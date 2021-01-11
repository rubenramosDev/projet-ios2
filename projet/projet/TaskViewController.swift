
import UIKit
import MapKit
import Foundation

class TaskViewController: UIViewController {
    
    @IBOutlet weak var boutonSave: UIBarButtonItem!
    @IBOutlet weak var boutonCancel: UIBarButtonItem!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchLocalisation: UISwitch!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var customIn: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    
    let dateFormater = DateFormatter()
    
    var task : ToDo?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let task = task {
            labelDate.text = dateFormater.string(from:task.derniereMod)
            if task.localisation != nil {
                switchLocalisation.setOn(true, animated: true)
            }
             mapView.centerToLocation(task.localisation!)
            imageView.image = UIImage(named: task.photo!)
        }
    }

    func textEditingChanged(textField: UITextField){
        if (textField.text != nil){
            boutonSave.isEnabled = true
        } else {
            boutonSave.isEnabled = false
        }
    }
    
    //cancel les modofications
    func cancel (sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //get the location from a MapView
    func getCenterLocation (for mapview: MKMapView) -> CLLocation {
        let coordinates = mapview.centerCoordinate
        return CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    //check if UISwitch is on
    @IBAction func valueSwitchChqnged (_ sender: Any) {
        if switchLocalisation.isOn {
            //on
        } else {
            //off
        }
    }
    
}

    //initialiser le MapView
    extension MKMapView {
       func centerToLocation (
           _ location: CLLocation,
           regionRadius: CLLocationDistance = 100){
           let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
       }
   }



