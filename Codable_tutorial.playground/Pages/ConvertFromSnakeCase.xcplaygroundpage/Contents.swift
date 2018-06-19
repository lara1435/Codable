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
    var residedAt: String
}

func getEmployee(employeeString: String) -> Employee? {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    guard let employeeData = employeeString.data(using: .utf8), let employeeObject = try? decoder.decode(Employee.self, from: employeeData) else {
        return nil
    }
    
    return employeeObject
}

func getEmployee(employeeObject: Employee) -> String? {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    guard let employeeData = try? encoder.encode(employeeObject), let emmployeeString = String(data: employeeData, encoding: .utf8) else {
        return nil
    }
    
    return emmployeeString
}

// jsonString -> Object
if let employee = getEmployee(employeeString: employeeString) {
    print("name: \(employee.name), age: \(employee.age), residedAt: \(employee.residedAt)")
} else {
    print("Invalid Employee")
}

// object -> jsonString
let employee = Employee(name: "Bharani", age: 32, residedAt: "Chennai")
if let employeeString = getEmployee(employeeObject: employee) {
    print("employee: \(employeeString)")
} else {
    print("Invalid Employee")
}

//: [Previous](@previous) | [Next](@next)
