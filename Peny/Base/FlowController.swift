//
//  FlowController.swift
//  Peny
//
//  Created by Yelena Gorelova on 26.10.2023.
//

import Foundation

protocol FlowController {

  associatedtype T
  var completionHandler: ((T) -> ())? { get set }
}
