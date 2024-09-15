import Foundation

// Весь твой код внутри функции
func main() {
    // Структура для фиксированных расходов
    struct FixedExpense {
        let amount: Double   // Сумма фиксированного расхода
        let day: Int         // День месяца, когда нужно оплатить (например, 12-е число)
        let repeatsMonthly: Bool  // Повторяется ли этот расход каждый месяц
    }

    // Функция для вычисления даты окончания капитала с учётом фиксированных расходов
    func calculateEndDate(startDate: String, capital: Double, dailyExpense: Double, fixedExpenses: [FixedExpense]) -> (Date?, Double) {
        guard dailyExpense > 0 else {
            print("Ежедневные расходы должны быть больше 0")
            return (nil, 0)
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"  // Формат даты

        guard let currentDate = dateFormatter.date(from: startDate) else {
            print("Ошибка: неверный формат даты.")
            return (nil, 0)
        }

        var remainingCapital = capital
        var currentDay = currentDate

        while remainingCapital > 0 {
            for expense in fixedExpenses {
                let components = Calendar.current.dateComponents([.day, .month], from: currentDay)
                if components.day == expense.day {
                    remainingCapital -= expense.amount
                }
            }

            remainingCapital -= dailyExpense
            if remainingCapital <= 0 {
                return (currentDay, remainingCapital)
            }

            guard let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: currentDay) else {
                return (nil, 0)
            }
            currentDay = nextDay
        }

        return (nil, remainingCapital)
    }

    // Пример фиксированных расходов
    let fixedExpenses = [
        FixedExpense(amount: 218, day: 12, repeatsMonthly: true),
        FixedExpense(amount: 624, day: 15, repeatsMonthly: true),
        FixedExpense(amount: 64, day: 20, repeatsMonthly: true),
        FixedExpense(amount: 6.5, day: 22, repeatsMonthly: true),
        FixedExpense(amount: 40, day: 25, repeatsMonthly: true),
        FixedExpense(amount: 6.5, day: 28, repeatsMonthly: true),
        FixedExpense(amount: 2.8, day: 30, repeatsMonthly: true)
    ]

    let startDate = "2024-09-16"
    let capital = 500.0
    let dailyExpense = 5.0

    let (endDate, finalCapital) = calculateEndDate(startDate: startDate, capital: capital, dailyExpense: dailyExpense, fixedExpenses: fixedExpenses)

    if let endDate = endDate {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        print("Дата окончания денег: \(dateFormatter.string(from: endDate)), остаток: \(finalCapital)")
    } else {
        print("Капитала хватит навсегда.")
    }
}

// Вызов функции main
main()

