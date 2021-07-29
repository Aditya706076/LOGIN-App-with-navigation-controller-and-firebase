//
//  ViewController.swift
//  LoginApp
//
//  Created by Aditya on 16/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var customPasswordField: UITextField!
    
    @IBOutlet weak var errorLabel1: UILabel!
    

    @IBOutlet weak var errorLabel2: UILabel!
    

    
    @IBOutlet weak var logInButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    logInButton.isEnabled = true
                           customPasswordField.isSecureTextEntry = true
                           self.txtEmail.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
                           
                           self.customPasswordField.delegate = self
                           self.customPasswordField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    }
                       
@objc private func textFieldEditingChanged()
      {
                  guard let email = txtEmail?.text else { return }
                  guard let password = customPasswordField?.text else { return }
                  
                  
          if email.validateEmail() {
              logInButton.isEnabled = true
              logInButton.backgroundColor = UIColor.green
            errorLabel1.text = "  "
       
              
          } else {
              logInButton.isEnabled = false
              logInButton.backgroundColor = UIColor.red
              errorLabel1.text = " * Invalid Email"

          }
          
          
          if password.validatePassword()
   {
             logInButton.isEnabled = true
             logInButton.backgroundColor = UIColor.green
             errorLabel2.text = " "
      
          }
          else {
              logInButton.isEnabled = false
           
              errorLabel2.text = " * Incorrect Password"
              logInButton.backgroundColor = UIColor.red
          }
                 
      }
  }

          extension String {
              
              func validateEmail() -> Bool {
                  let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
                  return applyPredicateOnRegex(regexStr: emailRegEx)
              }
              
              func validatePassword() -> Bool {
                  let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,}"

                  return applyPredicateOnRegex(regexStr: passRegEx)
              }
              
              func applyPredicateOnRegex(regexStr: String) -> Bool {
                  let trimmedString = self.trimmingCharacters(in: .whitespaces)
                  let validateString = NSPredicate(format: "SELF MATCHES %@", regexStr)
                  let isValidString = validateString.evaluate(with: trimmedString)
                  return isValidString
              }
          }
  //MARK:- UITextFieldDelegate
          extension ViewController: UITextFieldDelegate {
              
              func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                  let maxLength = 15
                  let currentString: NSString = (textField.text ?? "") as NSString
                  let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
                 
                  return newString.length <= maxLength
              }

    
}

