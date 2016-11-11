//
//  Match.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import Foundation

public struct Match {
    private(set) var factor: Factor

    init(factor: Factor) {
        self.factor = factor
    }
}
