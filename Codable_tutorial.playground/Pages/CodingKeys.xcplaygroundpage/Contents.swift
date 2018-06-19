import Foundation

// ****** jsonString ******
let employeeString = """
{
"name":"Vinoth",
"age":34,
"resided_at":"Madurai"
}
"""

// ****** Object ******
struct Employee: Codable {
    var name: String
    var age: Int
    var address: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case address = "resided_at"
    }
}

// jsonString -> Object
func getEmployee(employeeString: String) -> Employee? {
    guard let employeeData = employeeString.data(using: .utf8), let employeeObject = try? JSONDecoder().decode(Employee.self, from: employeeData) else {
        return nil
    }
    
    return employeeObject
}

if let employee = getEmployee(employeeString: employeeString) {
    print("name: \(employee.name), age: \(employee.age), address: \(employee.address)")
} else {
    print("Invalid Employee")
}

// object -> jsonString
func getEmployee(employeeObject: Employee) -> String? {
    guard let employeeData = try? JSONEncoder().encode(employeeObject), let emmployeeString = String(data: employeeData, encoding: .utf8) else {
        return nil
    }
    
    return emmployeeString
}

let employee = Employee(name: "Bharani", age: 32, address: "Chennai")
if let employeeString = getEmployee(employeeObject: employee) {
    print("employee: \(employeeString)")
} else {
    print("Invalid Employee")
}

//: [Previous](@previous) | [Next](@next)
