import Foundation

// ****** jsonString ******
let employeesString = """
[
{
"name":"Vinoth",
"age":34,
},
{
"name":"Bharani",
"age":32,
},
{
"name":"Sabdhu",
"age":30,
},
{
"name":"Preasanna",
"age":44,
}
]
"""

// ****** Object ******
struct Employee: Codable {
    var name: String
    var age: Int
}

// jsonString -> Objects
func getEmployee(employeesString: String) -> [Employee] {
    guard let employeeData = employeesString.data(using: .utf8), let employeeObject = try? JSONDecoder().decode([Employee].self, from: employeeData) else {
        return []
    }
    return employeeObject
}

let employees = getEmployee(employeesString: employeesString)
for employee in employees {
    print("name: \(employee.name), age: \(employee.age)")
}


// object Array -> jsonString
func getEmployee(employeesObject: [Employee]) -> String? {
    guard let employeeData = try? JSONEncoder().encode(employeesObject), let emmployeesString = String(data: employeeData, encoding: .utf8) else {
        return nil
    }
    return emmployeesString
}

let employee1 = Employee(name: "Vinoth", age: 34)
let employee2 = Employee(name: "Bharani", age: 32)
let employee3 = Employee(name: "Prasanna", age: 44)
let employee4 = Employee(name: "Sabdhu", age: 30)

let employeeObjects = [employee1, employee2, employee3, employee4]
let jsonString = getEmployee(employeesObject: employeeObjects)
print(jsonString ?? "Invalid employees")

//: [Previous](@previous) | [Next](@next)

