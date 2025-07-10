import Foundation

enum UserType: String, CaseIterable, Identifiable {
    case agent = "Agent"
    case company = "Company"
    var id: String { rawValue }
} 