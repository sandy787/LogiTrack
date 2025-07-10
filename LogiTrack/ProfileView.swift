import SwiftUI

struct ProfileView: View {
    @Binding var isLoggedIn: Bool
    var registeredName: String?
    var registeredEmail: String?
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.accentColor)
                Text("Agent Name: \(registeredName ?? "John Doe")")
                    .font(.title2)
                Text("Email: \(registeredEmail ?? "agent@example.com")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: {
                    isLoggedIn = false
                }) {
                    Text("Logout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView(isLoggedIn: .constant(true), registeredName: "John Doe", registeredEmail: "agent@example.com")
} 