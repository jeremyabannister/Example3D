//
//  RoundedBox.swift
//  Example3D
//
//  Created by Jeremy Bannister on 7/3/18.
//

import Object3D

struct RoundedBox: Object3D, Equatable {
  var position: Position3D
  var size: Size3D
  var cornerRadius: Double
}

extension RoundedBox {
  var asObject3DEnum: Object3DEnum {
    let objects: [Object3DEnumConvertible] = [horizontalCube, verticalCube, lowerLeftCylinder, lowerRightCylinder, upperRightCylinder, upperLeftCylinder]
    return .union(position: position, objectEnums: objects.map({ $0.asObject3DEnum }))
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

extension RoundedBox: Size3DShortcuts { }
