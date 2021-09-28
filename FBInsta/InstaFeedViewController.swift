//
//  InstaFeedViewController.swift
//  FBInsta
//
//  Created by Asif Habib on 08/09/2021.
//

import UIKit
import WebKit

class InstaFeedViewController: UIViewController, WKUIDelegate , WKNavigationDelegate {

    var isUserLoggedIn : Bool  = false
    var testUserData: InstagramTestUser?
    var feed: Feed?
    
    var cellName = "InstagramCell"

    
    @IBOutlet weak var feedTableview: UITableView!
    
    
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "Instagram Feed"
        InstagramApi.shared.authorizeApp { (url) in
            DispatchQueue.main.async {
                self.setupUI()
                self.webView.load(URLRequest(url: url!))
                self.webView.navigationDelegate =  self            }
        }
        
        
        feedTableview.register(UINib(nibName: cellName, bundle: .main ), forCellReuseIdentifier: cellName)
        feedTableview.estimatedRowHeight = 100
        feedTableview.rowHeight = UITableView.automaticDimension

    }
    
    
  
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let request = navigationAction.request
        InstagramApi.shared.getTestUserIDAndToken(request: request) { (instagramTestUser) in
            self.testUserData = instagramTestUser
            InstagramApi.shared.getMedia(testUserData: instagramTestUser) { feed in
                self.feed = feed
                DispatchQueue.main.async {
                    self.view.sendSubviewToBack(webView)
                    self.view.bringSubviewToFront(self.feedTableview)
                    self.feedTableview.reloadData()
                }
            }
        }
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
    
    func setupUI() {
            self.view.backgroundColor = .white
            self.view.addSubview(webView)
            
            NSLayoutConstraint.activate([
                webView.topAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
            ])
        }

}

extension InstaFeedViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.feed?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! InstagramCell
        cell.cellMedia = self.feed?.data?[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let comedyCell = cell as? InstagramCell {
            comedyCell.avPlayer?.pause()
          }
    }
}
