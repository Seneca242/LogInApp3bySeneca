//
//  ImageViewController.swift
//  LogInApp3bySeneca
//
//  Created by Дмитрий Дмитрий on 01.12.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet{
            viewWillLayoutSubviews()
        }
    }
    
    var imageNameTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "imageName")
        title = imageNameTitle
    }
    
    override func viewWillLayoutSubviews() {
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }

}
