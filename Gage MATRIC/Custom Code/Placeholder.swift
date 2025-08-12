

import Foundation

import UIKit

enum PlaceholderDirection: String {
    case placeholderUp = "up"
    case placeholderDown = "down"
}
public class PlaceholderTextField: UITextField {
    var enableMaterialPlaceHolder: Bool = true
    var placeholderAttributes = NSDictionary()
    var lblPlaceHolder = UILabel()
    var defaultFont = UIFont.systemFont(ofSize: 16)
    var difference: CGFloat = 24.0
    var directionMaterial = PlaceholderDirection.placeholderUp
    var isUnderLineAvailable: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize() {
        self.clipsToBounds = false
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        enableMaterialPlaceHolder(enableMaterialPlaceHolder: true)
        
        if isUnderLineAvailable {
            let underLine = UIImageView()
            underLine.backgroundColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 0.8)
            underLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
            underLine.clipsToBounds = true
            self.addSubview(underLine)
        }
        
        defaultFont = self.font!
    }
    
    @IBInspectable var placeHolderColor: UIColor? = .none {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder! as String,
                                                            attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor!])
        }
    }
    
    override public var placeholder: String? {
        didSet {
            let atts = [NSAttributedString.Key.foregroundColor: UIColor.green, NSAttributedString.Key.font: UIFont.labelFontSize] as [NSAttributedString.Key: Any]
            if let newPlaceholder = placeholder {
                self.attributedPlaceholder = NSAttributedString(string: newPlaceholder, attributes: atts)
            }
            enableMaterialPlaceHolder(enableMaterialPlaceHolder: self.enableMaterialPlaceHolder)
        }
    }
    override public var attributedText: NSAttributedString? {
        didSet {
            if (self.placeholder != nil) && (self.text != "") {
                let string = NSString(string: self.placeholder!)
                placeholderText(string)
            }
        }
    }
    
    @objc func textFieldDidChange() {
        if self.enableMaterialPlaceHolder {
            if (self.text == nil) || (self.text?.count)! > 0 {
                self.lblPlaceHolder.alpha = 1
                self.attributedPlaceholder = nil
                self.lblPlaceHolder.textColor = self.placeHolderColor
                self.lblPlaceHolder.font = UIFont(name: "Times", size: 16.0)
                self.lblPlaceHolder.font = .systemFont(ofSize: 16, weight: .bold)
                self.lblPlaceHolder.frame.origin.x = 0
                let fontSize = self.font!.pointSize
                self.lblPlaceHolder.font = UIFont.init(name: (self.font?.fontName)!, size: fontSize - 2)
            }
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { () -> Void in
                if (self.text == nil) || (self.text?.count)! <= 0 {
                    self.lblPlaceHolder.font = self.defaultFont
                    self.lblPlaceHolder.font = UIFont(name: "Times", size: 16.0)

                    self.lblPlaceHolder.frame = CGRect(x: self.lblPlaceHolder.frame.origin.x + 10, y: 0, width: self.frame.size.width, height: self.frame.size.height)
                    self.lblPlaceHolder.textColor = self.placeHolderColor ?? .gray
                } else {
                    if self.directionMaterial == PlaceholderDirection.placeholderUp {
                        self.lblPlaceHolder.font = .systemFont(ofSize: 16, weight: .heavy)
                        self.lblPlaceHolder.font = UIFont(name: "Times", size: 16)


                        self.lblPlaceHolder.frame = CGRect(x: self.lblPlaceHolder.frame.origin.x, y: -27
                                                           , width: self.frame.size.width, height: self.frame.size.height)
                        self.lblPlaceHolder.textColor = self.placeHolderColor ?? .white
                    } else {
                        self.lblPlaceHolder.frame = CGRect(x: self.lblPlaceHolder.frame.origin.x, y: self.difference, width: self.frame.size.width, height: self.frame.size.height)
                    }
                }
            }, completion: { (finished: Bool) -> Void in
            })
        }
    }
    
    func enableMaterialPlaceHolder(enableMaterialPlaceHolder: Bool) {
        self.enableMaterialPlaceHolder = enableMaterialPlaceHolder
        self.lblPlaceHolder = UILabel()
        self.lblPlaceHolder.frame = CGRect(x: 0, y: 0, width: 0, height: self.frame.size.height)
        self.lblPlaceHolder.font = UIFont.systemFont(ofSize: 24)
        self.lblPlaceHolder.alpha = 0
        self.lblPlaceHolder.clipsToBounds = true
        self.addSubview(self.lblPlaceHolder)
        self.lblPlaceHolder.attributedText = self.attributedPlaceholder
    }
    
    func placeholderText(_ placeholder: NSString) {
        let atts = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.labelFontSize] as [NSAttributedString.Key: Any]
        self.attributedPlaceholder = NSAttributedString(string: placeholder as String, attributes: atts)
        enableMaterialPlaceHolder(enableMaterialPlaceHolder: self.enableMaterialPlaceHolder)
    }
    
    override public func becomeFirstResponder() -> Bool {
        let returnValue = super.becomeFirstResponder()
        return returnValue
    }
    
    override public func resignFirstResponder() -> Bool {
        let returnValue = super.resignFirstResponder()
        return returnValue
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public class AnimatedPlaceholderTextField: UITextField, UITextFieldDelegate {
        let border = CALayer()
        
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
            delegate = self
            createBorder()
        }
        
        required override init(frame: CGRect) {
            super.init(frame: frame)
            delegate = self
            createBorder()
        }
        
        func createBorder() {
            let width = CGFloat(2.0)
            border.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
        
        public func textFieldDidBeginEditing(_ textField: UITextField) {
            clearButtonMode = .whileEditing
            movePlaceholderUp()
        }
        
        public func textFieldDidEndEditing(_ textField: UITextField) {
            movePlaceholderDown()
        }
        
        func movePlaceholderUp() {
                  border.borderColor = UIColor(red: 0.87, green: 0.30, blue: 0.32, alpha: 1.0).cgColor
              }

              func movePlaceholderDown() {
                  border.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
              }
    }
}
