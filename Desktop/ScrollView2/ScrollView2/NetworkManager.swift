//
//  NetworkManager.swift
//  ScrollView2
//
//  Created by vijay-pt5416 on 21/06/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var paragraph: [String] = [""] // string from API
    @Published var text2: String = "" // static string
    @Published var loading: Bool = false
    
    func fetchDetails() {
        self.text2 = "This is para 2"
        self.loading = true
        guard let url = URL(string: "https://baconipsum.com/api/?type=meat-and-filler?paras=2") else {
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let data = data else {
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode([String].self, from: data)
                    
                    DispatchQueue.main.async {
//                        for para in self.paragraph {
//                            self.text += para
//                        }
                        self.paragraph = result
                        self.loading = false
                    }
        
                }
                catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
