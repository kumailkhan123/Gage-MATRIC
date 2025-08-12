

import UIKit

class Microcurie_Conversion:UIViewController {
    @IBOutlet weak var dropdownn: DropDown!
  
    var copiedLabel:UILabel?
    let ttextfield = TextFieldDelegate()
    static var  Millicurie = ""
    @IBOutlet weak var cpybn: UIButton!
    @IBOutlet weak var  Millicurie: PlaceholderTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropdownn.optionArray = [
            "Becquerel (Bq)",
            "Kilobecquerel (kBq)",
            "Megabecquerel (MBq)",
            "Gigabecquerel (GBq)",
            "Terabecquerel (TBq)",
            "Rutherford (Rd)",
            "Nanocurie (nCi)",
            "Picocurie (pCi)",
            "Teracurie (TCi)",
            "Gigacurie (GCi)",
            "Kilocurie (kCi)"
        ]
        
        dropdownn.arrow.isHidden = true
        textfieldd()
        HideKeyboardOnTap()
        
    }
    
    @IBAction func clearall(_ sender: Any) {
        
        Millicurie.text = ""
        Millicurie.textFieldDidChange()
        dropdownn.text = ""
       
    }
    @IBAction func converttt(_ sender: Any) {
        if dropdownn.text?.isEmpty ?? true ||  Millicurie.text?.isEmpty ?? true {
                   showAlert(message: "Fill Text Fields", title: "Alert")
               } else {
                   if let  Millicurie =  Millicurie.text,
                      let input = Double( Millicurie),
                      let selectedIndex = dropdownn.optionArray.firstIndex(of: dropdownn.text!) {
                       
                       var resultValue = ""
                       
                       switch selectedIndex {
                       case 0:
                           let conversionValue = input * 3.7e10
                           resultValue = String(format: "%.2e Bq", conversionValue)
                       case 1:
                           let conversionValue = input * 3.7e7
                           resultValue = String(format: "%.2e kBq", conversionValue)
                       case 2:
                           let conversionValue = input * 3.7e4
                           resultValue = String(format: "%.2e MBq", conversionValue)
                       case 3:
                           let conversionValue = input * 37
                           resultValue = String(format: "%.2f GBq", conversionValue)
                       case 4:
                           let conversionValue = input * 0.037
                           resultValue = String(format: "%.2f TBq", conversionValue)
                       case 5:
                           let conversionValue = input * 3.7e4
                           resultValue = String(format: "%.2e Rd", conversionValue)
                       case 6:
                           let conversionValue = input * 1e9
                           resultValue = String(format: "%.2e nCi", conversionValue)
                       case 7:
                           let conversionValue = input * 1e12
                           resultValue = String(format: "%.2e pCi", conversionValue)
                       case 8:
                           let conversionValue = input * 1e-12
                           resultValue = String(format: "%.2E TCi", conversionValue)
                       case 9:
                           let conversionValue = input * 1e-9
                           resultValue = String(format: "%.2E GCi", conversionValue)
                       case 10:
                           let conversionValue = input * 1e-6
                           resultValue = String(format: "%.2E kCi", conversionValue)
                       default:
                           resultValue = "Invalid Value"
                       }
                       
                       filterVC.extview = resultValue
                
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "filterVC") as? filterVC {
                   
                    filterVC.extview = resultValue
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
        Millicurie.delegate = ttextfield
        Millicurie.applyShadow()
        dropdownn.applyShadow()
        
    }
    
    @IBAction func share(_ sender: Any) {
        if  dropdownn.text?.isEmpty ?? true ||   Millicurie.text?.isEmpty ?? true  ||
                filterVC.extview?.isEmpty ?? true {
            showAlert(message: " Fill Text Fields ", title: "Alert")
        }
        else  {
          
            let result = filterVC.extview
            let acttivityController = UIActivityViewController(activityItems: ["Millicurie :\( Millicurie.text ?? "") ,Result \(result ?? "") "], applicationActivities:nil)
            present(acttivityController, animated: true)
        }
    }
    
    @IBAction func coppy(_ sender: Any) {
        
        if dropdownn.text?.isEmpty ?? true ||   Millicurie.text?.isEmpty ?? true  ||     filterVC.extview?.isEmpty ?? true{
            showAlert(message: "Fill Text Fields", title: "Alert")
        }
        else  {
            vaus()
            
            let combined = "Millicurie \(Microcurie_Conversion.Millicurie),Result \(filterVC.extview!) "
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
                label.font = UIFont.systemFont(ofSize: 18.0)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(label)
                
                NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: cpybn.topAnchor, constant: -20.0),
                    label.leadingAnchor.constraint(equalTo: cpybn.trailingAnchor, constant: -70.0)
                ])
                
                copiedLabel = label
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                    label.removeFromSuperview()
                }
        }
        func vaus(){
            let  Millicurie =  Millicurie.text
            Microcurie_Conversion.Millicurie =  Millicurie ?? ""
        }
    }
}
