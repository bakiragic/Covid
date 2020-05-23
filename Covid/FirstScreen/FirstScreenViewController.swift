//
//  FirstScreenViewController.swift
//  Covid
//
//  Created by Bakir Agic on 5/24/20.
//  Copyright © 2020 Bakir Agic. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet var TopBar: TopBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TopBar.setTopBar(image: "add", text: "NEW COVID INFORMATION")
    }

        
        override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.isNavigationBarHidden = true
        }

        override func viewWillDisappear(_ animated: Bool) {
            self.navigationController?.isNavigationBarHidden = false
        }
        
    


}
