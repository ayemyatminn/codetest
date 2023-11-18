//
//  ResultVO.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation

struct ResultVO: Codable {
    let health_concerns: [HealthConcernVO]
    let diets: [DietsVO]?
    let is_daily_exposure: Bool
    let is_smoke: Bool
    let alchol: String
    let allergies: [AllergiesVO]
}
