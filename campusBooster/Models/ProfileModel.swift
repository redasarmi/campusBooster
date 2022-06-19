//
//  ProfileModel.swift
//  campusBooster
//
//  Created by Reda Sarmi on 19/06/2022.
//

import Foundation

struct Profile: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case first_name
        case last_name
        case email
        case gender
        case campus
        case year_in_cursus
    }
    
    let id = UUID()
    let first_name: String
    let last_name: String
    let email: String
    let gender: String
    let campus: String
    let year_in_cursus: Int
}

class ReadDataProfile: ObservableObject  {
    @Published var profiles = [Profile]()
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "supinfo", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let profiles = try? JSONDecoder().decode([Profile].self, from: data!)
        self.profiles = profiles!
    }
}
