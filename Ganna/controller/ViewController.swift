//
//  ViewController.swift
//  Ganna
//
//  Created by Pritesh Khandelwal on 27/07/19.
//  Copyright © 2019 Pritesh Khandelwal. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let imageCellIdentifier = "imageCell"
    var dataSource =  GaanaModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.apiCall()
        //self.makeGetCall()
    }
    func setup(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "imageCell", bundle: nil), forCellReuseIdentifier: imageCellIdentifier)
        self.tableView.tableFooterView = UIView()
    }
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.sections.count
        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: imageCellIdentifier) as! imageCell
        if(indexPath.section == 0){
            cell.sectionType = .first
        }else if (indexPath.section == 1){
            cell.sectionType = .second
        }else if (indexPath.section == 2){
            cell.sectionType = .third
        }else if (indexPath.section == 3){
            cell.sectionType = .fourth
        }else if (indexPath.section == 4){
            cell.sectionType = .fifth
        }
        cell.item = self.dataSource.sections[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  self.dataSource.sections[section].name
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return 155.0
        }else if (indexPath.section == 1){
            return 70.0
        }else if (indexPath.section == 2){
           return 155.0
        }else if (indexPath.section == 3){
            return 90.0
        }else if (indexPath.section == 4){
            let count = (self.dataSource.sections[indexPath.section].tracks.count / 2)
            let height =  (count * 160) + (count - 1) * 10
            return CGFloat(height)
        }else{
             return 160.0
        }
    }
}

extension ViewController{
    func apiCall(){
        let url = "https://demo3033278.mockable.io/gaanaDriveTest"
        guard let gitUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let mainRes = try decoder.decode(GaanaModel.self, from: data)
                self.dataSource = mainRes
                print(mainRes.status)
                print(mainRes.sections.count)
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
}

