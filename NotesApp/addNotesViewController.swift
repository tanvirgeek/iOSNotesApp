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
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = note!.title
        bodyTextView.text = note?.note
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveClick(_ sender: UIBarButtonItem) {
        
        if let title = titleTextField.text, let body = bodyTextView.text{
            //APIFunctions.functions.addNote(date: "Placeholder", title: title, note: body)
            APIFunctions.functions.updateNote(date: "Placeholder", title: title, note: body, id: note!._id)
            
        }
     
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
