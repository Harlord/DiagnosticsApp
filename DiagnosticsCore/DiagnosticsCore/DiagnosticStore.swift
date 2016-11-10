//
//  DiagnosticStore.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public class DiagnosticStore: DiagnosticDataSource {
    var realm: Realm

    public init() {
        self.realm = try! Realm()
    }

    public func save(diagnose: Diagnose) {
        try! realm.write {
            realm.add(diagnose)
        }
    }

    public func list() -> Results<Diagnose> {
        return realm.objects(Diagnose.self)
    }
}
