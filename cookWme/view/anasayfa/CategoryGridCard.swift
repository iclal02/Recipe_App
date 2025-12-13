//
//  CategoryGridCard.swift
//  cookWme
//
//  Created by icos on 1.12.2025.
//


import SwiftUI


struct CategoryGridCard: View {
    
    // Categories modelinden veri alıyor
    let category: Categories
    
    var body: some View {
        // Tıklanınca liste sayfasına giden NavigationLink
        NavigationLink(destination: FoodListView(selectedCategory: category)) {
            
            ZStack(alignment: .bottomLeading) {
                
                // Resim yer tutucu
                Image(category.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:183 ,height: 150)
                    .clipped()
                    .cornerRadius(12)
                
                // Gölgelendirme
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.6)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .cornerRadius(12)
                
                // Kategori Adı
                Text(category.name)
                    .font(.title3).bold()
                    .foregroundColor(.white)
                    .padding(10)
                
            }
            .aspectRatio(4/3, contentMode: .fit) // Tasarımdaki oran
        }
        // .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    CategoryGridCard(category:Categories.tumKategoriler[1])
        .environmentObject(FoodDataService())
}

