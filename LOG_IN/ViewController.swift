//
//  ViewController.swift
//  LOG_IN
//
//  Created by Raja Sinha on 8/19/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userNameTxt = UITextField()
    let passWordTxt = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if UserDefaults.standard.bool(forKey: "LoggedInSuccessfully") == true {
            //user is already logged in just navigate him to home screen
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            self.navigationController?.pushViewController(homeVC, animated: false)
            
            
        }
       
        setUpLayout()
    }
    
    @objc func toDologIn(){
        
//        if userNameTxt.text == "test" && passWordTxt.text == "test" {
        
        let parameters = ["mob" : userNameTxt.text , "password" : passWordTxt.text]
        guard let url = URL(string: "http://13.126.194.18:4200/api/login") else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])else {return}
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    guard let array = json as? [String: Any] else {return}
                    guard let code = array["code"] as? Int else {return}
                    if code == 200 {
                        //navigate to home Screen
                        
                        DispatchQueue.main.async {
                            UserDefaults.standard.set(true, forKey: "LoggedInSuccessfully")
                            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
                            self.navigationController?.pushViewController(homeVC, animated: true)
                        }
                       
                        
                    }
                    else
                    {
//                        DispatchQueue.main.async {
//                            self.messageAlert.text = "UNSuccessfully Log IN"
//                        }
                        print("Incorrect UserId or Password")

                    }
                    
                }catch{
                    print(error)
                }
            }
            }.resume()
        
        

        
}
    
func setUpLayout(){
        userNameTxt.layer.borderColor = UIColor.gray.cgColor
        userNameTxt.layer.borderWidth = 1
        userNameTxt.layer.cornerRadius = 5
        userNameTxt.placeholder =  "USERNAME"
        userNameTxt.text = ""
        
        view.addSubview(userNameTxt)
        userNameTxt.translatesAutoresizingMaskIntoConstraints = false
        userNameTxt.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        userNameTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        userNameTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        userNameTxt.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        
        
        
        passWordTxt.layer.borderColor = UIColor.gray.cgColor
        passWordTxt.layer.borderWidth = 1
        passWordTxt.layer.cornerRadius = 5
        passWordTxt.placeholder =  "PASSWORD"
        passWordTxt.text = ""
        
        view.addSubview(passWordTxt)
        passWordTxt.translatesAutoresizingMaskIntoConstraints = false
        passWordTxt.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        passWordTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        passWordTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        passWordTxt.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        
        let logINButton = UIButton()
        
        view.addSubview(logINButton)
        
        logINButton.translatesAutoresizingMaskIntoConstraints = false
        logINButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        logINButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        logINButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        logINButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        logINButton.setTitle("LogIn", for: .normal)
        
        logINButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        logINButton.backgroundColor = UIColor.black
        logINButton.addTarget(self, action: #selector(toDologIn), for: .touchUpInside)
        
    }
}


