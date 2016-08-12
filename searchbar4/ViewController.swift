//
//  ViewController.swift
//  searchbar4
//
//  Created by GEGWC8 on 8/3/16.
//  Copyright © 2016 GEGWC8. All rights reserved.
//

import UIKit

protocol CandySelectionDelegate: class {
    func candySelected(newCandy: Candy)
}

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    var candies = [Candy]()
    var searchController: UISearchController!
    var resultsController = UITableViewController()
    var filteredCandies = [Candy]()
    weak var delegate: CandySelectionDelegate?
    
    
    func resizeImage(image:UIImage, toTheSize size:CGSize)->UIImage{
        
        let scale = CGFloat(max(size.width/image.size.width,
            size.height/image.size.height))
        let width:CGFloat  = image.size.width * scale
        let height:CGFloat = image.size.height * scale;
        
        let rr:CGRect = CGRectMake( 0, 0, width, height);
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        image.drawInRect(rr)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return newImage
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        
        self.candies.append(Candy(address:"225 Potrero Avenue, San Francisco, CA 94103", name:"Martin de Porres", food:["","carrots","noodles", "rice"], picture: "orgmartindeporres.jpg", email:"info@martindeporres.org", phonenum:"(415) 552-0240",website:"http://martindeporres.org"))
        self.candies.append(Candy(address:"7900 Edgewater Drive, Oakland, CA 94621", name:"Alameda County Food Bank", food:["","bananas","apples"], picture: "orgalamedacountyfoodbank.jpg", email:"info@accfb.org", phonenum:"(510) 635-3663",website:"http://www.accfb.org/"))
        self.candies.append(Candy(address:"4010 Nelson Ave, Concord, CA 94520", name:"Contra Costa Food Bank", food:["","water","coke"], picture: "orgcontracostafoodbank.jpg", email:"info@foodbankccs.org", phonenum:"(925) 676-7543",website:"https://www.foodbankccs.org/"))
        self.candies.append(Candy(address:"835 Ferry Street, Martinez, CA 94553", name:"Loaves and Fishes", food:["","sprite","sandwiches"], picture: "orgloavesandfishes.jpg", email:"info@loavesfishescc.org", phonenum:"(925) 293 - 4792",website:"http://www.loavesfishescc.org/"))
        self.candies.append(Candy(address:"123 Macdonald Avenue, Richmond, CA 94801", name:"Bay Area Rescue Mission", food:["","milk","bread"], picture: "orgbayarearescuemission.jpg", email:"info@bayarearescue.org", phonenum:"(510) 215-4887",website:"http://www.bayarearescue.org/"))
//        self.candies.append(Candy(category:"Hard", name:"Organization", food:["","rice","brown rice"], picture: "org"))
//        self.candies.append(Candy(category:"Hard", name:"Organization", food:["","salads","pies"]))
//        self.candies.append(Candy(category:"Other", name:"Organization", food:["","apple juice","coffee"]))
//        self.candies.append(Candy(category:"Other", name:"Organization", food:["","chips","watermelon"]))
//        self.candies.append(Candy(category:"Other", name:"Organization", food:["","cakes","pineapples"]))
        

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
//        self.searchController = UISearchController(searchResultsController: self.resultsController)
//        self.tableView.tableHeaderView = self.searchController.searchBar
//        self.searchController.searchResultsUpdater = self
//        self.searchController.dimsBackgroundDuringPresentation = true
//        definesPresentationContext = true
        
        //back button
        let button = UIButton(type: .System) // let preferred over var here
        button.frame = CGRectMake(2, 20, 70, 30)
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("< Back", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    //button action
    func pressed(sender: UIButton!) {
        self.performSegueWithIdentifier("toHome", sender: self)
        //self.dismissViewControllerAnimated(true, completion:nil);
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredCandies = self.candies.filter {(candies:Candy) -> Bool in
            if candies.name.lowercaseString.containsString(self.searchController.searchBar.text!.lowercaseString) {
                return true
            }
            else if candies.address.lowercaseString.containsString(self.searchController.searchBar.text!.lowercaseString){
                return true
            }
            else {
                return false
            }
        }
        self.resultsController.tableView.reloadData()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return self.candies.count
        } else {
            return self.filteredCandies.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        var candy:Candy
        if tableView == self.tableView {
            candy = candies[indexPath.row]
            cell.labUerName.text = candy.name
            let imageName = candy.picture
            let image = UIImage(named: imageName)
            let newImage = resizeImage(image!, toTheSize: CGSizeMake(80, 80))
            let cellImageLayer: CALayer?  = cell.imgUser.layer
            cellImageLayer!.cornerRadius = cellImageLayer!.frame.size.width / 2
            cellImageLayer!.masksToBounds = true
            cell.imgUser.image = newImage
            
            
        }
        else {
            candy = filteredCandies[indexPath.row]
            cell.labUerName.text = candy.name
            let imageName = candy.name
            let image = UIImage(named: imageName)
            let newImage = resizeImage(image!, toTheSize: CGSizeMake(80, 80))
            let cellImageLayer: CALayer?  = cell.imgUser.layer
            cellImageLayer!.cornerRadius = cellImageLayer!.frame.size.width / 2
            cellImageLayer!.masksToBounds = true
            cell.imgUser.image = newImage
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView,
                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCandy = self.candies[indexPath.row]
        self.delegate?.candySelected(selectedCandy)
        
        if let detailViewController = self.delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController.navigationController!, sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "toDetailPage",
            let destination = segue.destinationViewController as? DetailViewController,
            index = tableView.indexPathForSelectedRow?.row
        {
            destination.candy = candies[index]
        }
    }
    
    
}

