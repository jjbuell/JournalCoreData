//
//  EntryController.swift
//  JournalCoreData
//
//  Created by JJB on 4/26/21.
//

import CoreData

class EntryController {
    
    
    //MARK: - Properties
    static let sharedInstance = EntryController()
    
    //SOT
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        
        return request
    }()
    
    
    //MARK: - Functions
    func createEntry(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        entries.append(entry)
        
        CoreDataStack.saveContext()
    }
    
    func fetchEntry() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entries.count)
        
        self.entries = entries
        
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(_ entry: Entry) {
        //black diamond
        guard let index = entries.firstIndex(of: entry) else {return}
        entries.remove(at: index)
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
    }
} //End of class
