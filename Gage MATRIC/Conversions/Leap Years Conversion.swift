

import UIKit

class Leap_Years_Conversion: UIViewController {
    
    @IBOutlet weak var dropdown: DropDown!
    var copiedLabel: UILabel?
    let textFieldDelegate = TextFieldDelegate()
    @IBOutlet weak var Leap_Years: PlaceholderTextField!
    @IBOutlet weak var cpybn: UIButton!
    static var  Leap_Years = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        Leap_Years.layer.cornerRadius = 30
        Leap_Years.layer.masksToBounds = true
        dropdown.optionArray = [
            "Days",
            "Weeks",
            "Hours",
            "Minutes",
            "Millennia",
            "Fortnights"
        ]
        dropdown.arrow.isHidden = true
        setupTextField()
HideKeyboardOnTap()
    }
    
    @IBAction func clearAll(_ sender: Any) {
        Leap_Years.text = ""
        Leap_Years.textFieldDidChange()
        dropdown.text = ""
    }
    
    @IBAction func convert(_ sender: Any) {
        if dropdown.text?.isEmpty ?? true || Leap_Years.text?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        } else {
            if let monthsText = Leap_Years.text,
               let input = Double(monthsText),
               let selectedIndex = dropdown.optionArray.firstIndex(of: dropdown.text!) {
                
                var resultingValue = ""
                
                switch selectedIndex {
                case 0:
                            let conversionValue = input * 30.4375
                            resultingValue = String(format: "%.2f Days", conversionValue)
                        case 1:
                            let conversionValue = input * 4.34524
                            resultingValue = String(format: "%.2f Weeks", conversionValue)
                        case 2:
                            let conversionValue = input * 730.5
                            resultingValue = String(format: "%.2f Hours", conversionValue)
                        case 3:
                            let conversionValue = input * 43830.0
                            resultingValue = String(format: "%.2f Minutes", conversionValue)
                        case 4:
                            let conversionValue = input / 12000.0
                            resultingValue = String(format: "%.10f Millennia", conversionValue)
                        case 5:
                            let conversionValue = input * 2.1726
                            resultingValue = String(format: "%.2f Fortnights", conversionValue)
                        default:
                            resultingValue = "Invalid Value"
                        }
                filterVC.extview = resultingValue
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "filterVC") as? filterVC {
                    vaus()
                    filterVC.extview = resultingValue
                    filterVC.copieedd = ""
                    if #available(iOS 15.0, *) {
                        if let sheet = vc.sheetPresentationController {
                            if #available(iOS 16.0, *) {
                                sheet.detents = [.custom { _ in return 240 }]
                            } else {
                                sheet.detents = [.medium()]
                            }
                            sheet.preferredCornerRadius = 30
                        }
                    }
                    self.present(vc, animated: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 60.0) {
                        vc.dismiss(animated: true)
                    }
                    
                    
                }
            }
        }
    }
    
    func setupTextField() {
        Leap_Years.delegate = textFieldDelegate
        Leap_Years.applyShadow()
        dropdown.applyShadow()
    }
    
    @IBAction func share(_ sender: Any) {
        if dropdown.text?.isEmpty ?? true || Leap_Years.text?.isEmpty ?? true || filterVC.extview?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        } else {
             let resultText = filterVC.extview
            
            let activityController = UIActivityViewController(activityItems: ["Leap Years: \(Leap_Years_Conversion.Leap_Years), Result: \(resultText ?? "")"], applicationActivities: nil)
            present(activityController, animated: true)
        }
    }
    
    @IBAction func coy(_ sender: Any) {
        if dropdown.text?.isEmpty ?? true || Leap_Years.text?.isEmpty ?? true ||  filterVC.extview?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        } else {
            vaus()
            let combined = "Leap Years \(Exabytes_Conversion.Exabytes),Result \(filterVC.extview!) "
            showCopiedLabel(message: "Copied")
            filterVC.copieedd = combined
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "filterVC") as? filterVC {
                vc.hidecopied()
                if #available(iOS 15.0, *) {
                    if let sheet = vc.sheetPresentationController {
                        if #available(iOS 16.0, *) {
                            sheet.detents = [.custom { _ in return 240 }]
                        } else {
                            sheet.detents = [.medium()]
                        }
                        sheet.preferredCornerRadius = 30
                    }
                }
                self.present(vc, animated: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 60.0) {
                    filterVC.extview = ""
                    filterVC.copieedd = ""
                    vc.dismiss(animated: true)
                }
            }
            }
            func showCopiedLabel(message: String) {
                copiedLabel?.removeFromSuperview()
                
                let label = UILabel()
                label.text = message
                label.textColor = UIColor.white
                label.font = UIFont.systemFont(ofSize: 14.0)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(label)
                
                NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: cpybn.topAnchor, constant: -20.0),
                    label.leadingAnchor.constraint(equalTo: cpybn.trailingAnchor, constant: -80.0)
                ])
                
                copiedLabel = label
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    label.removeFromSuperview()
                }
        }
    }
    
   
    func vaus(){
        let  Leap_Years =  Leap_Years.text
        Leap_Years_Conversion.Leap_Years =  Leap_Years ?? ""
    }
}
