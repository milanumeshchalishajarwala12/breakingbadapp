//
//  CharactersTableViewCell.swift
//  BrBaCharacters
//
//  Created by Milan Chalishajarwala on 10/19/20.
//

import UIKit
import SVProgressHUD

class CharactersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet var streetName: UILabel!
    
    @IBOutlet weak var realName: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func Nib() -> UINib{
        return UINib(nibName: "CharactersTableViewCell", bundle: nil)
    }

    @IBOutlet var subView: UIView!
    
    
    @IBOutlet var actIndicator: UIActivityIndicatorView!
    
    
    public func configureCell(name: String, characterStreetName: String, characterRealName: String, imgUrl: String){
        characterName.text = name
        streetName.text = "Also known as: \(characterStreetName)"
        realName.text = "Played by: \(characterRealName)"
        imageView?.layer.cornerRadius = 5
        subView.layer.backgroundColor = UIColor(white: 0, alpha: 0.6).cgColor
        subView.layer.cornerRadius = 5
        subView.isHidden = false
        actIndicator.isHidden = false
        let url = URL(string: imgUrl)
        if let imageURL = url{
            do{
                let data = try Data(contentsOf: imageURL)
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data)
                    self.subView.isHidden = true
                    self.actIndicator.isHidden = true
                }
            }catch{
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(systemName: "person.circle.fill")
                    self.imageView?.backgroundColor = UIColor.black
                    self.subView.isHidden = true
                    self.actIndicator.isHidden = true
                }
            }
        }
        
        
    }
    
}
