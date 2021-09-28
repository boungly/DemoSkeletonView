//
//  ViewController.swift
//  DemoSkeletonView
//
//  Created by Boung on 27/9/21.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    
    private let tableViewCell = "CustomTableViewCell"
    private var datasource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: tableViewCell)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        datasource = ["", "", ""]
        tableView.reloadData()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            self.tableView.reloadData()
        }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.anchor(top: view.layoutMarginsGuide.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.layoutMarginsGuide.bottomAnchor,
                         trailing: view.trailingAnchor)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell, for: indexPath) as! CustomTableViewCell
        cell.configCell(hideLoading: false)
        
        return cell
    }
}
