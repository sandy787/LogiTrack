import SwiftUI

struct DeliveryCardView: View {
    let delivery: Delivery
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(delivery.id)
                    .font(.headline)
                Spacer()
                StatusBadgeView(status: delivery.status)
            }
            Text(delivery.customerName)
                .font(.subheadline)
            Text(delivery.address)
                .font(.caption)
                .foregroundColor(.secondary)
            HStack {
                Text("Distance: \(delivery.estimatedDistance)")
                    .font(.caption2)
                Spacer()
            }
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color(.systemGray4), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    DeliveryCardView(delivery: Delivery(id: "ORD123", customerName: "Alice Smith", address: "123 Main St", phone: "555-1234", notes: "Leave at door", status: .assigned, estimatedDistance: "2.5 km", location: (37.7749, -122.4194)))
} 