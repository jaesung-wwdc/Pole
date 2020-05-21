import SceneKit

@available(iOS 11.0, *)
public extension SCNNode {
    func makePerpendicular(at point: Point) {
        self.position = point.convertedAxisFromAngle()
        self.eulerAngles = point.rotateVertically()
    }
}

@available(iOS 11.0, *)
public struct Point {
    let radius: CGFloat
    let latitude: CGFloat
    let longitude: CGFloat
    
    public init(r: CGFloat, lat: CGFloat, lng: CGFloat) {
        self.radius = r
        self.latitude = lat
        self.longitude = lng
    }
    
    func convertedAxisFromAngle() -> SCNVector3 {
        let xy = self.radius * cos(self.latitude * .pi / CGFloat(180))
        let x = xy * cos(self.longitude * .pi / CGFloat(180))
        let y = xy * sin(self.longitude * .pi / CGFloat(180))
        let z = self.radius * sin(self.latitude * .pi / CGFloat(180))
        
        return SCNVector3(x, y, z)
    }
    
    func rotateVertically() -> SCNVector3 {
        let x = (self.latitude) * .pi / CGFloat(180)
        let z = (self.longitude - 90) * .pi / CGFloat(180)
        return SCNVector3(x, 0, z)
    }
}
