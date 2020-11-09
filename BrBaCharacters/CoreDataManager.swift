//
//  CoreDataManager.swift
//  BrBaCharacters
//
//  Created by Milan Chalishajarwala on 10/13/20.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager{
    
    static let shared = CoreDataManager()
    private init () {}
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func storeData(character: CharacterModel){
        let entity = NSEntityDescription.entity(forEntityName: "Character", in: context)
        guard let Entity = entity else { return }
        let newObject = NSManagedObject(entity: Entity, insertInto: context)
            newObject.setValue(character.name, forKey: "name")
            newObject.setValue(character.appearance, forKey: "appearance")
            newObject.setValue(character.better_call_saul_appearance, forKey: "better_call_saul_appearance")
            newObject.setValue(character.birthday, forKey: "birthday")
            newObject.setValue(character.category, forKey: "category")
            newObject.setValue(character.char_id, forKey: "char_id")
            newObject.setValue(character.img, forKey: "img")
            newObject.setValue(character.nickname, forKey: "nickname")
            newObject.setValue(character.occupation, forKey: "occupation")
            newObject.setValue(character.portrayed, forKey: "portrayed")
            newObject.setValue(character.status, forKey: "status")
           
        
        
    }
    
    
    func fetchData() -> [Character]{
        
        var  characters = [Character]()
        let request = NSFetchRequest <Character>(entityName: "Character")
        let sortDescriptor = NSSortDescriptor(key: "char_id", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        do{
            characters = try context.fetch(request)
        }catch{
            
        }
        
        return characters
    }
}
