//
//  CharacterCollectionViewCell.swift
//  BrBaCharacters
//
//  Created by Milan Chalishajarwala on 10/13/20.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(imageUrl: String){
        let url = URL(string: imageUrl)
        if let imageURL = url{
            do {
                let data = try Data(contentsOf: imageURL)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)

                }
                
            }catch {
                print("Unable to fetch image")
            }
        }
    }
    
    
    func Nib() -> UINib{
        return UINib(nibName: "CharacterCollectionViewCell", bundle: nil)
    }

}
