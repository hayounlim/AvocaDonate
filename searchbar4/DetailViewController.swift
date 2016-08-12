//
//  DetailViewController.swift
//  searchbar4
//
//  Created by GEGWC8 on 8/4/16.
//  Copyright © 2016 GEGWC8. All rights reserved.
//




import UIKit

class DetailViewController: UIViewController {
    var clicked = UIColor.blackColor()
//    var navBar: UINavigationBar = UINavigationBar()
    
    var colorgreen = UIColor(netHex:0x5ea33f)
    var colororange = UIColor(netHex:0xff8803)



    
    //MARK: properties
    @IBOutlet weak var orgNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var donateButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phonenumLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
   
    @IBAction func donateButton(sender: UIButton) {
        
        for index in 0...(answerButton.count-1){
            print(answerButton[index].currentTitle)
            if (answerButton[index].backgroundColor == colororange){
                foodName.append(answerButton[index].currentTitle!)
            }
        }
        
//        for index in 0...(foodName.count-1){
//            print("food name", foodName[index])
//        }
        if (foodName.isEmpty){
            let myAlert = UIAlertController(title:"Alert", message: "Select an item to donate", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler:nil)
            
            
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            return;
        
        } else {
        
        self.performSegueWithIdentifier("DetailToDonate", sender: self)

        }
    }


    var candy: Candy! {
        didSet(newCandy){
            self.refreshUI()
        }
    }
    var isPlaying = [Bool]()
    var answerButton: Array<UIButton> = []
    var foodName: Array<String> = []

    
    
    func refreshUI(){
        answerButton = []
        
        orgNameLabel?.text = candy.name
        imageView?.image = UIImage(named:candy.picture)
        addressLabel?.text = candy.address
        emailLabel?.text = "Email: " + candy.email
        phonenumLabel?.text = "Phone number: " + candy.phonenum
        websiteLabel?.text = "Website: " + candy.website
        var ypos = 370
        let xpos = 15
//        var ctr = 0
        
        foodName = []
        

        
        for index in 0...(candy.food.count-1)
        {
            if index == 0
            {
                let button = UIButton(frame: CGRect(x: xpos, y: ypos, width: 10, height: 10))
                button.layer.cornerRadius = 0.3 * button.bounds.size.height
                button.backgroundColor = .whiteColor()
                button.setTitle(candy.food[index], forState: .Normal)
                button.setTitleColor(.blackColor(), forState: UIControlState.Normal)
                button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
                button.tag = index
                isPlaying.append(true)
                answerButton.append(button)
                self.view.addSubview(button)
            }
            else
            {
//                let thewidth = candy.food[index].characters.count * 15
                let button = UIButton(frame: CGRect(x: xpos, y: ypos, width: 100, height: 50))
                button.layer.cornerRadius = 0.3 * button.bounds.size.height
                button.backgroundColor = colorgreen
                button.setTitle(candy.food[index], forState: .Normal)
                button.setTitleColor(.whiteColor(), forState: UIControlState.Normal)
                button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
                button.tag = index
                isPlaying.append(true)
                answerButton.append(button)
                self.view.addSubview(button)
//                xpos = xpos + thewidth + 100
//                ctr = ctr + 1
//                if ((ctr % 3 == 0) || (xpos + thewidth) > 300){
//                    ypos = ypos + 70
//                    xpos = 15
//                }
            ypos = ypos + 70
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
//        setNavBarToTheView()

        
        for index in 0...(answerButton.count-1){
            print("answerButton name", answerButton[index].currentTitle)
        }
        
        let image:UIImage = UIImage(named:"bettertopbar.png")!
        
       // UINavigationBar.appearance().setBackgroundImage(navBgImage, forBarMetrics: .Default)
        
        self.navigationController?.navigationBar.setBackgroundImage(image, forBarMetrics: .Default)
        // Do any additional setup after loading the view.
    }
    
//    func setNavBarToTheView(){
    
//        navBar.frame = CGRectMake(0, 0, 320, 70)
//        self.view.addSubview(navBar)
//    }
    
    func buttonAction(sender: UIButton!) {
        if (isPlaying[sender.tag]){
            sender.backgroundColor = colororange
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            isPlaying[sender.tag] = false
        }
        else {
            sender.backgroundColor = colorgreen
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            isPlaying[sender.tag] = true
        }
        //sender.backgroundColor = UIColor.blueColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        //navigationItem.backBarButtonItem?.action = Selector("clearTheView")

        if (segue.identifier == "DetailToDonate") {
            let svc = segue.destinationViewController as! DonateViewController;
            
            svc.foodNameArray = foodName
            
        }
        

    }
    
    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        print("leave")
        for index in 0...(answerButton.count-1){
            answerButton[index].removeFromSuperview()
        }
        answerButton = []
        refreshUI()
        
    }

}




extension DetailViewController: CandySelectionDelegate {
    func candySelected(newCandy: Candy) {
        candy = newCandy
    }
}

