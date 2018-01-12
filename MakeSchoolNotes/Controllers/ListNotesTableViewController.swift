//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class ListNotesTableViewController: UITableViewController {
    var notes = [Note](){
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindWithSegue( _segue:UIStoryboardSegue){
        notes = coreDataHelper.retriveNotes()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = coreDataHelper.retriveNotes()
    }
    
    
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        let note = notes[indexPath.row]
        cell.noteTittleLabel.text = note.tittle
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString() ?? "unknonw"
        
        return cell
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else { return}
        switch identifier {
        case "displayNote":
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let note = notes[indexPath.row]
            let destination = segue.destination as! DisplayNoteViewController
            destination.note = note
            
            print ("note cell tapped")
        case "addNote":
            print("add new note bar tapped")
        default:
            print("unexpected segue identifier")
        }
        
        
        }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let noteToDetele = notes[indexPath.row]
            
            coreDataHelper.detele(note: noteToDetele)
            
            notes = coreDataHelper.retriveNotes()
        }
    }
    
    }


