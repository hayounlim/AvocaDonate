//
//  DonateViewController.swift
//  searchbar4
//
//  Created by GEGWC8 on 8/5/16.
//  Copyright © 2016 GEGWC8. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController,UIPickerViewDelegate {
    
   // var navBar: UINavigationBar = UINavigationBar()
    var foodNameArray: Array<String> = []
    var ypos = 70
    var labelArray: Array<UILabel> = []
    private var myTextField: UITextField!
 //   let thegreen = UIColor(hexString: "#5ea33f")
    var color2 = UIColor(netHex:0x5ea33f)


    
    func refreshDetail(){
        for index in 0...(foodNameArray.count-1){
            let thewidth = foodNameArray[index].characters.count * 15
            let label = UILabel(frame:CGRect(x: 10, y: ypos, width: thewidth, height: 70))
            label.textAlignment = NSTextAlignment.Center
            label.text = foodNameArray[index]
            label.font = UIFont.systemFontOfSize(15)
            labelArray.append(label)
            
            self.view.addSubview(label)
           
            let sampleTextField = UITextField(frame: CGRect(x: Int(self.view.bounds.width-80), y: ypos+10, width: 70, height: 30))
            sampleTextField.text = "1"
            sampleTextField.font = UIFont.systemFontOfSize(15)
            sampleTextField.textColor = UIColor.blackColor()
            sampleTextField.textAlignment = NSTextAlignment.Center
            sampleTextField.borderStyle = UITextBorderStyle.RoundedRect
            sampleTextField.autocorrectionType = UITextAutocorrectionType.No
            sampleTextField.keyboardType = UIKeyboardType.Default
            sampleTextField.returnKeyType = UIReturnKeyType.Done
            sampleTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
//            sampleTextField.becomeFirstResponder()
            sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center

            sampleTextField.keyboardType = UIKeyboardType.NumberPad
            self.view.addSubview(sampleTextField)
            ypos = ypos + 30

        }
        
        // add picker
        
        // make DatePicker
        let myDatePicker: UIDatePicker = UIDatePicker()
        
        // setting properties of the datePicker
        ypos = ypos + 50
        myDatePicker.frame = CGRectMake(0, CGFloat(ypos), self.view.frame.width, 200)
        myDatePicker.timeZone = NSTimeZone.localTimeZone()
        myDatePicker.backgroundColor = UIColor.whiteColor()
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.layer.shadowOpacity = 0.5
        
        // add an event called when value is changed.
        myDatePicker.addTarget(self, action: #selector(DonateViewController.onDidChangeDate(_:)), forControlEvents: .ValueChanged)
        
        // add DataPicker to the view
       // self.view.addSubview(myDatePicker)
        
        // make UITextField to show the selected value
    //    ypos = ypos + 250
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        myTextField.text = ""
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2,y: CGFloat(ypos));
        
        // add UITextField to the view
    //    self.view.addSubview(myTextField)
        
        
        // add button
    //    ypos = ypos + 30
        let button = UIButton(frame: CGRect(x: Int(self.view.bounds.width/2 - 50), y: ypos, width: 100, height: 50))
        button.backgroundColor = color2
        button.layer.cornerRadius = 20
        button.setTitle("Confirm", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button)
        
    }
    @IBAction func onDidChangeDateByOnStoryboard(sender: UIDatePicker) {
        self.onDidChangeDate(sender)
    }
    
    func buttonAction(sender: UIButton!) {
        
        
            let myAlert = UIAlertController(title:"Thank you!", message: "Email to the organization has been sent! You will be notified shortly", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler:nil)
            
            
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated: true, completion: nil)
        
//            let myAlert = UIAlertController(title:"Invalid", message: "The number you entered is invalid! Please try again.", preferredStyle: UIAlertControllerStyle.Alert)
//            
//            let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler:nil)
//            
//            
//            myAlert.addAction(okAction);
//            self.presentViewController(myAlert, animated: true, completion: nil)
            
           
        
        
        
        //dporjglkenokejrsokjfd;owkljeg;glkawjreg;dlkjwseg;lkrn;flkner;gkn;erlkgn;lrekgn;klenrg
//        self.performSegueWithIdentifier("toHome", sender: self)
    }
    
    // called when the date picker called.
    internal func onDidChangeDate(sender: UIDatePicker){
        
        // date format
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "MM/dd/yyyy hh:mm"
        
        // get the date string applied date format
        let mySelectedDate: NSString = myDateFormatter.stringFromDate(sender.date)
        myTextField.text = mySelectedDate as String
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
//        setNavBarToTheView()
        refreshDetail()
        
        //back button
        let button = UIButton(type: .System) // let preferred over var here
        button.frame = CGRectMake(2, 20, 70, 30)
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("< Back", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }    

    //button action
    func pressed(sender: UIButton!) {
        //self.performSegueWithIdentifier("toHome", sender: self)
        self.dismissViewControllerAnimated(true, completion:nil);
    
    

        // Do any additional setup after loading the view.
    }
    
//    func setNavBarToTheView(){
//    
//        navBar.frame = CGRectMake(0, 0, 320, 70)
//        self.view.addSubview(navBar)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
                ypos = 20
            labelArray = []
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}