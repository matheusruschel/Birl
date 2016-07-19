//
//  AudioTableViewCell.swift
//  Birl
//
//  Created by Matheus Ruschel on 7/17/16.
//  Copyright © 2016 Matheus Ruschel. All rights reserved.
//

import UIKit

protocol ButtonDelegate {
    
    func shareButtonClicked(forIndex index:Int?, cell:UITableViewCell, sender:UIButton)
}
let cellColors = [0xD1F2A5,0xEFFAB4,0xFFC48C,0xFF9F80,0xF56991]


class AudioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var whatsAppButton: UIButton!
    var buttonDelegate:ButtonDelegate?
    var cellIndex:Int?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    func configure(text:String, forRow index:Int) {
        
        self.selectionStyle = .None
        let image = UIImage(named: "level_up")
        let tintedImage = image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        whatsAppButton.setImage(tintedImage, forState: .Normal)
        whatsAppButton.tintColor = UIColor(netHex: 0x34495e)
        self.titleLabel.font = UIFont(name: "HelveticaNeue", size: 18)
        self.titleLabel.textColor = UIColor(netHex: 0x34495e)
        self.cellIndex = index
        self.titleLabel.text = text
        
        if (index+1) % 5 == 0 {
            self.backgroundColor = UIColor(netHex:cellColors[4])
        } else if (index+1) % 4 == 0 {
            self.backgroundColor = UIColor(netHex:cellColors[3])
        } else if (index+1) % 3 == 0 {
            self.backgroundColor = UIColor(netHex:cellColors[2])
        } else if (index+1) % 2 == 0 {
            self.backgroundColor = UIColor(netHex:cellColors[1])
        } else {
            self.backgroundColor = UIColor(netHex:cellColors[0])
        }
        

    }
    
    
    @IBAction func whatsAppButtonClicked(sender: UIButton) {
        buttonDelegate?.shareButtonClicked(forIndex: cellIndex,cell: self, sender: sender)
    }
    

}
extension UIColor {
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }


}
