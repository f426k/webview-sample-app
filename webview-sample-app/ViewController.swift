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
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!

    var width: CGFloat = 200
    var widthConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://granbluefantasy-campaign.mobage.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)

        widthConstraint = webView.widthAnchor.constraint(equalToConstant: width)
        NSLayoutConstraint.activate([
            widthConstraint!
        ])
    }

    @IBAction func plusDidTap() {
        if view.bounds.size.width > width {
            widthConstraint?.constant += 1
            width += 1
            webView.layoutIfNeeded()
        }
    }

    @IBAction func minusDidTap() {
        if 142 < width {
            widthConstraint?.constant -= 1
            width -= 1
            webView.layoutIfNeeded()
        }
    }
}

