
import SwiftUI

struct SearchResultView: View {
    
    @EnvironmentObject var dataService: FoodDataService
    var query: String
    
    // filtreleme yaptık.
    var filteredFoods: [Food] {
        if query.isEmpty { return [] }
        return dataService.allFoods.filter { $0.name.localizedCaseInsensitiveContains(query) }
    }
    
    
    var body: some View {
        
        List(filteredFoods) { food in
            NavigationLink(destination: FoodDetailView(food: food)) {
                
                HStack {
                    Image(food.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading) {
                        Text(food.name)
                            .font(.headline)
                        Text("Süre: \(food.cookingTime) dk")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationTitle("Sonuçlar")
    }
}

#Preview {
    SearchResultView( query: "p")
        .environmentObject(FoodDataService())
}

