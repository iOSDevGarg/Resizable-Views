//
//  ViewController.swift
//  ResizableContainerView
//
//  Created by IosDeveloper on 31/01/18.
//  Copyright © 2018 iOSDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    ///Upper ContainerView
    @IBOutlet weak var upContainerView: UIView!
    
    ///Bottom ContainerView
    @IBOutlet weak var bottomContainerView: UIView!
    
    ///Maximum Y to which Container can move
    var maximum_y = CGFloat()
    
    ///Minimum Y to which Container can move
    var minimum_y = CGFloat()
    
    
    //MARK: Side Menu Object
    private lazy var VC1Object: VC1 =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "VC1") as! VC1
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    //MARK: Side Menu Object
    private lazy var VC2Object: VC2 =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as! VC2
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    //MARK: Add Subview in Side Menu view
    private func add(asChildViewController viewController: UIViewController, baseView: UIView)
    {
        // Configure Child View
        viewController.view.frame = CGRect(x: 0, y: 0, width: baseView.frame.size.width, height: baseView.frame.size.height)
        
        // Add Child View Controller
        addChildViewController(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = true
        
        // Add Child View as Subview
        baseView.addSubview(viewController.view)
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    //MARK: Did Load
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.maximum_y = self.view.frame.size.height*0.07
        self.minimum_y = self.view.frame.size.height - self.view.frame.size.height*0.07
        self.add(asChildViewController: VC1Object, baseView: upContainerView)
        self.add(asChildViewController: VC2Object, baseView: bottomContainerView)
        self.addPanGesture()
        print("maximum_y:\(maximum_y) minimum_y:\(minimum_y) Height:\(self.view.frame.height)")
    }
    
    
}

//MARK:- Custom Functions
extension ViewController
{
    //MARK: Add Gesture
    func addPanGesture()
    {
        let gesture : UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action:#selector(ViewController.handlePanGesture(panGesture:)))
        self.bottomContainerView.addGestureRecognizer(gesture)
    }
    
    //MARK: Gesture Handler
    @objc func handlePanGesture(panGesture: UIPanGestureRecognizer)
    {
        ///Get the changes
        _ = panGesture.translation(in: self.view)
        let currentPoint = panGesture.location(in: self.view)
        
        ///Check if my View y is Greater than maximum allowed y
        if (panGesture.view?.frame.origin.y)! < maximum_y
        {
            ///if yes
            ///Set it to default y
            panGesture.view?.frame.origin.y = maximum_y
            panGesture.setTranslation(CGPoint.zero, in: self.view)
        }
        
        ///Check if my View y is Greater than maximum allowed y
        if (panGesture.view?.frame.origin.y)! > minimum_y
        {
            ///if yes
            ///Set it to default y
            panGesture.view?.frame.origin.y = minimum_y
            panGesture.setTranslation(CGPoint.zero, in: self.view)
        }
        
        ///Monitoring changes
        if CGFloat(round(Double((panGesture.view?.frame.origin.y)!))) >= maximum_y || (CGFloat(round(Double((panGesture.view?.frame.origin.y)!)))-1) >= maximum_y-10 || CGFloat(round(Double((panGesture.view?.frame.origin.y)!))) <= minimum_y || (CGFloat(round(Double((panGesture.view?.frame.origin.y)!)))-1) >= minimum_y+10
        {
            if currentPoint.y < minimum_y && currentPoint.y > maximum_y
            {
                ///Move view to required Position
                panGesture.view?.frame = CGRect(x: 0, y: currentPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height-currentPoint.y)
                self.upContainerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-(panGesture.view?.frame.height)!)
                panGesture.setTranslation(CGPoint.zero, in: self.view)
            }            
        }
        else
        {
            ///Error case
            ///Control should not come here
            print("No translation")
        }
    }
}

