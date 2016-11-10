//
//  QuestionDetailTableViewController.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import DiagnosticsCore
import Signals

protocol QuestionCreateDelegate {
    func newPatient(patient: Patient)
}

class QuestionCreateTableViewController: UITableViewController {
    private var datasource = [SectionItem]()
    var delegate: QuestionCreateDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 54.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        refreshList()
    }

    @IBAction func doneAction(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
        let name = datasource[0].rows.filter {$0.identifier == "name"}.first as? NameItem
        var answers = [Answer]()
        datasource[1].rows.forEach { (item) in
            if let questionItem = item as? QuestionItem {
                answers.append(questionItem.answer)
            }
        }
        self.delegate?.newPatient(patient: Patient(name: name?.value ?? "Patient", answers: answers))
    }

    @IBAction func cancelAction(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    func refreshList() {
        self.datasource.removeAll()
        var sectionInfo = SectionItem(title: "Basic info")
        sectionInfo.rows.append(NameItem(identifier: "name",title: "Name:", placeHolder: "Patient Name", value: nil))
        self.datasource.append(sectionInfo)

        var sectionQuestion = SectionItem(title: "Questions for diagnose")
        sectionQuestion.rows.append(getQuestionItem(identifier: "migrains", prompt: "Do you feel migrains?",
                                                    description: "Many patients with this disorder also have migraines",
                                                    riskFactorEvaluator: true))
        sectionQuestion.rows.append(getQuestionItem(identifier: "age", prompt: "You are under 15 years old?",
                                                    description: "People 15 years old or younger are more likely to have it",
                                                    riskFactorEvaluator: true))
        sectionQuestion.rows.append(getQuestionItem(identifier: "woman", prompt: "You are a woman?",
                                                    description: "There are more documented cases of men having it than woman",
                                                    riskFactorEvaluator: true))
        sectionQuestion.rows.append(getQuestionItem(identifier: "drugs", prompt: "Do you consume hallucinogenic drugs?",
                                                    description: "Usage of hallucinogenic drugs increases the probability",
                                                    riskFactorEvaluator: true))
        self.datasource.append(sectionQuestion)
    }

    func getQuestionItem(identifier: String, prompt: String, description: String, riskFactorEvaluator: Bool) -> QuestionItem{
        let question = Question(prompt: prompt,
                                description: description,
                                riskFactorEvaluator: riskFactorEvaluator)
        let answer =  Answer(question: question, answer: false)
        return QuestionItem(identifier: identifier, answer: answer)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.datasource[section].title
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.datasource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource[section].rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.datasource[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.cellIdentifier, for: indexPath)
        row.prepareCell(cell: cell, tableView: tableView)
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = datasource[indexPath.section].rows[indexPath.row]
        item.prepareCell(cell: cell, tableView: tableView)
        switch item.cellIdentifier {
        case TitleSwitchTableViewCell.identifierKey:
            titleSwitchCreated(tableView: tableView, cell: cell)
        case LabelEditTableViewCell.identifierKey:
            labelEditCreated(tableView: tableView, cell: cell)
        default: break
        }
    }

    func titleSwitchCreated(tableView: UITableView, cell: UITableViewCell) {
        guard let control = cell as? TitleSwitchTableViewCell else {
            return
        }
        control.optionSwitch.onValueChanged.subscribe(on: self, callback: {
            guard let index = tableView.indexPath(for: control) else {
                return
            }
            let item = self.datasource[index.section].rows[index.row]
            switch item.identifier {
            case "migrains", "age", "woman", "drugs":
                let questionItem = item as! QuestionItem
                questionItem.answer.answer = control.optionSwitch.isOn
            default: break
            }
        })
    }

    func labelEditCreated(tableView: UITableView, cell: UITableViewCell) {
        guard let control = cell as? LabelEditTableViewCell else {
            return
        }
        control.valueTextField.onEditingChanged.subscribe(on: self, callback: {
            guard let index = tableView.indexPath(for: control) else {
                return
            }
            let item = self.datasource[index.section].rows[index.row]
            switch item.identifier {
            case "name":
                let nameItem = item as! NameItem
                nameItem.value = control.valueTextField.text
            default: break
            }
        })
    }
}
