// BOJ #10816 숫자 카드 2 - 딕셔너리 활용하여 풀이
/*
 딕셔너리 counts에 상근이가 가지는 카드를 차례대로 입력받고,
 그 카드들의 숫자를 [숫자: 개수] 딕셔너리로 표현해주었다.
 그리고 M개의 숫자들을 순서대로 딕셔너리에서 찾아주었다.
 
 딕셔너리 활용하니까 바로 시간 초과를 해결할 수 있어서,, 이분 탐색을 이용하진 않았지만
 완성된 딕셔너리에서 숫자를 찾는 과정에 있어서는 이분 탐색을 활용하면 더 시간 복잡도를 줄일 수 있을 것 같음
 */

let N = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = Int(readLine()!)
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}
var counts = [Int: Int]()
var result = [Int]()

cards.sort()

for i in cards {
    if counts.keys.contains(i) { counts[i]! += 1 }
    else { counts[i] = 1 }
}

for i in nums {
    if counts.keys.contains(i) { result.append(counts[i]!) }
    else { result.append(0) }
}

print(result.map({String($0)}).joined(separator: " "))
