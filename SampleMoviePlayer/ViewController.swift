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
    @IBAction func tapStartButton(_ sender: UIButton) {
        moviePlayerView.start()
    }
    @IBAction func tapStopButton(_ sender: UIButton) {
        moviePlayerView.stop()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        moviePlayerView.config(with: URL(string: "https://initinctest.s3-ap-northeast-1.amazonaws.com/test.mp4")!)
    }
}
