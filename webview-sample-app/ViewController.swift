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
    @IBOutlet weak var widthLabel: UILabel!

    var width: CGFloat = 200
    var widthConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://granbluefantasy-campaign.mobage.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)
        widthLabel.text = "\(width)"
        widthConstraint = webView.widthAnchor.constraint(equalToConstant: width)
        NSLayoutConstraint.activate([
            widthConstraint!
        ])
    }

    @IBAction func plusDidTap() {
        if view.bounds.size.width > width {
            widthConstraint?.constant += 1
            width += 1
            widthLabel.text = "\(width)"
            webView.layoutIfNeeded()
        }
    }

    @IBAction func plus10DidTap() {
        if view.bounds.size.width > width {
            widthConstraint?.constant += 10
            width += 10
            widthLabel.text = "\(width)"
            webView.layoutIfNeeded()
        }
    }

    @IBAction func minusDidTap() {
        if 142 < width {
            widthConstraint?.constant -= 1
            width -= 1
            widthLabel.text = "\(width)"
            webView.layoutIfNeeded()
        }
    }

    @IBAction func minus10DidTap() {
        if 142 < width {
            widthConstraint?.constant -= 10
            width -= 10
            widthLabel.text = "\(width)"
            webView.layoutIfNeeded()
        }
    }
}

