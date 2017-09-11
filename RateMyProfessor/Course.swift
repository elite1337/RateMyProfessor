//
//  Course.swift
//  RateMyProfessor
//
//  Created by Pete on 08/09/2017.
//  Copyright © 2017 Pete. All rights reserved.
//

import Foundation

class Course
{
    var index: String = ""
    var time: String = ""
    var course: String = ""
    var ratting: String = ""
    var professor: String = ""
    var campus: String = ""
    var sweet: String = ""
    var chill: String = ""
    var bomb: String = ""
    var difficult: String = ""
    var fulfill: String = ""
    
    var interest: Bool = false
    var enroll: Bool = false

    init(indexInner: String, timeInner: String, courseInner: String, rattingInner: String, professorInner: String, campusInner: String, sweetInner: String, chillInner: String, bombInner: String, difficultInner: String, fulfillInner: String, interestInner: Bool, enrollInner: Bool)
    {
        index = indexInner
        time = timeInner
        course = courseInner
        ratting = rattingInner
        professor = professorInner
        campus = campusInner
        sweet = sweetInner
        chill = chillInner
        bomb = bombInner
        difficult = difficultInner
        fulfill = fulfillInner
        
        interest = interestInner
        enroll = enrollInner
    }
}
