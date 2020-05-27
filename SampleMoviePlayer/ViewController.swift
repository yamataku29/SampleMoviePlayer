//
//  ViewController.swift
//  SampleMoviePlayer
//
//  Created by 山田　卓 on 2020/05/26.
//  Copyright © 2020 山田　卓. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var moviePlayerView: AdMoviePlayerView!
    @IBOutlet private weak var soundButton: UIButton!
    @IBAction func tapStartButton(_ sender: UIButton) {
        moviePlayerView.start()
    }
    @IBAction func tapStopButton(_ sender: UIButton) {
        moviePlayerView.stop()
    }
    @IBAction func tapSoundButton(_ sender: UIButton) {
        isSoundMuted = !isSoundMuted
    }
    
    var isSoundMuted = false {
        didSet {
            isSoundMuted ? moviePlayerView.mute() : moviePlayerView.makeSound()
            soundButton.setImage(UIImage(named: isSoundMuted ? "mute" : "megaphone"), for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        moviePlayerView.config(with: URL(string: "https://initinctest.s3-ap-northeast-1.amazonaws.com/test.mp4")!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isSoundMuted = true
    }
}
