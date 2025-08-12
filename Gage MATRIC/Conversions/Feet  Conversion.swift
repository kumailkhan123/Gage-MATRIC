

import UIKit
class Feet__Conversion: UIViewController {
    @IBOutlet weak var dropdownn: DropDown!
    var copiedLabel: UILabel?
    let ttextfield = TextFieldDelegate()
    static var  Fet = ""
    @IBOutlet weak var cpybn: UIButton!
    @IBOutlet weak var Feet: PlaceholderTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropdownn.optionArray = [
            "Square Meters (m²)",
            "Square Kilometers (km²)",
            "Square Miles (mi²)",
            "Hectares (ha)",
            "Square Yards (yd²)",
            "Square Inches (in²)",
            "Square Centimeters (cm²)",
            "Square Millimeters (mm²)",
            "Square Micrometers (μm²)",
            "Square Nanometers (nm²)",
          
        ]
        dropdownn.arrow.isHidden = true
        textfieldd()
        HideKeyboardOnTap()
    }
    
    @IBAction func clearall(_ sender: Any) {
        Feet.text = ""
        Feet.textFieldDidChange()
        dropdownn.text = ""
    }
    
    @IBAction func converttt(_ sender: Any) {
        if dropdownn.text?.isEmpty ?? true || Feet.text?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        } else {
            if let Feet = Feet.text,
                let input = Double(Feet),
               let selectedIndex = dropdownn.optionArray.firstIndex(of: dropdownn.text!) {
                
                var resultingValue = ""
                
                switch selectedIndex {
                case 0:
                    let conversionValue = input * 1.0
                    resultingValue = String(format: "%.2f Square Meters", conversionValue)
                case 1:
                    let conversionValue = input * 1e-6
                    resultingValue = String(format: "%.2e Square Kilometers", conversionValue)
                case 2:
                    let conversionValue = input * 3.861e-7
                    resultingValue = String(format: "%.2e Square Miles", conversionValue)
              
                case 3:
                    let conversionValue = input * 1e-4
                    resultingValue = String(format: "%.2e Hectares", conversionValue)
                case 4:
                    let conversionValue = input * 1.196
                    resultingValue = String(format: "%.2f Square Yards", conversionValue)
            
                case 5:
                    let conversionValue = input * 1550
                    resultingValue = String(format: "%.2f Square Inches", conversionValue)
                case 6:
                    let conversionValue = input * 9999
                    resultingValue = String(format: "%.2e Square Centimeters", conversionValue)
                case 7:
                    let conversionValue = input * 1e6
                    resultingValue = String(format: "%.2e Square Millimeters", conversionValue)
                case 8:
                    let conversionValue = input * 1e12
                    resultingValue = String(format: "%.2e Square Micrometers", conversionValue)
                case 9:
                    let conversionValue = input * 1e18
                    resultingValue = String(format: "%.2e Square Nanometers", conversionValue)
               
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
    func textfieldd() {
        Feet.delegate = ttextfield
        Feet.applyShadow()
        dropdownn.applyShadow()
    }
    
    @IBAction func share(_ sender: Any) {
        if dropdownn.text?.isEmpty ?? true || Feet.text?.isEmpty ?? true || filterVC.extview?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        } else {
            guard let resultText = filterVC.extview, let Feet = Feet.text else { return }
            let activityController = UIActivityViewController(activityItems: ["Feet: \(Feet), Result: \(resultText)"], applicationActivities: nil)
            present(activityController, animated: true)
        }
    }
    
    @IBAction func coppy(_ sender: Any) {
        if dropdownn.text?.isEmpty ?? true || Feet.text?.isEmpty ?? true || filterVC.extview?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        } else {
            vaus()
            let combined = "Feet \(Exabytes_Conversion.Exabytes),Result \(filterVC.extview!) "
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
        let  Feet =  Feet.text
        Feet__Conversion.Fet =  Feet ?? ""
    }
}
