//
//  DownloadImageViewController.swift
//  MyFirstApp
//
//  Created by Clara Renauro on 2/14/22.
//

import UIKit

class DownloadImageViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        let imageURL = URL(string: imagesURL[0])!
        URLSession.shared.downloadTask(with: imageURL) {(fileURL, response, error) in
            guard error == nil else
            {
                print(error?.localizedDescription as Any)
                return
            }
            let status = (response as! HTTPURLResponse).statusCode
            print("response.status = \(status)")
            guard status == 200 else
            {
                print(status)
                return
            }
            if let imageURL = fileURL, let imageData = try?Data(contentsOf: imageURL)
            {
                let im = UIImage(data: imageData)
                DispatchQueue.main.async{
                    self.myImageView.image = im
                }
            }
        }.resume()
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
