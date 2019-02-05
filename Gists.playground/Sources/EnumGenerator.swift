import Foundation


public struct EnumGenerator {
    
    public init()
    {
        
    }
    public func generateEnum(fromString string: String) -> String {
        
        var enumString = "enum HTMLColor {\n"
        
        var cases = [String]()
        
        var values = [String]()
        
        for line in string.split(separator: ",")
        {
            let trimSet = CharacterSet.init(charactersIn: "\" \n")
            let first = line.split(separator: ":")[0]
            let second = line.split(separator: ":")[1]
            let firstTrimed = first.trimmingCharacters(in: trimSet)
            let secondTrimed = second.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
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
        
        return enumString
    }
}
