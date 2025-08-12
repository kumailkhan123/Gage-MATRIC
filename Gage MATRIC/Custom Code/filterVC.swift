import UIKit

class filterVC: UIViewController {
    @IBOutlet weak var valscpied1: UITextField!
    @IBOutlet weak var resultt: UITextField!
    static var extview: String?
    static var copieedd: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    private func updateUI() {
        valscpied1.text = filterVC.extview
        resultt.text = filterVC.copieedd
        valscpied1.applyShadow()
        resultt.applyShadow()
        
    }
    func hideResultTextField() {
        if let resultTextField = valscpied1 {
            resultTextField.isHidden = true
        } else {
            print("Result is nil")
        }
    }
    func hidecopied(){
        if let  copieedtextfield = resultt{
            copieedtextfield.isHidden = true
            
        }
        else{
            print("Copied nill")
        }
    }
  
}
