import SwiftUI
import MapKit

struct OrderDetailView: View {
    let delivery: Delivery
    @State private var region: MKCoordinateRegion
    init(delivery: Delivery) {
        self.delivery = delivery
        _region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: delivery.location.lat, longitude: delivery.location.lng), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Order ID: \(delivery.id)")
                    .font(.headline)
                StatusBadgeView(status: delivery.status)
                Divider()
                Text("Customer: \(delivery.customerName)")
                Text("Phone: \(delivery.phone)")
                Text("Address: \(delivery.address)")
                if !delivery.notes.isEmpty {
                    Text("Notes: \(delivery.notes)")
                }
                Divider()
                Text("Delivery Location")
                    .font(.subheadline)
                Map(coordinateRegion: $region, annotationItems: [delivery]) { item in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: item.location.lat, longitude: item.location.lng), tint: .accentColor)
                }
                .frame(height: 220)
            }
            .padding()
        }
        .navigationTitle("Order Details")
    }
}

#Preview {
    OrderDetailView(delivery: Delivery(id: "ORD123", customerName: "Alice Smith", address: "123 Main St", phone: "555-1234", notes: "Leave at door", status: .assigned, estimatedDistance: "2.5 km", location: (37.7749, -122.4194)))
} 