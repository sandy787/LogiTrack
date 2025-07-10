import SwiftUI

struct MainTabView: View {
    @Binding var isLoggedIn: Bool
    var registeredName: String?
    var registeredEmail: String?
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView(isLoggedIn: $isLoggedIn, registeredName: registeredName, registeredEmail: registeredEmail)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView(isLoggedIn: .constant(true), registeredName: "John Doe", registeredEmail: "agent@example.com")
} 