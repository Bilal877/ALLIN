//
//  ViewController.swift
//  ALLIN
//
//  Created by Hafiz Muhammad Bilal on 5/27/21.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var SignInBtn: UIButton!
  @IBOutlet weak var SignUpBtn: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    SignInBtn.layer.cornerRadius = 13
    SignUpBtn.layer.cornerRadius = 13
   
    // Do any additional setup after loading the view.
  }
  @IBAction func AdminBtnClick(_sender: UIButton){
    print("here is clicked buttton")
    let vc = UIStoryboard.storyBoard(withName: .Main).loadViewController(withIdentifier: .signInVC) as! AdminLoginVC
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.navigationBar.isHidden = true
  }


}

