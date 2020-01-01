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
    
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    
    @IBOutlet weak var birthTextFieldd: UITextField!
    
    
    @IBOutlet weak var woman: UIButton!
    @IBOutlet weak var man: UIButton!
    
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var agree1: UIButton!
    @IBOutlet weak var agree2: UIButton!
    
    //이거 빼도 됨
    //    var genderBtn: Bool = false
    //    var agreeBtn: Bool = false
    
    var userEmailString: String!
    var userPwdString: String?
    var phoneString: String?
    
    var isWoman: Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(userEmailString)
        print(userPwdString)
        print(phoneString)
        
        
        addKeyboardObserver()
        
        nameTextField.delegate = self
        
        completeButton.backgroundColor = UIColor.whiteFour
        completeButton.layer.cornerRadius = 5
        
        self.navigationItem.title = "회원가입"
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        let button1 = UIBarButtonItem(image: UIImage(named: "left1Ic"), style: .plain, target: self, action: #selector(goBack))
        button1.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem  = button1
        
    }
    
    
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
    
    
    
    
    @IBAction func clickAgreeButton(_ sender: UIButton) {
        
        if sender.currentImage?.isEqual(UIImage(named: "checkBtn")) == true {
            sender.setImage(UIImage(named: "checkSelectedBtn"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "checkBtn"), for: .normal)
        }
    }
    
    @IBAction func gotoLogin(_ sender: UIButton) {
        
        goSignup()
        
        
        
        
        
//        let loginStoryBoard : UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
//        let loginViewController = loginStoryBoard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
//        loginViewController.modalPresentationStyle = .fullScreen
//        self.present(loginViewController, animated: true, completion: nil)
    }
    
    func goSignup(){
        
//        let name = 
//        guard let title = self.titleLabel else { return }
//        guard let tittleText = title.text else { return }
        
        
        guard let name = self.nameTextField.text else { return }
        guard let nickname = self.nicknameTextField.text else { return }
        guard let birth = self.birthTextFieldd.text else { return }
        
        let gender: String!
        
        guard let email = self.userEmailString else { return }
        guard let pwd = self.userPwdString else { return }
        guard let phone = self.phoneString else { return }
        
        if isWoman == true {
            gender = "woman"
        } else {
            gender = "man"
        }
        
        
        SignupService.sharedSignup.signup(email, pwd, phone, name, nickname, birth, gender) {
            
            response in
            
            switch response{
            case .success(let data):
                
                print("data?? ", data)
                print("성공이닷~!~!~")

            case.networkFail:
                print("error")
                //찍어보기 확인

            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
            
            
            
            
            
            
        }
        
        
        
        

        
    }
    
    
    
    @objc func goBack(){
        print("tap back")
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension Signin2ViewController: UITextFieldDelegate {
    
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
