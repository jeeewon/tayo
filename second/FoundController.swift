//
//  FoundController.swift
//  second
//
//  Created by 정효주 on 2021/03/14.
//

import UIKit
import CoreLocation
import CoreBluetooth

class FoundController: UIViewController, CLLocationManagerDelegate{
    @IBOutlet weak var beaconDistance: UILabel!
    @IBOutlet weak var findLabel: UILabel!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func touchButton(_ sender: Any) {
        self.performSegue(withIdentifier: "Reservation", sender: nil)
    }
    var locationManager:CLLocationManager!
    var beaconProximity: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager.init()    //locationManager 초기화
        locationManager.delegate = self               //delegate 넣어줌
        locationManager.requestAlwaysAuthorization()  //위치 권한 받아옴
        locationManager.startUpdatingLocation()       //위치 업데이트 시작
        locationManager.allowsBackgroundLocationUpdates = false    //Background에서도 위치체크할지에 대한 여부 (필요없어서 false함)
        locationManager.pausesLocationUpdatesAutomatically = false //Background에서 멈추지 않고 돈다
    }
    
    //위치서비스에 대한 권한 받아들여지면 monitorBeacons() 함수 호출
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        if status == .authorizedAlways{
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                    if CLLocationManager.isRangingAvailable() {
                        startScanning()
                    }
            }
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "74278bda-b644-4520-8f0c-720eaf059935")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 40001, minor: 44348, identifier: "MyBeacon")

        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
   // func monitorBeacons(){
   //     if let uuid = UUID(uuidString: "74278bda-b644-4520-8f0c-720eaf059935") {
   //         let beaconRegion = CLBeaconRegion(
   //             proximityUUID: uuid, major: 40001,
   //             minor: 44348,
   //             identifier: "MiniBeacon_44348"
   //         )
   //         locationManager.startRangingBeacons(in: beaconRegion)
   //         print("startRangingBeacons")
   //     }
   //     else{
   //         print("CLLocation Monitoring is unavailable")
   //     }
   // }
    
    
    // 모니터링이 실행된 후 영역의 판단이 이루어지는 순간에 이 메소드가 실행
   // func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
   //     if region is CLBeaconRegion{
   //         print("DID ENTER")
   //     }
   // }
       
   // func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
   //     if let beaconRegion = region as? CLBeaconRegion{
   //         print("DID EXIT")
   //     }
   // }
    
   // func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion){
   //     print("startRangingBeacons")
   //     for beacon in beacons { // 연결할 수 있는 비콘이 있는 경우
   //         switch(beacon.proximity){
   //         case CLProximity.unknown :   beaconProximity = "Unknown";
   //         case CLProximity.far :       beaconProximity = "Far";
   //         case CLProximity.near :      beaconProximity = "Near";
   //         case CLProximity.immediate : beaconProximity = "Immediate"
   //         }
            //self.beaconDistance.text = beaconProximity
   //         print("proximity: \(beaconProximity)")
   //     }
   // }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            updateDistance(beacons[0].proximity)
        } else {
            updateDistance(.unknown)
        }
    }

    func updateDistance(_ distance: CLProximity) {
        UIView.animate(withDuration: 0.8) {
            switch distance {
            case .unknown:
                self.view.backgroundColor = UIColor.gray

            case .far:
                self.view.backgroundColor = UIColor.blue

            case .near:
                self.view.backgroundColor = UIColor.orange

            case .immediate:
                self.view.backgroundColor = UIColor.red
            }
        }
    }
}
