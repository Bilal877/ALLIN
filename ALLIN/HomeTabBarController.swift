//
//  HomeTabBarController.swift
//  ALLIN
//
//  Created by Hafiz Muhammad Bilal on 5/31/21.
//

import UIKit


class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    
//    let loginStatus = SessionManager.shared.isUserLoggedIn
//
    let my1VC = UIStoryboard.storyBoard(withName: .Main).loadViewController(withIdentifier: .HomeVC) as! HomeVC
//
//    let my2VC = loginStatus ? UIStoryboard(name: "mySell4BidsTab", bundle: nil).instantiateViewController(withIdentifier: "Mysell4BIdsVC") as! mySell4BidsVC_XlPager : UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//
//    let my3VC = loginStatus ? UIStoryboard(name: "sellTab", bundle: nil).instantiateViewController(withIdentifier: "SellNowStep1Vc") as! SellNowStep1Vc : UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//
//    let my4VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoriesVc") as! CategoriesListVc
//
//    let my5VC = loginStatus ? UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NotificationsVc") as! NotificationsVc : UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
    
    my1VC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
//    my2VC.tabBarItem = UITabBarItem(title: "My Sell4Bids", image: UIImage(named: "mysell4bids"), selectedImage: UIImage(named: "mysell4bids"))
//    my3VC.tabBarItem = UITabBarItem(title: "Sell", image: UIImage(named: "tab_camera"), selectedImage: UIImage(named: "tab_camera"))
//    my4VC.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(named: "categories"), selectedImage: UIImage(named: "categories"))
//    my5VC.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(named: "notification"), selectedImage: UIImage(named: "notification"))
    
    viewControllers = [my1VC].map {
        UINavigationController(rootViewController: $0)
    }
    
  }
    
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    guard let fromView = selectedViewController?.view, let toView = viewController.view else {
      return false
    }
    UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
   return true
  }
    
    
  
}
