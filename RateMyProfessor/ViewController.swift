//
//  ViewController.swift
//  RateMyProfessor
//
//  Created by Pete on 03/09/2017.
//  Copyright © 2017 Pete. All rights reserved.
//

import UIKit

protocol RowDelegate
{
    func data(dictionary: Dictionary<String, Any>)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, Delegate, IndexDelegate {
    
    var rowDelegate: RowDelegate? = nil
    
    var selectedIdex: Int = 0
    
    func data(data: Bool)
    {
        filterView.isHidden = data
    }
    func data(index: Int)
    {
        selectedIdex = index
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "filterVC"
        {
            let filterVC: FilterVC = segue.destination as! FilterVC
            filterVC.delegate = self
        }
        else if segue.identifier == "courseInfoVC"
        {
            let courseInfoVC = segue.destination as! CourseInfo
            let course: Course = courses[selectedIdex]
            courseInfoVC.data = ["index": course.index, "time": course.time, "course": course.course, "rating": course.ratting, "professor": course.professor, "campus": course.campus, "sweet": course.sweet, "chill": course.chill, "bomb": course.bomb, "difficult": course.difficult, "fulfill": course.fulfill, "interest": course.interest, "enroll": course.enroll]
        }
    }
    
    var courses: Array<Course> = []
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBAction func segment(_ sender: UISegmentedControl) {
        
        switch segment.selectedSegmentIndex
        {
            case 0:
            courses.removeAll()
            myData()
            tableView.reloadData()
            case 1:
            courses.removeAll()
            localData()
            tableView.reloadData()
            default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        filterView.isHidden = true
        myData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func filter(_ sender: Any) {
        
        if filterView.isHidden
        {
            filterView.isHidden = false
        }
        else
        {
            filterView.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VCTableViewCell
        cell.indexDelegate = self
        cell.updateData(courseData: courses[indexPath.row])
        cell.course.tag = indexPath.row
        let course: Course = courses[indexPath.row]
        if course.interest
        {
            cell.interest.setBackgroundImage(UIImage(named: "fullheart.png"), for: .normal)
        }
        else
        {
            cell.interest.setBackgroundImage(UIImage(named: "emptyheart.png"), for: .normal)
        }
        if course.enroll
        {
            cell.enroll.setBackgroundImage(UIImage(named: "fullplus.png"), for: .normal)
        }
        else
        {
            cell.enroll.setBackgroundImage(UIImage(named: "emptyplus.png"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        
    }
    
    func myData()
    {
        var course: Course = Course(indexInner:"0", timeInner:"0", courseInner:"Java", rattingInner:"2.5", professorInner:"popo", campusInner:"文化大學", sweetInner:"1", chillInner:"2", bombInner:"3", difficultInner:"4", fulfillInner:"5", interestInner: false, enrollInner: false)
        courses.append(course)
        
        course = Course(indexInner:"0", timeInner:"0", courseInner:"JavaScript", rattingInner:"2.5", professorInner:"lala", campusInner:"臺灣科技大學", sweetInner:"1", chillInner:"2", bombInner:"3", difficultInner:"4", fulfillInner:"5", interestInner: false, enrollInner: false)
        courses.append(course)
        
        course = Course(indexInner:"0", timeInner:"0", courseInner:"Swift", rattingInner:"4.7", professorInner:"Michael", campusInner:"台北市立大學", sweetInner:"1", chillInner:"1", bombInner:"3", difficultInner:"4", fulfillInner:"5", interestInner: false, enrollInner: false)
        courses.append(course)
    }
    
    func localData()
    {
        for _ in 1...15
        {
            let course: Course = Course(indexInner:"0", timeInner:"0", courseInner:"Java", rattingInner:"5", professorInner:"popo", campusInner:"NTUST", sweetInner:"1", chillInner:"2", bombInner:"3", difficultInner:"4", fulfillInner:"5", interestInner: false, enrollInner: false)
            courses.append(course)
        }
    }
}

