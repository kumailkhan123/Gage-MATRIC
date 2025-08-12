

import UIKit

class Megamaxwell_Conversion: UIViewController {
    
    @IBOutlet weak var dropdownn: DropDown!
    var copiedLabel:UILabel?
    let ttextfield = TextFieldDelegate()
    static var  Megamaxwell = ""

    @IBOutlet weak var cpybn: UIButton!
    @IBOutlet weak var Megamaxwell : PlaceholderTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropdownn.optionArray = [
            "Weber (Wb)",
            "Milliweber (mWb)",
            "Microweber (µWb)",
            "Volt-Second (Vs)",
            "Kiloline (kL)",
            "Line (L)",
            "Micromaxwell (µMx)",
            "Nanomaxwell (nMx)",
            "Picoweber (pWb)",
            "FemtoWeber (fWb)",
            "Kilomaxwell (kMx)"
        ]
        dropdownn.arrow.isHidden = true
        textfieldd()
        HideKeyboardOnTap()
    }
    
    @IBAction func clearall(_ sender: Any) {
        
        Megamaxwell.text = ""
        Megamaxwell.textFieldDidChange()
        dropdownn.text = ""
        
    }
    @IBAction func converttt(_ sender: Any) {
        if dropdownn.text?.isEmpty ?? true || Megamaxwell.text?.isEmpty ?? true {
                showAlert(message: "Fill Text Fields", title: "Alert")
            } else {
                if let Megamaxwell = Megamaxwell.text,
                   let input = Double(Megamaxwell) {
                    
                    let index = dropdownn.optionArray.firstIndex(of: dropdownn.text!)
                    var resultingValue = ""
                    
                    switch index {
                    case 0:
                        let conversionValue = input * 1e-8
                        resultingValue = String(format: "%.2e Wb", conversionValue)
                    case 1:
                        let conversionValue = input * 1e-5
                        resultingValue = String(format: "%.2e mWb", conversionValue)
                    case 2:
                        let conversionValue = input * 0.01
                        resultingValue = String(format: "%.2f µWb", conversionValue)
                    case 3:
                        let conversionValue = input * 1e-8
                        resultingValue = String(format: "%.2e Vs", conversionValue)
                    case 4:
                        let conversionValue = input * 1e-5
                        resultingValue = String(format: "%.2e kL", conversionValue)
                    case 5:
                        let conversionValue = input * 1e8
                        resultingValue = String(format: "%.2e L", conversionValue)
                    case 6:
                        let conversionValue = input * 1e6
                        resultingValue = String(format: "%.2e µMx", conversionValue)
                    case 7:
                        let conversionValue = input * 1e9
                        resultingValue = String(format: "%.2e nMx", conversionValue)
                    case 8:
                        let conversionValue = input * 1e-2
                        resultingValue = String(format: "%.2e pWb", conversionValue)
                    case 9:
                        let conversionValue = input * 1e-5
                        resultingValue = String(format: "%.2e fWb", conversionValue)
                    case 10:
                        let conversionValue = input * 1e-3
                        resultingValue = String(format: "%.2f kMx", conversionValue)
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
    func textfieldd(){
        
        Megamaxwell.delegate = ttextfield
        Megamaxwell.applyShadow()
        dropdownn.applyShadow()
        
    }
    
    @IBAction func share(_ sender: Any) {
        if  dropdownn.text?.isEmpty ?? true ||  Megamaxwell.text?.isEmpty ?? true || filterVC.extview?.isEmpty ?? true {
            showAlert(message: " Fill Text Fields ", title: "Alert")
        }
        else  {
            let resultText = filterVC.extview
            
            let acttivityController = UIActivityViewController(activityItems: ["Megamaxwell :\(Megamaxwell_Conversion.Megamaxwell) ,Result \(resultText ?? "") "], applicationActivities:nil)
            present(acttivityController, animated: true)
            
        }
    }
    
    @IBAction func coppy(_ sender: Any) {
        
        if dropdownn.text?.isEmpty ?? true ||  Megamaxwell.text?.isEmpty ?? true || filterVC.extview?.isEmpty ?? true {
            showAlert(message: "Fill Text Fields", title: "Alert")
        }
        else  {
            vaus()
            let combined = "Megamaxwell \(Megamaxwell_Conversion.Megamaxwell),Result \(filterVC.extview!) "
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
            let  Megamaxwell =  Megamaxwell.text
            Megamaxwell_Conversion.Megamaxwell =  Megamaxwell ?? ""
        }
}
