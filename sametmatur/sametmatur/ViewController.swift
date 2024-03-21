//
//  ViewController.swift
//  sametmatur
//
//  Created by samey on 21.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   

    // Şehir struct'ı tanımlama
    struct City {
        var name: String
        var localFoods: [String]
    }

    class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        // Şehirler ve yöresel yemeklerin listesi
        let cities: [City] = [
            City(name: "İstanbul", localFoods: ["Köfte", "İskender", "Balık Ekmek"]),
            City(name: "Ankara", localFoods: ["Döner", "Kuzu Tandır", "Höşmerim"]),
            City(name: "İzmir", localFoods: ["Kumru", "Boyoz", "Çiğdem"]),
            City(name: "Antalya", localFoods: ["Köfte", "Piyaz", "Kebap"]),
            City(name: "Trabzon", localFoods: ["Hamsi", "Kuymak", "Laz Böreği"]),
            City(name: "Adana", localFoods: ["Adana Kebap", "Analı Kızlı", "Şalgam Suyu"]),
            City(name: "Bursa", localFoods: ["İskender", "Kebap", "Kestane Şekeri"]),
            City(name: "Gaziantep", localFoods: ["Baklava", "Künefe", "Ali Nazik"]),
            City(name: "Konya", localFoods: ["Etli Ekmek", "Mantı", "Fırın Kebabı"]),
            City(name: "Samsun", localFoods: ["Bafra Pidesi", "Mısır Ekmeği", "Lokum"])
        ]
        
        @IBOutlet weak var tableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Table view ayarları
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        // Table view'da kaç satır olacağını belirtme
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cities.count
        }
        
        // Table view'daki hücreleri oluşturma
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let city = cities[indexPath.row]
            cell.textLabel?.text = city.name
            return cell
        }
        
        // Şehirlerin listelendiği ekranda bir şehir seçildiğinde yöresel yemeklerin olduğu ekrana geçiş yapma
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedCity = cities[indexPath.row]
            let foodsVC = storyboard?.instantiateViewController(withIdentifier: "FoodsViewController") as! FoodsViewController
            foodsVC.localFoods = selectedCity.localFoods
            navigationController?.pushViewController(foodsVC, animated: true)
        }
    }


}

