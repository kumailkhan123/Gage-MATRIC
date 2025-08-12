
import UIKit

class Table: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    @IBAction func feeet(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Feet__Conversion")as! Feet__Conversion
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func micrr(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Microcurie_Conversion")as! Microcurie_Conversion
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func vol(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Volt_Ampere_Conversion")as! Volt_Ampere_Conversion
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func exa(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Exabytes_Conversion")as! Exabytes_Conversion
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func meg(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Megamaxwell_Conversion")as! Megamaxwell_Conversion
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func lea(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Leap_Years_Conversion")as! Leap_Years_Conversion
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
