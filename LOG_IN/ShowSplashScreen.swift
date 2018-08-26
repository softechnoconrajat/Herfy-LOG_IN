//
//  ShowSplashScreen.swift
//  LOG_IN
//
//  Created by Raja Sinha on 8/20/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        perform(#selector(ShowSplashScreen.showNavController), with: nil, afterDelay: 3)
    }
    
    @objc func showNavController()
    {
        performSegue(withIdentifier: "showSplashScreen", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
