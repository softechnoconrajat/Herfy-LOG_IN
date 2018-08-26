//
//  HomeScreen.swift
//  LOG_IN
//
//  Created by Raja Sinha on 8/19/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//

import UIKit
import CocoaMQTT

var code: Int = Int()

class HomeScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    var mqtt: CocoaMQTT!
    
    var screenWidth : CGFloat = 0.0
    var screenHeight : CGFloat = 0.0
    
    //   var vT = VechileCurrentTime()
    
    
    // {} is referred to as closure, or anon. function
    
    
    // Logo for the Herfy app
    
    let logo : UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "h_logo")
        logo.isHighlighted = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        
        
        return logo
        
    }()
    
    
    
    
    // Label for day and Time Display
    
//    let dayTimeLabel : UILabel = {
//        let label = UILabel()
//
//        //this enables autolayout for headLabel
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.contentMode = .scaleAspectFit
//        return label
//    }()
    
    
    
    var logOutButton : UIButton = {

        var button = UIButton(type: .custom)
        button.setTitle("Logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(toDologOut), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        return button
    }()
    
    //Efficency label for Delivered Item
    
//    let efficiencyLabel : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.contentMode = .scaleAspectFit
//        label.text = "Efficiency"
//        label.textAlignment = .center
//        return label
//    }()
    
  
    // Label for displaying data for efficency
    
    let efficiencyDataLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "Efficiency: 0.0"
        label.textAlignment = .center
        return label
    }()
    
    
    
    // label for Order Queue Title
    let orderLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "Order Queue"
        return label
    }()
    
    
    // label for Delivery Queue Title
    let deliveryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "Delivery Queue"
        return label
    }()
    
    // label for Delivered Title
    let deliveredLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "Delivered"
        return label
    }()
    
    // label for Order Queue Data
    let orderData : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        //label.font = UIFont(name: "Helveticaneue_Bold", size: 32.0)
        return label
    }()
    
    // label for Delivery Queue Data
    let deliveryData : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    
    // Timer1 for delivery Data
    
    let deliveryTimer1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        //  label.backgroundColor = UIColor.red
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    // Timer2 for delivery Data
    
    let deliveryTimer2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        //  label.backgroundColor = UIColor.blue
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    // Timer3 for delivery Data
    
    let deliveryTimer3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        //  label.backgroundColor = UIColor.green
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    // Timer4 for delivery Data
    
    let deliveryTimer4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        // label.backgroundColor = UIColor.yellow
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    //Order Timer 1
    
    let orderTimer1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        // label.backgroundColor = UIColor.magenta
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    // label for Delivered Data
    let deliveredData : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    
    // Label to display average delivery Time
    
    let averageDel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    let averageDetTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0 : 0"
        return label
    }()
    
    var button : UIButton = {
        
        var button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(pressDrop), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        return button
    }()
    
    
    //LogOut Button
    
    @objc func toDologOut(){
        UserDefaults.standard.set(false, forKey: "LoggedInSuccessfully")
        self.navigationController?.popToRootViewController(animated: true)

    } // End of Logout Function
    

    var tableViews = UITableView()


    
    //MQTT Implementation
    
    var pr = false
    var n = 2
    var subscribed = false
    var unsubscribed = false
   
    
    
   
    
       
        
       
        
        
    
    
    // TO calculate the overall Average.
    
    func averagePerformance(time: Int, count: Int){
        let time : Int = time
        let countVech : Int = count
        
        var aver : Int = Int()
        
        var a : Int = 0
        var b : Int = 0
        
        
        if countVech == 0{
            print(Error.self)
        }
        else{
            aver =  (time/countVech)
            a = aver % 60 //Seconds
            b = aver / 60 //Minutes
            
            if b > 59 {
                b = 0
            }
            
            DispatchQueue.main.async {
                
                self.averageDel.text = "\(b)  :  \(a)"
                
            }//End of DispatchQueue
            
        }// End of Else Statement
        
    }//End of average Performance
    
    // update Time for the timer
    
    let obj1 = VechileCurrentTime()
    let obj2 = VechileCurrentTime()
    let obj3 = VechileCurrentTime()
    let obj4 = VechileCurrentTime()
    let obj5 = VechileCurrentTime()
    
    
    func orderqueue(orderQueue: Array<Int>)  {
        
        let oQ : Array<Int>
        oQ = orderQueue
        
        
        obj1.resetTimer(label: orderTimer1)
        //        obj2.resetTimer(label: deliveryTimer1)
        //        obj3.resetTimer(label: deliveryTimer2)
        //        obj4.resetTimer(label: deliveryTimer3)
        //        obj5.resetTimer(label: deliveryTimer4)
        
        if oQ.isEmpty == false{
            
            obj1.startTimer(orderTimer1, oQ[0], 1)
            
            
        }
        else{
            
            obj1.resetTimer(label: orderTimer1)
            
        }
        
    }//End of OrderQueurArray
    
    func deliveryQueue(deliveryQueue: Array<Int>) {
        
        let dQ : Array<Int>
        dQ = deliveryQueue
        
        obj2.resetTimer(label: deliveryTimer1)
        obj3.resetTimer(label: deliveryTimer2)
        obj4.resetTimer(label: deliveryTimer3)
        obj5.resetTimer(label: deliveryTimer4)
        
        
        if dQ.isEmpty == false{
            if dQ.count == 1 {
                
                obj2.startTimer(deliveryTimer1, dQ[0], 2)
                
            }
            else if dQ.count == 2 {
                
                obj2.startTimer(deliveryTimer1, dQ[0], 2)
                obj3.startTimer(deliveryTimer2, dQ[1], 2)
                
                
            }
            else if dQ.count == 3 {
                
                obj2.startTimer(deliveryTimer1, dQ[0], 2)
                obj3.startTimer(deliveryTimer2, dQ[1], 2)
                obj4.startTimer(deliveryTimer3, dQ[2], 2)
            }
            
        }
            
            // Else if Empty.
            
        else{
            obj2.resetTimer(label: deliveryTimer1)
            obj3.resetTimer(label: deliveryTimer2)
            obj4.resetTimer(label: deliveryTimer3)
            obj5.resetTimer(label: deliveryTimer4)
            //
        }
        
    } // End of delivery queue function
    
    
    // function to update time
    
