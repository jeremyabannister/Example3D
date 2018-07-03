//
//  Slide.swift
//  Example3D
//
//  Created by Jeremy Bannister on 7/3/18.
//

import Object3D

struct Slide: Object3D, Equatable {
  var position: Position3D
  var innerRadius: Double
  var outerRadius: Double
  var depth: Double
}

extension Slide {
  var asObject3DEnum: Object3DEnum {
    return .difference(position: position, original: outerCylinder.asObject3DEnum, subtractions: [innerCylinder.asObject3DEnum])
  }
}

private extension Slide {
  // Corner Cylinders
  var innerCylinder: Cylinder {
    return Cylinder(position: .zero, lowerRadius: innerRadius, upperRadius: innerRadius, depth: depth)
  }
  var outerCylinder: Cylinder {
    return Cylinder(position: .zero, lowerRadius: outerRadius, upperRadius: outerRadius, depth: depth)
  }
}