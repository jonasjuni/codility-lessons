//Factorial Loop
func factorialLoop(num: Int) -> Int {
    var result = 1
    for i in 1..<num + 1 {
        result *= i
    }
    return result
}
//print(factorialLoop(num: 0))

//TRIANGLE
func drawTriangle(n:Int){
    for i in 1...n {
        var dots = ""
        for _ in 1...i{
            dots += "* "
        }
        print(dots)
    }
}
//drawTriangle(n: 4)

func invertedTriangle(n:Int){
    for i in (1...n).reversed() {
        var dots = ""
        for _ in 0..<n - i{
            dots += "  "
        }
        for _ in 1..<i * 2 {
            dots += "* "
        }
        print(dots)
    }
}
//invertedTriangle(n: 4)

/*:
 Example: Given a positive integer n, how can we count the number of digits in its decimal representation?
 One way to do it is convert the integer into a string and count the characters.
 Here, though, we will use only arithmetical operations instead.
 We can simply keep dividing the number by ten and count how many steps are needed to obtain 0.
 */

func countDecimals (num: Int) -> Int{
    var result = 0
    var n = num
    while n > 0 {
        n /= 10
        result += 1
    }
    return result
}

//print(countDecimals(num: 100))

//: Fibonacci using while

func fibonacciWhile(n: Int) {
    var a = 0
    var b = 1
    while a <= n {
        print(a)
        (a, b) = ( a + b, a)
//        var c = a + b
//        b = a
//        a = c
        
    }
}
fibonacciWhile(n: 13)

//Binary gap

public func solution(_ N : Int) -> Int {
    var n = N
    var result = 0
    var count = 0
    var startCounting = false
    while n > 0 {
        let bit = n % 2 //Covert to binary
        n /= 2
        
        if bit == 1 && !startCounting { //find an 1 start counting
            startCounting = true
        } else if bit == 0 && startCounting { //
            count += 1
        } else if bit == 1 && startCounting {
            if count > result {
                result = count
            }
            count = 0
        }
    }
    return result
    
}
print(solution(1041)) //5


