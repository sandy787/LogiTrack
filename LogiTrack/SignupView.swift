import SwiftUI

struct SignupView: View {
    @Binding var isShowingSignup: Bool
    @Binding var registeredEmail: String?
    @Binding var registeredPassword: String?
    @Binding var registeredName: String?
    @Binding var loggedInUserType: UserType?
    @Binding var companyID: String?
    @Binding var partnerID: String?
    @Binding var isLoggedIn: Bool
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var partnerIDField = ""
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var selectedUserType: UserType = .agent
    @State private var showPartnerIDSheet = false
    @State private var generatedCompanyID: String = ""
    @State private var generatedPartnerID: String = ""
    let dummyValidPartnerIDs = ["PARTNER123", "PARTNER456"] // For agent validation demo
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Picker("User Type", selection: $selectedUserType) {
                    ForEach(UserType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                VStack(spacing: 16) {
                    TextField(selectedUserType == .company ? "Company Name" : "Name", text: $name)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    TextField(selectedUserType == .company ? "Company Email" : "Email", text: $email)
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
                    if selectedUserType == .agent {
                        TextField("Partner ID", text: $partnerIDField)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                    }
                }
                Button(action: {
                    if name.isEmpty || email.isEmpty || password.isEmpty || (selectedUserType == .agent && partnerIDField.isEmpty) {
                        errorMessage = "All fields are required."
                        showError = true
                    } else if selectedUserType == .agent && !dummyValidPartnerIDs.contains(partnerIDField) {
                        errorMessage = "Invalid Partner ID."
                        showError = true
                    } else if selectedUserType == .company {
                        // Generate company and partner IDs
                        let companyIDVal = String(UUID().uuidString.prefix(8))
                        let partnerIDVal = "PARTNER-" + String(UUID().uuidString.prefix(8))
                        generatedCompanyID = companyIDVal
                        generatedPartnerID = partnerIDVal
                        registeredEmail = email
                        registeredPassword = password
                        registeredName = name
                        loggedInUserType = .company
                        companyID = companyIDVal
                        partnerID = partnerIDVal
                        showPartnerIDSheet = true
                        isLoggedIn = true // auto-login for demo
                    } else {
                        // Agent signup success
                        registeredEmail = email
                        registeredPassword = password
                        registeredName = name
                        loggedInUserType = .agent
                        companyID = nil
                        partnerID = partnerIDField
                        isShowingSignup = false
                        isLoggedIn = true // auto-login for demo
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
            .sheet(isPresented: $showPartnerIDSheet) {
                VStack(spacing: 24) {
                    Text("Company Created!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Your Company ID:")
                        .font(.caption)
                    Text(generatedCompanyID)
                        .font(.headline)
                        .padding(.bottom, 8)
                    Text("Your Partner ID (share with agents):")
                        .font(.caption)
                    HStack {
                        Text(generatedPartnerID)
                            .font(.headline)
                        Button(action: {
                            UIPasteboard.general.string = generatedPartnerID
                        }) {
                            Image(systemName: "doc.on.doc")
                        }
                    }
                    Button("Done") {
                        showPartnerIDSheet = false
                    }
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}

#Preview {
    SignupView(isShowingSignup: .constant(true), registeredEmail: .constant(nil), registeredPassword: .constant(nil), registeredName: .constant(nil), loggedInUserType: .constant(nil), companyID: .constant(nil), partnerID: .constant(nil), isLoggedIn: .constant(false))
} 