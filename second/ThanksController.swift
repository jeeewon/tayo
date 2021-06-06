//
//  ThanksController.swift
//  second
//
//  Created by 정효주 on 2021/03/15.
//

import UIKit

class ThanksController: UIViewController {
    
    @IBOutlet weak var thanksLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thanksLabel.layer.cornerRadius = thanksLabel.layer.frame.size.width/2
    }
    
}
