//
//  AdMoviePlayerView.swift
//  SampleMoviePlayer
//
//  Created by 山田　卓 on 2020/05/27.
//  Copyright © 2020 山田　卓. All rights reserved.
//

import UIKit
import AVFoundation

final class AdMoviePlayerView: UIView {
    
    private var playerItem : AVPlayerItem!
    private var videoPlayer : AVPlayer!
    private var fileUrl: URL!
    private var isConfigured: Bool {
        return videoPlayer != nil && playerItem != nil
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    func config(with movieFileURL: URL) {
        guard !isConfigured else { return }
        let avAsset = AVURLAsset(url: movieFileURL)
        let videoPlayerView = AVPlayerView(frame: bounds)
        let movieLayer = videoPlayerView.layer as! AVPlayerLayer
        
        playerItem = AVPlayerItem(asset: avAsset)
        videoPlayer = AVPlayer(playerItem: playerItem)
        
        movieLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        movieLayer.player = videoPlayer
        layer.addSublayer(movieLayer)
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
