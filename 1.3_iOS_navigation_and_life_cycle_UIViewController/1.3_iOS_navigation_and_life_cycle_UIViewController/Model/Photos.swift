//
//  Photos.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 28.05.2022.
//

import UIKit

struct PhotosModel {
    var author: String
    var image: String
    
    static func makeMockModel() -> [PhotosModel] {
        var model = [PhotosModel]()
        model.append(PhotosModel(author: "Zealot", image: "1"))
        model.append(PhotosModel(author: "Zealot", image: "2"))
        model.append(PhotosModel(author: "Zealot", image: "3"))
        model.append(PhotosModel(author: "Zealot", image: "4"))
        model.append(PhotosModel(author: "Zealot", image: "5"))
        model.append(PhotosModel(author: "Zealot", image: "6"))
        model.append(PhotosModel(author: "Zealot", image: "7"))
        model.append(PhotosModel(author: "Zealot", image: "8"))
        model.append(PhotosModel(author: "Zealot", image: "9"))
        model.append(PhotosModel(author: "Zealot", image: "10"))
        model.append(PhotosModel(author: "Zealot", image: "11"))
        model.append(PhotosModel(author: "Zealot", image: "12"))
        model.append(PhotosModel(author: "Zealot", image: "13"))
        model.append(PhotosModel(author: "Zealot", image: "14"))
        model.append(PhotosModel(author: "Zealot", image: "15"))
        model.append(PhotosModel(author: "Zealot", image: "16"))
        model.append(PhotosModel(author: "Zealot", image: "17"))
        model.append(PhotosModel(author: "Zealot", image: "18"))
        model.append(PhotosModel(author: "Zealot", image: "19"))
        model.append(PhotosModel(author: "Zealot", image: "20"))
        return model
    }
}

