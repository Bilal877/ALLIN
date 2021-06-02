//
//  AdminLoginVC.swift
//  ALLIN
//
//  Created by Hafiz Muhammad Bilal on 5/28/21.
//

import UIKit
import AuthenticationServices
import GoogleSignIn
import FirebaseAuth
import FirebaseCore


class AdminLoginVC: UIViewController,ASAuthorizationControllerDelegate ,GIDSignInDelegate,UITextFieldDelegate{
  
  @IBOutlet weak var EmailTextField: UITextField!
  
  @IBOutlet weak var PasswordTextField: UITextField!
  @IBOutlet weak var loginWithApple:ASAuthorizationAppleIDButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    EmailTextField.delegate = self
    PasswordTextField.delegate = self
    loginWithApple.addTarget(self, action: #selector(handleAppleIdRequest), for: .touchUpInside)
    GIDSignIn.sharedInstance()?.presentingViewController = self
    GIDSignIn.sharedInstance()?.delegate = self
    if ((GIDSignIn.sharedInstance()?.hasPreviousSignIn()) != nil){
      GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
//    self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    self.navigationController?.navigationBar.isHidden = true
  }
  
  @objc func handleAppleIdRequest() {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.fullName, .email]
    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.performRequests()
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
      let userIdentifier = appleIDCredential.user
      let fullName = appleIDCredential.fullName
      let email = appleIDCredential.email
      print("\(userIdentifier), \(fullName),\(email)")
      
    }
  }
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
    //show alert error here
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
  }
  
  //Login with Google

  
  @IBAction func loginWithLoginBtn(_ sender: UIButton) {
    
    GIDSignIn.sharedInstance().signIn()
 //   GIDSignIn.sharedInstance()?.presentingViewController = self
  }
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//    print("\(user.profile.email)")
//    let vc = UIStoryboard.storyBoard(withName: .Main).loadViewController(withIdentifier: .HomeVC) as! HomeVC
//    self.navigationController?.pushViewController(vc, animated: true)
    
  }
  func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
    print("\(error.localizedDescription)")
  }
  
  
  @IBAction func BackBtn(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func SignInBtn(_ sender: UIButton) {
    let vc = UIStoryboard.storyBoard(withName: .Main).loadViewController(withIdentifier: .Admin_B_VC) as! Admin_B_VC
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
