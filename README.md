# Pole

Stand a pole perpendicular to sphere at a specifi point

- Copyright: ©Jaesung

Xcode > File > Swift Packages > Add Package Dependency > Enter repository URL: https://github.com/jaesung-wwdc/Pole

```Swift
import Pole

// ...

func treeOnEarth() {
    // ...

    let latitude = CGFloat.random(in: -180..<180)
    let longitude = CGFloat.random(in: -180..<180)
    let point = Point(r: 4.0, lat: latitude, lng: longitude)

    treeNode.makePerpendicular(at: point)

    earth.addChildNode(treeNode)
}
