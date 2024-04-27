//
//  MessageViewController.swift
//  newProject
//
//  Created by Admin on 26/04/24.
//

import UIKit

struct Company: Codable {
    var name: String
    var employees: [Employee]
}

struct Employee: Codable {
    var name: String
    var image: String
    var years: Int
    var salary: Double
}

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var myTableView: UITableView!
    private var companies: [Company]!
    

    

    override func viewDidLoad() {
        self.navigationItem.title = "Main View"
        super.viewDidLoad()
        companies = getCompanyData()
        myTableView = UITableView()
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        myTableView.tableFooterView = UIView()
        
        self.view.addSubview(myTableView)

        view.backgroundColor = .systemGray6
        //configButton()
        
        let views = ["view": view!, "tableView": myTableView]
        var allConstraints: [NSLayoutConstraint] = []
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: views as [String : Any])
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: views as [String : Any])
        NSLayoutConstraint.activate(allConstraints)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Company Selected: \(companies[indexPath.section].name)")
        print("Employee Selected: \(companies[indexPath.section].employees[indexPath.row].name)")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return companies.count
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < companies.count {
            return companies[section].name
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies[section].employees.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let employee = companies[indexPath.section].employees[indexPath.row]
        cell.employeeImage.image = UIImage(named: "icons96")
        cell.employeeName.text = "\(employee.name)"
        cell.yearsInService.text = "\(employee.years) years in service"
        cell.salary.text = formatter.string(from: NSNumber(value: employee.salary))
        
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    
    
    func getCompanyData() -> [Company] {
            
            var companies: [Company] = [Company]()
            let myJsonData = """
                [{
                        "name": "ABC Company",
                        "employees": [{
                                "years": 12,
                                "name": "Joe",
                                "image": "apple.png",
                                "salary": 110000
                            },
                            {
                                "years": 15,
                                "name": "John",
                                "image": "apple.png",
                                "salary": 150000
                            },
                            {
                                "years": 15,
                                "name": "John",
                                "image": "apple.png",
                                "salary": 150000
                            },
                            {
                                "years": 15,
                                "name": "John",
                                "image": "apple.png",
                                "salary": 150000
                            },
                            {
                                "years": 15,
                                "name": "John",
                                "image": "apple.png",
                                "salary": 150000
                            },
                            {
                                "years": 15,
                                "name": "John",
                                "image": "apple.png",
                                "salary": 150000
                            }


                        ]
                    },
                    {
                        "name": "XYZ Company",
                        "employees": [{
                            "years": 22,
                            "name": "Jake",
                            "image": "apple.png",
                            "salary": 220000.5
                        }]
                    }
                ]
                """
            
            //Decode JSON Data String to Swift Objects
            if let jsonData = myJsonData.data(using: .utf8) {
                let decoder = JSONDecoder()
                do {
                    companies = try decoder.decode([Company].self, from: jsonData)
                    for company in companies {
                        print("===")
                        print(company.name)
                        for employee in company.employees {
                            print("---")
                            print(employee.name)
                            
                        }
                        
                    }
                    
                } catch {
                    //do nothing
                }
                
                
            }
            
            return companies
            
        }
}
