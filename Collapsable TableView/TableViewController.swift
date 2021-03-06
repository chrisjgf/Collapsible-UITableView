//
//  TableViewController.swift
//  Collapsable TableView
//
//  Created by Chris on 17/05/2017.
//  Copyright © 2017 Chris. All rights reserved.
//

import UIKit

class TableData{
    var title: String?
    var content: [String]?
    init (_ str: String?){
        title = str
    }
}

class TableViewController: UITableViewController {
    
    var dataForTable = [TableData]()
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataSet1 = TableData("Oranges")
        dataSet1.content = ["A", "B", "C"]
        
        let dataSet2 = TableData("Pears")
        dataSet2.content = ["D", "E", "F", "G"]
        
        let dataSet3 = TableData("Apples")
        dataSet3.content = ["H", "I"]
        
        dataForTable.append(dataSet1)
        dataForTable.append(dataSet2)
        dataForTable.append(dataSet3)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataForTable.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let selected = selectedIndexPath{
            if section == selected.section{
                return dataForTable[selected.section].content!.count + 1 // +1 for section title
            } else {
                return 0
            }
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)

        // Configure the cell...
        if indexPath.row == 0{
            cell.textLabel?.text = dataForTable[indexPath.section].title
            cell.backgroundColor = UIColor.gray
        } else{
            cell.textLabel?.text = dataForTable[indexPath.section].content?[indexPath.row-1]
            cell.backgroundColor = UIColor.white
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){ // section titles
            if let selected = selectedIndexPath{ // has value
                if selected == indexPath{
                    tableView.deselectRow(at: indexPath, animated: true)
                    selectedIndexPath = nil
                }
            } else{
                selectedIndexPath = indexPath
            }
        }
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
