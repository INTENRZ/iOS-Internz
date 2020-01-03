//
//  SplashViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        perform(#selector(showTutorial), with: nil, afterDelay: 2.1)
        
    }
    
    
    @objc func showTutorial(){
        
        let onBoardingStoryBoard : UIStoryboard = UIStoryboard(name: "OnBoarding", bundle: nil)
        let OnBoardingViewController = onBoardingStoryBoard.instantiateViewController(withIdentifier: "OnBoarding") as! OnBoardingViewController
        OnBoardingViewController.modalPresentationStyle = .fullScreen
        self.present(OnBoardingViewController, animated: true, completion: nil)
        
        
    }

}
