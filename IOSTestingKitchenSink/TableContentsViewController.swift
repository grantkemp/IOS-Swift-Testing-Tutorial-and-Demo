//
//  ViewController.swift
//  IOSTestingKitchenSink
//
//  Created by Grant Kemp on 07/09/2015.
//  Copyright (c) 2015 Grant Kemp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var out_tbl_view: UITableView!
    
    var lessonsToShow:[String:[String:String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    getLessonsFromPlist()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: TableView Methods
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let lessonItemToShow = "lessonsToShow\(indexPath.row)"
        performSegueWithIdentifier(lessonItemToShow, sender: self)
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonsToShow!.count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let lessonNumber = "Lesson\(indexPath.row)"
        let lessonDetails = lessonsToShow![lessonNumber]
        let title = lessonDetails!["Title"]
        let description = lessonDetails!["Description"]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        cell.textLabel?.text = title
        cell.detailTextLabel!.text = description
        return cell
    }
    
        /**
            Get Resource From Plist

            :return: Dictionary
       */
    
    func getLessonsFromPlist() {
        guard let path = NSBundle.mainBundle().pathForResource("LessonList", ofType: "plist") else {
            print("no such plist")
          
            return
        }
         let sections = NSDictionary(contentsOfFile: path)
        lessonsToShow = (sections!.valueForKey("GettingStarted")) as! [String:[String:String]]
        
        print("got it")
    }

}

