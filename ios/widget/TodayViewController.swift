//
//  TodayViewController.swift
//  widget
//
//  Created by 신동현 on 2020. 12. 24..
//

import UIKit
import NotificationCenter

struct Shared:Decodable {
  let text: String
  let color: String
}

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var textLabel: UILabel!
    let userDefaults = UserDefaults(suiteName: "group.com.highmaru.corona_today")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.

      do{
      let shared = userDefaults?.string(forKey: "data")
      if(shared != nil){
        let data = try JSONDecoder().decode(Shared.self, from: shared!.data(using: .utf8)!)
        textLabel.text = data.text
      }
    }catch{
      print(error)
    }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
