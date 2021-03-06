//
//  LoginViewController.swift
//  Twitter
//
//  Created by Carolina Fernandez on 7/22/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //when view appears, check that the user is logged in
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool (forKey:"UserLoggedIn") == true
        {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
        
        
    }
    //function that will happen when the Login button is pressed
    //in the function when user logs in we have to make sure
    //they stay logged in
    @IBAction func loginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            UserDefaults.standard.set(true , forKey: "UserLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: {(Error) in
            print("Could not log in")
        })
        //hello testing comment 
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
