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
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(with movieFileURL: URL) {
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
