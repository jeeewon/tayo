//
//  YesController.swift
//  second
//
//  Created by 정효주 on 2021/03/14.
//

import UIKit
import CoreLocation

class YesController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var accept: UILabel!
    @IBOutlet weak var busStop: UILabel!
    @IBAction func keep(_ sender: Any) {
        self.performSegue(withIdentifier: "Found", sender: nil)
    }
    
    var locationManager:CLLocationManager!
    var latitude: Double?
    var longtitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //포그라운드 상태에서 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        //최적정확도-배터리
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //위치업데이트
        locationManager.startUpdatingLocation()
        //위도 경도 불러오기
        let coor = locationManager.location?.coordinate
        latitude = coor?.latitude
        longtitude = coor?.longitude
        
        
        ODsayService.sharedInst().setApiKey("XL7MO8NqL9HQNUz1SseMrg")    //SDK 인증
        ODsayService.sharedInst().setTimeout(5000)//통신 타임아웃 설정
        ODsayService.sharedInst().requestPointSearch(126.96161448636293, y: 37.53938947997525, radius: 50, stationClass: "1") { (retCode:Int32, resultDic:[AnyHashable : Any]?) in
            if retCode == 200 {
                let resultText = self.mDictToTextJson(rMDic:resultDic)
                var resultArr = [String]()
                                
                for i in resultText{
                    resultArr = resultText.components(separatedBy: "\n")
                }
                var resultStr = resultArr[9]
                               
                var realArr = resultStr.components(separatedBy: "\"")
                                
                self.busStop.text = realArr[1]
                                
                var resultId = resultArr[13]
                var realId = resultId.components(separatedBy: "\"")
                                
                }
            else {
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mDictToTextJson(rMDic:[AnyHashable : Any]?) -> String {
        if let sText = rMDic?.description {
            if let bytes = sText.cString(using: String.Encoding.ascii) {
                return String(cString: bytes, encoding: String.Encoding.nonLossyASCII)!
            } else {
                return "No Data is Displayed"
            }
            } else {
                return "No Data is Displayed"
            }
    }

}
