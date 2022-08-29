//
//  CategoryData.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit

struct Category {
    var imageName: String
    var categoryName: String
}


class CategoryData {
    var homeCategory = [
        Category(imageName: "Category1", categoryName: "찜"),
        Category(imageName: "Category2", categoryName: "폴로"),
        Category(imageName: "Category3", categoryName: "최근본상품"),
        Category(imageName: "Category4", categoryName: "스타굿즈"),
        Category(imageName: "Category5", categoryName: "내피드"),
        Category(imageName: "Category6", categoryName: "여성가방"),
        Category(imageName: "Category7", categoryName: "내폰시세"),
        Category(imageName: "Category8", categoryName: "스니커즈"),
        Category(imageName: "Category9", categoryName: "우리동네"),
        Category(imageName: "Category10", categoryName: "캠핑"),
        Category(imageName: "Category11", categoryName: "친구초대"),
        Category(imageName: "Category12", categoryName: "골프"),
        Category(imageName: "Category13", categoryName: "전체메뉴"),
        Category(imageName: "Category14", categoryName: "피규어/인형"),
    ]
}
