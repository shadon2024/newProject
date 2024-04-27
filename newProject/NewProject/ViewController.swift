//
//  ViewController.swift
//  newProject
//
//  Created by Admin on 25/04/24.
//

import RAMAnimatedTabBarController
import UIKit


class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        config()
        configAdd()
        //configButton()
        configTabBar()
        
    }

    
    
    private func config() {
        
        //self.navigationItem.title = "Home"
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star") , style: .plain, target: self, action: nil)
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "phone") , style: .plain, target: self, action: nil)
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem( title: "WhatsApp", style: .plain, target: nil, action: nil)
        
        
        self.navigationController?.navigationBar.tintColor = .systemBlue
        self.view.backgroundColor = .systemGray6
        self.navigationItem.leftBarButtonItem?.tintColor = .black

    }
    
    
    
    private func configAdd() {
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .add,
//            target: self,
//            action: nil)
        
        let customView = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        customView.text = "WatsApp"
        customView.textAlignment = .center
        customView.font = .systemFont(ofSize: 23)
        customView.textColor = .systemBlue
        customView.layer.masksToBounds = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)
        
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(named: "3dots1"),
                style: .done,
                target: self,
                action: nil),
            UIBarButtonItem(
                barButtonSystemItem: .search,
                target: self,
                action: nil),
            
            UIBarButtonItem(
                barButtonSystemItem: .camera,
                target: self,
                action: nil)
        ]
        

        
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .camera,
//            target: self,
//            action: nil)
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"),
//                                                                 style: .plain,
//                                                                 target: self,
//                                                                 action: nil)
    }
    
    
//    private func configButton() {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//        view.addSubview(button)
//        button.center = view.center
//        button.backgroundColor = .systemBlue
//        button.setTitle("Next", for: .normal)
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//    }
      
    
//    @objc func didTapButton() {
//        let vc = NextOneViewController()
//        vc.title = "Setting"
//        vc.view.backgroundColor = .systemGreen
//        navigationItem.backBarButtonItem = UIBarButtonItem(
//            title: "Exit",
//            style: .plain,
//            target: nil,
//            action: nil)
//        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out",
//                                                               style: .done,
//                                                               target: self,
//                                                               action: nil)
//
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    private func configTabBar() {
        self.tabBar.tintColor = .systemBlue
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.backgroundColor = .white
        self.tabBar.barTintColor = .red
        UITabBar.appearance().barTintColor = .green
        //UITabBar.appearance().tintColor = .red
        
        let message = self.creatNav(with: "Message" , image: UIImage(systemName: "text.bubble.fill"), and: MessageViewController())
        let status = self.creatNav(with: "Status", image: UIImage(named: "status2"), and: StatusViewController())
        let group = self.creatNav(with: "Group", image: UIImage(systemName: "person.3.fill"), and: GroupViewController())
        let call = self.creatNav(with: "Call", image: UIImage(systemName: "phone.fill"), and: CallViewController())
        
        let textt = UILabel()
        textt.text = "Message"
        textt.font = .systemFont(ofSize: 24)
        
        self.setViewControllers([message, status, group, call], animated: true)
    }
    
    private func creatNav(with title: String, image: UIImage?,  and vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
    }
    

}

