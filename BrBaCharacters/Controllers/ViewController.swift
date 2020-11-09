////
////  ViewController.swift
////  BrBaCharacters
////
////  Created by Milan Chalishajarwala on 10/13/20.
////
//
//import UIKit
//import AppleRetail
//
//class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    
//    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
//    var charactersArray: [CharacterModel] = []
//    @IBOutlet weak var charactersCollectionView: UICollectionView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let analytics = Analytics()
//        analytics.log(message: "Hello from the app!")
//        actIndicator.isHidden = false
//        charactersCollectionView.register(CharacterCollectionViewCell().Nib(), forCellWithReuseIdentifier: "CharacterCollectionViewCell")
//        charactersCollectionView.layer.zPosition = 2
//        charactersCollectionView.backgroundColor = UIColor(white: 1, alpha: 0.001)
//        configureBackground()
//        guard CoreDataManager.shared.fetchData().count == 0  else { return }
//        NetworkManager.shared.fetchCharacter(type:[CharacterModel].self)
//    }
//    
//    
//    
//    @IBAction func detailsButton(_ sender: Any) {
//        let nc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsNavigationController") as! UINavigationController
//        nc.modalPresentationStyle = .fullScreen
//        self.present(nc, animated: true, completion: nil)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let data = CoreDataManager.shared.fetchData()
//        self.charactersArray = data
//        
//        DispatchQueue.main.async {
//            self.charactersCollectionView.reloadData()
//        }
//        
//        
//    }
//    
//    func configureBackground(){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.view.bounds
//        gradientLayer.colors = [UIColor.black.cgColor, UIColor.systemGreen.cgColor]
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
//        self.view.layer.addSublayer(gradientLayer)
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return charactersArray.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
//        let data = charactersArray[indexPath.row]
//        let viewModel = ViewModel(char_id: data.char_id ?? 0, birthday: data.birthday ?? " ", category: data.category ?? " ", img: data.img ?? " ", name: data.name ?? " ", nickname: data.nickname ?? " ", status: data.status ?? " ", portrayed: data.portrayed ?? " " , appearance: data.appearance as? [Int16] ?? [0], better_call_saul_appearance: data.better_call_saul_appearance as? [Int16] ?? [0], occupation: data.occupation as? [String] ?? ["NA"])
//        
//        cell.configureCell(imageUrl: viewModel.img ?? "")
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: ((self.view.window?.frame.width)!/2), height: ((self.view.window?.frame.width)!/2))
//    }
//}
//
