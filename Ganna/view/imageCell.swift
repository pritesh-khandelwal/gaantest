//
//  imageCell.swift
//  Ganna
//
//  Created by Pritesh Khandelwal on 27/07/19.
//  Copyright © 2019 Pritesh Khandelwal. All rights reserved.
//

import UIKit

enum Sectiontype {
    case first
    case second
    case third
    case fourth
    case fifth
}

class imageCell: UITableViewCell {

    @IBOutlet weak var collView: UICollectionView!
    var item = Section(){
        didSet{
            bindData()
        }
    }
    
    var sectionType:Sectiontype?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
        // Initialization code
    }
    
    func setup(){
        
        self.collView.dataSource = self
        self.collView.delegate = self
        self.collView.register(UINib(nibName: imageCollCell.identifier, bundle: nil), forCellWithReuseIdentifier: imageCollCell.identifier)
    }
    
    
    func bindData(){
        self.collView.reloadData()
        switch self.sectionType! {
        case .first,.second,.third,.fourth:
            if let layout = self.collView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
            self.collView.isScrollEnabled = true
        case .fifth:
            if let layout = self.collView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
            self.collView.isScrollEnabled = false
        }
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension imageCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.item.tracks.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCollCell.identifier, for: indexPath) as! imageCollCell
        cell.collImage.layer.masksToBounds = true
        switch self.sectionType! {
        case .first:
           cell.collImage.layer.cornerRadius = 0.0
        case .second:
            cell.collImage.layer.cornerRadius = 0.0
        case .third:
            cell.collImage.layer.cornerRadius = 77.5
            cell.collImage.layer.masksToBounds = true
        case .fourth:
            cell.collImage.layer.cornerRadius = 0.0
        case .fifth:
            cell.collImage.layer.cornerRadius = 0.0
        }
        cell.collImage.imageFromServerURL(urlString: self.item.tracks[indexPath.row].atw)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        var  width:CGFloat = 155.0
        var  height:CGFloat = 155.0
        
        switch self.sectionType! {
            case .first:
                width = 155
                height = 155
            case .second:
                width = 70
                height = 70
            case .third:
                width = 155
                height = 155
            case .fourth:
                width = 155
                height = 90
            case .fifth:
                width = (self.frame.width - 20)/2
                height = 160
        }
        let size = CGSize(width: width, height: height)
        return size
    }
    
    
}

