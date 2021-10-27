//
//  main.swift
//  BS_BOJ
//
//  Created by 강호성 on 2021/10/27.
//

// 특정 개수에 대한 특정 길이 찾기
// 개수가 중복이 될 때 최대 길이를 찾아야 한다. -> upper Bound를 쓰면 201이 반환된다.
// cm  ... 198  199  200  201 ...
// cnt ...  11   11   11   12 ...
//
// 여기서 반환된 값은 특정 개수(N)을 초과한 첫 길이(=12개로 자를 때 만들 수 있는 최소 길이)이기 때문에 -1해주면 11개로 만들 수 있는 최대 길이가 된다.

let KN = readLine()!.split(separator: " ").map{Int(String($0))!}
var k = KN[0], n = KN[1]

var arr = [Int]()
for _ in 0..<k { arr.append(Int(readLine()!)!) }

var min = 0, max = arr.max()!+1

while min < max {
    
    let mid = (max+min)/2 // 범위 내에서의 중간 길이
    var cnt = 0 // 총 몇개가 만들어지는지
    
    for i in 0..<arr.count {
        cnt += (arr[i]/mid)
    }
    
    // mid 길이로 자를 때의 개수가 만들려는 랜선의 개수보다 작다면
    // 자르려 하는 길이를 줄이기 위해 최대 길이를 줄인다
    if cnt < n {
        max = mid
    } else { // 자르려 하는 길이를 늘려야 하므로 최소길이를 늘린다.
        min = mid + 1
    }
}
print(min-1)
