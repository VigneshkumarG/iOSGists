import UIKit

extension UIColor
{
    // Get RGBA
    
    public func rgba() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
    // Send full value like 255
    public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0)
    {
        self.init(red: CGFloat(red)/255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
    
    // hex string can be #ff00ff / #ff00abff
    public convenience init?(hexString: String) {
        guard hexString.hasPrefix("#") else {
            return nil
        }
        let start = hexString.index(hexString.startIndex, offsetBy: 1)
        let hexColor = String(hexString[start...])
        switch hexColor.count {
        case 8:
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                self.init(hexNumberWithAlpha: hexNumber)
                return
            }
        case 6:
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                self.init(hexNumber: hexNumber)
                return
            }
        default:
            break
        }
        return nil
    }
    private convenience init(hexNumber: UInt64) {
        
        let red = CGFloat((hexNumber & 0xff000000) >> 16) / 255
        let green = CGFloat((hexNumber & 0x00ff0000) >> 8) / 255
        let blue = CGFloat(hexNumber & 0x000000ff) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private convenience init(hexNumberWithAlpha hexNumber: UInt64) {
        
        let red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        let green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        let blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        let alpha = CGFloat(hexNumber & 0x000000ff) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
