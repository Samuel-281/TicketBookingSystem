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

//struct TicketsModel:Hashable, Codable{
//
//    var movieID:String
//    var saleDate:String //当前日期
//    var startTime:String //开始时间
//    var endTime:String
//    var price:String
//    var discontPrice:String
//    var tips:String
//    var seatNumbers:String?//座位号
//
//}


class TicketsModel:NSObject,NSCoding,Codable{
    
    var movieID:String
    var saleDate:String //当前日期
    var startTime:String //开始时间
    var endTime:String
    var price:String
    var discontPrice:String
    var tips:String
    ///自定义字段
    var seatNumbers:String?//座位号
    var totlePrice:String?
    //模型类 遵循 NSCoding 编码解码协议 以便存储数据到本地
    func encode(with coder: NSCoder) {
        coder.encode(movieID, forKey: "movieID")
        coder.encode(saleDate, forKey: "saleDate")
        coder.encode(startTime, forKey: "startTime")
        coder.encode(endTime, forKey: "endTime")
        coder.encode(price, forKey: "price")
        coder.encode(discontPrice, forKey: "discontPrice")
        coder.encode(tips, forKey: "tips")
        coder.encode(seatNumbers, forKey: "seatNumbers")
        coder.encode(totlePrice, forKey: "totlePrice")
    }
    
    required init?(coder: NSCoder) {
        movieID = coder.decodeObject(forKey: "movieID") as! String
        saleDate = coder.decodeObject(forKey: "saleDate") as! String
        startTime = coder.decodeObject(forKey: "startTime") as! String
        endTime = coder.decodeObject(forKey: "endTime") as! String
        price = coder.decodeObject(forKey: "price") as! String
        discontPrice = coder.decodeObject(forKey: "discontPrice") as! String
        tips = coder.decodeObject(forKey: "tips") as! String
        seatNumbers = coder.decodeObject(forKey: "seatNumbers") as? String
        totlePrice = coder.decodeObject(forKey: "totlePrice") as? String
    }
    
    override init() {
        movieID = ""
        saleDate = ""
        startTime = ""
        endTime = ""
        price = ""
        discontPrice = ""
        tips = ""
        seatNumbers = ""
        totlePrice = ""
    }
    
}
