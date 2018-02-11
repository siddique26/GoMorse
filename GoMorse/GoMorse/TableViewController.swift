//
//  Morsemodel.swift
//  GoMorse
//
//  Created by Siddique on 11/02/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {
    let cellId = "cellId"
    @IBOutlet weak var tableView: UITableView!
    let tableData: [(title: String, data: [(eng: String, morse: String)])] = [
        ("Alphabet", [
            ("A", "·-"),
            ("B", "-···"),
            ("C", "-·-·"),
            ("D", "-··"),
            ("E", "·"),
            ("F", "··-·"),
            ("G", "--·"),
            ("H", "····"),
            ("I", "··"),
            ("J", "·---"),
            ("K", "-·-"),
            ("L", "·-··"),
            ("M", "--"),
            ("N", "-·"),
            ("O", "---"),
            ("P", "·--·"),
            ("Q", "--·-"),
            ("R", "·-·"),
            ("S", "···"),
            ("T", "-"),
            ("U", "··-"),
            ("V", "···-"),
            ("W", "·--"),
            ("X", "-··-"),
            ("Y", "-·--"),
            ("Z", "--··"),
            ]),
        ("Numbers", [
            ("0", "-----"),
            ("1", "·----"),
            ("2", "··---"),
            ("3", "···--"),
            ("4", "····-"),
            ("5", "·····"),
            ("6", "-····"),
            ("7", "--···"),
            ("8", "---··"),
            ("9", "----·"),
            ]),
        ("Punctuation", [
            (".", "·-·-·-"),
            (",", "--··--"),
            ("?", "··--··"),
            ("@", "·--·-·"),
            ])
    ]
    
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData[section].title
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let cellData = tableData[indexPath.section].data[indexPath.row]
        cell.textLabel?.text = cellData.eng
        cell.detailTextLabel?.text = cellData.morse
        return cell
    }
    
}
