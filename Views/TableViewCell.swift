//
//  Cell.swift
//  navbar-toggler
//
//  Created by dada on 2021/7/24.
//

import Foundation
import UIKit
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var F_Location: UILabel!
    @IBOutlet weak var F_Feature: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var F_Name_Ch: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
