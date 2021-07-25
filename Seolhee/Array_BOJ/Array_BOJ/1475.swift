// BOJ 1475

import Foundation

let input = readLine()!
var num = Array(repeating: 0, count: 10)

for i in input {
    num[Int(String(i))!] += 1
}

num[9] += num[6]
num[6] = 0

if num.firstIndex(of: num.max()!) == 9 {
    print((num[9] / 2) + (num[9] % 2))
}
else { print(num.max()!) }
