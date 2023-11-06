//: [Previous](@previous)

import Foundation

final class HtmlMutableString: NSObject, NSMutableCopying {
/// Please do not modify this class.
    static var mutationsCount = 0

    private(set) var data: String = ""
    override var description: String {
        return data
    }

    override init() {
        super.init()
    }

    init(string: String) {
        super.init()
        data = string
    }

    func append(_ val: HtmlMutableString) {
        data.append(val.data)
    }

    func mutableCopy(with zone: NSZone? = nil) -> Any {
        HtmlMutableString.mutationsCount += 1
        return HtmlMutableString(string: data)
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? HtmlMutableString else { return false }
        return data == object.data
    }
}

struct HtmlString: CustomDebugStringConvertible, ExpressibleByStringLiteral, Equatable {
/// Please provide finished implementation here.

    static func == (lhs: HtmlString, rhs: HtmlString) -> Bool {
        return lhs.data.isEqual(rhs.data)
    }

    var debugDescription: String {
        return data.description
    }
    private var data = HtmlMutableString()

    public init(stringLiteral value: String) {
        data = HtmlMutableString(string: value)
    }

    init(_ data: HtmlMutableString) {
        self.data = data
        
    }

    mutating func append(_ param: HtmlMutableString) {
        data.append(param)
    }

    mutating func mutableCopy() -> Any  {
        return data.mutableCopy()
    }
}

var htmlString: HtmlString = "<strong>Smaple</strong>"
let htmlString2: HtmlString = "<strong>Smaple</strong>"

String(reflecting: htmlString)

print(htmlString == htmlString2)

htmlString.append(HtmlMutableString(string: "<p>Paragraph</p>"))
print(htmlString)
String(describing: htmlString)

let test = htmlString.mutableCopy()

//: [Next](@next)
/* let htmlString: HtmlString = "<strong>Sample Title</strong>"
 print(String(describing: htmlString)) // should print "<strong>Sample Title</strong>"
 let otherHtmlString: HtmlString = "<strong>Sample Title</strong>"
 otherHtmlString == htmlString // true
 htmlString.append(HtmlMutableString(string: "<p>some paragraph</p>"))
 // printing htmlString should look like this: "<strong>Samlpe Title</strong><p>some paragraph</p>*/
