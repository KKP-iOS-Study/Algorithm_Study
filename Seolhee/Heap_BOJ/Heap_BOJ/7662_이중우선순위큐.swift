// #7662 이중 우선순위 큐
// -> 입력받는 부분에서 시간초과. 따라서 프로그래머스에 있는 같은 문제로 풀이함
//
// queue라는 배열을 생성, 각 명령에 알맞게 배열을 수정했음.
// I 명령어의 경우에는 바로 queue 배열의 마지막에 값을 삽입했고,
// D 명령어의 경우에는 queue 배열이 비어있지는 않은지 확인 후 명령을 실행했음.
// 숫자 앞에 "-"가 붙어있는 경우에는 최솟값을 삭제해야하므로, queue 배열을 내림차순 정렬 후 removeLast 했음.
// 숫자 앞에 "-"가 붙어있지 않은 경우에는 최댓값을 삭제해야하므로, queue 배열을 오름차순 정렬 수 removeLast 했음.
// (removeFirst를 하지 않기 위하여 위와 같이 정렬한 것)

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    for i in operations {
        let command = i.split(separator: " ").map({String($0)})
        
        if command[0] == "I" { queue.append(Int(command[1])!) }
        else if command[0] == "D" && !queue.isEmpty {
            if command[1].contains("-") { queue.sort(by: >); queue.removeLast() }
            else { queue.sort(); queue.removeLast() }
        }
    }
    
    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}

// 입출력 예제
print(solution(["I 16","D 1"]))
print(solution(["I 7","I 5","I -5","D -1"]))