//    @objc func updateSaudiTime(){
//        
//        
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
//        dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
//        
//        let str = dateFormatter.string(from : date)
//        
//        
//        self.dayTimeLabel.text = str
        
  //  } //End of function updateTime.
    
    
    // Setting Up MQTT
    
    func setUpMQTT() {
        
        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: "13.126.194.18", port: 1883)
        mqtt.willMessage = CocoaMQTTWill(topic: "/will", message: "dieout")
        mqtt.keepAlive = 60
        mqtt.connect()
        mqtt.delegate = self
    }
    
    // Variable Declaration for Expected Time eT, Maximum Interval, and Order Queue
    
    var a : [Int] = []
    var b : [Int] = []
    var c : [String] = []
    
    var rest_Id : Int = Int()
    var dropDownOption : [String] = Array()
    var rest_name : String = String()
    
    var restDetails = [String: Int]()
    
    
    //Function to ghet the expected time for delivery and populating the array
    func expectedTime()->(a:Array<Int>, b:Array<Int>, c:Array<String>, restDetails:[String : Int]){
        
        
        let url = URL(string: "http://13.126.194.18:4200/api/expTime")
        
        do{
            let data =  try Data(contentsOf: url!)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            if let array = json as? [Any] {
                
                for x in array{
                    if let dataStatus = x as? [String:Any] {
                        
                        if  let eT = dataStatus["max_interval"]  as? Int  {
                            
                            a += [eT]
                            
                        }
                        
                        if let mI = dataStatus["expected_interval"] as? Int{
                            b += [mI]
    
                        }
                        
                        if let qN = dataStatus["queue_name"] as? String{
                            c += [qN]
                           
                            
                        }
                    }//end of dataStatus loop
                } // end of for array loop
                
                for (index, value) in array.enumerated() {
                    if(index > 2){
                        //guard let rest_details = value as? String else {return}
                        
                        if let rest_details = value as? [String: Any]{
                            
                            if let id = rest_details["id"] as? Int {
                                rest_Id = id
                            }
                            
                            if let restName = rest_details["name"] as? String {
                                rest_name = restName
                                dropDownOption += [restName]
                            }
                            // DropDownList
                            dropdownList = dropDownOption
                        }
                        restDetails[rest_name] = rest_Id
                    }
                }
                
            }//end of Array Loop
            
        }//end of Do Array Loop
            
        catch {
            print(error)
        }
        return (a,b,c, restDetails )
    }//End of function to calculate expected Time
    
    
    var flag = 0
    
    var dropdownList : Array<String> = Array()
    
  
    
    
    // Main View Did Load Function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     
        let screenSize : CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        setUpMQTT()
        
        self.setupLayout()
        self.expectedTime()
        
