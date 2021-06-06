//
//  RegisterController.swift
//  second
//
//  Created by 정효주 on 2021/03/08.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func goRegister(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) {(authResult, error) in
            if (error != nil) { //회원가입실패
            }
            else{ //회원가입성공
                let alert = UIAlertController(title: "알림", message: "회원가입완료", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.performSegue(withIdentifier: "goLogin", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
