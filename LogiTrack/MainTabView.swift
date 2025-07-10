import SwiftUI

struct MainTabView: View {
    @Binding var isLoggedIn: Bool
    var registeredName: String?
    var registeredEmail: String?
    var userType: UserType
    var companyID: String?
    var partnerID: String?
    var body: some View {
        TabView {
            if userType == .company {
                CompanyDashboardView(companyID: companyID, partnerID: partnerID)
                    .tabItem {
                        Label("Company", systemImage: "building.2")
                    }
            } else {
                DashboardView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
            }
            ProfileView(isLoggedIn: $isLoggedIn, registeredName: registeredName, registeredEmail: registeredEmail)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView(isLoggedIn: .constant(true), registeredName: "John Doe", registeredEmail: "agent@example.com", userType: .agent, companyID: nil, partnerID: nil)
} 