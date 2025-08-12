
import UIKit

class Volt_Ampere_Conversion:UIViewController {
    @IBOutlet weak var dropdownn: DropDown!
  
    var copiedLabel:UILabel?
    let ttextfield = TextFieldDelegate()
    static var Volt_Ampere = ""
    @IBOutlet weak var cpybn: UIButton!
    @IBOutlet weak var Volt_Ampere: PlaceholderTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropdownn.optionArray = ["CentiWatt","Watt","TeraWat","PlanckPower","Poncelet","ExaWatt"]
        dropdownn.arrow.isHidden = true
        textfieldd()
        HideKeyboardOnTap()
        
    }
    
    @IBAction func clearall(_ sender: Any) {
        
        Volt_Ampere.text = ""
        Volt_Ampere.textFieldDidChange()
        dropdownn.text = ""
       
    }
    @IBAction func converttt(_ sender: Any) {
        if dropdownn.text?.isEmpty ?? true || Volt_Ampere.text?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields ", title: "Alert")
        } else {
            if let Volt_Ampere = Volt_Ampere.text,
               let input = Double(Volt_Ampere),
               let selectedOption = dropdownn.text {
                
                var resultingValue = ""
                
                switch selectedOption {
                case "CentiWatt":
                    let conversionValue = input * 9.805e+7
                    resultingValue = String(format: "%.2e CentiWatt", conversionValue)
                
                case "Watt":
                    let conversionValue = input * 99.665
                    resultingValue = String(format: "%.2f Watt", conversionValue)
                case "TeraWat":
                    let conversionValue = input * 9.80665e-10
                    resultingValue = String(format: "%.2e TeraWat", conversionValue)
                case "PlanckPower":
                    let conversionValue = input * 2.70282e-49
                    resultingValue = String(format: "%.2e  PlanckPower", conversionValue)
                case "Poncelet":
                    let conversionValue = input * 13.15093
                    resultingValue = String(format: "%.2f  Poncelet", conversionValue)
                case "ExaWatt":
                    let conversionValue = input * 151.15093
                    resultingValue = String(format: "%.2f  ExaWatt", conversionValue)
               
                default:
                    resultingValue = "Invalid Value"
                }
                
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "filterVC") as? filterVC {
                   
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
        filterVC.copieedd = ""
        filterVC.extview = ""
        Volt_Ampere.delegate = ttextfield
        Volt_Ampere.applyShadow()
        dropdownn.applyShadow()
        
    }
    
    @IBAction func share(_ sender: Any) {
        if  dropdownn.text?.isEmpty ?? true ||  Volt_Ampere.text?.isEmpty ?? true  ||
                filterVC.extview?.isEmpty ?? true {
            showAlert(message: " Fill Text Fields ", title: "Alert")
        }
        else  {
          
            let result = filterVC.extview
            let acttivityController = UIActivityViewController(activityItems: ["Volt Ampere :\(Volt_Ampere.text ?? "") ,Result \(result ?? "") "], applicationActivities:nil)
            present(acttivityController, animated: true)
        }
    }
    
    @IBAction func coppy(_ sender: Any) {
        
        if dropdownn.text?.isEmpty ?? true ||  Volt_Ampere.text?.isEmpty ?? true  ||     filterVC.extview?.isEmpty ?? true{
            showAlert(message: "Fill Text Fields", title: "Alert")
        }
        else  {
            vaus()
            
            let combined = "Volt Ampere \(Volt_Ampere_Conversion.Volt_Ampere),Result \(filterVC.extview!) "
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
                    filterVC.extview = ""
                    filterVC.copieedd = ""
                    vc.dismiss(animated: true)
                }
            }
            func showCopiedLabel(message: String) {
                copiedLabel?.removeFromSuperview()
                
                let label = UILabel()
                label.text = message
                label.textColor = UIColor.white
                label.font = UIFont.systemFont(ofSize: 18.0)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(label)
                
                NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: cpybn.topAnchor, constant: -20.0),
                    label.leadingAnchor.constraint(equalTo: cpybn.trailingAnchor, constant: -70.0)
                ])
                
                copiedLabel = label
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 60.0) {
                    label.removeFromSuperview()
                }
            }
        }
        func vaus(){
            let Volt_Ampere = Volt_Ampere.text
            Volt_Ampere_Conversion.Volt_Ampere = Volt_Ampere ?? ""
        }
    }
}
