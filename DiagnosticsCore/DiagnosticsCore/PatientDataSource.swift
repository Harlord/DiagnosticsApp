//
//  DiagnosticDataSource.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public protocol PatientDataSource {
    func save(patient: PatientModel)
    func list() -> Results<PatientModel>
}
