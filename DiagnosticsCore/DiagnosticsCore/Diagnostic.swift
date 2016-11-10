//
//  Diagnostics.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

public struct Diagnostic {
    public var patient: Patient

    public init(patient: Patient) {
        self.patient = patient
    }

    public var likelihood: Double {
        let quantity = Double(patient.answers.count)
        let matches = Double(patient.answers.filter { $0.match() == $0.question.riskFactorEvaluator }.count)
        return (matches * 100) / quantity
    }
}
