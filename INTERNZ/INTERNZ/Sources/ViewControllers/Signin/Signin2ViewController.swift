//
//  Signin2ViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 27/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class Signin2ViewController: UIViewController {
    
    @IBOutlet weak var wholeView: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLineView: UIView!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var nicknameLineView: UIView!
    
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var birthLineView: UIView!
    
    @IBOutlet weak var woman: UIButton!
    @IBOutlet weak var man: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var agree1: UIButton!
    @IBOutlet weak var agree2: UIButton!
    
    /* 전 회원가입 뷰에서 받아오는 값 */
    var userEmailString = ""
    var userPwdString = ""
    var phoneString = ""
    
    /* radio button value */
    var gender = ""
    
    /* 회원가입시 필요한 정보 */
    var name = ""
    var nickname = ""
    var birth = ""
    
    var isWoman: Bool = true
    
    var isSuccessSignup: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardObserver()
        
        nameTextField.delegate = self
        nicknameTextField.delegate = self
        birthTextField.delegate = self
        
        completeButton.setWhiteButton()
        
        self.navigationItem.title = "회원가입"
    }
    
    // 성별 클릭 radio button click event
    @IBAction func clickRadioButton(_ sender: UIButton) {
        
        if isWoman == true {
            woman.setImage(UIImage(named: "radioBtn"), for: .normal)
            man.setImage(UIImage(named: "radioSelectedBtn"), for: .normal)
            isWoman = false
        } else {
            woman.setImage(UIImage(named: "radioSelectedBtn"), for: .normal)
            man.setImage(UIImage(named: "radioBtn"), for: .normal)
            isWoman = true
        }
    }
    
    // 약관 동의 click event
    @IBAction func clickAgreeButton(_ sender: UIButton) {
        if sender.image(for: .normal)?.isEqual(UIImage(named: "checkBtn")) == true {
            sender.setImage(UIImage(named: "checkSelectedBtn"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "checkBtn"), for: .normal)
        }
    }
    
    
    @IBAction func gotoLogin(_ sender: UIButton) {
        
        self.name = self.nameTextField.text ?? ""
        self.nickname = self.nicknameTextField.text ?? ""
        self.birth = self.birthTextField.text ?? ""
        
        if isWoman == true {
            self.gender = "woman"
        } else {
            self.gender = "man"
        }
        
        SignupService.sharedSignup.signup(userPwdString, userPwdString, userEmailString, phoneString, name, nickname, birth, gender) {
            
            response in
            
            switch response{
            case .success(let data):
                
                print("data?? ", data)
                self.isSuccessSignup = data as! Bool
                print("isSuccessSignup?? ", self.isSuccessSignup)
                
                if self.isSuccessSignup == true { // 회원가입 성공
                    
                    let alert = UIAlertController(title: "회원 가입 성공!", message: "로그인 화면으로 넘어갑니다.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: {
                        action in
                        self.goLoginView();
                        return;
                    }))
                    self.present(alert, animated: true)

                } else {
                    let alert = UIAlertController(title: "회원가입 실패!", message: "값을 제대로 입력했는지 확인해 주세요.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
                
            case.networkFail:
                print("error")
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
        }
    }
    
    func goLoginView(){
        let loginStoryBoard : UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = loginStoryBoard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
        return
    }
    
}


extension Signin2ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            nameLineView.backgroundColor = .marigold
        case nicknameTextField:
            nicknameLineView.backgroundColor = .marigold
        case birthTextField :
            birthLineView.backgroundColor = .marigold
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            nameLineView.backgroundColor = .whiteFour
        case nicknameTextField:
            nicknameLineView.backgroundColor = .whiteFour
        case birthTextField :
            birthLineView.backgroundColor = .whiteFour
        default:
            break
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if self.nameTextField.text != "" && self.nicknameTextField.text != "" && self.birthTextField.text != "" {
            self.completeButton.backgroundColor = .marigold
        } else {
            self.completeButton.backgroundColor = .whiteFour
        }
    }
}

extension Signin2ViewController {
    
    private func addKeyboardObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func closeKeyboardObserver(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            //            self.emailLabel.transform = .init(translationX: 0, y: -50)
            self.wholeView.transform = .init(translationX: 0, y: -50)
        })
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.wholeView.transform = .identity
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
