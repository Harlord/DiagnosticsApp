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
    func newPatient(patient: PatientModel)
}

class QuestionCreateTableViewController: UITableViewController {
    private var datasource = [SectionItem]()
    var delegate: QuestionCreateDelegate?
    var toddSyndromeDisease = ToddSyndromeDisease()

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
        let patientModel = PatientModel()
        patientModel.name = name?.value ?? "Patient"

        datasource[1].rows.forEach { (item) in
            if let questionItem = item as? QuestionItem {
                answers.append(questionItem.answer)

                let questionModel = QuestionModel()
                questionModel.prompt = questionItem.answer.question.prompt
                questionModel.identifier = questionItem.answer.question.identifier

                let answerModel = AnswerModel()
                answerModel.question = questionModel
                answerModel.value = questionItem.answer.value

                patientModel.answers.append(answerModel)
            }
        }

        patientModel.likelihood = toddSyndromeDisease.diagnose(answers: answers).likelihood

        self.delegate?.newPatient(patient: patientModel)
    }

    @IBAction func cancelAction(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    func refreshList() {
        self.datasource.removeAll()
        var sectionInfo = SectionItem(title: "Basic info")
        sectionInfo.rows.append(NameItem(identifier: "name", title: "Name:", placeHolder: "Patient Name", value: nil))
        self.datasource.append(sectionInfo)

        var sectionQuestion = SectionItem(title: "Questions for diagnose")

        toddSyndromeDisease.factors.map({$0.questions}).map({$0}).forEach { (question) in
            let item = QuestionItem(answer: Answer(question: question, value: false))
            sectionQuestion.rows.append(item)
        }
        self.datasource.append(sectionQuestion)
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
            let questionItem = item as! QuestionItem
            questionItem.answer.value = control.optionSwitch.isOn
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
            let nameItem = item as! NameItem
            nameItem.value = control.valueTextField.text
        })
    }
}
