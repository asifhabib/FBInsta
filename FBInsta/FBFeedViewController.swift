//
//  FBFeedViewController.swift
//  FBInsta
//
//  Created by Asif Habib on 08/09/2021.
//

import UIKit
import FBSDKCoreKit
import SDWebImage


struct Paging : Codable {
    let previous : String?
    let next : String?
}

struct FBFeedItem : Codable {
    let full_picture : String?
    let id : String?
//    ": "https://scontent.flhe15-1.fna.fbcdn.net/v/t1.6435-9/241502320_4264165526983084_793203289615585546_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=110474&_nc_eui2=AeHnA7W7y6XzTH9reUpJFu1kP4ms36y8q8c_iazfrLyrx14bkZukT7VFsNjAn6eJUp4&_nc_ohc=Y-XBTYGs1qoAX_rf1Bb&_nc_ht=scontent.flhe15-1.fna&edm=AP4hL3IEAAAA&oh=3d7df046f5c86978696c4ef7648d9dcb&oe=616953F2",
//    "id":
}


struct PostsData : Codable {
    var data : [FBFeedItem]?
    let paging : Paging?
}

struct FBFeedResponse : Codable {
    
    let id : String?
    var posts : PostsData?
    
}




class FBFeedViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    var cellName = "FBFeedCell"
    var response : FBFeedResponse?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellName, bundle: .main ), forCellReuseIdentifier: cellName)
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableView.automaticDimension
        fetchFBFeed()

        // Do any additional setup after loading the view.
    }
//    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
//        initWithGraphPath:@"/me"
//               parameters:@{ @"fields": @"id,posts{caption,full_picture,source}",}
//               HTTPMethod:@"GET"];
//    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//        // Insert your code here
//    }];
    func fetchFBFeed(){
        let request = GraphRequest(graphPath: "/me", parameters: ["fields":"id,posts{caption,full_picture,source}"], tokenString: "EAAFYZAugEJEABALuXZA4RnnP7oyP5e41m616WdoRP1YsCoMi7OBFVgKMEBUi6wQuHJBkWwKZA3IQZAtJnwVHXcfIax9b31o3KtK3bHvVKhxnCC5mqq3is8wn0FZCElynODyQDwQ760x9LTXHxT3MTM8xqqTSZAz70ZBPe9AKmB7LLjSOieGOKFp6Hkb0o7uyeBXZC3OZATj4vcsHtTlAaevPZCjZA1PCciMYZAuWfQKkNwwHWZARvf91VOraphZBUtoSwh8NMZD", version: nil, httpMethod: .get)
        request.start { connection, result, error in
            if let error = error {
                print("Requst Error :\(error)")
            }
            else {
                
            }
            let jsonData = try? JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
            
            let feed = try? JSONDecoder().decode(FBFeedResponse.self, from: jsonData!)
            self.processResponse(response: feed!)
            
            print("Feed :\(feed)")
            
            
        }
    }
    
    
    
    func processResponse(response : FBFeedResponse) {
        
        var response = response
        
        response.posts?.data?.removeAll(where: { item in
            item.full_picture == nil
        })
        
        self.response = response
        tableView.reloadData()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FBFeedViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.posts?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! FBFeedCell
        let item = response?.posts?.data?[indexPath.row]
        
        
        
        cell.feedImage.sd_setImage(with: URL(string: (item?.full_picture)!))
        return cell
        
    }
}


//class ViewController: UIViewController {
//
//    @IBOutlet weak var btn_login : UIButton!
//    @IBOutlet weak var btn_fetchFeed : UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupFacebook()
//
//        // Do any additional setup after loading the view.
//    }
//
//    func setupFacebook(){
//        if !isLoggedIn() {
//            btn_login.setTitle("Login Facebook", for: .normal)
//            return
//        }
//        btn_login.setTitle("Logout Facebook", for: .normal)
//        proceedWithGraphRequest()
//
//    }
//    func isLoggedIn() -> Bool {
//        if let token = AccessToken.current,
//           token.isExpired == false {
//            return true
//        }
//        return false
//    }
//
//    @IBAction func onClick_login(_ sender : Any){
//        if isLoggedIn() {
//            LoginManager().logOut()
//            AccessToken.current = nil
//            return
//        }
//
//        LoginManager().logIn(permissions: ["email","public_profile","user_posts"], from: self) { [weak self] (result, error) in
//            if let error = error {
//                print("Login Failed with Error :\(error)")
//            }
//            else {
//                self?.proceedWithGraphRequest()
//            }
//        }
//
//
//
//    }
//    func proceedWithGraphRequest(){
//        let request = GraphRequest(graphPath: "/me", parameters: ["fields": "id,name,email,posts"], httpMethod: .get)
//
//        request.start { (connection, result, error) in
//            if let error = error {
//                print("GraphRequest Error :\(error)")
//            }
//            else {
//                print("Response :\(result)")
//            }
//        }
//
//
//    }
//    @IBAction func onClick_fetchFeed(_ sender : Any){
//
//    }
//}
