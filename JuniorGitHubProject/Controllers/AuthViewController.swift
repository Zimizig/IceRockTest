//
//  ViewController.swift
//  JuniorGitHubProject
//
//  Created by Роман on 03.11.2023.
//

import SwiftUI
import Alamofire

class AuthViewController: UIViewController, UITextFieldDelegate {
    
    let logoView: UIImageView = UIImageView.init()
    let signButton = UIButton(type: .system)
    let textFiledSignIn = UITextField.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.05751948804, green: 0.08434148878, blue: 0.118762739, alpha: 1)
        
        let logoImage = UIImage(named: "Logo")
        logoView.frame = CGRect(x: 150, y: 200, width: 96, height: 96)
        logoView.image = logoImage
        self.view.addSubview(logoView)
        
        
        signButton.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        signButton.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.5764705882, blue: 0.3137254902, alpha: 1)
        signButton.tintColor = .white
        signButton.setTitle("Sign in", for: .normal)
        signButton.layer.cornerRadius = 10
        signButton.addTarget(self, action: #selector(checkData), for: .touchUpInside)
        self.view.addSubview(signButton)
        
        textFiledSignIn.frame = CGRect(x: 50, y: 350, width: 300, height: 50)
        textFiledSignIn.layer.borderWidth = 0.6
        textFiledSignIn.layer.borderColor = #colorLiteral(red: 0.4078431373, green: 0.4156862745, blue: 0.431372549, alpha: 1)
        textFiledSignIn.layer.cornerRadius = 10
        textFiledSignIn.textColor = .white
        textFiledSignIn.attributedPlaceholder = NSAttributedString(
            string: "Personal access token",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        placeholderPadding(textField: textFiledSignIn, leftPadding: 10)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_: )))
        textFiledSignIn.addGestureRecognizer(tap)
        
        self.view.addSubview(textFiledSignIn)
        
        
        var userInfo = [Model]()
        // var error = String()
        
        AppRepository.sharedInstance.signIn(token: "token") { result in
            switch result { 
            case .success(let data):
                userInfo = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        print(userInfo)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFiledSignIn.endEditing(true)
        return textField.resignFirstResponder()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textFiledSignIn.text != "" {
            return true
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func placeholderPadding(textField: UITextField, leftPadding: CGFloat) {
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: leftPadding, height: textField.frame.height))
        textField.leftViewMode = UITextField.ViewMode.always
    }
    
    @objc func checkData () {
        self.showAlert(title: "Error", message: "404: Нет данных")
    }
    
    @objc func tapped(_ recognizer: UITapGestureRecognizer) {
        UIButton.animate(withDuration: 0.3) {
            self.signButton.frame = CGRect(x: 50, y: 450, width: 300, height: 50)
            self.textFiledSignIn.layer.borderColor = #colorLiteral(red: 0.3490196078, green: 0.6392156863, blue: 0.9843137255, alpha: 1)
            self.textFiledSignIn.isHidden = false
            self.textFiledSignIn.becomeFirstResponder()
        }
    }
}

extension AuthViewController {
    
    func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel , handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: Обязательно удалить /

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        AuthViewController().showPreview()
    }
}

// MARK: Обязательно удалить //
    
