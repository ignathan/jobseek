//
//  MasterModel.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

struct Job: Codable {
    let id: String
    let positionTitle: String
    let description: String
    let company: Company
    let salaryRange: SalaryRange
    let location: String
    let industry: String
    let status: Status
    let createdAt: String
    let updatedAt: String
    let applied: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case positionTitle,
             description,
             company,
             salaryRange,
             location,
             industry,
             status,
             createdAt,
             updatedAt,
             applied
    }
}

struct Company: Codable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}

struct SalaryRange: Codable {
    let min: Int
    let max: Int
}

enum Status: String, Codable {
    case DRAFT
    case PUBLISHED
    case EXPIRED
    case BANNED
}
