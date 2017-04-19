//
//  ProductTableViewCell.swift
//  TableView_DucTran
//
//  Created by Cntt03 on 4/19/17.
//  Copyright © 2017 Cntt03. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    

    @IBOutlet weak var productImageView: UIImageView!

    @IBOutlet weak var productTitleLabel: UILabel!
    
    @IBOutlet weak var productDesLabel: UILabel!
    
    func configCellWith(product: Product){
        productImageView.image = product.image
        productTitleLabel.text = product.title
        productDesLabel.text = product.description
    }
}
