//
//  DailyVitaStepOneViewModel.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation
import Combine

class DailyVitaStepOneViewModel: BaseViewModel {
    
    let getHealthConcernsList = CurrentValueSubject<[HealthConcernVO], Never>([HealthConcernVO]())
    
    func getHealthConcernsData() {
        let sub = readLocalJSONFile(forName: "Healthconcern")
        sub.publisher.sink { [weak self] data in
            do {
                let dataResponse = try JSONDecoder().decode(HealthConcernData.self, from: data)
                self?.getHealthConcernsList.send(dataResponse.data)
            } catch(let error) {
                print(error)
                self?.isDecodeError.send("Decode Error")
            }
        }
        .store(in: &bindings)

    }
    
}
