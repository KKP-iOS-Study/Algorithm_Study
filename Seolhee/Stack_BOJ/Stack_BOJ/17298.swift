// BOJ #17298 오큰수
//
// 풀이는 분~~명히 맞고 진짜 이것보다 더 효율적으로 풀 수 없다고 생각했는데도 자꾸 시간초과가 떴음.
// 결국 찾아낸 이유가 원래 nums 선언시에 readLine()!.components(separatedBy: " ").map({Int($0)!}) 이렇게 했었음.
// 근데 이걸 readLine()!.split(separator: " ").map({Int(String($0))!}) 이렇게..
// components를 split으로 바꾸고, Int($0)!를 Int(String($0))!로 바꿔줬더니 풀렸다.
//
// 원래 components는 [String] 타입으로 반환하고, split은 [Substring] 타입으로 반환하기 때문에
// 난 String으로 한 번더 변환해주는 것이 귀찮아 split보다는 components를 많이 사용해왔었다.
// 이번 기회로 split, components 차이점에 대해 공부해봤는데,,
// split이 components에 비해 성능이 좋다고 한다..
// 그 이유는 components는 쪼개려는 separator가 많을 수록 그걸 다 반환하기 때문에 느려진다고 함.
// => 블로그에 자세히 정리해봐야겠다.

import Foundation

var count = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map({Int(String($0))!}) // 입력받은 수 배열
var stack = [[0, nums[0]]] // 입력받은 수를 차례대로 검사하기 위한 스택 배열 (nums 배열의 인덱스와 요소를 받아온다.)
var answer = Array(repeating: "-1", count: count) // -1로 채워진 결과 출력 배열

for i in 1..<nums.count {
    // 스택이 비어있지 않고, nums 배열의 i 번째 수가 스택의 마지막 수보다 클 경우에만 while문 실행
    while !stack.isEmpty && nums[i] > stack.last![1] {
        // 스택의 마지막 요소 삭제와 동시에, 해당 숫자의 인덱스를 answer의 인덱스로 사용하여 해당 수의 오큰수인 nums[i]를 저장
        answer[stack.removeLast()[0]] = "\(nums[i])"
    }
    stack.append([i, nums[i]])
}

print(answer.joined(separator: " "))
