//
//  ViewController.swift
//  webview-sample-app
//
//  Created by Fuka Takashima on 2024/05/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://granbluefantasy-campaign.mobage.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)
    }


}

