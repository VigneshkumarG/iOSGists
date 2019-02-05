import UIKit

let redWithAlpha = UIColor(hexString: "#F0F8FFFF")

let redWithoutAlpha = UIColor(hexString: "#FAEBD7FF")


let path = Bundle.main.path(forResource: "HTMLColors", ofType: "strings")!

let data = Data(contentsOf: URL.init(fileURLWithPath: path))

let string = String(data: data, encoding: .utf8)!

var enumString = "enum HTMLColor {\n"

var cases = [String]()

var values = [String]()


for (index,line) in string.split(separator: ",").enumerated()
{
    let trimSet = CharacterSet.init(charactersIn: "\" \n")
    
    let first = line.split(separator: ":")[0]
    let second = line.split(separator: ":")[1]
    let firstTrimed = first.trimmingCharacters(in: trimSet)
    let secondTrimed = second.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let caseString = "case \(firstTrimed) = \(secondTrimed)\n"
    cases.append(firstTrimed)
    values.append(secondTrimed)
}

for caseItem in cases {
    enumString.append("case \(caseItem)\n")
}

enumString.append("func getHexString() -> String { \n")
enumString.append("switch self { \n")
for (caseItem,val) in zip(cases, values) {
    enumString.append("case .\(caseItem):\n")
    enumString.append("return \(val)\n")
}
enumString.append("}")
enumString.append("}\n")
enumString.append("}\n")

print(enumString)

UIColor(hexString: UIColor.HTMLColor.aqua.getHexString())
