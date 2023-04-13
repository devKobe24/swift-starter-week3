//
//  STEP1.swift
//  CodeStarterCamp_Week3
//
//  Created by Minseong Kang on 2023/03/27.
//

import Foundation

class Person {
	let name: String
	let age: Int
	let personality: String
	var mbti: String
	let birthDay: String
	var money: Int
	
	init(name: String, age: Int, personality: String, mbti: String, birthDay: String, money: Int) {
		self.name = name
		self.age = age
		self.personality = personality
		self.mbti = mbti
		self.birthDay = birthDay
		self.money = money
	}
	
	func walk() {
		print("걷다")
	}
	
	func buy() {
		print("물건을 사다")
	}
	
	func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by customer: Person) {
		coffeeShop.make(coffee, for: customer)
		
		let price = coffee.price
		print("COFFEE PRICE=====>>>> \(price)")
		if money < price {
			print("잔액이 \(price - money)원만큼 부족합니다.")
		} else {
			money -= price
			print("MONEY =====>>>>>> \(money)")
			
			coffeeShop.sales += price
			print("COFFEE SHOP MONEY =====>>>>>> \(coffeeShop.sales)")
		}
	}
}



enum Coffee: String {
	case americano = "아메리카노"
	case latte = "라떼"
	case coldBrew = "콜드브루"
	case capuccino = "카푸치노"
	case none = "없음"
	
	var price: Int {
		switch self {
		case .americano:
			return 1000
		case .latte:
			return 1100
		case .coldBrew:
			return 1200
		case .capuccino:
			return 1100
		case .none:
			return 0
		}
	}
}


class CoffeeShop {
	var barista: Person
	var sales: Int = 0
	var pickUpTable: [(coffee: Coffee, customer: Person)] = [] {
		didSet {
			guard let pickupMenu = pickUpTable.last else { return }
			let customName = pickupMenu.customer.name
			let orderedCoffee = pickupMenu.coffee
			let customerMoney = pickupMenu.customer.money
			
			if customerMoney >= orderedCoffee.price {
				print("\(customName) 님이 주문하신 \(orderedCoffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
			} else {
				print("\(orderedCoffee.price - customerMoney)원 만큼 부족하므로 \(customName) 님이 주문하신 \(orderedCoffee)(을/를) 준비할 수 없습니다.")
			}
			
		}
	}
	var menu: [Coffee: Int] = [
		.americano: Coffee.americano.price,
		.latte: Coffee.latte.price,
		.coldBrew: Coffee.coldBrew.price,
		.capuccino: Coffee.capuccino.price
	]
	
	init(barista: Person) {
		self.barista = barista
	}
	
	func takenAnOrder() {
		print("주문을 받는 메서드")
	}
	
	func make(_ coffee: Coffee, for customer: Person) {
		let brewedCoffee = brewCoffee(coffee)
		// Tuple을 append 하기 때문에 아래와 같이 코드를 작성함.
		pickUpTable.append((brewedCoffee, customer))
	}
	
	func brewCoffee(_ coffee: Coffee) -> Coffee {
		return coffee
	}
}


