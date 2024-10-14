//
//  JobResponse.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

struct JobResponse: Codable {
    let page: Int
    let size: Int
    let total: Int
    let hasNext: Bool
    let jobs: [Job]
}
