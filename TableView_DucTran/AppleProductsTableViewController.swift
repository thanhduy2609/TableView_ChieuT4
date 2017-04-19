//
//  AppleProductsTableViewController.swift
//  TableView_DucTran
//
//  Created by Cntt03 on 4/19/17.
//  Copyright © 2017 Cntt03. All rights reserved.
//

import UIKit

class AppleProductsTableViewController: UITableViewController {
    
    var products: [Product] {
        var productLines = ProductLine.productLines();
        return productLines[0].products;
    }
    
    lazy var productLines: [ProductLine] = {
        return ProductLine.productLines()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return productLines.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productLine = productLines[section];
        return productLine.name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let productLine = productLines[section]
        return productLine.products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product Cell", for: indexPath) as! ProductTableViewCell

        // Configure the cell...
        let productLine = productLines[indexPath.section];
        
        let product = productLine.products[indexPath.row];
//        cell.textLabel?.text = product.title
//        cell.detailTextLabel?.text = product.description
//        cell.imageView?.image = product.image
        
        cell.configCellWith(product: product)
        
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            let productLine = productLines[indexPath.section];
            productLine.products.remove(at: indexPath.row)
            //update table view with new data source
            //tableView.reloadData() bad ways
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
