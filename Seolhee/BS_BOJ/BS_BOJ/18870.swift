// BOJ #18870 좌표 압축
/*
 좌표 압축 -> 숫자별로 내가 몇 번째로 작은 수인지 출력하면 되는 문제임
 중복에 관계없이 딱 순서만 출력하면 되므로, 세트를 활용해주었음
 
 세트에 중복을 제외한 수들을 넣고, 오름차순 정렬하여 새로운 배열 sortedNum을 생성해주었음
 그리고 이분탐색을 이용해서 입력받은 수 순서대로 sortedNum에서 찾아 그 위치를 결과 배열 result에 추가했음
 (오름차순 정렬되어있으므로 위치가 곧 순서가 되기 때문)
 */

let n = Int(readLine()!)!
var num = readLine()!.split(separator: " ").map({Int(String($0))!})
var set = Set<Int>()
var result = [Int]()

for i in num { set.insert(i) } // 세트에 담으면서 중복 제거
var sortedNum = set.sorted() // 세트 오름차순 정렬해서 새로운 배열 생성

for i in num {
    var start = 0
    var end = sortedNum.count
    
    while start <= end {
        let mid = (start + end) / 2
        
        if sortedNum[mid] == i { result.append(mid); break } // 찾았으면 그 위치를 바로 result 배열에 추가
        else if sortedNum[mid] < i { start = mid + 1 }
        else { end = mid - 1 }
    }
}

print(result.map({String($0)}).joined(separator: " "))
