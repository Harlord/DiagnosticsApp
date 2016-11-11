//
//  ToddSyndromeDisease.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import Foundation

public class ToddSyndromeDisease: Disease {
    public override init() {
        super.init()
        factors.append(FullFactor(
            title: "Many patients with this disorder also have migraines",
            questions: Question(identifier: "migraine", prompt: "Do you feel migrains?")))

        factors.append(FullFactor(
            title: "People 15 years old or younger are more likely to have it",
            questions: Question(identifier: "under_15", prompt: "You are under 15 years old?")))

        factors.append(FullFactor(
            title: "There are more documented cases of men having it than woman",
            questions: Question(identifier: "are_woman", prompt: "You are a woman?")))

        factors.append(FullFactor(
            title: "Usage of hallucinogenic drugs increases the probability",
            questions: Question(identifier: "use_drugs", prompt: "Do you consume hallucinogenic drugs?")))
    }
}
