//
//  CourseInfo.swift
//  RateMyProfessor
//
//  Created by Pete on 09/09/2017.
//  Copyright © 2017 Pete. All rights reserved.
//

import UIKit

class CourseInfo: UIViewController, RowDelegate {

    @IBOutlet weak var category: UIImageView!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var rating1: UIImageView!
    @IBOutlet weak var rating2: UIImageView!
    @IBOutlet weak var rating3: UIImageView!
    @IBOutlet weak var rating4: UIImageView!
    @IBOutlet weak var rating5: UIImageView!
    @IBOutlet weak var professor: UIButton!
    @IBOutlet weak var campus: UILabel!
    @IBOutlet weak var interest: UIButton!
    @IBOutlet weak var enroll: UIButton!
    var categories: Array<UIImage> = [UIImage(named: "bomb")!]
    var data: [String: Any]?
    
    func data(dictionary: Dictionary<String, Any>) {
        
        data = dictionary
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "courseInfoVC"
        {
            let viewController: ViewController = segue.destination as! ViewController
            viewController.rowDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tabBarController?.tabBar.isHidden = true
        
        category.image = categories[0]
        course.text = data!["course"] as? String
        professor.setTitle(data!["professor"] as? String, for: .normal)
        campus.text = data!["campus"] as? String
        if (data!["interest"] as? Bool)!
        {
            interest.setBackgroundImage(UIImage(named: "fullheart.png"), for: .normal)
        }
        else
        {
            interest.setBackgroundImage(UIImage(named: "emptyheart"), for: .normal)
        }
        
        if (data!["enroll"] as? Bool)!
        {
            enroll.setBackgroundImage(UIImage(named: "fullplus.png"), for: .normal)
        }
        else
        {
            enroll.setBackgroundImage(UIImage(named: "emptyplus.png"), for: .normal)
        }
        
        //rating
        let rating: String = (data!["rating"] as? String)!
        let rating2Float: Float? = Float(rating)
        if rating2Float! == 5
        {
            rating1.image = UIImage(named: "ratingFullStar")!
            rating2.image = UIImage(named: "ratingFullStar")!
            rating3.image = UIImage(named: "ratingFullStar")!
            rating4.image = UIImage(named: "ratingFullStar")!
            rating5.image = UIImage(named: "ratingFullStar")!
        }
        else if rating2Float! < 5 && rating2Float! > 4
        {
            rating1.image = UIImage(named: "ratingFullStar")!
            rating2.image = UIImage(named: "ratingFullStar")!
            rating3.image = UIImage(named: "ratingFullStar")!
            rating4.image = UIImage(named: "ratingFullStar")!
            if (rating2Float! - rating2Float!.rounded()+1) > 0.33
            {
                rating5.image = UIImage(named: "ratingHalfStar")!
            }
        }
        else if rating2Float! == 4
        {
            rating1.image = UIImage(named: "ratingFullStar")!
            rating2.image = UIImage(named: "ratingFullStar")!
            rating3.image = UIImage(named: "ratingFullStar")!
            rating4.image = UIImage(named: "ratingFullStar")!
        }
        else if rating2Float! < 4 && rating2Float! > 3
        {
            rating1.image = UIImage(named: "ratingFullStar")!
            rating2.image = UIImage(named: "ratingFullStar")!
            rating3.image = UIImage(named: "ratingFullStar")!
            if (rating2Float! - rating2Float!.rounded()+1) > 0.33
            {
                rating4.image = UIImage(named: "ratingHalfStar")!
            }
        }
        else if rating2Float! == 3
        {
            rating1.image = UIImage(named: "ratingFullStar")!
            rating2.image = UIImage(named: "ratingFullStar")!
            rating3.image = UIImage(named: "ratingFullStar")!
        }
        else if rating2Float! < 3 && rating2Float! > 2
        {
            rating1.image = UIImage(named: "ratingFullStar")!
            rating2.image = UIImage(named: "ratingFullStar")!
            if (rating2Float! - rating2Float!.rounded()+1) > 0.33
            {
                rating3.image = UIImage(named: "ratingHalfStar")!
            }
        }
        else if rating2Float! == 2
        {
            rating1.image = UIImage(named: "ratingFullStar")!
            rating2.image = UIImage(named: "ratingFullStar")!
        }
        else if rating2Float! < 2 && rating2Float! > 1
        {
            rating1.image = UIImage(named: "ratingFullStar")!
            if (rating2Float! - rating2Float!.rounded()+1) > 0.33
            {
                rating2.image = UIImage(named: "ratingHalfStar")!
            }
        }
        else if rating2Float! == 1
        {
            rating1.image = UIImage(named: "ratingFullStar")!
        }
        else if rating2Float! < 1
        {
            if (rating2Float! - rating2Float!.rounded()+1) > 0.33
            {
                rating1.image = UIImage(named: "ratingHalfStar")!
            }
        }
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

    @IBAction func onBackPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
