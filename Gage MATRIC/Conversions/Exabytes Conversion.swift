

import UIKit

class Exabytes_Conversion: UIViewController {
    
    @IBOutlet weak var dropdownn: DropDown!
    var copiedLabel:UILabel?
    let ttextfield = TextFieldDelegate()
    static var  Exabytes = ""

    @IBOutlet weak var cpybn: UIButton!
    @IBOutlet weak var Exabytes : PlaceholderTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropdownn.optionArray = [
            "Bits (b)",
            "Bytes (B)",
            "Kilobytes (KB)",
            "Gigabytes (GB)",
            "Terabytes (TB)",
            "Petabytes (PB)",
            "Zettabytes (ZB)",
            "Yottabytes (YB)",
            "Kibibytes (KiB)",
            "Mebibytes (MiB)",
            "Gibibytes (GiB)",
            "Tebibytes (TiB)",
            "Pebibytes (PiB)",
            "Exbibytes (EiB)"
        ]
        dropdownn.arrow.isHidden = true
        textfieldd()
        HideKeyboardOnTap()
    }
    
    @IBAction func clearall(_ sender: Any) {
        
        Exabytes.text = ""
        Exabytes.textFieldDidChange()
        dropdownn.text = ""

    }
    @IBAction func converttt(_ sender: Any) {
        if dropdownn.text?.isEmpty ?? true || Exabytes.text?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        } else {
            if let Exabytes = Exabytes.text,
               let input = Double(Exabytes),
               let selectedIndex = dropdownn.selectedIndex {
                
                var resultingValue = ""
                
                switch selectedIndex {
                case 0:
                    let conversionValue = input * 8e+6
                    resultingValue = String(format: "%.2e Bits", conversionValue)
                case 1:
                    let conversionValue = input * 1e+6
                    resultingValue = String(format: "%.2e Bytes", conversionValue)
                case 2:
                    let conversionValue = input * 999.9
                    resultingValue = String(format: "%.2f Kilobytes", conversionValue)
                case 3:
                    let conversionValue = input / 1000
                    resultingValue = String(format: "%.2f Gigabytes", conversionValue)
                case 4:
                    let conversionValue = input / 1e+6
                    resultingValue = String(format: "%.2e Terabytes", conversionValue)
                case 5:
                    let conversionValue = input / 1e+9
                    resultingValue = String(format: "%.2e Petabytes", conversionValue)
                    
                case 6:
                    let conversionValue = input / 1e+15
                    resultingValue = String(format: "%.2e Zettabytes", conversionValue)
                case 7:
                    let conversionValue = input / 1e+18
                    resultingValue = String(format: "%.2e Yottabytes", conversionValue)
                case 8:
                    let conversionValue = input * 976.563
                    resultingValue = String(format: "%.2f Kibibytes", conversionValue)
                case 9:
                    let conversionValue = input * 9.9
                    resultingValue = String(format: "%.2f Mebibytes", conversionValue)
                case 10:
                    let conversionValue = input / 1024
                    resultingValue = String(format: "%.2f Gibibytes", conversionValue)
                case 11:
                    let conversionValue = input / 1.049e+6
                    resultingValue = String(format: "%.2e Tebibytes", conversionValue)
                case 12:
                    let conversionValue = input / 1.074e+9
                    resultingValue = String(format: "%.2e Pebibytes", conversionValue)
                case 13:
                    let conversionValue = input / 1.1e+12
                    resultingValue = String(format: "%.2e Exbibytes", conversionValue)
                default:
                    resultingValue = "Invalid Selection"
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
    func textfieldd(){
        
        Exabytes.delegate = ttextfield
        Exabytes.applyShadow()
        dropdownn.applyShadow()
        
    }
    
    @IBAction func share(_ sender: Any) {
        if  dropdownn.text?.isEmpty ?? true ||  Exabytes.text?.isEmpty ?? true || filterVC.extview?.isEmpty ?? true {
            showAlert(message: " Fill Text Fields ", title: "Alert")
        }
        else  {
             let resultText = filterVC.extview
            
            
            let acttivityController = UIActivityViewController(activityItems: ["Exabytes :\(Exabytes_Conversion.Exabytes) ,Result \(resultText ?? "") "], applicationActivities:nil)
            present(acttivityController, animated: true)
            
        }
    }
    
    @IBAction func coppy(_ sender: Any) {
        
        if dropdownn.text?.isEmpty ?? true ||  Exabytes.text?.isEmpty ?? true || filterVC.extview?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        }
        else   {
            vaus()
            let combined = "Exabytes \(Exabytes_Conversion.Exabytes),Result \(filterVC.extview!) "
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
        let  Exabytes =  Exabytes.text
        Exabytes_Conversion.Exabytes =  Exabytes ?? ""
    }
}
