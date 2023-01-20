//
//  SearchTableViewCell.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 17.01.2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var titleLabel: BaseLabel = {
        let title = BaseLabel()
        return title
    }()
    
    private var listImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "playIcon"), for: <#T##UIControl.State#>)
        return button
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        [listImageView, titleLabel, playButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            listImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            listImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            listImageView.widthAnchor.constraint(equalToConstant: 96),
            listImageView.heightAnchor.constraint(equalToConstant: 55),
            
            titleLabel.leadingAnchor.constraint(equalTo: listImageView.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            playButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
}
