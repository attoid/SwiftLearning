import Foundation

// Создаем функцию main, в которой будет выполняться весь код
func main() {
    let product = "Яблоко" // Название товара не изменится

    var reserv = 500 // Запас товара
    var price = 3.5 // Цена

    // Вычисление начальных запасов
    var result = Double(reserv) * price

    print("Товар: \(product)")
    print("В количестве: \(reserv)")
    print("Цена: \(price)")
    print("Запасы: $ \(result)")

    // Продажа 100 единиц
    let sell = 100
    reserv -= sell

    // Применение фиксированной скидки
    let discount = 0.5
    price = price - discount

    // Пересчитываем запасы после продажи
    result = Double(reserv) * price

    print("Товар после продажи: \(product)")
    print("В количестве: \(reserv)")
    print("Цена: \(price)")
    print("Запасы после продажи: $ \(result)")
}

// Вызываем функцию main
main()

