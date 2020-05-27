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
    @IBOutlet private weak var titleLabel: UILabel!
    @IBAction func tapStartButton(_ sender: UIButton) {
        moviePlayerView.start()
    }
    @IBAction func tapStopButton(_ sender: UIButton) {
        moviePlayerView.stop()
    }
    @IBAction func tapSoundButton(_ sender: UIButton) {
        isSoundMuted = !isSoundMuted
    }
    
    private let movieFilePath = ""
    
    var isSoundMuted = false {
        didSet {
            isSoundMuted ? moviePlayerView.mute() : moviePlayerView.makeSound()
            soundButton.setImage(UIImage(named: isSoundMuted ? "mute" : "megaphone"), for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        moviePlayerView.config(with: URL(string: movieFilePath)!, delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isSoundMuted = true
    }
}

extension ViewController: AdMoviePlayerViewDelegate {
    func didEndMovie() {
        titleLabel.text = "動画終了"
    }
}
