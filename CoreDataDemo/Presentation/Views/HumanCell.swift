//
//  HumanCell.swift
//  CoreDataDemo
//
//  Created by Jack Smith on 17/02/2020.
//  Copyright © 2020 Jack Smith. All rights reserved.
//

import UIKit

class HumanCell: UITableViewCell {
    
    // MARK:- IBOutlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var professionLabel: UILabel!
    
    // MARK:- Properties
    
    var human: Human? {
        didSet {
            self.configureCell()
        }
    }
    
    // MARK:- Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK:- Methods
    
    private func configureCell() {
        guard let human = self.human else {return}
        self.nameLabel.text = human.name
        self.ageLabel.text = "\(human.age)"
        self.heightLabel.text = "\(human.height)"
        self.weightLabel.text = "\(human.weight)"
        self.professionLabel.text = human.profession
    }
}
