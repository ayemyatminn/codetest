//
//  DailyVitaStepThreeViewModel.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation
import Combine

class DailyVitaStepThreeViewModel: BaseViewModel {
    
    let getAllergiesList = CurrentValueSubject<[AllergiesVO], Never>([AllergiesVO]())
    
    func getAllergiesData() {
        let sub = readLocalJSONFile(forName: "allergies")
        sub.publisher.sink { [weak self] data in
            do {
                let dataResponse = try JSONDecoder().decode(AllergiesData.self, from: data)
                self?.getAllergiesList.send(dataResponse.data)
            } catch(let error) {
                print(error)
                self?.isDecodeError.send("Decode Error")
            }
        }
        .store(in: &bindings)
    }
    
}
