//
//  CoreDataOperation.swift
//  CoreData-Swift4
//
//  Created by VPN on 15/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit
import CoreData

class CoreDataOperation: NSObject {

    let appDeleObj: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    

    func addRecord(entityName:String,predicate:String,primaryKey:String,dict:NSMutableDictionary) -> NSManagedObject {

        
        
        let newdict = self.removeNullFromDict(dict: dict);
        
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: appDeleObj.context)
        var newRecord = NSManagedObject();
        
        let predicateM = NSPredicate(format: "%K == %@", primaryKey, (dict.value(forKey: primaryKey) as? String)!)
        
        let arr = checkkEntityAlreadyExist(strEntityName: entityName, prdictate: predicateM)
        
        if(arr.count == 0)
        {
            newRecord = NSManagedObject(entity: entity!, insertInto: appDeleObj.context)
        }
        else
        {
            newRecord = arr.firstObject as! NSManagedObject;
        }
        
        for (key, value) in newdict {
            
              newRecord.setValue(value, forKey: key as! String)

        }
        
        do {
            try appDeleObj.context.save()
        } catch {
            print("Failed saving")
        }
        
        return newRecord;

    }
    
    
    func fetchEntityData (strEntityName : String,predicate : String) -> Any
    {
        var result : Any = NSArray();
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: strEntityName)
        
        if(predicate != "")
        {
            request.predicate = NSPredicate(format: predicate)

        }
        
        request.returnsObjectsAsFaults = false
        do {
            result = try appDeleObj.context.fetch(request)
            return result;
            
        } catch {
            
            print("Failed")
        }
        return result;

    }
    
    func deleteEntity (strEntityName:String,predicate:String)
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: strEntityName)
        
        if(predicate != "")
        {
            fetchRequest.predicate = NSPredicate(format: predicate)
        }
        
        let result = try? appDeleObj.context.fetch(fetchRequest)
        let resultData = result as! [NSManagedObject]
        
        for object in resultData {
            appDeleObj.context.delete(object)
        }
        
        do {
            try appDeleObj.context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    
    func checkkEntityAlreadyExist(strEntityName:String,prdictate:NSPredicate)-> NSArray
    {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: strEntityName)
        fetchRequest.predicate = prdictate;
        var results: [NSManagedObject] = []
        do {
            results = try appDeleObj.context.fetch(fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        
        return results as NSArray;
    }
    
    
    func removeNullFromDict (dict : NSMutableDictionary) -> NSMutableDictionary
    {
        let dic = dict;
        
        for (key, value) in dict {
            
            let val : NSObject = value as! NSObject;
            if(val.isEqual(NSNull()))
            {
                dic.setValue("", forKey: (key as? String)!)
            }
            else
            {
                dic.setValue(value, forKey: key as! String)
            }
            
        }
        
        return dic;
    }
    
}


