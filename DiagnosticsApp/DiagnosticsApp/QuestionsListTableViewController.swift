//
//  QuestionsListTableViewController.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import DiagnosticsCore
import RealmSwift

class QuestionsListTableViewController: UITableViewController, QuestionCreateDelegate {
    private var datasource = [SectionItem]()
    private var patientDataSource: PatientDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.patientDataSource = PatientStore()
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        let section = SectionItem(title: "Diagnoses of patients")
        datasource.append(section)
        refresh()
    }

    func refresh() {
        datasource[0].rows.removeAll()
        patientDataSource?.list().forEach({ (patient) in
            datasource[0].rows.append(getItemList(patient: patient))
        })
        tableView.reloadData()
    }

    func getItemList(patient: PatientModel) -> QuestionlistItem {
        return QuestionlistItem(title: patient.name, detail: "\(String(format: "%.0f", patient.likelihood))%")
    }

    func newPatient(patient: PatientModel) {
        appendLastRow(item: getItemList(patient: patient))
        persist(item: patient)
    }

    func appendLastRow(item: QuestionlistItem) {
        datasource[0].rows.append(item)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: datasource[0].rows.count - 1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }

    func persist(item: PatientModel) {
        patientDataSource?.save(patient: item)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.datasource[section].title
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return datasource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource[section].rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = datasource[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.cellIdentifier, for: indexPath)
        row.prepareCell(cell: cell, tableView: tableView)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "create_diagnostic" {
            if let navigationController = segue.destination as? UINavigationController,
                let viewController = navigationController.viewControllers[0] as? QuestionCreateTableViewController {
                viewController.delegate = self
            }
        }
    }
}
