//
//  Patient.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/11/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

public struct Patient {
    public var name: String!
    public var likelihood: Double!

    public init(name: String, likelihood: Double) {
        self.name = name
        self.likelihood = likelihood
    }
}
