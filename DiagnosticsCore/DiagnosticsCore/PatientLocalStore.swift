//
//  DiagnosticStore.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public class PatientLocalStore: PatientDataSource {
    var realm: Realm

    public init() {
        self.realm = try! Realm()
    }

    public func save(patient: Patient) {
        let patientModel = PatientModel()
        patientModel.name = patient.name
        patientModel.likelihood = patient.likelihood

        try! realm.write {
            realm.add(patientModel)
        }
    }

    public func list() -> [Patient] {
        let results = realm.objects(PatientModel.self)
        var patients = [Patient]()
        results.forEach { (patientModel) in
            patients.append(Patient(name: patientModel.name, likelihood: patientModel.likelihood))
        }
        return patients
    }
}
