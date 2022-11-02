//
//  ViewController.swift
//  Infinite Scroll
//
//  Created by Hasan Basri Komser on 2.11.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var data = [ "Hasan","Ahmet","Basri","Ömer","Ali","Mehmet","Hasan","Ahmet","Basri","Ömer","Ali","Mehmet","Hasan","Ahmet","Basri","Ömer","Ali","Mehmet","Hasan","Ahmet","Basri","Ömer","Ali","Mehmet","Hasan","Ahmet","Basri","Ömer","Ali","Mehmet","Hasan","Ahmet","Basri","Ömer","Ali","Mehmet","Hasan","Ahmet","Basri","Ömer","Ali","Mehmet"
    ]
    var newData = ["Elma","Armut","Muz","Erik"]
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if data.count - 1 == indexPath.row {
            self.listTableView.tableFooterView = createSpinnerFooter()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.data.append(contentsOf: self.newData)
                self.listTableView.reloadData()
            }
        }
    }
    func createSpinnerFooter() -> UIView {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.self.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
}


