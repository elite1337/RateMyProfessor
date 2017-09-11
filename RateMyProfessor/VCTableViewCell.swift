//
//  VCTableViewCell.swift
//  RateMyProfessor
//
//  Created by Pete on 08/09/2017.
//  Copyright © 2017 Pete. All rights reserved.
//

import UIKit

protocol IndexDelegate
{
    func data(index: Int)
}

class VCTableViewCell: UITableViewCell {
    
    var indexDelegate: IndexDelegate? = nil
    
    @IBOutlet weak var category: UIImageView!
    @IBOutlet weak var ratting1: UIImageView!
    @IBOutlet weak var ratting2: UIImageView!
    @IBOutlet weak var ratting3: UIImageView!
    @IBOutlet weak var ratting4: UIImageView!
    @IBOutlet weak var ratting5: UIImageView!
    @IBOutlet weak var replyNo: UILabel!
    @IBOutlet weak var campus: UILabel!
    
    var categories: Array<UIImage> = [UIImage(named: "bomb.png")!]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var courseObject: Course? = nil
    func updateData(courseData: Course)
    {
        courseObject = courseData
        
        //ratting
        ratting1.image = UIImage(named: "ratingEmptyStar")!
        ratting2.image = UIImage(named: "ratingEmptyStar")!
        ratting3.image = UIImage(named: "ratingEmptyStar")!
        ratting4.image = UIImage(named: "ratingEmptyStar")!
        ratting5.image = UIImage(named: "ratingEmptyStar")!
        let ratting: String = courseData.ratting
        let ratting2Float: Float? = Float(ratting)
        if ratting2Float! == 5
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
            ratting2.image = UIImage(named: "ratingFullStar")!
            ratting3.image = UIImage(named: "ratingFullStar")!
            ratting4.image = UIImage(named: "ratingFullStar")!
            ratting5.image = UIImage(named: "ratingFullStar")!
        }
        else if ratting2Float! < 5 && ratting2Float! > 4
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
            ratting2.image = UIImage(named: "ratingFullStar")!
            ratting3.image = UIImage(named: "ratingFullStar")!
            ratting4.image = UIImage(named: "ratingFullStar")!
            if (ratting2Float! - ratting2Float!.rounded()+1) > 0.33
            {
                ratting5.image = UIImage(named: "ratingHalfStar")!
            }
        }
        else if ratting2Float! == 4
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
            ratting2.image = UIImage(named: "ratingFullStar")!
            ratting3.image = UIImage(named: "ratingFullStar")!
            ratting4.image = UIImage(named: "ratingFullStar")!
        }
        else if ratting2Float! < 4 && ratting2Float! > 3
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
            ratting2.image = UIImage(named: "ratingFullStar")!
            ratting3.image = UIImage(named: "ratingFullStar")!
            if (ratting2Float! - ratting2Float!.rounded()+1) > 0.33
            {
                ratting4.image = UIImage(named: "ratingHalfStar")!
            }
        }
        else if ratting2Float! == 3
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
            ratting2.image = UIImage(named: "ratingFullStar")!
            ratting3.image = UIImage(named: "ratingFullStar")!
        }
        else if ratting2Float! < 3 && ratting2Float! > 2
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
            ratting2.image = UIImage(named: "ratingFullStar")!
            if (ratting2Float! - ratting2Float!.rounded()+1) > 0.33
            {
                ratting3.image = UIImage(named: "ratingHalfStar")!
            }
        }
        else if ratting2Float! == 2
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
            ratting2.image = UIImage(named: "ratingFullStar")!
        }
        else if ratting2Float! < 2 && ratting2Float! > 1
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
            if (ratting2Float! - ratting2Float!.rounded()+1) > 0.33
            {
                ratting2.image = UIImage(named: "ratingHalfStar")!
            }
        }
        else if ratting2Float! == 1
        {
            ratting1.image = UIImage(named: "ratingFullStar")!
        }
        else if ratting2Float! < 1
        {
            if (ratting2Float! - ratting2Float!.rounded()+1) > 0.33
            {
                ratting1.image = UIImage(named: "ratingHalfStar")!
            }
        }
        
        //algorithm
        category.image = categories[0]
        replyNo.text = "777 view(s)"
        //structure
        course.setTitle(courseData.course, for: .normal)
        professor.setTitle(courseData.professor, for: .normal)
        campus.text = courseData.campus
        
        if courseData.interest
        {
            interest.setBackgroundImage(UIImage(named: "fullheart.png"), for: .normal)
        }
        else
        {
            interest.setBackgroundImage(UIImage(named: "emptyheart"), for: .normal)
        }
        
        if courseData.enroll
        {
            enroll.setBackgroundImage(UIImage(named: "fullplus.png"), for: .normal)
        }
        else
        {
            enroll.setBackgroundImage(UIImage(named: "emptyplus.png"), for: .normal)
        }
        
    }

    @IBOutlet weak var course: UIButton!
    @IBAction func course(_ sender: Any) {
        
        let index = (sender as? UIButton)?.tag
        indexDelegate?.data(index: index!)
    }
    
    @IBOutlet weak var professor: UIButton!
    @IBAction func professor(_ sender: Any) {
        
        
    }
    
    @IBOutlet weak var interest: UIButton!
    @IBAction func interest(_ sender: Any) {
        
        if (courseObject?.interest)!
        {
            interest.setBackgroundImage(UIImage(named: "emptyheart.png"), for: .normal)
            courseObject?.interest = false
        }
        else
        {
            interest.setBackgroundImage(UIImage(named: "fullheart.png"), for: .normal)
            courseObject?.interest = true
        }
    }
    
    @IBOutlet weak var enroll: UIButton!
    @IBAction func enroll(_ sender: Any) {
        
        if (courseObject?.enroll)!
        {
            enroll.setBackgroundImage(UIImage(named: "emptyplus.png"), for: .normal)
            courseObject?.enroll = false
        }
        else
        {
            enroll.setBackgroundImage(UIImage(named: "fullplus.png"), for: .normal)
            courseObject?.enroll = true
        }
    }
}
