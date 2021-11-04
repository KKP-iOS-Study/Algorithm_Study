/*
BS 멀티버스ll boj18869.swift
Created by hoseung Lee on 2021/11/04.
https://www.acmicpc.net/problem/18869
https://github.com/KKP-iOS-Study/Algorithm_Study
KKP-iOS-Study : Algorithm Study
*/

func boj18869() {
  let mn = readLine()!.split(separator: " ").map{Int(String($0))!}
  
  var multiverse: [[Int]] = .init(repeating: .init(repeating: 0, count: mn[1]), count: mn[0])
  
  func compressionCoordinate(_ universe: String) -> [Int] {
    
    
    var unique: Set<Int> = []
    
    func convertUnique(_ subString: Substring) -> Int {
      let convert = Int(String(subString))!
      unique.insert(convert)
      return convert
    }
    
    let original = universe.split(separator: " ").map(convertUnique(_:))
    let reference = Array(unique.sorted())
    
    var convertedCoordinate: [Int] = original
    
    for (index, target) in original.enumerated() {
      var mid = 0
      var start = 0
      var end = reference.count
      while end >= start {
        mid = (start + end) / 2
        
        if reference[mid] == target {
          break
        } else if reference[mid] > target {
          end = mid - 1
        } else {
          start = mid + 1
        }
      }
      convertedCoordinate[index] = mid
    }
    return convertedCoordinate
  }
  
  for i in 0..<mn[0] {
    multiverse[i] = compressionCoordinate(readLine()!)
  }
  
  var sync = 0
  for reference in 0..<multiverse.count {
    for comparison in reference..<multiverse.count {
      if reference == comparison { continue }
      if multiverse[reference] == multiverse[comparison] {
        sync += 1
      }
    }
  }
  print(sync)
}

/*
 좌표 압축, BS 문제
 - 좌표 압축이 된 두 유니버스가 균등 하면 완전히 똑같은 좌표 배열을 가지기 때문에
 - 좌표 압축 후 두 유니버스를 equal 연산 후 true이면 균등하다고 볼 수 있음
 */
