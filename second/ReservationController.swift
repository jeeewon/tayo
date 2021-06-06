//
//  ReservationController.swift
//  second
//
//  Created by 정효주 on 2021/03/14.
//

import UIKit

class ReservationController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var busNumber: UITextField!
    @IBAction func confirm(_ sender: Any) {  //여기다가 나중에 busNumber가 존재하면 "Confirm"화면 없으면 alert하고 다시 "Reservation"화면
        self.performSegue(withIdentifier: "Confirm", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.layer.cornerRadius = numberLabel.layer.frame.size.width/2
    }

}
