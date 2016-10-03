//
//  ViewController.swift
//  What's the Weather?
//
//  Created by Salomon Pluviose on 10/3/16.
//  Copyright © 2016 Salomon Pluviose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBAction func seachButton(_ sender: AnyObject) {
        var userEntered = cityTextField.text
        
        if (userEntered?.contains(" "))! {
          userEntered = userEntered?.replacingOccurrences(of: " ", with: "-")
        }
        
        if let url = URL(string: "http://www.weather-forecast.com/locations/\(userEntered!)/forecasts/latest") {
            do {
                let contents = try String(contentsOf: url, encoding: .ascii)
//                print(contents)
                
                let needContent = contents
                
                let parsedContent = needContent.components(separatedBy: "<p class=\"summary\">")
                
                let p = parsedContent[1]
//                print(p[p.startIndex])
                
                let answer = NSString(string: p)
                
                let pContent = answer.substring(to: 378)
                print(pContent)
                
                webview.loadHTMLString(pContent, baseURL: nil)
                
            } catch {
                responseLabel.text = "The weather for that city couldn't be found. Try again"
            }
        } else {
            print("bad url")
            print("http://www.weather-forecast.com/locations/\(userEntered!)/forecasts/latest")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

