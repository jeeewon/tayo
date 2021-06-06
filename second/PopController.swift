//
//  PopController.swift
//  second
//
//  Created by 정효주 on 2021/03/15.
//

import UIKit

class PopController: UIViewController {

    @IBOutlet weak var alertLabel: UILabel!
    @IBAction func alertingButton(_ sender: Any) {  //api기준 버스가 정류장 떠나면 띄워지는 조건으로 바꿔줘야됌
        let alerting = UIAlertController(title: "알림", message: "승차 예약하신 버스가 떠났습니다. 버스에 탑승하셨나요?", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler:{ action in
            guard let thanks = self.storyboard?.instantiateViewController(withIdentifier: "Thanks") else {return}
            thanks.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(thanks, animated: true)})
        let no = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: { action in
            guard let choose = self.storyboard?.instantiateViewController(withIdentifier: "Choose") else {return}
            choose.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(choose, animated: true)})
        alerting.addAction(yes)
        alerting.addAction(no)
        present(alerting, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
