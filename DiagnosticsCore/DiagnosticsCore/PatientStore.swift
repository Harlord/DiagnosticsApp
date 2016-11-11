//
//  DiagnosticStore.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public class PatientStore: PatientDataSource {
    var realm: Realm

    public init() {
        self.realm = try! Realm()
    }

    public func save(patient: PatientModel) {
        try! realm.write {
            realm.add(patient)
        }
    }

    public func list() -> Results<PatientModel> {
        return realm.objects(PatientModel.self)
    }
}
