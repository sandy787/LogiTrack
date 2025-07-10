import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var isShowingSignup: Bool
    var registeredEmail: String?
    var registeredPassword: String?
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("LogiTrack Lite")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                }
                Button(action: {
                    // Dummy login logic
                    if let regEmail = registeredEmail, let regPwd = registeredPassword {
                        if email == regEmail && password == regPwd {
                            isLoggedIn = true
                        } else {
                            showError = true
                        }
                    } else if !email.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                    } else {
                        showError = true
                    }
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top)
                if showError {
                    Text("Invalid email or password.")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                HStack {
                    Text("Don't have an account?")
                        .font(.caption)
                    Button("Sign up") {
                        isShowingSignup = true
                    }
                    .font(.caption)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false), isShowingSignup: .constant(false), registeredEmail: nil, registeredPassword: nil)
} 