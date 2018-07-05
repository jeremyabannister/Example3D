//
//  RoundedBox.swift
//  Example3D
//
//  Created by Jeremy Bannister on 7/3/18.
//

@_exported import Object3D

public struct RoundedBox: Object3D, Equatable {
  public var position: Position3D
  public var size: Size3D
  public var cornerRadius: Double
  
  public init (position: Position3D, size: Size3D, cornerRadius: Double) {
    self.position = position
    self.size = size
    self.cornerRadius = cornerRadius
  }
}

extension RoundedBox {
  public var asRawObject3D: RawObject3D {
    let objects: [RawObject3DConvertible] = [horizontalCube, verticalCube, lowerLeftCylinder, lowerRightCylinder, upperRightCylinder, upperLeftCylinder]
    return .union(position: position, rawObjects: objects.map({ $0.asRawObject3D }))
  }
}

private extension RoundedBox {
  // Crossing Cubes
  var horizontalCube: Cube {
    let size = Size3D(width: width, height: height - (2 * cornerRadius), depth: depth)
    let position = Position3D(x: 0, y: (height - size.height)/2, z: 0)
    return Cube(position: position, size: size)
  }
  var verticalCube: Cube {
    let size = Size3D(width: width - (2 * cornerRadius), height: height, depth: depth)
    let position = Position3D(x: (width - size.width)/2, y: 0, z: 0)
    return Cube(position: position, size: size)
  }
  
  // Corner Cylinders
  var lowerLeftCylinder: Cylinder {
    let position = Position3D(x: cornerRadius, y: cornerRadius, z: 0)
    return Cylinder(position: position, lowerRadius: cornerRadius, upperRadius: cornerRadius, depth: depth)
  }
  var lowerRightCylinder: Cylinder {
    return lowerLeftCylinder.translated(by: verticalCube.width, 0, 0)
  }
  var upperRightCylinder: Cylinder {
    return lowerRightCylinder.translated(by: 0, horizontalCube.height, 0)
  }
  var upperLeftCylinder: Cylinder {
    return upperRightCylinder.translated(by: -verticalCube.width, 0, 0)
  }
}

extension RoundedBox: HasSize3D{ }
