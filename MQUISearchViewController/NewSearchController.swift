//
//  NewSearchController.swift
//  SearchDemo
//
//  Created by Monkey-Sun on 2017/9/24.
//  Copyright © 2017年 Monkey-Sun. All rights reserved.
//

import UIKit

class NewSearchController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchResultsUpdating, UISearchControllerDelegate {
    var searchResult : searchResultController!
    var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "搜索"
        self.view.backgroundColor = UIColor.white
        
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        self.searchResult = searchResultController()
        searchResult.results = []
        
        self.searchController = UISearchController(searchResultsController: self.searchResult)
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.placeholder = "输入查询内容"
        
        self.definesPresentationContext = true//ios 11中 如果此处不设置为true，则resultController的searchBar会看不见
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        self.view = nil
    }
}

//Mark delegate and dataSource
extension NewSearchController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = String("\(indexPath.row)")
        return cell!
    }
}

//Mark searchBar and search action
extension NewSearchController{
    func willPresentSearchController(_ searchController: UISearchController) {
        self.searchController.navigationItem.searchController = self.navigationItem.searchController
    }
    
    func updateSearchResults(for searchController: UISearchController){
        if let searchText = searchController.searchBar.text {
            self.searchResult.results = [searchText]
            self.searchResult.tableView.reloadData()
        }
    }
}
