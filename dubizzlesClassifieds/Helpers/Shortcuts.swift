//
//  Shortcuts.swift
//  DubizzlesClassifieds
//
//  Created by Shahzaib Iqbal Bhatti on 3/8/21.
//

import UIKit

func getStoryBoard(_ storyBoard: StoryBoard) -> UIStoryboard {
    return UIStoryboard(name: storyBoard.rawValue, bundle: nil)
}

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
