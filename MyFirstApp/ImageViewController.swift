//
//  ImageViewController.swift
//  MyFirstApp
//
//  Created by Clara Renauro on 2/7/22.
//
 // Operation Queue
import UIKit

let imagesURL = ["https://www.planetware.com/photos-large/N/norway-attractions-sognefjord.jpg", "https://www.planetware.com/photos-large/N/norway-attractions-pulpit-rock.jpg", "https://www.planetware.com/photos-large/N/norway-attractions-tromso.jpg", "https://www.planetware.com/photos-large/N/norway-attractions-lofoten-islands.jpg" ]

class Downloader{
    class func downloadImageWithURL(url: String) -> UIImage{
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)!
        
    }
}

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    var queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func downloadImage(_ sender: Any) {
        
        let operation1 = BlockOperation{
            let img1 = Downloader.downloadImageWithURL(url: imagesURL[0])
                    
                    OperationQueue.main.addOperation {
                        self.imageView1.image = img1
                    }
        }
        let operation2 = BlockOperation{
            let img1 = Downloader.downloadImageWithURL(url: imagesURL[1])
                    
                    OperationQueue.main.addOperation {
                        self.imageView2.image = img1
                    }
        }
        let operation3 = BlockOperation{
            let img1 = Downloader.downloadImageWithURL(url: imagesURL[2])
                    
                    OperationQueue.main.addOperation {
                        self.imageView3.image = img1
                    }
        }
        let operation4 = BlockOperation{
            let img1 = Downloader.downloadImageWithURL(url: imagesURL[3])
                    
                    OperationQueue.main.addOperation {
                        self.imageView4.image = img1
                    }
        }
        
        queue.addOperation (operation1)
                operation1.completionBlock = {
                    self.queue.addOperation(operation2)
                }
                //queue.addOperation (operation2)
                queue.addOperation (operation3)
                operation3.addDependency(operation2)
                queue.addOperation (operation4)
        
    }

    @IBAction func cancelImage(_ sender: Any) {
        
      
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
