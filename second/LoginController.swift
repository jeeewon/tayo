//
//  LoginController.swift
//  second
//
//  Created by 정효주 on 2021/03/08.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func Login(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) {(authResult, error) in
            if (error != nil) { //로그인되게하기
                Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) {(user, error) in
                    if(user != nil){ //로그인성공
                        let success = UIAlertController(title: "알림", message: "로그인되었습니다.", preferredStyle: UIAlertController.Style.alert)
                        success.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                        self.present(success, animated: false)
                    }
                }
            }
            else{ //회원가입성공
                let alert = UIAlertController(title: "알림", message: "회원가입완료", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener( {(user, error) in
            if(user != nil){
                self.performSegue(withIdentifier: "User", sender: nil)
            }
        })
    }
}
