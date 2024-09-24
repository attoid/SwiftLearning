import Foundation

//Просто массив
let array = ["phto1", "photo2", "photo3"]

//Массив кортежей
let assets: [(name: String, amount: Int)] = [
    (name:"real estate", amount: 50000),
        (name:"cash", amount: 10000),
            (name:"shares", amount: 100000),
                (name:"bonds", amount: 44000)
]

//Просто словарь
let dictionary: [String: Int] = [
    "Math": 100,
    "English": 120,
    "Russian": 180
]

//Словарь кортежей
let listMovies: [String: (rate:Int, director:String)] = [
    "Серьезный человек": (rate: 80, director: "Coen brothers"),
    "Матрица": (rate: 100, director: "The Wachowskis"),
    "There Will Be Blood": (rate: 73, "Paul Thomas Anderson")
]

//Просто множество
let mySet: Set<String> = ["Tbilisi", "Batumi", "Kutaisi"]

//Множество кортежей
//нет поддержки Hashable
