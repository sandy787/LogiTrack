import SwiftUI

struct SignupView: View {
    @Binding var isShowingSignup: Bool
    @Binding var registeredEmail: String?
    @Binding var registeredPassword: String?
    @Binding var registeredName: String?
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var partnerID = ""
    @State private var showError = false
    @State private var errorMessage = ""
    let validPartnerID = "PARTNER123"
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack(spacing: 16) {
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
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
                    TextField("Partner ID", text: $partnerID)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                }
                Button(action: {
                    if name.isEmpty || email.isEmpty || password.isEmpty || partnerID.isEmpty {
                        errorMessage = "All fields are required."
                        showError = true
                    } else if partnerID != validPartnerID {
                        errorMessage = "Invalid Partner ID."
                        showError = true
                    } else {
                        registeredEmail = email
                        registeredPassword = password
                        registeredName = name
                        isShowingSignup = false
                    }
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top)
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                HStack {
                    Text("Already have an account?")
                        .font(.caption)
                    Button("Login") {
                        isShowingSignup = false
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
    SignupView(isShowingSignup: .constant(true), registeredEmail: .constant(nil), registeredPassword: .constant(nil), registeredName: .constant(nil))
} 