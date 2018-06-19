import Foundation

// ****** jsonString ******
let employeeString = """
{
"name":"Vinoth",
"age":34,
"resided_at":"Madurai",
"department":"Store"
}
"""

// ****** Object ******

struct Department: Codable {
    var name: String
}

struct Employee: Codable {
    var name: String
    var age: Int
    var address: String
    var department: Department
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case address = "resided_at"
        case department
    }
}

extension Employee {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        age = try values.decode(Int.self, forKey: .age)
        address = try values.decode(String.self, forKey: .address)
        
        let departmentName = try values.decode(String.self, forKey: .department)
        department = Department(name: departmentName)
    }
}

extension Employee {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(address, forKey: .address)
        try container.encode(department.name, forKey: .department)
    }
}

// jsonString -> Object
func getEmployee(employeeString: String) -> Employee? {
    print("\(employeeString)")
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

let department = Department(name: "iOS Development")
let employee = Employee(name: "Bharani", age: 32, address: "Chennai", department: department)
if let employeeString = getEmployee(employeeObject: employee) {
    print("employee: \(employeeString)")
} else {
    print("Invalid Employee")
}

//: [Previous](@previous) | [Next](@next)
