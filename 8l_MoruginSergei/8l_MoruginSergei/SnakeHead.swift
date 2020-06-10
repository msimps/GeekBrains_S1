//
//  SnakeHead.swift
//  8l_MoruginSergei
//
//  Created by Matthew on 09.06.2020.
//  Copyright © 2020 Ostagram Inc. All rights reserved.
//

import UIKit
class SnakeHead: SnakeBodyPart {
    override init(atPoint point: CGPoint){
        super.init(atPoint:point)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
