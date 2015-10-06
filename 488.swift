import Foundation

let answer = "0123456789".utf8.reduce(0) { $0 + Int($1) }
let input = ["0123456789", "01234", "01234567890", "6789012345", "012322456789"];
let output = input.map { $0.utf8.reduce(0) { $0 + Int($1) } == answer }
print(output)
