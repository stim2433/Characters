//
//  CharacterViewController.swift
//  Characters
//
//  Created by stimLite on 01.07.2022.
//

import UIKit


class CharacterViewController: UIViewController {
    var presenter: CharacterViewPresenterProtocol?
//    var subscriber = Observier()
    
    let tableView = UITableView()
    var setStatus: ((String) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableView)
        tableView.frame = view.frame
//        subscriber.subscribe(self)
        
        presenter?.getData()
//        subscriber.getDataImage()
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
//        print (data?.status)
        
//        cell.updateStatus(stringStatus: data?.status)
        
//        cell.characterView.statusLabel.text = data?.status
//        cell.updateStatus()
//        setStatus(data?.status)
        guard let data = data else { return cell }
        
        cell.statusViewContiner.statusView.text = data.status
        
        cell.characterView.titleLabel.text = data.name
//        print (data.status)
        
        cell.characterView.locationLabel.text = data.location.name
        cell.characterView.humanLabel.text = "\(data.species), \(data.gender )"
        presenter?.getImage(strUrl: data.image, index: indexPath)

        presenter?.callBack = { index in
            let updateCell = tableView.cellForRow(at: index) as! CharacterViewCell

            updateCell.avatarImage = UIImage (data: (self.presenter?.imageModel)!)
            updateCell.updateStatus()
//            updateCell.setStatus(for: "Alive")
        }
        
        return cell
    }
    
    func updateImage (indexPath: IndexPath) {
        print ()
        
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
