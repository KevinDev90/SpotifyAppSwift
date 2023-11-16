//
//  PlaybackPresenter.shared.swift
//  SpotifyApp
//
//  Created by Kevin Guzman on 4/10/23.
//
import AVFoundation
import Foundation
import UIKit

protocol PlayerDataSource: AnyObject {
    var songName: String? {get}
    var subtitle: String? {get}
    var imageURL: URL? {get}
}

final class PlaybackPresenter {
    static let shared = PlaybackPresenter()
    
    private var track: AudioTrack?
    private var tracks = [AudioTrack]()
    
    var index = 0
    
    var currentTrack: AudioTrack? {
        if let track = track, tracks.isEmpty {
            return track
        } else if let player = self.playerQueue, !tracks.isEmpty {
            let item = player.currentItem
            let items = player.items()
            guard let _ = items.firstIndex(where: {$0 == item}) else {
                return tracks[index]
            }
            return nil
        }
        return nil
    }
    
    var player: AVPlayer?
    var playerQueue: AVQueuePlayer?
    var playerVC: PlayerViewController?
    
    func startPlayback(
        from viewController: UIViewController,
        track: AudioTrack){
            guard let url = URL(string: track.preview_url ?? "") else {
                return
            }
            player = AVPlayer(url: url)
            player?.volume = 0.5
            
            self.track = track
            self.tracks = []
            let vc = PlayerViewController()
            vc.title = track.name
            vc.dataSource = self
            vc.delegate = self
            
            viewController.present(UINavigationController(rootViewController: vc), animated: true) {
                self.player?.play()
            }
            self.playerVC = vc
        }
    
    func startPlayback(
        from viewController: UIViewController,
        tracks: [AudioTrack]){
            
            self.tracks = tracks
            self.track = nil
            
            self.playerQueue = AVQueuePlayer(items: tracks.compactMap({
                guard let url = URL(string: $0.preview_url ?? "") else {
                    return nil
                }
                return AVPlayerItem(url: url)
            }))
            self.playerQueue?.volume = 0
            self.playerQueue?.play()
            
            let vc = PlayerViewController()
            
            vc.dataSource = self
            vc.delegate = self

            viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            self.playerVC = vc
        }
}

extension PlaybackPresenter: PlayerDataSource, PlayerViewControllerDelegate  {
    func didSlideSlider(_ value: Float) {
        player?.volume = value
    }
    
    func didTapPlayPause() {
        if let player = player {
            if player.timeControlStatus == .playing {
                player.pause()
            } else if player.timeControlStatus == .paused {
                player.play()
            }
        } else if let player = playerQueue {
            if player.timeControlStatus == .playing {
                player.pause()
            } else if player.timeControlStatus == .paused {
                player.play()
            }
        }
    }
    
    func didTapNext() {
        print("entreee")
        if tracks.isEmpty {
            // not playlist or album
//            player?.pause()
        } else if let player = playerQueue {
            player.advanceToNextItem()
            index += 1
            print(index)
            playerVC?.refreshUI()
        }
    }
    
    func didTapBack() {
        if tracks.isEmpty {
            // not playlist or album
            player?.pause()
            player?.play()
        } else if let firstPlayer = playerQueue?.items().first {
            playerQueue?.pause()
            playerQueue?.removeAllItems()
            playerQueue = AVQueuePlayer(items: [firstPlayer])
            playerQueue?.play()
            playerQueue?.volume = 0
        }
    }
    
    
    var songName: String? {
        return currentTrack?.name
    }
    
    var subtitle: String? {
        return currentTrack?.artists.first?.name
    }
    
    var imageURL: URL? {
        return URL(string: currentTrack?.album?.images.first?.url ?? "")
    }
    
    
}
