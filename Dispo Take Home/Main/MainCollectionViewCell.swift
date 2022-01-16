//
//  MainCollectionViewCell.swift
//  Dispo Take Home
//
//  Created by Ikechukwu Onuorah on 15/01/2022.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    var viewContainer = UIView()
    var gifThumbNail = UIImageView()
    var gifTitle = UILabel()
    
    func setupViewController() {
        addSubview(viewContainer)
        viewContainer.clipsToBounds = true
        viewContainer.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    func setupGifThumbNail() {
        viewContainer.addSubview(gifThumbNail)
        gifThumbNail.contentMode = .scaleAspectFill
        gifThumbNail.clipsToBounds = true
        gifThumbNail.backgroundColor = .systemPink
        gifThumbNail.snp.makeConstraints { (make) in
            make.width.equalTo(75)
            make.height.equalTo(75)
            make.centerY.equalTo(viewContainer)
            make.leading.equalTo(viewContainer).offset(15)
        }
    }
    
    func setupGifTitle() {
        viewContainer.addSubview(gifTitle)
//        movieTitle.text = movieCell?.title
        gifTitle.text = "Initially working"
        gifTitle.numberOfLines = 0
        gifTitle.lineBreakMode = .byWordWrapping
        gifTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(gifThumbNail.snp.trailing).offset(25)
            make.centerY.equalTo(gifThumbNail)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    func layoutViews() {
        setupViewController()
        setupGifThumbNail()
        setupGifTitle()
    }
    
//    var movieCell: MovieDataModel? {
//        didSet {
//            guard let movieCell = movieCell else { return }
//            movieThumbNail.image = UIImage(named: movieCell.image ?? "")
//            movieTitle.text = movieCell.title
//            movieGenre.text = movieCell.genre
//            movieRatings.text = "Rated \(movieCell.rating ?? String())"
//            movieTicketPrice.text = "₦ \(movieCell.ticketPrice ?? String())"
//            movieCountry.text = movieCell.country
//            movieReleaseDate.text = movieCell.releaseDate
//            movieDescription.text = movieCell.movieDescription
//        }
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
