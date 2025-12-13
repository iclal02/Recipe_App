//
//  SortControlView.swift
//  cookWme
//
//  Created by icos on 3.12.2025.
//

import SwiftUI

struct SortControlView: View {
    
    @Binding var selectedCriteria: SortCriteria
    @Binding var selectedOrder: SortOrder
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                // MARK: - ÜST BAŞLIK
                HStack {
                    Text("Sırala")
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: isExpanded)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .onTapGesture {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        isExpanded.toggle()
                    }
                }
                
                // MARK: - İÇERİK (AÇILIR)
                if isExpanded {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // KRİTER
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Kriter")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Picker("Kriter", selection: $selectedCriteria) {
                                ForEach(SortCriteria.allCases) { criteria in
                                    Label(criteria.rawValue,
                                          systemImage: icon(for: criteria))
                                    .tag(criteria)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(10)
                            .background(.thinMaterial)
                            .cornerRadius(10)
                        }
                        
                        // YÖN
                        if selectedCriteria != .none {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Sıralama Yönü")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Picker("Order", selection: $selectedOrder) {
                                    ForEach(SortOrder.allCases) { order in
                                        Label(order.rawValue,
                                              systemImage: order == .ascending ? "arrow.up" : "arrow.down")
                                        .tag(order)
                                    }
                                }
                                .pickerStyle(.segmented)
                            }
                        }
                    }
                    .padding(14)
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
        }
        .background(.ultraThinMaterial) // CAM EFEKTİ
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 12, x: 0, y: 5)
        .padding(.horizontal)
        .padding(.top, 8)
    }
    
    private func icon(for criteria: SortCriteria) -> String {
        switch criteria {
        case .none: return "circle"
        case .difficulty: return "flame"
        case .cookingTime: return "clock"
        }
    }
}


#Preview {
    SortControlView(selectedCriteria:.constant(.none), selectedOrder:.constant(SortOrder.ascending))
        .environmentObject(FoodDataService())
}

