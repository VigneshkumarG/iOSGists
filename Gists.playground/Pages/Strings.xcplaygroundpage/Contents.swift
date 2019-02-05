//: [Previous](@previous)

import Foundation


let path = Bundle.main.path(forResource: "Languages", ofType: "strings")!

let url = URL(fileURLWithPath: path)

let data = try! Data(contentsOf: url)

let fileString = String(data: data, encoding: .utf8)!


struct StringsFileParser
{
    func parse(string: String) -> [String: String] {
        
        //1. Result Dictionary
        var stringDict = [String:String]()
        
        //2. Character Set for triming
        var trimSet = CharacterSet.whitespacesAndNewlines
        trimSet.insert(charactersIn: "\"")
        
        //3. Iterate each line
        for line in string.split(separator: ";")
        {
            // 4. split line by =
            let components = line.split(separator: "=")
            if components.count == 2
            {
                //5. first component is key, second component is value
                let key = components[0].trimmingCharacters(in: trimSet)
                let value = components[1].trimmingCharacters(in: trimSet)
                
                //6. add to dictionary
                stringDict[key] = value
            }
        }
        return stringDict
    }
}
let dict = StringsFileParser().parse(string: fileString)
dump(dict)

//: [Next](@next)
