//
//  MovieDataModel.swift
//  TicketBooking
//
//  Created by M on 2022/5/16.
//

import UIKit

//模型
struct MovieDataModel:Hashable, Codable{
    var name:String //名字
    var img:Int //图片
    var startTime:String //id
    var playTime:String
    var movieType:String
    var movieID:String
    
}

struct TicketsModel:Hashable, Codable{
    
    var movieID:String
    var saleDate:String //当前日期
    var startTime:String //开始时间
    var endTime:String
    var price:String
    var discontPrice:String
    var tips:String
    
}
