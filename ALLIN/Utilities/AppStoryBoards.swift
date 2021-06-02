//
//  AppStoryBoards.swift
//  ALLIN
//
//  Created by Hafiz Muhammad Bilal on 5/28/21.
//

import UIKit

extension UIStoryboard {
    
    //MARK:- Generic Public/Instance Methods
    
    func loadViewController(withIdentifier identifier: viewControllers) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
  
    //MARK:- Class Methods to load Storyboards
    
    class func storyBoard(withName name: storyboards) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue , bundle: Bundle.main)
    }
    
    class func storyBoard(withTextName name:String) -> UIStoryboard {
        return UIStoryboard(name: name , bundle: Bundle.main)
    }
    
}

enum storyboards : String {
    
    //All Storyboards
    case Main = "Main"
    
}

enum viewControllers: String {
  //All Controllers
  case signInVC = "AdminLoginVC"
  case HomeVC = "HomeVC"
  case Admin_B_VC = "Admin_B_VC"

  
}
