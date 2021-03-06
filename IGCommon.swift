//
//  IGCommon.swift
//  InstagramStories
//
//  Created by Ranjith Kumar on 9/12/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

protocol CellConfigurer:class {
    static func nib()->UINib
    static func reuseIdentifier()->String
}
protocol CellDataConfigurer:class {
    associatedtype _data
    func populate<_data>(with data:_data)
}

extension CellConfigurer {
    static func nib() -> UINib {
        return UINib.init(nibName: self.reuseIdentifier(), bundle: nil)
    }
    static func reuseIdentifier()->String {
        return String(describing: self)
    }
}
typealias CellComposition = CellConfigurer&CellDataConfigurer

class TableViewCell<T>:UITableViewCell,CellComposition{
    typealias _data = T
    func populate<_data>(with data: _data) {
        print(data)
    }
}
class CollectionViewCell:UICollectionViewCell,CellComposition {
    typealias _data = Int
    func populate<_data>(with data: _data) {
        print(data)
    }
}

let t = TableViewCell<String>()
t.populate(with: 2) //Generic DATA<T>

extension UINib {
    class func nib(with name:String)->UINib {
        return UINib.init(nibName: name, bundle: nil)
    }
}

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

