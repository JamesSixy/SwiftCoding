
public struct Point: Equatable {
    public let x: Int, y:Int
    public init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    public static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.x == rhs.y
    }
}
