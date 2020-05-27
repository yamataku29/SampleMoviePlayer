//
//  AdMoviePlayerView.swift
//  SampleMoviePlayer
//
//  Created by 山田　卓 on 2020/05/27.
//  Copyright © 2020 山田　卓. All rights reserved.
//

import UIKit
import AVFoundation

protocol AdMoviePlayerViewDelegate: class {
    func didEndMovie()
}

final class AdMoviePlayerView: UIView {
    
    private var playerItem : AVPlayerItem!
    private var videoPlayer : AVPlayer!
    private var fileUrl: URL!
    private weak var delegate: AdMoviePlayerViewDelegate?
    private var isConfigured: Bool {
        return videoPlayer != nil && playerItem != nil
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    func config(with movieFileURL: URL, delegate: AdMoviePlayerViewDelegate) {
        guard !isConfigured else { return }
        self.delegate = delegate
        
        let avAsset = AVURLAsset(url: movieFileURL)
        let videoPlayerView = AVPlayerView(frame: bounds)
        let movieLayer = videoPlayerView.layer as! AVPlayerLayer
        
        playerItem = AVPlayerItem(asset: avAsset)
        videoPlayer = AVPlayer(playerItem: playerItem)
        
        movieLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        movieLayer.player = videoPlayer
        layer.addSublayer(movieLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.endPlaying), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
    }
    
    func stop() {
        videoPlayer.pause()
    }
    
    func start() {
        videoPlayer.play()
    }
    
    func mute() {
        videoPlayer.volume = 0
    }
    
    func makeSound() {
        videoPlayer.volume = 1
    }
    
    @objc private func endPlaying() {
        delegate?.didEndMovie()
    }
}

private final class AVPlayerView: UIView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}
