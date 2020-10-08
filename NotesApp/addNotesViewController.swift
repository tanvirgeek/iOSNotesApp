//
//  addNotesViewController.swift
//  NotesApp
//
//  Created by MD Tanvir Alam on 7/10/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import UIKit

class addNotesViewController: UIViewController {

    var note: Note?
    var update = false
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    @IBAction func deleteButtonClicked(_ sender: UIBarButtonItem) {
        APIFunctions.functions.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if update == true {
            titleTextField.text = note!.title
            bodyTextView.text = note?.note
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if update == false{
            self.deleteButton.isEnabled = false
            self.deleteButton.title = ""
        }
    }
    
    @IBAction func saveClick(_ sender: UIBarButtonItem) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: Date())
        
        if update == true{
            if let title = titleTextField.text, let body = bodyTextView.text{
                //APIFunctions.functions.addNote(date: "Placeholder", title: title, note: body)
                APIFunctions.functions.updateNote(date: date, title: title, note: body, id: note!._id)
                
            }
        }else{
            if let title = titleTextField.text, let body = bodyTextView.text{
            APIFunctions.functions.addNote(date: date, title: title, note: body)
            }
            
        }
        self.navigationController?.popViewController(animated: true)
     
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
