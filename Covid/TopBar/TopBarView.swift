//
//  TopBar.swift
//  Covid
//
//  Created by Bakir Agic on 5/23/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import Foundation
import UIKit

class TopBarView: UIView{
    
    var contentView: UIView!
    var topLabel: UILabel!
    var topImage: UIImageView!
    
    
    init() {
        super.init(frame: CGRect.init())
        commonI();
        
        
    }
    
    func setConstraints(){
        self.topAnchor.constraint(equalTo: super.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: super.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: super.trailingAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: 414).isActive = true
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
               
        
    }
    
    func commonI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setConstraints()
        let rectLabel = CGRect(x: 135, y: 60, width: 220, height: 30)
        topLabel = UILabel(frame: rectLabel)
        topLabel.textColor = UIColor.white
        topLabel.font = UIFont.boldSystemFont(ofSize: 17)
        topLabel.center.x = self.center.x
        self.addSubview(topLabel)
      
        let rectImage = CGRect(x: 374, y: 60, width: 25, height: 25)
        topImage = UIImageView(frame: rectImage)
        self.addSubview(topImage)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonI()
    }
    
    func setTopBar(image: String, text: String){
        topLabel.text = text
        topImage.image = UIImage(named: image)
    }
    
    
   
}
