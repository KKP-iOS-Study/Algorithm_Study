import UIKit

var arr = [1, 2, 2, 3, 3, 3]
print(arr.filter({$0 == 3}).count)
// filter 사용하면 배열에 있는 숫자 중복 횟수 확인 가능,,!!!!

print(arr.remove(at: 1))
print(arr)
// remove는 먼저 해당 위치 요소를 반환하고 지움!

print(arr.removeAll(where: {$0 == 3}))
print(arr)
// removeAll하고, where절에 클로저 사용하면
// 위치를 모르고도 원하는 요소들을 모두 삭제할 수 있다!!

var str1 = "1234"
var str2 = str1.reversed()
print(str2)
print(arr.reversed())
// reversed 함수의 반환 타입,,에 대해 알아보는 중!

var arr2 = ["1", "2", "3", "4", "5"]
print(arr2.joined())
// joined는 '문자열'을 담은 배열에만 쓸 수 있음!!!!!!!
// 입력 받는게 애초에 [String] 타입임.

var arr3 = Array(repeating: 1, count: 5)
print(arr3)
var a = [1, 3]
arr3.map({ a[$0] -= 1 })
print(arr3)
