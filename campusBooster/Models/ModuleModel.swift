//
//  ModuleModel.swift
//  campusBooster
//
//  Created by Reda Sarmi on 19/06/2022.
//

import Foundation

enum Category: String {
    case ArchitectureAndNetwork = "Architecture and Network"
    case Development = "Development"
    case Managment = "Managment"
    case Other = "Other"
}

struct Module: Codable, Identifiable {
    enum ModuleKeys: CodingKey {
        case first_name
        case last_name
        case email
        case gender
        case campus
        case year_in_cursus
    }
    
    let id = UUID()
    let moduleName: String
    let category: Category.RawValue
    let grade: Int
    let year: Int
}

class ReadDataModule: ObservableObject  {
    @Published var modules = [Module]()
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "student_marks", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let modules = try? JSONDecoder().decode([Module].self, from: data!)
        self.modules = modules!
    }
}
