//
//  ActivitiesViewController.swift
//  Project_Group_12
//
//  Created by Samarth Joshi on 2022-03-30.
//

import UIKit

class ActivitiesViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    
    var db = Database.shared
    var defaults:UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        //Initialising activities
        print("Activities screen opened")
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutPressed))

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCollectionViewCell", for: indexPath) as! ActivityCollectionViewCell
        cell.populateCell(activity: db.getAll()[indexPath.row])
        if(db.getAll()[indexPath.row].popularActivity)
        {
            print("\(db.getAll()[indexPath.row].nameOfActivity)  \(db.getAll()[indexPath.row].popularActivity)")
            cell.backgroundColor = UIColor.yellow
        }
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int  {
        return db.getAll().count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 224, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Row clicked: \(indexPath.item)")
        
        guard let nextScreen = storyboard?.instantiateViewController(identifier: "activityDetailsScreen") as? ActivityDetailsViewController else
        {
            print("Cannot find next screen")
            return
        }
        
        nextScreen.currentActivityName = db.getAll()[indexPath.row].nameOfActivity
        self.navigationController?.pushViewController(nextScreen, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // 2. Add the inset for collection view sections. I added left and right space 8 because I need to match the minimum line spacing between the cells.
        return UIEdgeInsets(top: 0.3, left: 8.0, bottom: 0.3, right: 8.0)
      }
    
    @objc func logoutPressed(){
        
        self.defaults.set(false, forKey: "IsLoggedIn")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginNavigationController = storyboard.instantiateViewController(identifier: "LoginNavigationController")

        // This is to get the SceneDelegate object from your view controller
        // then call the change root view controller function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(LoginNavigationController)
    }
}
