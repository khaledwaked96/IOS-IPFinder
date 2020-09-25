//
//  ViewController.swift
//  ipFinder
//
//  Created by macintosh on 9/23/20.
//  Copyright © 2020 macintosh. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var labelFlag: UILabel!
    @IBOutlet weak var textSearch: UITextField!
    @IBOutlet weak var mapLocation: MKMapView!
    @IBOutlet weak var ipaddress: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var content: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
    }
    
    

    
    func getData(ip:String){
        
       /*
         https://ipstack.com/documentation
         */
        
  let request = AF.request("http://api.ipstack.com/\(ip)?access_key=9a89369c6741eaaf4eb703b87e1d8d11", method: .get)
       
                 request.responseJSON {(response) in
                
                      switch response.result {
                      case .success(let value):
                        
                    let jsonData = JSON(value)
                    
                    
var data = Data(type: jsonData["type"].string ?? "", ipAddress: jsonData["ip"].string ?? "", country: jsonData["country_name"].string ?? "", countryCode: jsonData["country_code"].string ?? "", region: jsonData["region_name"].string ?? "", city: jsonData["city"].string ?? "", latitude: jsonData["latitude"].double ?? 0.0, longitude: jsonData["longitude"].double ?? 0.0,flag:jsonData["country_flag_emoji"].string ?? "",content:jsonData["continent_name"].string ?? ""  )

                self.type.text = data.type
                self.ipaddress.text = data.ipAddress
                self.country.text = data.country
                self.countryCode.text = data.countryCode
                self.city.text =  data.city
                self.region.text = data.region
                self.latitude.text  = String(data.latitude!)
                self.longitude.text = String(data.longitude!)
                self.content.text = data.content
                self.labelFlag.text = data.flag
  
                    
                    
                    
            let location = CLLocationCoordinate2D(latitude: data.latitude ?? 0.0,  longitude: data.longitude ?? 0.0)
              
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            self.mapLocation.setRegion(region, animated: true)
                      
            let annotation = MKPointAnnotation()
                annotation.coordinate = location
                    annotation.title = data.city
              
                    self.mapLocation.addAnnotation(annotation)
                        
                        
                        
                          case .failure(let error):
                              print("Error: \(error.localizedDescription)")
                    }
           }
    }
    
    @IBAction func searchButton(_ sender: Any) {
        getData(ip: textSearch.text!)
 
                  
        
    }
    
    
    
    
    
}

