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
    
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func gotoLogin(_ sender: UIButton) {
        
        let loginStoryBoard : UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = loginStoryBoard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
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
