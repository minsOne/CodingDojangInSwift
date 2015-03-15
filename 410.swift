// MARK : URL - http://codingdojang.com/scode/410
import Foundation

extension String {
  subscript (i: Int) -> String {
    return String(self[advance(self.startIndex, i)])
  }
}

let nameStream = "이유덕,이재영,권종표,이재영,박민호,강상희,이재영,김지완,최승혁,이성연,박영서,박민호,전경헌,송정환,김재성,이유덕,전경헌"

let nameTable:[String] = nameStream.componentsSeparatedByString(",")

// MARK: Problem 1
let y = nameTable.filter { $0[0] == "김" || $0[0] == "이" }
println("1.김씨와 이씨는 각각 몇 명 인가요? : \(y)")

// MARK: Problem 2
let x = nameTable
  .filter { $0 == "이재영" }
  .reduce(0) { (s0, s1) in s0 + 1 }
println("2.\"이재영\"이란 이름이 몇 번 반복되나요? \(x)")

// MARK: Problem 3
let removedDuplecateNameTable = NSSet(array: nameTable).allObjects as [String]
println("3.중복을 제거한 이름을 출력하세요. \n \(removedDuplecateNameTable)")

// MARK: Problem 4
let sortedRemovedDuplecateNameTable = sorted(removedDuplecateNameTable){ $0 < $1 }
println("4.중복을 제거한 이름을 오름차순으로 정렬하여 출력하세요. \n \(sortedRemovedDuplecateNameTable)")
