//
//  MovieTableViewCell.swift
//  Movie Searcher
//
//  Created by Afraz Siddiqui on 3/22/20.
//  Copyright © 2020 ASN GROUP LLC. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
//    UITableViewCell父类是UIView
//  UITableView的每一行都是一个UITableViewCell/UITableViewCell的类型
//    按加载来区分动态cell:cell的内容在运行时才能确定
//    静态cell:cell的内容一开始已经确定


    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//selected/true將單元格設置為選中，false將其設置為未選中。默認值為false.

//animated/true為選定狀態之間的過渡設置動畫，false使過渡立即生效。



    static let identifier = "MovieTableViewCell"
//建構宣告一個表格名

    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell",
                     bundle: nil)
    }
//NIB 和 XIB 是描述用戶界面的文件建構一個nib檔的功能
//return 回傳
//註冊nib，並輸入在XIB裡的ID名稱，不是外面的Cell的ID名稱



    func configure(with model: Movie)

    {
        self.movieTitleLabel.text = model.name
        self.movieYearLabel.text = model.price
        let url = model.pic
//使用網址上的資料如果有錯誤就報錯
        if let data = try? Data(contentsOf: URL(string: url)!) {
            self.moviePosterImageView.image = UIImage(data: data)
//使用網路上的文字及圖片
        }
    }
    
}
