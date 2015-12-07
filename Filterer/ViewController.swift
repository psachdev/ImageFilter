//
//  ViewController.swift
//  Filterer
//
//  Created by Prateek Sachdeva on 11/22/15.
//  Copyright (c) 2015 Prateek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var filteredImage: UIImage?
    var origimage: UIImage!
    var filterImageShown : Bool!
    
    let imageProcessor : ImageProcessor! = ImageProcessor(redfactor: 2, bluefactor: 4, greenfactor: 8, lowerfactor: 2, higherfactor: 10, factor: 5)
    
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var redFilterButton: UIButton!
    @IBOutlet var blueFilterButton: UIButton!
    @IBOutlet var greenFilterButton: UIButton!
    @IBOutlet var yellowFilterButton: UIButton!
    @IBOutlet var purpleFilterButton: UIButton!
    
    @IBOutlet var comapreButton: UIButton!
    
    @IBAction func onShare(sender: AnyObject) {
        //check for nil image
        //UIActivityViewController has delegates too, take a look
        let activityController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
    }
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var secondaryMenu: UIView!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var sliderView: UIView!
    @IBOutlet var editButton: UIButton!
    
    
    @IBAction func onSliderChange(sender: UISlider) {
        if(filterImageShown==true){
            var currentValue = Int(sender.value)
            switch lastFilter! {
            case Filter.Purple:
                filteredImage = imageProcessor!.applyPurpleFilter(filteredImage!, x: currentValue+50, y: currentValue)
                UIView.animateWithDuration(1, animations: { self.imageView.alpha=1 })
                    { completed in if(completed == true) {
                        self.imageView.image = self.filteredImage
                        //self.imageView.alpha=1
                        UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                        }}
            case Filter.Yellow:
                filteredImage = imageProcessor!.applyYellowFilter(filteredImage!, green: currentValue, red: currentValue)
                UIView.animateWithDuration(1, animations: { self.imageView.alpha=1 })
                    { completed in if(completed == true) {
                        self.imageView.image = self.filteredImage
                        //self.imageView.alpha=1
                        UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                        }}

            case Filter.Blue:
                filteredImage = imageProcessor!.applyBlueFilter(filteredImage!, blue: currentValue)
                UIView.animateWithDuration(1, animations: { self.imageView.alpha=1 })
                    { completed in if(completed == true) {
                        self.imageView.image = self.filteredImage
                        //self.imageView.alpha=1
                        UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                        }}

            case Filter.Green:
                filteredImage = imageProcessor!.applyGreenFilter(filteredImage!, green: currentValue)
                UIView.animateWithDuration(1, animations: { self.imageView.alpha=1 })
                    { completed in if(completed == true) {
                        self.imageView.image = self.filteredImage
                        //self.imageView.alpha=1
                        UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                        }}
            case Filter.Red:
                filteredImage = imageProcessor!.applyRedFilter(filteredImage!, red: currentValue)
                UIView.animateWithDuration(1, animations: { self.imageView.alpha=1 })
                    { completed in if(completed == true) {
                        self.imageView.image = self.filteredImage
                        //self.imageView.alpha=1
                        UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                        }}

            default:
                print("DO NOTHING")
            }
            
        }
    }
    
    @IBAction func onEditPressed(sender: UIButton) {
        
        hideSecondaryMenu(secondaryMenu)
        filterButton.selected=false
        if(sender.selected){
            hideSecondaryMenu(sliderView)
            sender.selected=false;
        }else{
            showSecondaryMenu(sliderView)
            sender.selected=true
        }
    }
    
    enum Filter {
        case None
        case Red
        case Blue
        case Green
        case Yellow
        case Purple
    }
    var lastFilter : Filter!
    
    @IBAction func onPurplePressed(sender: UIButton) {
        if(sender.selected){
            
        }else{
            //Apply Filter. Image cannot be non-null
            //origimage = imageView.image
            filteredImage = imageProcessor!.applyPurpleFilter(origimage, x: 100, y: 50)
            UIView.animateWithDuration(1, animations: { self.imageView.alpha=0 })
                { completed in if(completed == true) {
                    self.imageView.image = self.filteredImage
                    //self.imageView.alpha=1
                    UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                    }}
            //imageView.image = filteredImage
            sender.selected = true
            filterImageShown=true
            comapreButton.enabled=true
            editButton.enabled=true
            lastFilter=Filter.Purple
        }

    }
    
    @IBAction func onYellowPressed(sender: UIButton) {
        if(sender.selected){
            
        }else{
            //Apply Filter. Image cannot be non-null
            //origimage = imageView.image
            filteredImage = imageProcessor!.applyYellowFilter(origimage, green : 100, red : 100)
            UIView.animateWithDuration(1, animations: { self.imageView.alpha=0 })
                { completed in if(completed == true) {
                    self.imageView.image = self.filteredImage
                    //self.imageView.alpha=1
                    UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                    }}
            //imageView.image = filteredImage
            sender.selected = true
            filterImageShown=true
            comapreButton.enabled=true
            editButton.enabled=true
            lastFilter=Filter.Yellow
        }

    }
    
    @IBAction func onGreenPressed(sender: UIButton) {
        if(sender.selected){
            
        }else{
            //Apply Filter. Image cannot be non-null
            //origimage = imageView.image
            filteredImage = imageProcessor!.applyGreenFilter(origimage, green : 150)
            UIView.animateWithDuration(1, animations: { self.imageView.alpha=0 })
                { completed in if(completed == true) {
                    self.imageView.image = self.filteredImage
                    //self.imageView.alpha=1
                    UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                    }}
            //imageView.image = filteredImage
            sender.selected = true
            filterImageShown=true
            comapreButton.enabled=true
            editButton.enabled=true
            lastFilter=Filter.Green
        }

    }
    
    @IBAction func onBlueFilterPressed(sender: UIButton){
        if(sender.selected){
            
        }else{
            //Apply Filter. Image cannot be non-null
            //origimage = imageView.image
            filteredImage = imageProcessor!.applyBlueFilter(origimage, blue : 150)
            UIView.animateWithDuration(1, animations: { self.imageView.alpha=0 })
                { completed in if(completed == true) {
                    self.imageView.image = self.filteredImage
                    //self.imageView.alpha=1
                    UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                    }}
            //imageView.image = filteredImage
            sender.selected = true
            filterImageShown=true
            comapreButton.enabled=true
            editButton.enabled=true
            lastFilter=Filter.Blue
        }
    }
    
    @IBAction func onRedFilterPressed(sender: UIButton){
        if(sender.selected){
            
        }else{
            //Apply Filter. Image cannot be non-null
            //origimage = imageView.image
            filteredImage = imageProcessor!.applyRedFilter(origimage, red : 150)
            UIView.animateWithDuration(1, animations: { self.imageView.alpha=0 })
                { completed in if(completed == true) {
                    self.imageView.image = self.filteredImage
                    //self.imageView.alpha=1
                    UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                    }}
            
            //imageView.image = filteredImage
            sender.selected = true
            filterImageShown=true
            comapreButton.enabled=true
            editButton.enabled=true
            lastFilter=Filter.Red
        }
    }
    
    @IBAction func onNewPhoto(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: {
            action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .Default, handler: {
            action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        //ActionSheet is viewController which needs to presented
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func showCamera(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .Camera
        self.presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .PhotoLibrary
        self.presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            origimage = image
            filteredImage=image
            
            redFilterButton.selected=false
            blueFilterButton.selected=false
            greenFilterButton.selected=false
            yellowFilterButton.selected=false
            purpleFilterButton.selected=false
            
            filterImageShown=false
            comapreButton.enabled=false
            editButton.enabled=true
        }
        
    }
    
    var imageBeforeToggle : UIImage!
    func onImageClicked(sender: UILongPressGestureRecognizer){
        if(sender.state == UIGestureRecognizerState.Began){
            imageView.animationDuration=1
            imageBeforeToggle=imageView.image
            imageView.animationImages=[origimage as AnyObject, filteredImage as! AnyObject]
            imageView.startAnimating()
        }
        if(sender.state == UIGestureRecognizerState.Ended){
            if(imageView.isAnimating()){
                imageView.stopAnimating()
            }
            imageView.image=imageBeforeToggle
        }
        /*
        if(filterImageShown==true){
            imageView.image=origimage
            filterImageShown=false
        }else{
            imageView.image=filteredImage
            filterImageShown=true
        }
        */
    }
    
    @IBAction func onComparePressed(sender: UIButton) {
        editButton.selected=false
        filterButton.selected=false
        if(filterImageShown==true){
            //imageView.image=origimage
            //filterImageShown=false
            UIView.animateWithDuration(1, animations: { self.imageView.alpha=0 })
                { completed in if(completed == true) {
                    self.imageView.image = self.origimage
                    self.filterImageShown=false
                     UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                    }}
        }else{
            //imageView.image=filteredImage
            //filterImageShown=true
            UIView.animateWithDuration(1, animations: { self.imageView.alpha=0 })
                { completed in if(completed == true) {
                    self.imageView.image = self.filteredImage
                    self.filterImageShown=true
                    UIView.animateWithDuration(1, animations: {self.imageView.alpha=1})
                    }}
        }
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    @IBOutlet var imageToggle2: UIButton!
    
    @IBAction func onImageToggle(sender: UIButton) {
        if(imageToggle2.selected){
            imageView.image=self.origimage
            imageToggle2.selected=false
        }else{
            imageView.image=self.filteredImage
            imageToggle2.selected=true
        }
    }
    */
    @IBAction func onFilter(sender: UIButton) {
        hideSecondaryMenu(sliderView)
        editButton.selected=false
        if(sender.selected){
            hideSecondaryMenu(secondaryMenu)
            sender.selected=false;
        }else{
            showSecondaryMenu(secondaryMenu)
            sender.selected=true
        }
        
    }
    
    func hideSecondaryMenu(menuView : UIView){
        UIView.animateWithDuration(1, animations: { menuView.alpha=0 })
            { completed in if(completed == true) {menuView.removeFromSuperview()}}
    }
    
    func showSecondaryMenu( menuView : UIView){
        view.addSubview(menuView)
        
        let secondary_constraint_height: NSLayoutConstraint = NSLayoutConstraint(item: menuView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: bottomView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let secondary_constraint_width: NSLayoutConstraint = NSLayoutConstraint(item: menuView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: bottomView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        let secondary_constraint_bottom: NSLayoutConstraint = NSLayoutConstraint(item: menuView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: bottomView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        let secondary_constraint_left: NSLayoutConstraint = NSLayoutConstraint(item: menuView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: bottomView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        
        view.addConstraint(secondary_constraint_height)
        view.addConstraint(secondary_constraint_width)
        view.addConstraint(secondary_constraint_bottom)
        view.addConstraint(secondary_constraint_left)
        view.layoutIfNeeded()
        
        menuView.alpha = 0
        UIView.animateWithDuration( 1 ){
            menuView.alpha=1
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastFilter = Filter.None
        
        secondaryMenu.setTranslatesAutoresizingMaskIntoConstraints(false)
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        
        sliderView.setTranslatesAutoresizingMaskIntoConstraints(false)
        sliderView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        
        
        filterImageShown=false
        filteredImage=UIImage(named: "sample.png")!
        origimage = UIImage(named: "sample.png")!
        comapreButton.enabled=false
        editButton.enabled=false
        
        
        //var normalButton : UIImage = UIImage(named: "Wizard.png")!
        //redFilterButton.setImage(normalButton, forState: UIControlState.Normal)
        
        imageView.userInteractionEnabled=true
        var longPressGesture = UILongPressGestureRecognizer(target: self, action: "onImageClicked:")
        longPressGesture.enabled=true
        //default duration is 0.5 seconds
        imageView.addGestureRecognizer(longPressGesture)
        
       
        /*
        // Do any additional setup after loading the view, typically from a nib.
         origimage = UIImage(named: "sample.png")!
         imageToggle2.setTitle("Show Orig", forState: .Selected)
        
        let imageProcessor = ImageProcessor(redfactor: 2, bluefactor: 4, greenfactor: 8, lowerfactor: 2, higherfactor: 10, factor: 5)
        
        var imageFilter : String = "50% Brightness"
        self.filteredImage = imageProcessor.applyDefaultFilter(origimage, filter:imageFilter)
        imageFilter = "70% Brightness"
        filteredImage = imageProcessor.applyDefaultFilter(origimage, filter:imageFilter)
        imageFilter = "2X Contrast"
        filteredImage = imageProcessor.applyDefaultFilter(origimage, filter:imageFilter)
        
        imageFilter = "10X Contrast"
        filteredImage = imageProcessor.applyDefaultFilter(origimage, filter:imageFilter)
        
        imageFilter = "50% Brightness 2X Contrast"
        filteredImage = imageProcessor.applyDefaultFilter(origimage, filter:imageFilter)
        filteredImage = imageProcessor.filter_red_blue_green(origimage)
        
        
        filteredImage = imageProcessor.filter_contrast_unequal(filteredImage!)
        
        
        filteredImage = imageProcessor.filter_contrast_equal(filteredImage!)
        
        var filterOrder = [Int]()
        filterOrder.append(2)
        filterOrder.append(1)
        filterOrder.append(3)
        filteredImage = imageProcessor.applyOrderedFilter(origimage, filterorder: filterOrder)
        //imageView.image = filteredImage
        //print("Code Executed")
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

