//
//  ConfirmController.swift
//  second
//
//  Created by 정효주 on 2021/03/15.
//

import UIKit

class ConfirmController: UIViewController {

    @IBOutlet weak var busNumber: UILabel!
    @IBAction func yesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "Success", sender: nil)
    }
    
    @IBAction func noButton(_ sender: Any) {
        guard let no = self.storyboard?.instantiateViewController(withIdentifier: "Reservation") else {return}
        no.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(no, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
