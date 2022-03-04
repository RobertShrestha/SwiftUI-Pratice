//
//  ViewModel.swift
//  SwiftUIAPICalls
//
//  Created by Robert Shrestha on 2/14/22.
//

import Foundation

struct Courses: Hashable, Codable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject {
    @Published var courses: [Courses] = []

    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self, let data = data, error == nil else {
                return
            }
            do {
                let courses = try JSONDecoder().decode([Courses].self, from: data)
                DispatchQueue.main.async {
                    self.courses = courses
                }

            } catch(let error) {
                print(error)
            }

        }
        task.resume()
    }


}
