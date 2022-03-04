//
//  ContentView.swift
//  SwiftUIAPICalls
//
//  Created by Robert Shrestha on 2/14/22.
//

import SwiftUI


struct URLImage: View {
    let urlString: String

    @State var data: Data?

    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 130, height: 70)
                .aspectRatio( contentMode: .fill)
                .background(.gray)
        } else {
            Image(systemName: "Video")
                .resizable()
                .frame(width: 130, height: 70)
                .aspectRatio( contentMode: .fill)
                .background(.gray)
                .onAppear {
                    fetch()
                }
        }
    }
    private func fetch() {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _ , _ in
            self.data = data

        }
        task.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses,id: \.self) {
                    course in
                    HStack {
                        URLImage(urlString: course.image, data: nil)
                        VStack {
                            Text(course.name)
                                .bold()
                            Spacer()
                        }

                    }
                    .padding(3)
                }
            }
            .navigationTitle("Courses")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetch()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
