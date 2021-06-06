//
//  UserController.swift
//  second
//
//  Created by 정효주 on 2021/03/10.
//

import UIKit
import Firebase
import FirebaseAuth

class UserController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    @IBAction func searchButton(_ sender: Any) {
        self.performSegue(withIdentifier:"Location", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = Auth.auth().currentUser?.email
    }
}
