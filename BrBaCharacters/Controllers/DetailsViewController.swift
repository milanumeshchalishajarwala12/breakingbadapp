//
//  DetailsViewController.swift
//  BrBaCharacters
//
//  Created by Milan Chalishajarwala on 10/19/20.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var allArray = [CharacterModel]()
    @IBOutlet var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(CharactersTableViewCell().Nib(), forCellReuseIdentifier: "CharactersTableViewCell")
        tblView.delegate = self
        tblView.dataSource = self
        NetworkManager.shared.fetchCharacter(type: CharacterModel.self)
        NetworkManager.shared.closure = {
            data in
            self.allArray = data
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersTableViewCell") as! CharactersTableViewCell
        let data = allArray[indexPath.row]
        
        let viewModel = ViewModel(char_id: data.char_id ?? 0, birthday: data.birthday ?? "", category: data.category ?? "", img: data.img ?? "", name: data.name ?? "", nickname: data.nickname ?? "", status: data.status ?? "", portrayed: data.portrayed ?? "", appearance: data.appearance ?? [0], better_call_saul_appearance: data.better_call_saul_appearance ?? [0], occupation: data.occupation ?? ["NA"] )
        //
        cell.configureCell(name: viewModel.name ?? "", characterStreetName: viewModel.nickname ?? "", characterRealName: viewModel.portrayed ?? "", imgUrl: viewModel.img ?? "")
        return cell
    }
    
    //
    //    let char_id: Int16?
    //    let birthday: String?
    //    let category: String?
    //    let img: String?
    //    let name: String?
    //    let nickname: String?
    //    let status: String?
    //    let portrayed: String?
    //    let appearance: [Int16]?
    //    let better_call_saul_appearance: [Int16]?
    //    let occupation: [String]?
    
    
}

