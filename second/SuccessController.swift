//
//  SuccessController.swift
//  second
//
//  Created by 정효주 on 2021/03/15.
//

import UIKit

class SuccessController: UIViewController {

    @IBOutlet weak var busReservLabel: UILabel!
    
    @IBAction func prevButton(_ sender: Any) {  //api기준 전정류장에서 출발하면으로 조건 바꿔줘야됌
        let prev = UIAlertController(title: "전 정류장 출발 알림", message: "전 정류장에서 출발하였습니다. 승차위치를 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        prev.addAction(okAction)
        present(prev, animated: false, completion: nil)
    }
    
    @IBAction func stopButton(_ sender: Any) {  //기사가 라즈베리파이버튼 누르면 실행되는 조건으로 바꿔줘야됌
        let stop = UIAlertController(title: "버스 정차 알림", message: "버스가 승차위치에 정차하였습니다. 천천히 탑승해주세요", preferredStyle: UIAlertController.Style.alert)
        let okayAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler:{ action in
            guard let popup = self.storyboard?.instantiateViewController(withIdentifier: "Popup") else {return}
            popup.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(popup, animated: true)})
        stop.addAction(okayAction)
        present(stop, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
