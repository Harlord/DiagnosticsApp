//
//  Diagnostics.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import Foundation

public struct Diagnostic {
    private(set) var matches: [Match]

    public init(matches: [Match], likelihood: Double) {
        self.matches = matches
        self.likelihood = likelihood
    }

    public private(set) var likelihood: Double
}
