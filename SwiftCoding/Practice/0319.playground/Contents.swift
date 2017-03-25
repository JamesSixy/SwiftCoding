
import ZHDataStructure
import UIKit

//****** photo app, instagram


/**
 
 Scenario
    1.login register
    2.Post
 
 
 MVC
 */

protocol ApiLink {
    
}

enum SocialPhotoApiName: String {
    case fetchPhotos = "fetchImage"
    case fetchNewFeed = "fetchNewFeed"
    case downloadImage
}

enum HttpMethod<Body> {
    case get
    case post
}

struct Resource<A> {
    let url: URL
    let parse: (Data) -> A?
    let method: HttpMethod<Data>
}

final class Webservice {
    func load<A>(resource: Resource<A>, completion: (A?) -> ()) {
        
    }
}



