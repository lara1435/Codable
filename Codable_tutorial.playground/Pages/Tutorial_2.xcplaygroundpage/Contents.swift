import Foundation

// object -> jsonString   => Encode
// jsonString -> Object   => Decode

// Encode => Encodable protocol
// Decode => Decodable protocol

// Codable => typealias => Encodable & Decodable

// ****** jsonString ******
let employeesString = """
[
{
"name":"Vinoth",
"age":34,
"resided_at":"Madurai"
},
{
"name":"Bharani",
"age":32,
"resided_at":"Chennai"
},
{
"name":"Sabdhu",
"age":30,
"resided_at":"USA"
},
{
"name":"Preasanna",
"age":44,
"resided_at":"Chennai"
}
]
"""

// ****** Object ******
struct Employee: Codable {
    var name: String
    var age: Int
}

func getEmployee(employeesString: String) -> [Employee] {
    guard let employeeData = employeesString.data(using: .utf8), let employeeObject = try? JSONDecoder().decode([Employee].self, from: employeeData) else {
        return []
    }
    
    return employeeObject
}

func getEmployee(employeesObject: [Employee]) -> String? {
    guard let employeeData = try? JSONEncoder().encode(employeesObject), let emmployeesString = String(data: employeeData, encoding: .utf8) else {
        return nil
    }
    
    return emmployeesString
}

// jsonString -> Objects
let employees = getEmployee(employeesString: employeesString)
for employee in employees {
    print("name: \(employee.name), age: \(employee.age)")
}


let employee1 = Employee(name: "Vinoth", age: 34)
let employee2 = Employee(name: "Bharani", age: 32)
let employee3 = Employee(name: "Prasanna", age: 44)
let employee4 = Employee(name: "Sabdhu", age: 30)

let employeeObjects = [employee1, employee2, employee3, employee4]
let jsonString = getEmployee(employeesObject: employeeObjects)
print(jsonString ?? "Invalid employees")
//: [Next](@next)

