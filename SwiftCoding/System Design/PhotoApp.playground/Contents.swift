

import UIKit

/*
 如何设计一个图片app?
 类似于instagram?
 UI长什么样
 
 4S法则
 Scenario
 - Features: （枚举所有功能）
 *Upload/Fetch images - 涉及：网络请求（NSURLSession）, WebService class， Cache
 Post a thread(Contains images) -
 Images/News Feed - 涉及：线程,网络请求，返回后更新tableView CollectionView， Cache
 Login/Register
 User profile(Edit)
 Search
 Follow/Unfollow
 
 
 - QPS: 一般不需要顾虑吧，如果要得话 那么肯定要把WebServices(本来就要写的)，还有数据库的表和fields
 如何计算：
 1.要知道DAU是多少 假设 150M
 2.（读的QPS）150M * 每个用户平均请求次数 / 86400 = 150M * 60 / 86400 ~ 100k
 3.乘上一个峰值 100k * 3 = 300K, 如果有其他特殊情况再乘个系数
 4.最终读QPS为300k, 写QPS大概是个几十分之一， 这里用1：60， 所以写QPS为5K
 5.数据库QPS 100 = Laptop, QPS 1K 好一些的服务器，需要考虑single point failure, QPS 1M需要1000台服务器（Memcached）
 
 Service:
 图片app按照前面feature来划分服务
 
 Receptionist
 |               \               \                \
 MediaService       FeedsService     UserService    FriendShipService
 [Upload Images]    [Post sth]       [Login]        [BecomeFriends]/[FollowOrUnfollow]
 [Upload Video]     [Get news feed]  [Register]
 
 
 |
 AuthService
 
 Storage:
 1.为每一个服务选择储存结构  (SQL, NoSQL, FileSystem, MemCache)
 
 MediaService       FeedsService     UserService    FriendShipService
 *FileSystem*      *NoSQL*          *SQL*          *SQL or NoSQL*
 
 2.Schema细化 - 表的fields, client请求的参数，返回的参数
 MediaService       FeedsService           UserService            FriendShipService
 [FeedTable]            [UserTable]            [FriendshipTable]
 *id - Int              *id - Int                   *id - Int
 *user_id - FKey         *username - varchar[10]     *from_User_ID - FKey
 *content - text          *email - varchar[XX]        *to_User_ID - FKey
 *created_at - timestemp   *pwd - varchar[XX]
 
 AuthService
 *session_key - string
 *user_id - FKey
 *expired_at - timestamp
 
 3.How to get feeds?
 
 */


typealias JSONDictionary = [String: Any]

struct Media {
    let url = URL(string: "http://localhost:8000/episodes.json")!
}

extension Media {
    
}

struct Episode {
    let id: String
    let title: String
}

extension Episode {
    static let all = Resource<[Episode]>(url: url, parseJSON: { json in
        guard let dictionaries = json as? [JSONDictionary] else { return nil }
        return dictionaries.flatMap(Episode.init)
    })
}


/**
 Network
 */

enum Result<A> {
    case success(A)
    case error(Error)
}

enum HttpMethod<Body> {
    case get
    case post(Body)
}


extension HttpMethod {
    var method: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
    
    
    func map<B>(f: (Body) -> B) -> HttpMethod<B> {
        switch self {
        case .get: return .get
        case .post(let body):
            return .post(f(body))
        }
    }
}

struct Resource<A> {
    let url: URL
    let method: HttpMethod<Data>   // new enum
    let parse: (Data) -> A?
}

extension Resource {
    init(url: URL, parse: (AnyObject) -> A?, method: HttpMethod<AnyObject> = .get) {
        self.url = url
        self.method = method.map { json in
            // TODO try! is not safe here anymore
            return try! JSONSerialization.data(withJSONObject: json, options: [])
        }
        // ...
    }
}

extension Resource {
    var cacheKey: String {
        return "cache" + String(url.hashValue) // TODO use sha1
    }
}

struct FileStorage {
    let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    subscript(key: String) -> Data? {
        get {
            let url = baseURL.appendingPathComponent(key)
            return try? Data(contentsOf: url)
        }
        set {
            let url = baseURL.appendingPathComponent(key)
            _ = try? newValue?.write(to: url)
        }
    }
}

final class Webservice {
    func load<A>(resource: Resource<A>, completion: @escaping (A?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(resource.parse(data))
            }.resume()
    }
}


final class Cache {
    var storage = FileStorage()
    
    func load<A>(_ resource: Resource<A>) -> A? {
        guard case .get = resource.method else { return nil }
        let data = storage[resource.cacheKey]
        return data.flatMap(resource.parse)
    }
    
    func save<A>(_ data: Data, for resource: Resource<A>) {
        guard case .get = resource.method else { return }
        storage[resource.cacheKey] = data
    }
}

final class CachedWebservice {
    let webservice: Webservice
    let cache = Cache()
    
    init(_ webservice: Webservice) {
        self.webservice = webservice
    }
    
    func load<A>(_ resource: Resource<A>, update: @escaping (Result<A>) -> ()) {
        if let result = cache.load(resource) {
            print("cache hit")
            update(.success(result))
        }
        
        let dataResource = Resource<Data>(url: resource.url, parse: { $0 }, method: resource.method)
        webservice.load(dataResource, completion: { result in
            switch result {
            case let .error(error):
                update(.error(error))
            case let .success(data):
                self.cache.save(data, for: resource)
                update(Result(resource.parse(data), or: WebserviceError.other))
            }
        })
    }
}


/****
 Calling
 */
var allEpisodes: Resource<[Episode]> = try! Resource(
    url: URL(string: "http://localhost:8000/episodes.json")!,
    parse: Episode.init
)

let webservice = Webservice()
let cachedWebservice = CachedWebservice(webservice)
cachedWebservice.load(allEpisodes) { result in
    print(result)
}



