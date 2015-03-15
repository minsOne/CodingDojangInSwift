import Foundation

var count = 0

for hour in 0...23 {
  for minute in 0...59 {
    switch (hour, minute) {
    case (hour, _) where String(hour).rangeOfString("3") != nil :
      count++
    case (_, minute) where String(minute).rangeOfString("3") != nil:
      count++
    default:
      break
    }
  }
}

println("Total Seconds : \(count * 60)")