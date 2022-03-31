//
//  ViewController.swift
//  Project_Group_12
//
//  Created by Samarth Joshi on 2022-03-29.
//

import UIKit

class ViewController: UIViewController {

    
    //Class level Variables
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var error: UILabel!
    
    var usersList:[User]=[]
    var userVerified:Bool = false
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        usersList.append(User(email: "samarthjoshi99@gmail.com", password: "samarth"))
        usersList.append(User(email: "yfhsu2@gmail.com", password: "yfhsu"))
        
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
                error.text = ""
                guard let nextScreen = storyboard?.instantiateViewController(identifier: "activitiesScreen") as? ActivitiesViewController else
                {
                    print("Cannot find next screen")
                    return
                }
                print("Opening activites screen")
                self.navigationController?.pushViewController(nextScreen, animated: true)
            }
            else
            {
                error.text = "Email or password is wrong!"
            }
        }
       
    }
    
}

