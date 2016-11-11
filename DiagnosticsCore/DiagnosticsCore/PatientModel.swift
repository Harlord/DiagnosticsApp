//
//  PatientModel.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public class PatientModel: Object {
    public dynamic var name: String = ""
    public dynamic var likelihood: Double = 0
}
