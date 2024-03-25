//
//  TableViewController.swift
//  ToDoListProgram
//
//  Created by Анастасия on 04.02.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    let circle = Circle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupNC()
        addAction()
       colorBackground()
        circle.settingCircle()
        
    }
    
    func colorBackground() {
        view.backgroundColor = UIColor(named: "basic")
    }
    
    //MARK: -
    func setupNC() {
        let navigationController = UIViewController()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
        
    }
    
    @objc func editAction() {
        tableView.isEditing.toggle()
        print("sucsesful")
    }
    
    //MARK: - creating action
    
    func addAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddAction))
    }
    
    @objc func pushAddAction() {
        
        let alertController = UIAlertController(title: "напиши задачу", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "напиши новую задачу"
        }
        
        let alertAction1 = UIAlertAction(title: "Закрыть", style: .default) { (alert) in
            
        }
        
        let alertAction2 = UIAlertAction(title: "Создать", style: .cancel) { (alert) in
            let newItem = alertController.textFields![0].text
            addItem(nameItem: newItem!)
            self.tableView.reloadData()
        }
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoItem.count
    }
    
    //MARK: -
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let currentItem = ToDoItem[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        
        if (currentItem["isComplited"] as? Bool) == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK: -
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        removedItem(at: indexPath.row)
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if changeState(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        tableView.reloadData()
        
    }
    
}
