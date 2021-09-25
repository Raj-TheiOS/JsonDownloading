//
//  DetailViewController.swift
//  JsonDownloadingSwift4
//
//  Created by Raj on 21/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var Vurl:String?
    var Vname:String?
    var Vdob:String?
    var Vcountry:String?
    var Vheight:String?
    var Vspouse:String?
    var Vchidren:String?
    var Vdesc:String?
    
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var detailNameLbl: UILabel!
    @IBOutlet weak var detailDobLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var spouseLbl: UILabel!
    @IBOutlet weak var chidrenLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameLbl.text = Vname
        detailDobLbl.text = "DOB:" + Vdob!
        countryLbl.text = "Country : " + Vcountry!
        heightLbl.text = "Height : " + Vheight!
        spouseLbl.text = "Spouse : " + Vspouse!
        chidrenLbl.text = "Children : " + Vchidren!
        descriptionLbl.text = "Description :" + Vdesc!
        
        // to get image from url
        if let imageURL = URL(string: Vurl!){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data{
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.detailImg.image = image
                    }
                }
            }
        } // image fetch end
    }
}
