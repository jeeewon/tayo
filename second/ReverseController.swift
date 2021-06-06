//
//  ReverseController.swift
//  second
//
//  Created by 정효주 on 2021/03/14.
//

import UIKit

class ReverseController: UIViewController {

    @IBOutlet weak var accept: UILabel!
    @IBAction func keep(_ sender: Any) {
        self.performSegue(withIdentifier: "Found", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
