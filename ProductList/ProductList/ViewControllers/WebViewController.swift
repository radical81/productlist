//
//  WebViewController.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 20/3/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {

  var webView: WKWebView!
  var target: URL?
  
  override func loadView() {
    let webConfiguration = WKWebViewConfiguration()
    webView = WKWebView(frame: .zero, configuration: webConfiguration)
    webView.uiDelegate = self
    view = webView
  }
  override func viewDidLoad() {
    super.viewDidLoad()
        
    let myRequest = URLRequest(url: target!)
    webView.load(myRequest)
  }
}
