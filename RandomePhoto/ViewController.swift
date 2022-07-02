//
//  ViewController.swift
//  RandomePhoto
//
//  Created by Vikas Surera on 02/07/22.
//

import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Random Image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        
        return button
    }()
    
    let colors:[UIColor] = [
        .systemPink,
        .systemBlue,
        .systemPurple,
        .systemYellow,
        .systemOrange
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.center = view.center
        getRandomPhoto()
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 120 - view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
        )
    }

    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else{
            return
        }
                
        imageView.image = UIImage(data: data)
    }
}

