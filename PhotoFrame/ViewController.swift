//
//  ViewController.swift
//  PhotoFrame
//
//  Created by William Dedominico on 10/4/22.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer!
    
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var image: UIImageView!
    var moved = false
    var index = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    @objc func update(){
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = UIColor.random();
            if self.moved {
                self.imageView.transform = CGAffineTransform(translationX: 0, y: -200);
                self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1);
                self.moved = false;
            }
            else{
                self.imageView.transform = CGAffineTransform(translationX: 0, y: 200);
                self.imageView.transform = CGAffineTransform(scaleX: -1, y: -1);
                self.moved = true;
            }
        }
    }
    
    @IBAction func onButtonTapped(_ sender: Any) {
        image.image = UIImage(named: "image\(index)")
        if index >= 6 {
            index = 1;
        }
        else{
            index += 1;
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1
        )
    }
}
