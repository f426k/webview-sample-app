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
    @IBOutlet weak var floatingButton: UIButton!

    var width: CGFloat = 300
    var widthConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: URL(string: "https://www.apple.com/")!)
        webView.load(request)
        webView.isInspectable = true
        widthLabel.text = "\(width)"
        floatingButton.layer.cornerRadius = 25
        floatingButton.clipsToBounds = true
        widthConstraint = webView.widthAnchor.constraint(equalToConstant: width)
        NSLayoutConstraint.activate([
            widthConstraint!
        ])
    }

    @IBAction func inputUrlAlert() {
        let alertController = UIAlertController(
            title:"Enter URL",
            message:"Enter the URL to open in WebView.",
            preferredStyle: UIAlertController.Style.alert
        )
        alertController.addTextField()
        let openButton = UIAlertAction(title: "Open", style: UIAlertAction.Style.default) {(action:UIAlertAction) in
            if let textField = alertController.textFields?.first {
                guard let url = URL(string: textField.text!) else {
                    // invalid url
                    return
                }
                self.webView.load(URLRequest(url: url))
            }
        }
        alertController.addAction(openButton)

        let cancelButton = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler:nil)
        alertController.addAction(cancelButton)

        present(alertController, animated:true, completion: nil)

    }

    @IBAction func plusDidTap() {
        if view.bounds.size.width > width {
            widthConstraint?.constant += 1
            width += 1
            widthLabel.text = "\(width)"
            webView.layoutIfNeeded()
        }
    }

    @IBAction func plusHalfDidTap() {
        if view.bounds.size.width > width {
            widthConstraint?.constant += 0.5
            width += 0.5
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
        if 300 < width {
            widthConstraint?.constant -= 1
            width -= 1
            widthLabel.text = "\(width)"
            webView.layoutIfNeeded()
        }
    }

    @IBAction func minusHalfDidTap() {
        if 300 < width {
            widthConstraint?.constant -= 0.5
            width -= 0.5
            widthLabel.text = "\(width)"
            webView.layoutIfNeeded()
        }
    }

    @IBAction func minus10DidTap() {
        if 300 < width {
            widthConstraint?.constant -= 10
            width -= 10
            widthLabel.text = "\(width)"
            webView.layoutIfNeeded()
        }
    }
}

