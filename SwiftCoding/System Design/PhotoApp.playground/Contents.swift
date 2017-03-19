

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


