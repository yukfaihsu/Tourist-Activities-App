//
//  WebViewViewController.swift
//  Project_Group_12
//
//  Created by Yuk Fai Hsu on 2022-04-03.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var wvWebsite: WKWebView!
    var website:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: URL(string: website)!)
        wvWebsite.load(request)
    }
}
