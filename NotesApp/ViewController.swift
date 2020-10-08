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
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes()
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! addNotesViewController
        if (segue.identifier == "updateNoteSegue"){
            vc.note = noteArray[notesTableView.indexPathForSelectedRow!.row]
            vc.update = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteTableViewCell
        cell.titleLabel.text = noteArray[indexPath.row].title
        cell.dateLabel.text = noteArray[indexPath.row].date
        cell.noteLabel.text = noteArray[indexPath.row].note
        return cell
    }


}

extension ViewController: DataDelegate{
    func updateArray(newArray: String) {
        do{
            noteArray = try JSONDecoder().decode([Note].self,from:newArray.data(using: .utf8)!)
           
            //print(noteArray)
            
            
        }catch{
            print("Error loading data \(error)")
        }
        notesTableView.reloadData()
    }
    
    
}

