//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note:Note?
    
    @IBOutlet weak var tittleTextField: UITextField!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
//            let destination = segue.destination as? ListNotesTableViewController else {return}
        
        switch identifier {
        case "cancel":
            print("cancel is tapped")
        case "save" where note != nil:
            
            note?.tittle = tittleTextField.text ?? ""
            note?.content = contentTextView.text ?? ""
            note?.modificationTime = Date()
            coreDataHelper.saveNote()
//            destination.tableView.reloadData()
            
           
        case "save" where note == nil:
           let note = coreDataHelper.newNote()
            note.tittle = tittleTextField.text ?? ""
            note.content = contentTextView.text ?? ""
            note.modificationTime = Date()
           coreDataHelper.saveNote()
        default:
            print(" unexpected segue identifier on displaynote")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tittleTextField.text = ""
        contentTextView.text = ""
        if let note = note {
            tittleTextField.text = note.tittle
            contentTextView.text = note.content
        } else{
            tittleTextField.text = ""
            contentTextView.text = ""
        }
    }
    
    
    
}
