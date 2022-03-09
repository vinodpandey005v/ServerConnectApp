//
//  HomeVC.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: - Outlets
    // Show user data into table
    @IBOutlet weak var userTableView: UITableView!
    
    //Use to store recive from API
    var userArray: [UserModel] = []
    
    // Use for check more item available on server
    var isMoreItem  = false
    
    // User for number of page
    var pageNumber  = 0
    
    // Check API is calling or not
     var isApiCall  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.configerData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userTableView.reloadData()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func configerData() {
        self.title = "User List"
        self.registerCells()
        self.getUserList()
    }
    /**
     * Function use to register cells in tableview
     * @param none
     * @return none
     **/
    func registerCells() {
        self.userTableView.register(UINib(nibName: "UserCustomCell", bundle: nil), forCellReuseIdentifier: "UserCustomCell")
        self.userTableView.register(UINib(nibName: "TwoImageCell", bundle: nil), forCellReuseIdentifier: "TwoImageCell")
        
        self.userTableView.register(UINib(nibName: "UserHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "UserHeaderView")
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
        self.userTableView.reloadData()
    }
    
    //MARK: Web Service Call
    /**
     * Function to use for user List
     * @param None
     * @return none
     **/
    func getUserList() {
        let parameter = [APIParametersKey.APIRequestLimit:"10",APIParametersKey.APIRequestOffset:"\(pageNumber * 10)"]
        ServiceHandler.sharedServiceInstance.getUserList(params: parameter, successBlock: { (userList, moreItem) in
                self.userArray = self.userArray + userList
                self.isMoreItem = moreItem
            self.pageNumber = self.pageNumber + 1
            self.isApiCall = false
            self.userTableView.reloadData()
        }) { (error, message) in
            self.isApiCall = false
        }
    }

}

// MARK: - UITableView Delegate and datasource Methods
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        if self.userArray.count > 0  {
            return self.userArray.count
        }
        return 0
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let items = self.userArray[section].userItems, items.count > 0  {
            if items.count % 2 != 0 {
                return (items.count + 1) / 2
            }
            return items.count / 2
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let items = self.userArray[indexPath.section].userItems, items.count > 0  {
            if items.count % 2 != 0,indexPath.row == 0  {
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserCustomCell") as! UserCustomCell
                cell.updateUI(indexPath: indexPath, firstImageURL: items[indexPath.row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwoImageCell") as! TwoImageCell
                cell.updateUI(firstImageURL: items[indexPath.row], secondImageURL: items[indexPath.row + 1])
                 return cell
            }
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let items = self.userArray[indexPath.section].userItems, items.count > 0  {
            if items.count % 2 != 0,indexPath.row == 0  {
                return ScreenSize.ScreenWidth
            } else {
                return ScreenSize.ScreenWidth / 2
            }
            
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let tableHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "UserHeaderView") as! UserHeaderView
        tableHeaderView.updateUI(section: section, userMdl: self.userArray[section])
        return tableHeaderView
        
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UserHeaderView.getCellHeight()
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if self.isMoreItem {
            if( indexPath.section == self.userArray.count - 2) {
                if self.isApiCall == false {
                    self.isApiCall = true
                    self.getUserList()
                }
            }
        }
        
    }
}




