// BOJ 1107 리모컨
/*
makeNum 함수에서, num이라는 수를 만듦으로서 num만큼 +혹은 -를 누르는 횟수를 세이브할 수 있음
하지만 num이라는 수를 누르고 함께 +혹은 -버튼을 눌러줘야 해당 채널로 이동할 수 있으므로
num수의 자릿 수 만큼과 +혹은 -를 누르는 1만큼의 카운트는 추가되어야 함
=> makeNum 함수에서는 for문과 재귀를 사용하여 만들 수 있는 모든 경우의 수를 만들고,
 (N에서 num을 뺀 절대값) + (num이라는 수를 만들기 위해 숫자 버튼을 누르는 횟수) + (+혹은 -를 누르는 횟수 1번)의 연산을 통해서
 가장 작은 횟수로 채널 이동이 가능한 경우를 찾는다.
*/

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var breakButton = [Int]()
if M > 0 { breakButton = readLine()!.split(separator: " ").map({Int(String($0))!}) }
var minCount = abs(N - 100) // 100번 채널에서 시작하므로, N에서 100만큼 뺀 횟수가 최대 횟수 (최솟값 갱신 위해 최댓값 넣어놓기)

func makeNum(_ num: String) {
    if num.count > 5 { return } // 채널이 최대 500000까지 이므로 5자리 이상으로 넘어가면 함수 종료
    for i in 0..<10 {
        if !breakButton.contains(i) {
            let count = abs(N - Int(num + String(i))!) + num.count + 1
            minCount = min(count, minCount)
            makeNum(num + String(i))
        }
    }
}

makeNum("")
print(minCount)
