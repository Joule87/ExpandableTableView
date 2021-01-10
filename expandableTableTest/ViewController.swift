//
//  ViewController.swift
//  expandableTableTest
//
//  Created by Julio Collado on 1/9/21.
//  Copyright © 2021 Julio Collado. All rights reserved.
//

import UIKit

struct Section {
    var title: String
    var isExpanded: Bool
    var items: [String]
}

struct Items {
    var title: String?
}


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(UINib(nibName: CustomSectionHeader.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: CustomSectionHeader.identifier)
        tableView.remembersLastFocusedIndexPath = true

       
    }

    var sections = [Section(title: "A", isExpanded: false, items: ["1","1","1","1","1"]),
                    Section(title: "B", isExpanded: false, items: ["2","2","2","2","2"]),
                    Section(title: "C", isExpanded: false, items: ["3","3","3","3","3"]),
                    Section(title: "D", isExpanded: false, items: ["4","4","4","4","4"])]

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomSectionHeader.identifier) as? CustomSectionHeader else {
            preconditionFailure()
        }

        headerView.textValueLabel?.text = sections[section].title
        headerView.delegate = self
        headerView.index = section
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].isExpanded ? self.sections[section].items.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
            preconditionFailure()
        }
        cell.textLabel?.text = self.sections[indexPath.section].items[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: HeaderTableViewCellDelegate {
    func didTapSection(index: Int?) {
        guard let index = index else { return }
        self.sections[index].isExpanded = !self.sections[index].isExpanded
        tableView.reloadSections([index], with: .automatic)
    }
    
    
}