//        Timer.scheduledTimer(timeInterval: 0.10, target: self, selector: #selector(HomeScreen.updateSaudiTime), userInfo: nil, repeats: true)       
    }
    
    // Layout of the views
    
    func setupLayout(){
        
        
        view.backgroundColor = UIColor.black
        
        //Container for header view
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.black
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        
        headerView.addSubview(logo)
        
        logo.topAnchor.constraint(equalTo: headerView.topAnchor, constant:11).isActive = true
        logo.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 0).isActive = true
        logo.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -290).isActive = true
        logo.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.90).isActive = true
        
        headerView.bringSubview(toFront: logo)
        
        
        // Day Time Label

//        headerView.addSubview(dayTimeLabel)

//        dayTimeLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10).isActive = true
//        dayTimeLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 70).isActive = true
//        dayTimeLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -80).isActive = true
//
//        dayTimeLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.9).isActive = true
//        dayTimeLabel.textAlignment = .center
//        dayTimeLabel.font = UIFont(name: "Arial", size: 18.0)
//        dayTimeLabel.textColor = UIColor.white
        
        
        
        
        
        // LogOut Buttom at header
        
        headerView.addSubview(logOutButton)

        logOutButton.translatesAutoresizingMaskIntoConstraints = false

        logOutButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 30).isActive = true
        logOutButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 285).isActive = true
        logOutButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -5).isActive = true

        logOutButton.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
        logOutButton.layer.borderWidth = 0.5
        logOutButton.backgroundColor = UIColor.black
        
        // Efficenecy Time Table
        
//        headerView.addSubview(efficiencyLabel)
        
