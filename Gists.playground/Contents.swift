import UIKit

let redWithAlpha = UIColor(hexString: "#F0F8FFFF")

let redWithoutAlpha = UIColor(hexString: "#FAEBD7FF")


let path = Bundle.main.path(forResource: "HTMLColors", ofType: "strings")!

let data = try! Data(contentsOf: URL.init(fileURLWithPath: path))

let string = String(data: data, encoding: .utf8)!

let enumString = EnumGenerator().generateEnum(fromString: string)

UIColor(red: 244, green: 200, blue: 120)

UIColor(hexString: UIColor.HTMLColor.aqua.getHexString())

let col2 = UIColor(hue: 0, saturation: 0.66, brightness: 0.66, alpha: 1)
let col3 = UIColor(hue: 0.25, saturation: 0.66, brightness: 0.66, alpha: 1)
let col4 = UIColor(hue: 0.5, saturation: 0.66, brightness: 0.66, alpha: 1)
let col5 = UIColor(hue: 0.75, saturation: 0.66, brightness: 0.66, alpha: 1)

