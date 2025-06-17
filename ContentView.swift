import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var output = ""
    @ObservedObject private var chatGPT = ChatGPTService()

    var body: some View {
        VStack {
            TextField("Ask ChatGPT...", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Send") {
                chatGPT.sendMessage(input) { response in
                    DispatchQueue.main.async {
                        self.output = response ?? "No response"
                    }
                }
            }
            .padding()

            ScrollView {
                Text(output)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}
