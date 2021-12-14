// BOJ 5430 AC
//
/*
계속 실제로 reverse를 하고, 맨 앞의 인덱스를 remove 하다 보면 시간초과이므로
시작 인덱스와 끝 인덱스를 담은 변수를 이용하여 삭제할 위치의 값을 찾아주고,
reverse의 경우에는 어차피 뒤집기 or 원상태 이렇게 두 가지의 상태 중 하나이므로 Bool 변수를 이용해준다.
*/

let T = Int(readLine()!)!

for _ in 0..<T {
    let p = readLine()!
    let n = Int(readLine()!)!
    let x = readLine()!.dropFirst().dropLast().split(separator: ",").map({String($0)}) // 맨 앞과 뒤의 "["와 "]"를 제외, ","를 기준으로 나눠서 배열로 생성
    var reverse = false // 뒤집었는지 원상태인지 판별 (true == 뒤집은상태, false == 원상태)
    var error = false // 에러 판별
    var start = 0, end = x.count // 시작 인덱스와 끝 인덱스가 될 위치를 저장 (D 입력 시 실제로 문자를 삭제하지 않고 인덱스로 판별하기 위함)
    
    for i in p {
        if i == "R" { reverse = !reverse } // 뒤집었을 경우 reverse 값을 반대로 변경
        else {
            if x.count == 0 { error = true; break }
            else {
                if reverse == true { end -= 1 } // 뒤집어져있을 경우에는 끝 인덱스를 앞으로 당기기
                else { start += 1 } // 뒤집어져있지 않은 경우에는 시작 인덱스를 뒤로 밀기
                if start > end { error = true; break } // 시작 인덱스가 끝 인덱스보다 커지면 에러로 판정, 반복문 종료
            }
        }
    }
    
    if error { print("error") }
    else {
        if reverse { print("[" + x[start..<end].reversed().joined(separator: ",") + "]") }
        else { print("[" + x[start..<end].joined(separator: ",") + "]") }
    }
}
