//
//  DetailViewController.swift
//  LoginApp
//
//  Created by Aditya on 16/07/21.
//

import UIKit
import FirebaseDatabase

class DetailViewController: UIViewController {
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    var database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.database = Database.database().reference()
       

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpBtn(_ sender: Any) {
        self.saveFIRData()
    }
    func saveFIRData(){
        let dict = ["Firstname": FirstName.text, "LastName": LastName.text, "Email": Email.text , "Password": Password.text ]
        self.database.child("Sign Ups").childByAutoId().setValue(dict)
    }

}
