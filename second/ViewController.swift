//
//  ViewController.swift
//  second
//
//  Created by 정효주 on 2021/03/06.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var appicon: UIImageView!
    @IBOutlet weak var appname: UIImageView!
    
    @IBAction func loginButton(_ sender: Any) {
        guard let login = self.storyboard?.instantiateViewController(withIdentifier: "Login") else {return}
        login.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(login, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appicon.image = UIImage(named: "app_icon.jpg")
        appname.image = UIImage(named: "app_name.png")
    }

}

