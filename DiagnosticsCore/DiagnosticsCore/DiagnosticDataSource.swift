//
//  DiagnosticDataSource.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public protocol DiagnosticDataSource {
    func save(diagnose: Diagnose)
    func list() -> Results<Diagnose>
}
