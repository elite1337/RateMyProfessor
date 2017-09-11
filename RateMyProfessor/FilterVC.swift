//
//  FilterVC.swift
//  RateMyProfessor
//
//  Created by Pete on 09/09/2017.
//  Copyright © 2017 Pete. All rights reserved.
//

import UIKit

protocol Delegate
{
    func data(data: Bool)
}

class FilterVC: UIViewController {

    var delegate: Delegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func filter1(_ sender: Any) {
        
        delegate?.data(data: true)
    }
    
    @IBAction func filter2(_ sender: Any) {
        
        delegate?.data(data: true)
    }
    
    @IBAction func filter3(_ sender: Any) {
        
        delegate?.data(data: true)
    }
    
    @IBAction func filter4(_ sender: Any) {
        
        delegate?.data(data: true)
    }
    
    @IBAction func filter5(_ sender: Any) {
        
        delegate?.data(data: true)
    }
}
