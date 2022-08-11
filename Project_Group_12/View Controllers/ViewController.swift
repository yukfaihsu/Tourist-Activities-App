//
//  ViewController.swift
//  Project_Group_12
//
//  Created by Samarth Joshi on 2022-03-29.
//

import UIKit

class ViewController: UIViewController {

    
    //Class level Variables
    
    @IBOutlet weak var rememberLoginToggle: UISwitch!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var error: UILabel!
    
    
    let usersList:[User] = [
        //Initialising users
        User(email: "samarthjoshi99@gmail.com", password: "samarth"),
        User(email: "daniel456@gmail.com", password: "daniel")]
    
    var userVerified:Bool = false
    var defaults:UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        //Checking if remember login was used last time
        if(UserDefaults.standard.bool(forKey: "IsLoggedIn"))
        {
            guard let nextScreen = storyboard?.instantiateViewController(identifier: "activitiesScreen") as? ActivitiesViewController else
            {
                print("Cannot find next screen")
                return
            }
            
            print("Opening activites screen")
            self.navigationController?.pushViewController(nextScreen, animated: true)
        }
        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginButtonPressed(_ sender: Any)
    {
        guard let username = userEmail.text, let password = userPassword.text
        else
        {
            print("Null value")
            return
        }
        
        if(username.isEmpty || password.isEmpty)
        {
            error.text = "Either field can't be left empty"
        }
        else
        {
            for i in usersList
            {
                if(i.email == username && i.password == password)
                {
                    userVerified = true
                    break;
                }
            }
            if(userVerified)
            {
                if(rememberLoginToggle.isOn)
                {
                    UserDefaults.standard.set(true, forKey: "IsLoggedIn")
                }
                else
                {
                    UserDefaults.standard.set(false, forKey: "IsLoggedIn")
                }
                error.text = ""
                
                self.defaults.set(self.userEmail.text!, forKey: "Key_UserEmail")
                
                guard let nextScreen = storyboard?.instantiateViewController(identifier: "activitiesScreen") as? ActivitiesViewController else
                {
                    print("Cannot find next screen")
                    return
                }
                print("Opening activites screen")
                
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")

                // This is to get the SceneDelegate object from your view controller
                // then call the change root view controller function to change to main tab bar
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                
                userEmail.text = ""
                userPassword.text = ""
                
                self.navigationController?.pushViewController(nextScreen, animated: true)
            }
            else
            {
                error.text = "Email or password is wrong!"
                userEmail.text = ""
                userPassword.text = ""
            }
        }
       
    }
    
}

