//
//  Database.swift
//  Project_Group_12
//
//  Created by Samarth Joshi on 2022-04-02.
//

import Foundation
import UIKit
class Database
{
    static let shared = Database()
    
    private init() {}
    var activitiesList:[Activity] = [Activity(nameOfActivity: "Aerial Tour with Wine Tasting", priceOfActivity: 99, imageOfActivity: UIImage(named: "aerial tour")!, descriptionOfActivity: "Take in sweeping aerial views of Toronto from the comfort of an 8-person executive plane. Don’t forget your camera: The pilot’s flight path is designed to showcase top landmarks such as the CN Tower, Rogers Center, Toronto Islands, and Lake Ontario. ", hostOfActivity: "Samarth",popularActivity: false, websiteOfActivity: "https://totaladvantagetravel.com/exhilarating-120km-aerial-tour-of-toronto/"),
                                     Activity(nameOfActivity: "CN Tower Tour", priceOfActivity: 99, imageOfActivity: UIImage(named: "cn tower")!,descriptionOfActivity: "At a height of 553.33 m (1,815 ft., 5 in), the CN Tower is Canada’s National Tower, an engineering Wonder, award-winning dining & entertainment destination, and Toronto’s “must-see” for over 4 decades.",hostOfActivity: "Daniel",popularActivity: true, websiteOfActivity: "https://www.tripadvisor.ca/Attraction_Review-g155019-d155483-Reviews-CN_Tower-Toronto_Ontario.html"),
                                     Activity(nameOfActivity: "St. Lawrence Market", priceOfActivity: 55, imageOfActivity: UIImage(named: "lawrence market")!,descriptionOfActivity: "All roads to good food lead to St. Lawrence Market, a city landmark more than two centuries old. Two hundred vendors sell everything from local mustard to fresh pasta, lobster to artisanal bread.",hostOfActivity: "John",popularActivity: false, websiteOfActivity: "https://www.tripadvisor.co.uk/Attraction_Review-g155019-d185112-Reviews-St_Lawrence_Market-Toronto_Ontario.html"),
                                     Activity(nameOfActivity: "Royal Ontario Museum", priceOfActivity: 23, imageOfActivity: UIImage(named: "royal ontario museum")!,descriptionOfActivity: "Opened in 1914, the Royal Ontario Museum (ROM) showcases art, culture, and nature from around the globe and across the ages. One of North America's most renowned cultural institutions, Canada's largest museum is home to a world-class collection of more than six million objects and specimens, featured in 40 gallery and exhibition spaces.",hostOfActivity: "Jane", popularActivity: false, websiteOfActivity: "https://www.tripadvisor.co.uk/Attraction_Review-g155019-d155481-Reviews-Royal_Ontario_Museum-Toronto_Ontario.html"),
                                     Activity(nameOfActivity: "Toronto Island Park", priceOfActivity: 200, imageOfActivity: UIImage(named: "toronto island park")!,descriptionOfActivity: "Park consisting of four main islands and containing trails, beaches and children's amusement rides.",hostOfActivity: "Adam" , popularActivity: false, websiteOfActivity: "https://www.tripadvisor.co.uk/Attraction_Review-g155019-d185115-Reviews-or10-Toronto_Island_Park-Toronto_Ontario.html"),
                                     Activity(nameOfActivity: "Niagara Falls with Cruise", priceOfActivity: 139, imageOfActivity: UIImage(named: "niagara falls")!,
                                              descriptionOfActivity: "Visit the natural wonder of Niagara Falls from Toronto the easy way on this guided tour. You’ll be picked up from downtown Toronto and driven around Lake Ontario to the falls and the town of the same name.",hostOfActivity: "Sarah" , popularActivity: true, websiteOfActivity: "https://www.viator.com/tours/Toronto/Tour-to-Niagara-Falls-with-Cruise/d623-117512P1"),
                                     Activity(nameOfActivity: "Algonquin Provincial Park", priceOfActivity: 225, imageOfActivity: UIImage(named: "algonquin park")!,descriptionOfActivity: "Enjoy the beauty of Canada’s oldest provincial park on a convenient day trip from Toronto. The forests, lakes, and sweeping views contrast with the busy-ness of Toronto. You’ll spend time canoeing, hiking, swimming, and cliff diving (if you dare).",hostOfActivity: "Tony" , popularActivity: false, websiteOfActivity: "https://www.viator.com/tours/Toronto/Algonquin-Provincial-Park-Day-Tour-from-Toronto/d623-74516P3")]
    
    func getAll()->[Activity] {
        return self.activitiesList
    }
    
    func getActivityByName(name:String) -> Activity?{
        for act in self.activitiesList{
            if (name == act.nameOfActivity){
                return act
            }
        }
        return nil
    }
}
