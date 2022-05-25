import SwiftUI
import PlaygroundSupport

struct LoginForm: View {
    @State private var username = ""
    @State private var password = ""

//    @FocusState var usernameFocused: Bool
//    @FocusState var passwordFocused: Bool

    enum Field: Hashable {
        case username
        case password
    }

    @FocusState var focusedField: Field?

    var body: some View {
        print("FocusedField is: \(focusedField)")
        return VStack {
            Form {
                TextField("Username", text: $username)
                    .focused($focusedField, equals: .username)

                SecureField("Password", text: $password)
                    .focused($focusedField, equals: .password)

                Button("Sign In") {
                    if username.isEmpty {
                        focusedField = .username
                    } else if password.isEmpty {
                        focusedField = .password
                    } else {
                        print("Sign in")
                    }
                }
            }
        }
        .onAppear {
            // yuck
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                focusedField = .username
            }
        }
    }
}


PlaygroundPage.current.liveView = UIHostingController(rootView: LoginForm())

