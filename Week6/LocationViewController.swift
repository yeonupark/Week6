//
//  LocationViewController.swift
//  Week6
//
//  Created by 마르 on 2023/08/22.
//

import UIKit
import CoreLocation // 1. 위치 임포트

class LocationViewController: UIViewController {

    // 2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        // 3. 위치 프로토콜 연결
        locationManager.delegate = self
        
        checkDeviceLocationAutorization()
    }
    
    func checkDeviceLocationAutorization() {
        
        // iOS 위치 서비스 활성화 체크
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                // 현재 사용자의 위치 권한 상태를 가지고 옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                self.checkCurrentLocationAuthorization(status: authorization)
                
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청 못합니다")
            }
        }
    }

    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization() // 얼럿 띄우는 역할 // info.plist에서 설정한 것과 일치시켜줘야함
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        }
    }
}

// 4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    // 5. 사용자의 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("===",locations)
    }
    
    // 6. 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치가져오는데실패함")
    }
    
    // 사용자의 권한 상태가 바뀔 때를 알려줌 ( iOS14 이상)
    // 거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했건
    // 허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAutorization()
    }
    
    // 사용자의 권한 상태가 바뀔 때를 알려줌 ( iOS14 미만)
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}
