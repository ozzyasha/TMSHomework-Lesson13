//
//  ViewController.swift
//  TMSHomework-Lesson13
//
//  Created by Наталья Мазур on 4.01.24.
//

import UIKit

class ViewController: UIViewController {

    let data = [
        Model(header: "ДЗ №1 - стандартные ячейки с индексом", row: ["Элемент № 1", "Элемент № 2", "Элемент № 3", "Элемент № 4", "Элемент № 5", "Элемент № 6", "Элемент № 7", "Элемент № 8", "Элемент № 9", "Элемент № 10"]),
        Model(header: "ДЗ №2 - ячейки с двумя лейблами", row: ["Swift", "Objective-C", "Java", "Python", "C++", "C#", "Ruby", "Dart", "Kotlin", "Pascal"]),
        Model(header: "ДЗ №3 - Секция 1", row: ["Элемент № 1", "Элемент № 2", "Элемент № 3", "Элемент № 4", "Элемент № 5", "Элемент № 6", "Элемент № 7", "Элемент № 8", "Элемент № 9", "Элемент № 10"]),
        Model(header: "ДЗ №3 - Секция 2", row: ["Swift", "Objective-C", "Java", "Python", "C++", "C#", "Ruby", "Dart", "Kotlin", "Pascal"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        data[section].header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].row.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        
        if data[indexPath.section].header == "ДЗ №1 - стандартные ячейки с индексом" {
            
            cell.textLabel?.textColor = .black
            let textInRow: String = data[indexPath.section].row[indexPath.row]
            let dataArray = data[indexPath.section].row
            
            cell.textLabel?.textColor = .black
            cell.textLabel?.text = String(dataArray!.firstIndex(of: textInRow)!)
            
        } else if data[indexPath.section].header == "ДЗ №2 - ячейки с двумя лейблами"{
            
            let textInRow: String = data[indexPath.section].row[indexPath.row]
            let dataArray = data[indexPath.section].row
            cell.textLabel?.textColor = .black
            cell.textLabel?.text = data[indexPath.section].row[indexPath.row]
            cell.detailTextLabel?.textColor = .systemBlue
            cell.detailTextLabel?.text = String(dataArray!.firstIndex(of: textInRow)!)
            
        } else if data[indexPath.section].header == "ДЗ №3 - Секция 1" {
            
            let textInRow: String = data[indexPath.section].row[indexPath.row]
            let dataArray = data[indexPath.section].row
            
            cell.textLabel?.textColor = .black
            cell.textLabel?.text = String(dataArray!.firstIndex(of: textInRow)!)
            cell.detailTextLabel?.textColor = .systemBlue
            cell.detailTextLabel?.text = data[indexPath.section].header
            
        } else if data[indexPath.section].header == "ДЗ №3 - Секция 2" {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.textColor = .black
            cell.textLabel?.text = data[indexPath.section].row[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Выбран элемент: \(data[indexPath.section].row[indexPath.row]) , из секции: \(data[indexPath.section].header!)")
    }
    
}


//1. Вывести 20 ячеек в таблице. В label ячейки укажите текущий индекс. Используйте стандартную ячейку.
//2. Вывести 10 языков программирования. Ячейка должна содержать два Label.
//3. Вывести 20 ячеек. Для первых 10 ячеек выводится в textLabel текущий индекс, в detailTextLabel текущая секция, стиль ячейки с двумя label. Для вторых 10 выводятся языки программирования, у ячеек стиль стандартный с одним label. Итого таблица с 20 ячейками.
