//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterKim: Person = Person(
	name: "Mr.Kim",
	age: 35,
	personality: "침착",
	mbti: "INFP",
	birthDay: "89/07/08",
	money: 10
)

let missKim: Person = Person(
	name: "Miss.Kim",
	age: 22,
	personality: "활발",
	mbti: "ENFP",
	birthDay: "98/04/27",
	money: 10
)

let yagombucks: CoffeeShop = CoffeeShop(barista: misterKim)

missKim.order(.americano, of: yagombucks, by: missKim.name)
