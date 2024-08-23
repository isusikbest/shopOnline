//
//  Launch.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 01/08/2024.
//

import UIKit
import Lottie
import SnapKit

class LaunchViewController: UIViewController {
    
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        animationView = .init(name: "animation")
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .loop
        view.addSubview(animationView!)
        animationView?.play()
        animationView?.snp.makeConstraints({
            $0.width.height.equalTo(UIScreen.main.bounds.width)
            $0.centerX.centerY.equalToSuperview()
        })
    }
}
