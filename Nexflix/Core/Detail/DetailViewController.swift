//
//  DetailViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 07.04.2023.
//

import UIKit
import Player

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    let videoUrl = URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
    
    private lazy var playerViewController: Player = {
        let player = Player()
        player.playerDelegate = self
        player.playbackDelegate = self
        player.view.frame = view.bounds
        player.url = videoUrl
        player.playFromBeginning()
        return player
    }()
    
    private var coordinator: DetailCoordinator
    
    // MARK: - Init
    
    init(coordinator: DetailCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        addChild(playerViewController)
        view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: self)
        playerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playerViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            playerViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            playerViewController.view.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addGesture() {
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
                tapGestureRecognizer.numberOfTapsRequired = 1
                self.player.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
            switch self.player.playbackState {
            case .stopped:
                self.player.playFromBeginning()
                break
            case .paused:
                self.player.playFromCurrentTime()
                break
            case .playing:
                self.player.pause()
                break
            case .failed:
                self.player.pause()
                break
            }
        }
}

extension DetailViewController: PlayerDelegate {
    func playerReady(_ player: Player) {
        print(player)
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        print(player)
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        print(player)
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        print(player)
    }
    
    func player(_ player: Player, didFailWithError error: Error?) {
        print(player)
    }
    
    
}

extension DetailViewController: PlayerPlaybackDelegate {
    func playerCurrentTimeDidChange(_ player: Player) {
        print(player)
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
        print(player)
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
        print(player)
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
        print(player)
    }
    
    func playerPlaybackDidLoop(_ player: Player) {
        print(player)
    }
}
