import Foundation

let mosTable: [String:String] = [".-":"A","-...":"B","-.-.":"C","-..":"D",".":"E","..-.":"F",
"--.":"G","....":"H","..":"I",".---":"J","-.-":"K",".-..":"L",
"--":"M","-.":"N","---":"O",".--.":"P","--.-":"Q",".-.":"R",
"...":"S","-":"T","..-":"U","...-":"V",".--":"W","-..-":"X",
"-.--":"Y","--..":"Z", "Space":" "]

var mosSignalStream = ".... .  ... .-.. . . .--. ...  . .- .-. .-.. -.--"


// MARK: O(n)으로 풀 경우

extension String {
  
  subscript (i: Int) -> Character {
    return self[advance(self.startIndex, i)]
  }
}

enum state: String {
  case Char = "Char"
  case Space = "Space"
}

var mosState:state = .Char
var word = "", totalWord = ""

for var index = 0; index < countElements(mosSignalStream); index++ {
  let str = String(mosSignalStream[index])
  
  if (index == countElements(mosSignalStream) - 1) {
    word += str
    totalWord += mosTable[word]!
  } else {
    switch (mosState, str) {
    case (.Char, _) where str != " " :
      word += str
    case (.Char, _) where str == " " :
      totalWord += mosTable[word]!
      mosState = .Space
      word = ""
    case (.Space, _) where str != " " :
      word = str
      mosState = .Char
    case (.Space, _) where str == " " :
      totalWord += " "
    default:
      break
    }
  }
}
println("Translate Result : \(totalWord)")


// MARK: High Order Function으로 풀 경우

let mosSignalSigalArray = mosSignalStream.componentsSeparatedByString("  ")

let result = mosSignalSigalArray
  .map { str -> [String] in return str.componentsSeparatedByString(" ") }
  .map { obj -> String in
    return obj
      .map { str -> String in return mosTable[str]! }
      .reduce("") { $0 + $1 }
      + " " }
.reduce("", combine: +)

println("Translate Result : \(result)")