//
//  CharacterViewController.swift
//  Characters
//
//  Created by stimLite on 01.07.2022.
//

import UIKit


class CharacterViewController: UIViewController {
    var presenter: CharacterViewPresenterProtocol?
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        presenter?.getData()
    }
}

extension CharacterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 5
    }
}

extension CharacterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.dataModel?.results.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CharacterViewCell
        
        let data = presenter?.dataModel?.results[indexPath.row]
        
        cell.configerationViewCell()
        
        cell.characterView.statusLabel.text = presenter?.test(status: data?.status ?? "test")
        cell.characterView.titleLabel.text = data?.name
        cell.characterView.locationLabel.text = data?.location.name
        cell.characterView.humanLabel.text = "\(data?.species ?? "test"), \(data?.gender ?? "test")"
        
//        cell.backgroundColor = .green
        
        return cell
    }
}

extension CharacterViewController: CharacterViewProtocol {
    func saccess() {
        tableView.reloadData()
        tableView.backgroundColor = .green
    }
    
    func update() {
        tableView.backgroundColor = .yellow
    }
    
    func errors() {
        tableView.backgroundColor = .red
    }
}
