//
//  PatientCloudStore.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/11/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

class PatientCloudStore: PatientDataSource {
    func save(patient: Patient) {
        //TODO: call api POST patient
    }

    func list() -> [Patient] {
        //TODO: call api GET patient
        return [Patient]()
    }
}
