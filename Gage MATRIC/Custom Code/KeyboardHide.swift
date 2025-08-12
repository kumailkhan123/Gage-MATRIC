


import UIKit
class TextFieldDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789").union(CharacterSet(charactersIn: ""))
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: characterSet)
    }
}
extension UIViewController {
    func HideKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(diismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func diismissKeyboard() {
        view.endEditing(true)
    }
}


extension UIViewController {
    func showAlert(message: String, title: String = "Alert") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add OK button with blue text color
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor.blue, forKey: "titleTextColor")
        
        // Add Cancel button with red text color
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        alert.addAction(okAction)
//        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
}