//        efficiencyLabel.translatesAutoresizingMaskIntoConstraints = false
//        efficiencyLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15).isActive = true
//        efficiencyLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 182).isActive = true
//        efficiencyLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -85).isActive = true
//        efficiencyLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.3).isActive = true
//        efficiencyLabel.backgroundColor = UIColor.efficiencyLabelColor
//        efficiencyLabel.layer.cornerRadius = 0.25
//
        
        
        // Efficiency Data Label
        
        headerView.addSubview(efficiencyDataLabel)
        
        efficiencyDataLabel.translatesAutoresizingMaskIntoConstraints = false
        efficiencyDataLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 35).isActive = true
        efficiencyDataLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 90).isActive = true
        efficiencyDataLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -95).isActive = true
        efficiencyDataLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.7).isActive = true
        efficiencyDataLabel.backgroundColor = UIColor.black
        efficiencyDataLabel.textColor = UIColor.white
        efficiencyDataLabel.font = UIFont(name: "Arial", size: 25.0)
        
        
        //Container for order view
        let orderView = UIView()
        orderView.backgroundColor = UIColor.subViewContainerColor
        view.addSubview(orderView)
        
        orderView.translatesAutoresizingMaskIntoConstraints = false
        orderView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 2).isActive = true
        orderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        orderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        orderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        
        
        
        
        
        // Contenet of Order View conatainer
        
        // order Title
        orderView.addSubview(orderLabel)
        orderLabel.centerXAnchor.constraint(equalTo: orderView.centerXAnchor, constant: -100).isActive = true
        //orderLabel.centerYAnchor.constraint(equalTo: orderView.centerYAnchor).isActive = true
        
        orderLabel.centerYAnchor.constraint(equalTo: orderView.centerYAnchor, constant: -80).isActive = true
        
        orderLabel.heightAnchor.constraint(equalTo:  orderView.heightAnchor, multiplier: 0.2).isActive = true
        orderLabel.textAlignment = .center
        orderLabel.font = UIFont(name: "Arial", size: 20.0)
        orderLabel.textColor = UIColor.black
        
        orderLabel.shadowOffset = CGSize(width: 2, height: 4)
        orderLabel.shadowColor = UIColor.white
        
        
        
        // order Data
        
        orderView.addSubview(orderData)
        orderData.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 0).isActive = true
        orderData.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 10).isActive = true
        orderData.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -220).isActive = true
        orderData.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.78).isActive = true
        
        
        orderData.backgroundColor = UIColor.orderBGColor
        orderData.textAlignment = .center
        
        
        orderData.font = UIFont(name: "Arial", size: 70)
        
        orderData.textColor = .white
        orderData.shadowOffset = CGSize(width: 8, height: 4)
        orderData.shadowColor = UIColor.black
        
        
        
        // Order Queue Timer1
        
        orderView.addSubview(orderTimer1)
        
        orderTimer1.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 80).isActive = true
        orderTimer1.leadingAnchor.constraint(equalTo: orderData.trailingAnchor, constant: 10).isActive = true
        orderTimer1.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -120).isActive = true
        orderTimer1.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.35).isActive = true
        
        
        orderTimer1.isHidden = true
        
        
        
        
        //Container for delivery view
        
        let deliveryView = UIView()
        deliveryView.backgroundColor = UIColor.subViewContainerColor
        view.addSubview(deliveryView)
        
        deliveryView.translatesAutoresizingMaskIntoConstraints = false
        deliveryView.topAnchor.constraint(equalTo: orderView.bottomAnchor, constant: 2).isActive = true
        deliveryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        deliveryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        deliveryView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        //Delivery Title
        
        
        deliveryView.addSubview(deliveryLabel)
        deliveryLabel.centerXAnchor.constraint(equalTo: deliveryView.centerXAnchor, constant: -100).isActive = true
        //        deliveryLabel.centerYAnchor.constraint(equalTo: deliveryView.centerYAnchor).isActive = true
        deliveryLabel.centerYAnchor.constraint(equalTo: deliveryView.centerYAnchor, constant: -80).isActive = true
        deliveryLabel.heightAnchor.constraint(equalTo:  deliveryView.heightAnchor, multiplier: 0.2).isActive = true
        deliveryLabel.textAlignment = .center
        deliveryLabel.font = UIFont(name: "Arial", size: 20.0)
        deliveryLabel.textColor = UIColor.black
        
        deliveryLabel.shadowOffset = CGSize(width: 2, height: 4)
        deliveryLabel.shadowColor = UIColor.white
        
        //delivery Data
        deliveryView.addSubview(deliveryData)
        
        deliveryData.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 0).isActive = true
        deliveryData.leadingAnchor.constraint(equalTo: deliveryView.leadingAnchor, constant: 10).isActive = true
        deliveryData.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -220).isActive = true
        deliveryData.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.78 ).isActive = true
        
        deliveryData.backgroundColor = UIColor.deliveryBGColor
        deliveryData.textAlignment = .center
        deliveryData.font = UIFont(name: "Arial", size: 70.0)
        
        
        deliveryData.textColor = .white
        deliveryData.shadowOffset = CGSize(width: 8, height: 4)
        deliveryData.shadowColor = UIColor.black
        
        
        
        //Delivery Timer1
        
        deliveryView.addSubview(deliveryTimer1)
        
        deliveryTimer1.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 80).isActive = true
        deliveryTimer1.leadingAnchor.constraint(equalTo: deliveryData.trailingAnchor, constant: 10).isActive = true
        deliveryTimer1.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -120).isActive = true
        deliveryTimer1.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true
        
        deliveryTimer1.isHidden = true
        
        //Delivery Timer2
        
        deliveryView.addSubview(deliveryTimer2)
        
        deliveryTimer2.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 80).isActive = true
        deliveryTimer2.leadingAnchor.constraint(equalTo: deliveryTimer1.trailingAnchor, constant: 10).isActive = true
        deliveryTimer2.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -20).isActive = true
        deliveryTimer2.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true
        
        deliveryTimer2.isHidden = true
        
        //Delivery Timer3
        
        deliveryView.addSubview(deliveryTimer3)
        
        deliveryTimer3.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant:0).isActive = true
        deliveryTimer3.leadingAnchor.constraint(equalTo: deliveryData.trailingAnchor, constant: 10).isActive = true
        deliveryTimer3.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant:-120).isActive = true
        deliveryTimer3.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true
        
        deliveryTimer3.isHidden = true
        
        //Delivery Timer4
        
        deliveryView.addSubview(deliveryTimer4)
        
        deliveryTimer4.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant:0).isActive = true
        deliveryTimer4.leadingAnchor.constraint(equalTo: deliveryTimer3.trailingAnchor, constant: 10).isActive = true
        deliveryTimer4.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -20).isActive = true
        deliveryTimer4.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true
        
        deliveryTimer4.isHidden = true
        
        
        
        //Container for delivered view
        
        let deliveredView = UIView()
        deliveredView .backgroundColor = UIColor.subViewContainerColor
        view.addSubview(deliveredView )
        
        deliveredView .translatesAutoresizingMaskIntoConstraints = false
        deliveredView .topAnchor.constraint(equalTo: deliveryView.bottomAnchor, constant: 2).isActive = true
        deliveredView .leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        deliveredView .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        deliveredView .heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        // Contenet of delivered View conatainer
        
        deliveredView.addSubview( deliveredLabel)
        deliveredLabel.centerXAnchor.constraint(equalTo: deliveredView.centerXAnchor, constant:-100).isActive = true
        //         deliveredLabel.centerYAnchor.constraint(equalTo: deliveredView.centerYAnchor).isActive = true
        deliveredLabel.centerYAnchor.constraint(equalTo: deliveredView.centerYAnchor, constant: -80).isActive = true
        deliveredLabel.heightAnchor.constraint(equalTo:  deliveredView.heightAnchor, multiplier: 0.2).isActive = true
        deliveredLabel.textAlignment = .center
        deliveredLabel.font = UIFont(name: "Arial", size: 20.0)
        deliveredLabel.textColor = UIColor.black
        
        deliveredLabel.shadowOffset = CGSize(width: 2, height: 4)
        deliveredLabel.shadowColor = UIColor.white
        
        
        //delivered Data
        
        deliveredView.addSubview(deliveredData)
        
        deliveredData.topAnchor.constraint(equalTo: deliveredLabel.bottomAnchor, constant: 0).isActive = true
        deliveredData.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 10).isActive = true
        deliveredData.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -220).isActive = true
        deliveredData.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.78).isActive = true
        
        deliveredData.backgroundColor = UIColor.deliveredBGColor
        deliveredData.textAlignment = .center
        deliveredData.font = UIFont(name: "Arial", size: 70.0)
        
        deliveredData.textColor = .white
        deliveredData.shadowOffset = CGSize(width: 8, height: 4)
        deliveredData.shadowColor = UIColor.black
        
        
        deliveredView.addSubview(averageDel)
        
        averageDel.topAnchor.constraint(equalTo: deliveredView.topAnchor, constant: 65).isActive = true
        averageDel.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 160).isActive = true
        averageDel.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -10).isActive = true
        averageDel.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.60).isActive = true
        averageDel.font = UIFont(name: "Arial", size: 38.0)
        
        averageDel.backgroundColor = UIColor.black
        averageDel.textColor = UIColor.red
        
        averageDel.textAlignment = NSTextAlignment.center
        
        
        
        // Title for delivery average
        
        deliveredView.addSubview(averageDetTitle)
        
        averageDetTitle.topAnchor.constraint(equalTo: deliveredView.topAnchor, constant: 37).isActive = true
        averageDetTitle.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 160).isActive = true
        averageDetTitle.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -10).isActive = true
        averageDetTitle.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.30).isActive = true
        averageDetTitle.font = UIFont(name: "Arial", size: 20.0)
        
        averageDetTitle.backgroundColor = UIColor.black
        averageDetTitle.textColor = UIColor.white
        averageDetTitle.text = "Overall Average"
        
        
        
        averageDetTitle.textAlignment = NSTextAlignment.center
        
        
        orderView.addSubview(button)
        button.setTitle("Resturents", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.topAnchor.constraint(equalTo: orderView.topAnchor, constant: 5).isActive = true
        button.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 240).isActive = true
        button.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -5).isActive = true
        button.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.22).isActive = true
        
        
        // for tableView
        orderView.addSubview(tableViews)
        
        //registering the cell
        tableViews.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //It's give button x position and y position
        
        tableViews.frame = CGRect(x: button.frame.origin.x, y: button.frame.origin.y, width: button.frame.width, height: 100)
        tableViews.delegate = self
        tableViews.dataSource = self
        
        tableViews.isHidden = true
        
    }//End of setupLayout function
    
    
    
    
    // function pressDrop
    @objc func pressDrop(){
        if flag == 0 {
            // hide so height 0
            UIView.animate(withDuration: 0.1){
                self.tableViews.frame = CGRect(x: self.button.frame.origin.x, y: self.button.frame.origin.y + self.button.frame.height, width: self.button.frame.width, height: 0)
                self.tableViews.isHidden = true
                
                // set flag to 1
                self.flag = 1
            }
            
        }
        else{
            //show
            UIView.animate(withDuration: 0.1){
                
                self.tableViews.frame = CGRect(x: self.button.frame.origin.x, y: self.button.frame.origin.y + self.button.frame.height, width: self.button.frame.width, height: 100)
                self.tableViews.isHidden = false
                
                // set flag to 1
                self.flag = 0
                
            }
        }
    } //End of PressDrop Function
    
    
    
    // number of selection in dropdown
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in dropdown
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownList.count
    }
    
    // height of each dropdown row
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //display in dropdown list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViews.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell"
        cell.textLabel?.text = dropdownList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get the value for the row
        button.setTitle(dropdownList[indexPath.row], for: .normal)
        
        self.tableViews.frame = CGRect(x: self.button.frame.origin.x, y: self.button.frame.origin.y + self.button.frame.height, width: self.button.frame.width, height: 0)
        self.tableViews.isHidden = true
        
        self.flag = 1
        pr(string: dropdownList[indexPath.row])
    }
    
    var restCode = Int()
    func pr(string: String){
        
        let (_, _, _, restDetails) = expectedTime()
        // code = restDetails[string]!
        restCode = restDetails[string]!
        pressNow()
    }
    
    // Function for resturents details
    
    @objc func pressNow() {
        
        var orderQueueArr : Array<Int> = Array()
        var deliveryQueueArr : Array<Int> = Array()
        //        var deliveredQueueArr : Array<Int> = Array()
        var arrayEfficiency : Array<Int> = []
        
        
        var deliveredQueueData : Int = Int()
        
        var secondsInOrder1 : Int = Int()
        var secondsInOrder2 : Int = Int()
        
        
        
        let parameters = ["resID": restCode]
        
        guard let url = URL(string : "http://13.126.194.18:4200/api/log") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            else{return}
        
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            //                        if let response = response {
            //                            print(response)
            //                        }
            if let data = data{
                
                // if data.isEmpty == false
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                    self.initScreen()
                    
                    if let array = json as? [String:Any] {
                        
                        if let code = array["code"] as? Int {
                            print("code: \(code)")
                            
                            self.initScreen()
                        }
                            
                            
                        else{
                            if let code = array["log"] as? [Any]{
                                var x = 0
                                var y = 0
                                var z = 0
                                let date = Date()
                                let dateFormatter = DateFormatter()
                                var stringToDate : Date
                                
                                
                                
                                
                                
                                for user in code{
                                    
                                    
                                    
                                    if let userDict = user as? [String:Any] {
                                        
                                        
                                        if let status = userDict["status"] as? Int {
                                            if status == 1 {
                                                
                                                if let orderQueData = userDict["passage_queue"] as? String {
                                                    
                                                    //Calculate current Saudi Time
                                                    
                                                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                                    dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                                    
                                                    
                                                    //Differenece in Time
                                                    
                                                    stringToDate = dateFormatter.date(from: orderQueData)!
                                                    let secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                                    
                                                    orderQueueArr += [secondsInOrder]
                                                    
                                                }//End of Order Queue Loop
                                                
                                                x = x+1
                                                
                                            } // End of Status == 1 Loop
                                                
                                            else if status == 2 {
                                                
                                                if let deliveryQueData = userDict["order_queue"] as? String {
                                                    
                                                    //calculate Current saudi Time
                                                    
                                                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                                    dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                                    
                                                    
                                                    
                                                    //difference in Time
                                                    
                                                    stringToDate = dateFormatter.date(from: deliveryQueData)!
                                                    
                                                    // return Seconds In Delivery Queue return Type Int
                                                    let secondsInDelivery = date.seconds(from: stringToDate)
                                                    
                                                    
                                                    
                                                    // self.updateVechileTimer(sec: secondsInDelivery, stat: status)
                                                    
                                                    deliveryQueueArr += [secondsInDelivery]
                                                    
                                                    
                                                    
                                                }//End of delivery Queue Data
                                                
                                                y = y + 1
                                                
                                            } // End of Status == 2 Loop
                                                
                                            else if status == 3 {
                                                
                                                
                                                if let deliveredQueData = userDict["delivery_queue"] as? String {
                                                    
                                                    //Calculate current Saudi Time
                                                    
                                                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                                    dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                                    
                                                    
                                                    //Differenece in Time
                                                    
                                                    stringToDate = dateFormatter.date(from: deliveredQueData)!
                                                    let secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                                    
                                                    //deliveredQueueArr += [secondsInOrder]
                                                    secondsInOrder1 = secondsInOrder
                                                    
                                                  
                                                    
                                                    
                                                }//End of Order Queue Loop
                                                
                                                if let orderQueData = userDict["passage_queue"] as? String {
                                                    
                                                    //Calculate current Saudi Time
                                                    
                                                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                                    dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                                    
                                                    
                                                    //Differenece in Time
                                                    
                                                    stringToDate = dateFormatter.date(from: orderQueData)!
                                                    let secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                                    
                                                    secondsInOrder2 = secondsInOrder
                                                    
                                                }//End of PassageQueue Data
                                                
                                                deliveredQueueData += secondsInOrder2 - secondsInOrder1
                                                // for checking the efficiency
                                                
                                                arrayEfficiency += [secondsInOrder2-secondsInOrder1]
                                                
                                               
                                                z = z + 1
                                                
                                            }//end of status == 3 Loop
                                        } //end of for user Loop
                                    }//End of Status Loop
                                } //End of UserDict Loop
                                DispatchQueue.main.async {
                                    self.orderData.text = String(x)
                                    self.deliveryData.text = String(y)
                                    self.deliveredData.text = String(z)
                                    
                                }
                                self.orderqueue(orderQueue: orderQueueArr)
                                self.deliveryQueue(deliveryQueue: deliveryQueueArr)
                                self.averagePerformance(time: deliveredQueueData, count: z)
                                self.arrayEfficiencyData(arrayEfficiency, z)
                            } //end of do
                        }//End of "Code" Loop
                    } // End of Else for No code == 204
                    
                    
                }//End of "Array" Loop
                    
                catch{
                    print(error)
                }//end of catch
                
                // }//End of If Empty Startement
                //            else{
                //                print("empty data")
                //            }
            }// end of data task
            }.resume()//end of seesion.datatask
    } // End of Fuction to bring resturents data
    
    
    // Function to calculate the Efficieny for the function
    
    func arrayEfficiencyData(_ arrayOrderEfficiency: Array<Int>,_ totalNoOfDeliveredOrder:Int ){
        
        var noOfOrderDelivered = 0
        noOfOrderDelivered = totalNoOfDeliveredOrder
        var timeForOrderDeliveredArray : Array<Int> = []
        timeForOrderDeliveredArray = arrayOrderEfficiency
        var arraySizeCounterLength = 0
        arraySizeCounterLength = timeForOrderDeliveredArray.count
        var counterEfficienct = 0
        var efficiencyPercentage : Float = 0
        
        for i in 0...arraySizeCounterLength - 1 {
            if timeForOrderDeliveredArray[i] <= 230{
                
                counterEfficienct += 1
                
            }//End of If statement
            
        }//End of for loop
        
        //Calculating Efficiency
        efficiencyPercentage = Float(counterEfficienct * 100/noOfOrderDelivered)
        
        DispatchQueue.main.async {
            self.efficiencyDataLabel.text = "Efficiency:\(efficiencyPercentage)%"
        }
        self.efficiencyViewColorChange(efficiencyPercentage)
        
    }//End of Function rrayEfficiencyData
    
    
    func efficiencyViewColorChange(_ efficiencyPercentageValue:Float){
        var percentgeValue = 0
        percentgeValue = Int(efficiencyPercentageValue)
        
        if percentgeValue >= 0 && percentgeValue<50 {
            DispatchQueue.main.async {
                self.efficiencyDataLabel.backgroundColor = UIColor.red
             //   self.efficiencyLabel.backgroundColor = UIColor.red
            }
        }
            else if percentgeValue >= 50 && percentgeValue<80{
                DispatchQueue.main.async {
                    self.efficiencyDataLabel.backgroundColor = UIColor.yellow
                  //  self.efficiencyLabel.backgroundColor = UIColor.yellow
                }
                
            }
        
        else if percentgeValue >= 80 && percentgeValue<=100{
            DispatchQueue.main.async {
                self.efficiencyDataLabel.backgroundColor = UIColor.green
               // self.efficiencyLabel.backgroundColor = UIColor.green
            }
        }
    }
    
    
    //Function to initilize screen at the time of each selection
    func initScreen(){
        DispatchQueue.main.async {
            self.orderData.text = String(0)
            self.deliveryData.text = String(0)
            self.deliveredData.text = String(0)
            self.orderTimer1.isHidden = true
            self.deliveryTimer1.isHidden = true
            self.deliveryTimer2.isHidden = true
            self.deliveryTimer3.isHidden = true
            self.deliveryTimer4.isHidden = true
            self.averageDel.text = "0  :  0"
            
        }
        
    }//End of Function to initilize screen at the time of each selection
    
}// End of main class

