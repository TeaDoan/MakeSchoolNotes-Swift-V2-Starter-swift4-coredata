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
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if note == nil { // new note
            let newNote = coreDataHelper.newNote()
            newNote.setValue(titleTextField.text, forKey: "title")
            self.note = newNote
        } else { // note already set
            note?.setValue(titleTextField.text, forKey: "title")
        }
        coreDataHelper.saveNote()

        
    }
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        
      
    }
    
   
  
    
    
    
}
