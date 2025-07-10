import SwiftUI

struct Delivery: Identifiable, Hashable, Equatable {
    let id: String
    let customerName: String
    let address: String
    let phone: String
    let notes: String
    var status: DeliveryStatus
    let estimatedDistance: String
    let location: (lat: Double, lng: Double)
    
    static func == (lhs: Delivery, rhs: Delivery) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum DeliveryStatus: String, CaseIterable, Identifiable {
    case assigned = "Assigned"
    case picked = "Picked"
    case delivered = "Delivered"
    var id: String { rawValue }
}

struct DashboardView: View {
    @State private var deliveries: [Delivery] = [
        Delivery(id: "ORD123", customerName: "Alice Smith", address: "123 Main St, Springfield", phone: "555-1234", notes: "Leave at door", status: .assigned, estimatedDistance: "2.5 km", location: (37.7749, -122.4194)),
        Delivery(id: "ORD124", customerName: "Bob Johnson", address: "456 Oak Ave, Springfield", phone: "555-5678", notes: "Call on arrival", status: .picked, estimatedDistance: "4.1 km", location: (37.7799, -122.4149)),
        Delivery(id: "ORD125", customerName: "Carol Lee", address: "789 Pine Rd, Springfield", phone: "555-9012", notes: "Beware of dog", status: .delivered, estimatedDistance: "1.8 km", location: (37.7849, -122.4094))
    ]
    @State private var selectedDelivery: Delivery?
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Assigned Deliveries")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                List {
                    ForEach(deliveries) { delivery in
                        Button(action: {
                            selectedDelivery = delivery
                        }) {
                            DeliveryCardView(delivery: delivery)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .contextMenu {
                            ForEach(DeliveryStatus.allCases) { status in
                                Button(action: {
                                    if let idx = deliveries.firstIndex(where: { $0.id == delivery.id }) {
                                        deliveries[idx].status = status
                                    }
                                }) {
                                    Label(status.rawValue, systemImage: status == .assigned ? "tray" : status == .picked ? "shippingbox" : "checkmark.seal")
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationDestination(item: $selectedDelivery) { delivery in
                OrderDetailView(delivery: delivery)
            }
        }
    }
}

#Preview {
    DashboardView()
} 