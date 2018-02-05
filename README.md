# Resizable-Views

This sample Project make A View Being Dragged in View and Change its And other used views Height According to the Requirement and changes made

Project Hierarchy 
 
     --> Main View
       --> 2 ContainerViews
          --> Subviews in ContainerView
       --> Container View At Bottom Draggable (Pan Gesture)
       
# Pan Gesture
    func addPanGesture()
    {
        let gesture : UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action:#selector(ViewController.handlePanGesture(panGesture:)))
        self.bottomContainerView.addGestureRecognizer(gesture)
    }
    
# View Translation

    ///Move view to required Position
    panGesture.view?.frame = CGRect(x: 0, y: currentPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height-currentPoint.y)
    self.upContainerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-(panGesture.view?.frame.height)!)
    panGesture.setTranslation(CGPoint.zero, in: self.view)
       
# Output 

![draggableview](https://user-images.githubusercontent.com/26831784/35792834-0d8106d4-0a75-11e8-8182-afe4990fed0c.gif)
