import UIKit

extension UITextField {
    func applyShadow(cornerRadius: CGFloat = 0) {
       
               self.layer.masksToBounds = false
               self.layer.shadowRadius = 4.0
               self.layer.shadowColor = UIColor.black.cgColor
               self.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
               self.layer.shadowOpacity = 2
               self.layer.cornerRadius = cornerRadius
              
        self.layer.borderColor = UIColor.black.cgColor
               self.layer.borderWidth = 0.7
           }
       
}
