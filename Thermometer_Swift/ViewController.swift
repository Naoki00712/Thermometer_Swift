//
//  ViewController.swift
//  Thermometer_Swift
//
//  Created by Naoki Matsumoto on 2021/11/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // アプリがロードされた時に実行させたい処理を書きます

        let url: URL = URL(string: "http://ambidata.io/api/v2/channels/42764/data?&readKey=b86f22d78098548d&n=1")!
        let task: URLSessionTask  = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any]
                print(json)
                print("count: \(json.count)")
            }
            catch {
                print(error)
            }
        })
        task.resume()
    }
}

