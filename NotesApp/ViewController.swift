//
//  ViewController.swift
//  NotesApp
//
//  Created by MD Tanvir Alam on 4/10/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var noteArray = [Note]()
    @IBOutlet weak var notesTableView: UITableView!
    var apiFunctions = APIFunctions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes()
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        
        //apiFunctions.fetchNotes()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! addNotesViewController
        if (segue.identifier == "updateNoteSegue"){
            vc.note = noteArray[notesTableView.indexPathForSelectedRow!.row]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = noteArray[indexPath.row].title
        return cell
    }


}

extension ViewController: DataDelegate{
    func updateArray(newArray: String) {
        do{
            noteArray = try JSONDecoder().decode([Note].self,from:newArray.data(using: .utf8)!)
           
            print(noteArray)
            
            
        }catch{
            print("Error loading data \(error)")
        }
        notesTableView.reloadData()
    }
    
    
}

