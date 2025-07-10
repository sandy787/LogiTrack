import SwiftUI

struct Agent: Identifiable, Hashable {
    let id: String
    let name: String
    let email: String
    var deliveries: [Delivery]
}

struct CompanyDashboardView: View {
    var companyID: String?
    var partnerID: String?
    @State private var agents: [Agent] = [
        Agent(id: "A1", name: "Agent One", email: "one@company.com", deliveries: [
            Delivery(id: "ORD201", customerName: "Ravi Kumar", address: "Mumbai, India", phone: "9000000001", notes: "", status: .assigned, estimatedDistance: "3.2 km", location: (19.0760, 72.8777))
        ]),
        Agent(id: "A2", name: "Agent Two", email: "two@company.com", deliveries: [
            Delivery(id: "ORD202", customerName: "Priya Singh", address: "Delhi, India", phone: "9000000002", notes: "", status: .picked, estimatedDistance: "5.1 km", location: (28.6139, 77.2090))
        ])
    ]
    @State private var showAddAgent = false
    @State private var newAgentName = ""
    @State private var newAgentEmail = ""
    @State private var showAssignDelivery = false
    @State private var selectedAgent: Agent? = nil
    @State private var newDeliveryCustomer = ""
    @State private var newDeliveryAddress = ""
    @State private var newDeliveryPhone = ""
    @State private var newDeliveryNotes = ""
    @State private var newDeliveryLocation = (lat: 19.0760, lng: 72.8777)
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Partner ID: \(partnerID ?? "-")")
                    .font(.caption)
                    .padding(.top)
                HStack {
                    Text("Agents")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    Button(action: { showAddAgent = true }) {
                        Label("Add Agent", systemImage: "plus")
                    }
                }
                List {
                    ForEach(agents) { agent in
                        Section(header: Text(agent.name).font(.headline)) {
                            Text(agent.email)
                                .font(.caption)
                            ForEach(agent.deliveries) { delivery in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Order: \(delivery.id)")
                                        Text(delivery.customerName)
                                            .font(.caption)
                                        Text(delivery.address)
                                            .font(.caption2)
                                    }
                                    Spacer()
                                    StatusBadgeView(status: delivery.status)
                                }
                            }
                            Button("Assign Delivery") {
                                selectedAgent = agent
                                showAssignDelivery = true
                            }
                            .font(.caption)
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Company Dashboard")
            .sheet(isPresented: $showAddAgent) {
                VStack(spacing: 24) {
                    Text("Add New Agent")
                        .font(.headline)
                    TextField("Agent Name", text: $newAgentName)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    TextField("Agent Email", text: $newAgentEmail)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    Button("Add") {
                        let newAgent = Agent(id: UUID().uuidString.prefix(6).description, name: newAgentName, email: newAgentEmail, deliveries: [])
                        agents.append(newAgent)
                        newAgentName = ""
                        newAgentEmail = ""
                        showAddAgent = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    Button("Cancel") {
                        showAddAgent = false
                    }
                    .foregroundColor(.red)
                }
                .padding()
            }
            .sheet(isPresented: $showAssignDelivery) {
                VStack(spacing: 24) {
                    Text("Assign Delivery to \(selectedAgent?.name ?? "")")
                        .font(.headline)
                    TextField("Customer Name", text: $newDeliveryCustomer)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    TextField("Address (India)", text: $newDeliveryAddress)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    TextField("Phone", text: $newDeliveryPhone)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    TextField("Notes", text: $newDeliveryNotes)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    Button("Assign") {
                        if let idx = agents.firstIndex(where: { $0.id == selectedAgent?.id }) {
                            let newDelivery = Delivery(
                                id: "ORD-\(Int.random(in: 100...999))",
                                customerName: newDeliveryCustomer,
                                address: newDeliveryAddress,
                                phone: newDeliveryPhone,
                                notes: newDeliveryNotes,
                                status: .assigned,
                                estimatedDistance: "--",
                                location: newDeliveryLocation
                            )
                            agents[idx].deliveries.append(newDelivery)
                        }
                        newDeliveryCustomer = ""
                        newDeliveryAddress = ""
                        newDeliveryPhone = ""
                        newDeliveryNotes = ""
                        showAssignDelivery = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    Button("Cancel") {
                        showAssignDelivery = false
                    }
                    .foregroundColor(.red)
                }
                .padding()
            }
        }
    }
}

#Preview {
    CompanyDashboardView(companyID: "COMPANY123", partnerID: "PARTNER123")
} 