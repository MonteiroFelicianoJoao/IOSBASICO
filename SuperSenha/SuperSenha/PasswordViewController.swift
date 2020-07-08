//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Douglas Frari on 01/07/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10 // default se usuario nao enviar
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters,
                                              useLetters: useLetters,
                                              useNumbers: useNumbers,
                                              useCapitalLetters: useCapitalLetters,
                                              useSpecialLetters: useSpecialCharacters)
        
        
        tvPasswords.text = "" // limpa a view

        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
             tvPasswords.text.append(password + "\n\n")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func generatePasswordAgain(_ sender: Any) {
        
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) // posiciona a scroll no topo da view
        tvPasswords.text = "" // limpa a view

        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
             tvPasswords.text.append(password + "\n\n")
        }

    }
    
}
