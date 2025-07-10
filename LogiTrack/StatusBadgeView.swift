import SwiftUI

struct StatusBadgeView: View {
    let status: DeliveryStatus
    var color: Color {
        switch status {
        case .assigned: return .blue
        case .picked: return .orange
        case .delivered: return .green
        }
    }
    var body: some View {
        Text(status.rawValue)
            .font(.caption2)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.15))
            .foregroundColor(color)
            .cornerRadius(8)
    }
}

#Preview {
    StatusBadgeView(status: .assigned)
} 