// Function to change backGround Colour from the hexa Deciamal Codes

extension UIColor {
    
    func colorFromHex(_ hex:String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#"){
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6{
            return UIColor.black
        }
        
        var rgb:UInt32 = 0
        
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000)>>16)/255.0,
                            green: CGFloat((rgb & 0x00FF00)>>8)/255.0,
                            blue : CGFloat(rgb & 0x0000FF)/255.0, alpha:1.0)
        
        
        
    } // End of colorFromHex
    
    static let orderBGColor = UIColor().colorFromHex("#5271C2")
    static let deliveryBGColor = UIColor().colorFromHex("#35a541")
    static let deliveredBGColor = UIColor().colorFromHex("#bdb235")
    static let  titleBGColor = UIColor().colorFromHex("#e1e1e1")
    static let  subViewContainerColor = UIColor().colorFromHex( "#e5e5e5")
    static let efficiencyLabelDataColor = UIColor().colorFromHex("#e1e1e1")
    static let efficiencyLabelColor = UIColor().colorFromHex("#e1e1e1")
    static let headerViewBGColor = UIColor().colorFromHex("#e1e1e1")
    
}//End of UIColor


extension Date {
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
}// End of Extension Date

// Function to get Vechile Timer



class VechileCurrentTime {
    
    var labelName : UILabel = UILabel()
    
    
    var timer = Timer()
    var time = 0
    var status = 0
    
