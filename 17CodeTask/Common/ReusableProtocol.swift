//
//  ReusableProtocol.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{
    func register(_ aCase: CollectionViewCells){
        register(aCase.nib, forCellWithReuseIdentifier: aCase.reuseableId)
    }
    
    func dequeueReusableCell(_ aCase: CollectionViewCells, for indexPath: IndexPath) -> UICollectionViewCell{
        return dequeueReusableCell(withReuseIdentifier: aCase.reuseableId, for: indexPath)
    }
}

protocol Reusable{
    associatedtype ViewType
    var object: ViewType.Type { get }
    var reuseableId: String { get }
}

extension Reusable{
    var nib: UINib? { return UINib(nibName: cellName, bundle: nil) }
    var cellName: String { return "\(object)" }
    var reuseableId: String { return cellName }
}


enum CollectionViewCells: Reusable{
    case user
    
    var object: UICollectionViewCell.Type{
        switch self {
        case .user:
            return UserCollectionViewCell.self
        }
    }
    
    var nib: UINib?{
        switch self {
        case .user:
            return UINib(nibName: cellName, bundle: nil)
        }
    }
}
