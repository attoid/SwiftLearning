import Foundation

var continueProgram = true  // Переменная для управления циклом

while continueProgram == true {
    // Основная логика программы
    print("Введите ваше имя: ")
    let name = readLine()  // Читаем имя

    // Проверка имени на наличие данных
    if let validInput = name {  //проверка что строка не пустая с помощью if let
        print("Привет, \(validInput)")
    } else {
        print("Ошибка ввода.")
    }

    // Спрашиваем, хочет ли пользователь запустить программу снова
    print("Хотите запустить программу снова? (y/n):")
    let answer = readLine()

    if let validAnswer = answer {
        if validAnswer == "y" {  // Если пользователь вводит 'y', продолжаем
            continueProgram = true
        } else if answer == "n" {  // Если пользователь вводит 'n', завершаем программу
            continueProgram = false
            print("Программа завершена.")
        } else {
            print("Некорректный ответ. Введите 'y' или 'n'.")
        }
    }
}
