import UIKit
import WebKit

class DetailRecipWebView: UIViewController, WKNavigationDelegate {
    var webView: WKWebView?
    var urlString = String()

    override func loadView() {
        webView = WKWebView()
        webView?.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: urlString) else {return}
        webView?.load(URLRequest(url: url))
        webView?.allowsBackForwardNavigationGestures = true
    }

}
