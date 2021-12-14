// BOJ 5430 AC

let T = Int(readLine()!)!

for _ in 0..<T {
    let p = readLine()!
    let n = Int(readLine()!)!
    let x = readLine()!.dropFirst().dropLast().split(separator: ",").map({String($0)})
    var reverse = false
    var error = false
    var start = 0, end = x.count
    
    for i in p {
        if i == "R" { reverse = !reverse }
        else {
            if x.count == 0 { error = true; break }
            else {
                if reverse == true { end -= 1 }
                else { start += 1 }
                if start > end { error = true; break }
            }
        }
    }
    
    if error { print("error") }
    else {
        if reverse { print("[" + x[start..<end].reversed().joined(separator: ",") + "]") }
        else { print("[" + x[start..<end].joined(separator: ",") + "]") }
    }
}
