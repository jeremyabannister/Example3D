//
//  Slide.swift
//  Example3D
//
//  Created by Jeremy Bannister on 7/3/18.
//

@_exported import Object3D

// MARK: - --> Initial Declaration <--
public struct Slide: Object3D, Equatable {
  public var position: Position3D
  public var innerRadius: Double
  public var outerRadius: Double
  public var depth: Double
  
  public init (position: Position3D, innerRadius: Double, outerRadius: Double, depth: Double) {
    self.position = position
    self.innerRadius = innerRadius
    self.outerRadius = outerRadius
    self.depth = depth
  }
}

// MARK: - Conversion to RawObject3D
extension Slide {
  public var asRawObject3D: RawObject3D {
    return .difference(position: position, original: outerCylinder.asRawObject3D, subtractions: [innerCylinder.asRawObject3D])
  }
}

// MARK: - Child Objects
private extension Slide {
  // Corner Cylinders
  var innerCylinder: Cylinder {
    return Cylinder(position: .zero, lowerRadius: innerRadius, upperRadius: innerRadius, depth: depth)
  }
  var outerCylinder: Cylinder {
    return Cylinder(position: .zero, lowerRadius: outerRadius, upperRadius: outerRadius, depth: depth)
  }
}
