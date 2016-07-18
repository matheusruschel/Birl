//
//  AudioTableViewCell.swift
//  Birl
//
//  Created by Matheus Ruschel on 7/17/16.
//  Copyright © 2016 Matheus Ruschel. All rights reserved.
//

import UIKit

protocol WhatsAppButtonDelegate {
    
    func whatsAppButtonClicked(forIndex index:Int?, cell:UITableViewCell, sender:UIButton)
}

class AudioTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var whatsAppButton: UIButton!
    var whatsAppDelegate:WhatsAppButtonDelegate?
    var cellIndex:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    func configure() {
        
        let image = UIImage(named: "whatsapp")
        let tintedImage = image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        whatsAppButton.setImage(tintedImage, forState: .Normal)
        whatsAppButton.tintColor = UIColor(netHex: 0x43d854)
        self.titleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        
    }
    
    
    @IBAction func whatsAppButtonClicked(sender: UIButton) {
        whatsAppDelegate?.whatsAppButtonClicked(forIndex: cellIndex,cell: self, sender: sender)
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
