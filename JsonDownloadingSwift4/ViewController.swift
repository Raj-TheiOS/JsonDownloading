//
//  ViewController.swift
//  JsonDownloadingSwift4
//
//  Created by Raj on 21/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    final let url = URL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")
    private var actors = [Actor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJson()
    }
    func downloadJson(){
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something wrong")
                return}
            print("data downloaded")
            do{
                let decoder = JSONDecoder()
                let downloadedActors = try decoder.decode(Actors.self, from: data)
                // to get array complete data
                self.actors = downloadedActors.actors
                DispatchQueue.main.async {
                    self.tableView.reloadData() // to allot data to tableview
                }
                // print(actors.actors[0].name) // to print specific name from array
            }catch{
                print("something Wrong after downloading")
            }
            
        }.resume()
    } // func downloadjason end
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActorCell
        
        cell.nameLbl.text = "Name:" + actors[indexPath.row].name
        cell.DOBLbl.text = "Dob : " + actors[indexPath.row].dob
        
        // to get image from url
        if let imageURL = URL(string: actors[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                
                if let data = data{
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    }
                }
            }
        } // image fetch end
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        
        detailVC.Vname = self.actors[indexPath.row].name
        detailVC.Vdob = self.actors[indexPath.row].dob
        detailVC.Vurl = self.actors[indexPath.row].image
        detailVC.Vcountry = self.actors[indexPath.row].country
        detailVC.Vheight = self.actors[indexPath.row].height
        detailVC.Vspouse = self.actors[indexPath.row].spouse
        detailVC.Vchidren = self.actors[indexPath.row].children
        detailVC.Vdesc = self.actors[indexPath.row].description
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}