    var isTimerRunning = false
    
    func startTimer(_ label : UILabel, _ vechTime: Int, _ Vechstatus: Int){
        
        labelName = label
        time = vechTime
        status = Vechstatus
        
        
        DispatchQueue.main.async {
            
            if self.isTimerRunning == false {
                
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(VechileCurrentTime.updateTime), userInfo: nil, repeats: true)
            }
            
        }
        
        
    }
    
    @objc func updateTime()  {
        
        isTimerRunning = true
        
        DispatchQueue.main.async {
            self.labelName.isHidden = false
        }
        
        var b : Int
        var a : Int
        
        time += 1
        
        a = time % 60 //Seconds
        b = time / 60 //Minutes
        
        if b > 59 {
            b = 0
        }
        
        DispatchQueue.main.async {
            
            self.labelName.text = "\(b) : \(a)"
            
        }
        
        colorChange(a, b, labelName, status)
        
    }// End of updateTime function
    
    
    //Color Change Function for the Vechniles in the queue
    
    func colorChange(_ a:Int, _ b:Int, _ label:UILabel, _ status:Int) {
        
        let a : Int = a
        let b : Int = b
        let label :UILabel = label
        let status: Int = status
        
        DispatchQueue.main.async {
            
            if status == 1{
                if ( b == 0 && a < 45) {
                    label.backgroundColor = UIColor.green
                }
                else if (b == 0 && a > 45) || (b == 0 && a < 59) {
                    label.backgroundColor = UIColor.yellow
                }
                else if b>0 {
                    label.backgroundColor = UIColor.red
                }
                
                
            }//end of status == 1
                
            else if status == 2{
                
                if (b <= 1 && a < 60) || (b == 2 && a < 30) {
                    label.backgroundColor = UIColor.green
                }
                else if (b == 2 && a > 30) || (b == 2 && a < 59) {
                    label.backgroundColor = UIColor.yellow
                }
                else {
                    label.backgroundColor = UIColor.red
                }
            } //end os status == 2
        } // End of Dispatch.main.async Function
    } // End of colour change function
    
    
    func hide(label:UILabel){
        let label : UILabel = label
        DispatchQueue.main.async {
            label.isHidden = true
        }
        
    }// End of function Hide.
    
    
    func resetTimer(label: UILabel){
        
        timer.invalidate()
        self.time = 0   //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant
        
        DispatchQueue.main.async {
            //  label.text =  String(self.time)
            
            label.text =  String(0)
            label.isHidden = true
        }
        
        
        isTimerRunning = false
        
    }
    
}// end of vechileCurrentTime class


// Extension of HomeScreen

extension HomeScreen: CocoaMQTTDelegate {
    // These two methods are all we care about for now
    
    func mqtt(_ mqtt: CocoaMQTT, didConnect host: String, port: Int) {
        
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16 ) {
        
        if let msgString = message.string {
            pressNow()
            
        }
        
    }
    
    // Other required methods for CocoaMQTTDelegate
    func mqtt(_ mqtt: CocoaMQTT, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(true)
       
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        mqtt.subscribe("world")
       
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
      
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) {
        
        
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
       
        
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
       
        
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
      
        
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
      
        setUpMQTT()
        sleep(3)
        
        pressNow()
        
    }
    
    func _console(_ info: String) {
        
        
    }
}

