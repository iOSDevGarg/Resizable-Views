//
//  VC1.swift
//  ResizableContainerView
//
//  Created by IosDeveloper on 31/01/18.
//  Copyright © 2018 iOSDeveloper. All rights reserved.
//

import UIKit

class VC1: UIViewController
{

    ///TableView Outlet
    @IBOutlet weak var myTableView: UITableView!
    
    ///Array Declarations
    let sideMenuArray = ["Index 0","Index 1","Index 2","Index 3","Index 0","Index 1","Index 2","Index 3","Index 0","Index 1","Index 2","Index 3","Index 0","Index 1","Index 2","Index 3","Index 0","Index 1","Index 2","Index 3","Index 0","Index 1","Index 2","Index 3"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ///Set Delegates For TableView
        myTableView.delegate = self
        myTableView.dataSource = self
        
        ///Set Footer View as Empty
        myTableView.tableFooterView = UIView()
    }
}

//MARK:- TableView Delegates
extension VC1 : UITableViewDelegate, UITableViewDataSource
{
    //MARK: Set Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        ///Return Count in Array
        return sideMenuArray.count
    }
    
    //MARK: Set Cell Data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        ///Initiate Cell
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        ///Set Values
        cell.textLabel?.text = sideMenuArray[indexPath.row]
        
        ///Return Cell View
        return cell
    }
    
    //MARK: Selection Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    //MARK: Set Height For row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
    
}

