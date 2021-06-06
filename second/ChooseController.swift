//
//  ChooseController.swift
//  second
//
//  Created by 정효주 on 2021/03/15.
//

import UIKit

class ChooseController: UIViewController {

    @IBOutlet weak var chooseLabel: UILabel!
    @IBAction func stationButton(_ sender: Any) {
        guard let loca = self.storyboard?.instantiateViewController(withIdentifier: "Location") else {return}
        loca.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(loca, animated: true)
    }
    @IBAction func stopButton(_ sender: Any) {
        guard let found = self.storyboard?.instantiateViewController(withIdentifier: "Found") else {return}
        found.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(found, animated: true)
    }
    @IBAction func numberButton(_ sender: Any) {
        guard let num = self.storyboard?.instantiateViewController(withIdentifier: "Reservation") else {return}
        num.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(num, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
