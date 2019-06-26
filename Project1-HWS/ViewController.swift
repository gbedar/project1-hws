//
//  ViewController.swift
//  Project1-HWS
//
//  Created by George Bedar on 6/25/19.
//  Copyright © 2019 George Bedar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController
{
  var pictures = [String]()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    title = "Storm Viewer"
    navigationController?.navigationBar.prefersLargeTitles = true
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let items = try! fm.contentsOfDirectory(atPath: path)
    
    print("all files are  \(items)")
    
    for item in items
    {
      if item.hasSuffix("jpg")
      {
        pictures.append(item)
        
      }
      
    }
    print("Pictures is: \(pictures)")

  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
    cell.textLabel?.text = pictures[indexPath.row]
    print("the indexPath is: \(indexPath.description)")
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //1: try loading the "Detail" view controller and typecsting it to be DetailViewController.
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      //2: success! Set its selectedImage property.
      vc.selectedImage = pictures[indexPath.row]
      //3: now push it onto the navigation controller.
      navigationController?.pushViewController(vc, animated: true)
      }
    }
  

}

