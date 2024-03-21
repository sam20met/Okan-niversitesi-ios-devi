//
//  FoodsViewController.swift
//  sametmatur
//
//  Created by samey on 21.03.2024.
//

import Foundation
import UIKit

class FoodsViewController: UIViewController, UITableViewDataSource {
    
    var localFoods: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Table view ayarları
        tableView.dataSource = self
    }
    
    // Table view'da kaç satır olacağını belirtme
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localFoods.count
    }
    
    // Table view'daki hücreleri oluşturma
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        let food = localFoods[indexPath.row]
        cell.textLabel?.text = food
        return cell
    }
}
