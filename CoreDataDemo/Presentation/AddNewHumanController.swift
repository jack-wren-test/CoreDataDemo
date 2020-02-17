//
//  AddNewHumanController.swift
//  CoreDataDemo
//
//  Created by Jack Smith on 17/02/2020.
//  Copyright © 2020 Jack Smith. All rights reserved.
//

import UIKit

class AddNewHumanController: UIViewController {
    
    // MARK:- IBOutlets
    
    @IBOutlet private weak var nameTF: UITextField!
    @IBOutlet private weak var professionTF: UITextField!
    @IBOutlet private weak var heightTF: UITextField!
    @IBOutlet private weak var weightTF: UITextField!
    @IBOutlet private weak var birthDatePicker: UIDatePicker!
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Private
    
    private func createHumanRecord(name: String,
                                   birthDate: Date,
                                   height: Float,
                                   weight: Float,
                                   profession: String) {
        do {
            try CoreDateClient.shared.createHuman(name: name,
                                                  birthDate: birthDate,
                                                  height: height,
                                                  weight: weight,
                                                  profession: profession)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK:- IBActions
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let name = self.nameTF.text,
            let height = Float(self.heightTF.text ?? ""),
            let weight = Float(self.weightTF.text ?? ""),
            let profession = self.professionTF.text else {return}
        let birthDate = self.birthDatePicker.date
        
        self.createHumanRecord(name: name,
                               birthDate: birthDate,
                               height: height,
                               weight: weight,
                               profession: profession)
    }
}
