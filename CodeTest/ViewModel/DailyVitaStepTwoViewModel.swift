//
//  DailyVitaStepTwoViewModel.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation
import Combine

class DailyVitaStepTwoViewModel: BaseViewModel {
    
    let getDietsList = CurrentValueSubject<[DietsVO], Never>([DietsVO]())
    
    func getDietsData() {
        let sub = readLocalJSONFile(forName: "Diets")
        sub.publisher.sink { [weak self] data in
            do {
                let dataResponse = try JSONDecoder().decode(DietsData.self, from: data)
                self?.getDietsList.send(dataResponse.data)
            } catch(let error) {
                print(error)
                self?.isDecodeError.send("Decode Error")
            }
        }
        .store(in: &bindings)
    }
    
}
