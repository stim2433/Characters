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
//        subscriber.subscribe(self)
//        subscriber.indexRow = indexPath.row
        
        let data = presenter?.dataModel?.results[indexPath.row]
//        let image = subscriber.imageData
        
        presenter?.getImage()
        
        cell.configerationViewCell()
        cell.updateStatus(stringStatus: data?.status)
        cell.characterView.statusLabel.text = data?.status
        cell.characterView.titleLabel.text = data?.name
        cell.characterView.locationLabel.text = data?.location.name
        cell.characterView.humanLabel.text = "\(data?.species ?? "test"), \(data?.gender ?? "test")"
//        if let image = image {
//            cell.avatarImage.image = UIImage (data: image)
//        }
        
        return cell
    }
}

extension CharacterViewController: CharacterViewProtocol {
    func saccess() {
        tableView.reloadData()
        tableView.backgroundColor = .green
    }
    
    func update() {
        print(presenter?.dataImage)
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CharacterViewCell
        let image = presenter?.dataImage
        if let image = image {
            cell?.avatarImage.image = UIImage (data: image)
            tableView.reloadData()
        }
        
//        print(cell.avatarImage)
//        subscriber.imageData = presenter?.dataImage
//        subscriber.getDataImage()
//        subscriber.unsubscribe(self)
        
        tableView.backgroundColor = .yellow
    }
    
    func errors() {
        tableView.backgroundColor = .red
    }
}

//extension CharacterViewController: Subscriber {
//    func update(subscribe: Observier) {
////        guard subscribe.imageData != nil else { return }
////        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.none)
////        print(presenter?.dataImage)
//        print (#function)
//        
//    }
//}


protocol Subscriber: AnyObject {
    func update(subscribe: Observier)
}

class Observier {
    private lazy var subscribers = [Subscriber]()
    
    var indexRow: Int!
    var imageData: Data!
    
    func subscribe (_ subscriber: Subscriber) {
        print ( "subscribe")
        subscribers.append(subscriber)
    }
    
    func unsubscribe ( _ subscriber: Subscriber) {
        guard let index = subscribers.firstIndex(where: { $0 === subscriber }) else { return }
        subscribers.remove(at: index)
        print ( "unsubscribe")
    }
    
    func notify() {
        subscribers.forEach( { $0.update(subscribe: self)} )
    }
    
    func getDataImage () {
        print (subscribers.index(after: 0))
        notify()
    }
}
