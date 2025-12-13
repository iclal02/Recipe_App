
import Foundation

struct FoodData {
    static let ornekYemekler: [Food] = [
        
        // Domates Çorbası
        Food(
            imageName: "domates_corbasi_resmi",
            name: "Domates Çorbası",
            cookingTime: 25,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "5 adet Domates"),
                Ingredient(name: "1 yemek kaşığı Un"),
                Ingredient(name: "2 yemek kaşığı Tereyağı")
            ],
            recipe: [
                "Domatesleri haşlayıp blenderdan geçirin.",
                "Tereyağında unu kavurun.",
                "Domates püresini ve suyu ekleyip karıştırarak pişirin."
            ],
            categories: "Çorba",
            isFavorite: true
        ),
        
        // Tavuklu Makarna Salatası
        Food(
            imageName: "makarna_salatasi",
            name: "Tavuklu Makarna Salatası",
            cookingTime: 40,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "200 gram Tavuk Göğsü"),
                Ingredient(name: "Yarım paket Makarna"),
                Ingredient(name: "200 gram Yoğurt")
            ],
            recipe: [
                "Makarnayı haşlayın ve süzün.",
                "Tavukları didin.",
                "Tüm malzemeleri yoğurt ve baharatlarla karıştırın."
            ],
            categories: "Öğle Yemeği",
            isFavorite: false
        ),
        
        // Sufle
        Food(
            imageName: "sufle_resmi",
            name: "Sufle",
            cookingTime: 60,
            dificultlyLevel: .hard,
            ingredients: [
                Ingredient(name: "100 gram Bitter Çikolata"),
                Ingredient(name: "2 adet Yumurta"),
                Ingredient(name: "3 yemek kaşığı Şeker")
            ],
            recipe: [
                "Çikolatayı eritip diğer malzemelerle karıştırın.",
                "Fırında kabarana kadar pişirin."
            ],
            categories: "Tatlı",
            isFavorite: false
        ),
        
        // Mercimek Çorbası
        Food(
            imageName: "mercimek_corbasi",
            name: "Mercimek Çorbası",
            cookingTime: 30,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 su bardağı Kırmızı Mercimek"),
                Ingredient(name: "1 adet Soğan"),
                Ingredient(name: "1 yemek kaşığı Tereyağı")
            ],
            recipe: [
                "Soğanı kavurun.",
                "Mercimeği ekleyin.",
                "Su koyup yumuşayana kadar kaynatın, blenderdan geçirin."
            ],
            categories: "Çorba",
            isFavorite: false
        ),
        
        // Ezogelin Çorbası
        Food(
            imageName: "ezogelin",
            name: "Ezogelin Çorbası",
            cookingTime: 35,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "1 su bardağı Mercimek"),
                Ingredient(name: "2 yemek kaşığı Bulgur"),
                Ingredient(name: "1 kaşık Domates Salçası")
            ],
            recipe: [
                "Salçayı kavurun.",
                "Bakliyatları ekleyin.",
                "Suda pişirip baharatlayın."
            ],
            categories: "Çorba",
            isFavorite: false
        ),
        
        // Yayla Çorbası
        Food(
            imageName: "yayla_corbasi",
            name: "Yayla Çorbası",
            cookingTime: 25,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 kase Yoğurt"),
                Ingredient(name: "1 adet Yumurta"),
                Ingredient(name: "1 tatlı kaşığı Nane")
            ],
            recipe: [
                "Terbiyeyi hazırlayıp kaynayan suya ekleyin.",
                "Nane ile servis edin."
            ],
            categories: "Çorba",
            isFavorite: false
        ),
        
        // Tarhana Çorbası
        Food(
            imageName: "tarhana",
            name: "Tarhana Çorbası",
            cookingTime: 20,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "3 yemek kaşığı Tarhana"),
                Ingredient(name: "4 bardak Su"),
                Ingredient(name: "1 kaşık Tereyağı")
            ],
            recipe: [
                "Tarhanayı suyla açıp karıştırarak pişirin.",
                "Üzerine tereyağı gezdirin."
            ],
            categories: "Çorba",
            isFavorite: false
        ),
        
        // Sebze Çorbası
        Food(
            imageName: "sebze_corbasi",
            name: "Sebze Çorbası",
            cookingTime: 30,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 adet Patates"),
                Ingredient(name: "1 adet Havuç"),
                Ingredient(name: "1 adet Kabak")
            ],
            recipe: [
                "Sebzeleri doğrayın ve haşlayın.",
                "Blenderdan geçirip servis edin."
            ],
            categories: "Çorba",
            isFavorite: false
        ),
        
        // Menemen
        Food(
            imageName: "menemen",
            name: "Menemen",
            cookingTime: 15,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "2 adet Domates"),
                Ingredient(name: "1 adet Biber"),
                Ingredient(name: "2 adet Yumurta")
            ],
            recipe: [
                "Biber ve domatesi kavurun.",
                "Yumurtayı kırın ve pişirin."
            ],
            categories: "Kahvaltı",
            isFavorite: false
        ),
        
        // Peynirli Omlet
        Food(
            imageName: "omlet",
            name: "Peynirli Omlet",
            cookingTime: 10,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "2 adet Yumurta"),
                Ingredient(name: "50 gram Beyaz Peynir")
            ],
            recipe: [
                "Yumurtayı çırpın.",
                "Peynirle birlikte tavada pişirin."
            ],
            categories: "Kahvaltı",
            isFavorite: false
        ),
        
        // Pankek
        Food(
            imageName: "pankek",
            name: "Pankek",
            cookingTime: 20,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "1 su bardağı Un"),
                Ingredient(name: "1 su bardağı Süt"),
                Ingredient(name: "1 Yumurta")
            ],
            recipe: [
                "Tüm malzemeyi çırpın.",
                "Yağsız tavada pişirin."
            ],
            categories: "Kahvaltı",
            isFavorite: false
        ),
        
        // Simit Tabağı
        Food(
            imageName: "simit_tabağı",
            name: "Simit Tabağı",
            cookingTime: 5,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 adet Simit"),
                Ingredient(name: "50 gr Peynir"),
                Ingredient(name: "10 adet Zeytin")
            ],
            recipe: [
                "Malzemeleri servis tabağına dizin."
            ],
            categories: "Kahvaltı",
            isFavorite: false
        ),
        
        // Kaşarlı Tost
        Food(
            imageName: "kahvalti_tost",
            name: "Kaşarlı Tost",
            cookingTime: 7,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "2 dilim Kaşar"),
                Ingredient(name: "2 dilim Ekmek")
            ],
            recipe: [
                "Ekmeklerin arasına kaşar koyun.",
                "Tost makinesinde pişirin."
            ],
            categories: "Kahvaltı",
            isFavorite: false
        ),
        
        // Pilav
        Food(
            imageName: "pilav",
            name: "Pilav",
            cookingTime: 25,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 su bardağı Pirinç"),
                Ingredient(name: "1 kaşık Tereyağı")
            ],
            recipe: [
                "Pirinçleri kavurun.",
                "Üzerine su ekleyin ve pişirin."
            ],
            categories: "Öğle Yemeği",
            isFavorite: false
        ),
        
        // Mantı
        Food(
            imageName: "manti",
            name: "Mantı",
            cookingTime: 40,
            dificultlyLevel: .hard,
            ingredients: [
                Ingredient(name: "1 paket Mantı"),
                Ingredient(name: "1 kase Yoğurt")
            ],
            recipe: [
                "Mantıyı haşlayın.",
                "Yoğurt ve sosla karıştırın."
            ],
            categories: "Öğle Yemeği",
            isFavorite: false
        ),
        
        // Kuru Fasulye
        Food(
            imageName: "kuru_fasulye",
            name: "Kuru Fasulye",
            cookingTime: 60,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "2 su bardağı Fasulye"),
                Ingredient(name: "1 kaşık Salça")
            ],
            recipe: [
                "Fasulyeyi haşlayın.",
                "Salçayla birlikte pişirin."
            ],
            categories: "Öğle Yemeği",
            isFavorite: false
        ),
        
        // Tavuk Sote
        Food(
            imageName: "tavuk_sote",
            name: "Tavuk Sote",
            cookingTime: 25,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "300 gr Tavuk"),
                Ingredient(name: "1 adet Biber"),
                Ingredient(name: "1 adet Soğan")
            ],
            recipe: [
                "Tavuk ve sebzeleri kavurun.",
                "Pişirin."
            ],
            categories: "Öğle Yemeği",
            isFavorite: false
        ),
        
        // Makarna
        Food(
            imageName: "makarna",
            name: "Makarna",
            cookingTime: 15,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 paket Makarna"),
                Ingredient(name: "1 tatlı kaşığı Tuz")
            ],
            recipe: [
                "Makarnayı haşlayın.",
                "Süzün."
            ],
            categories: "Öğle Yemeği",
            isFavorite: false
        ),
        
        // Izgara Köfte
        Food(
            imageName: "kofte",
            name: "Izgara Köfte",
            cookingTime: 30,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "300 gr Kıyma"),
                Ingredient(name: "1 çay kaşığı Tuz")
            ],
            recipe: [
                "Harç hazırlayın.",
                "Köfte şekli verip pişirin."
            ],
            categories: "Akşam Yemeği",
            isFavorite: false
        ),
        
        // Fırında Somon
        Food(
            imageName: "balik",
            name: "Fırında Somon",
            cookingTime: 25,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 adet Somon"),
                Ingredient(name: "1 kaşık Zeytinyağı")
            ],
            recipe: [
                "Somonu yağlayın.",
                "Fırında pişirin."
            ],
            categories: "Akşam Yemeği",
            isFavorite: false
        ),
        
        // Patlıcan Musakka
        Food(
            imageName: "musakka",
            name: "Patlıcan Musakka",
            cookingTime: 40,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "2 adet Patlıcan"),
                Ingredient(name: "200 gr Kıyma")
            ],
            recipe: [
                "Patlıcanı kızartın.",
                "Kıymalı sos ile pişirin."
            ],
            categories: "Akşam Yemeği",
            isFavorite: false
        ),
        
        // Sebzeli Bulgur
        Food(
            imageName: "sebzeli_bulgur",
            name: "Sebzeli Bulgur",
            cookingTime: 20,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 su bardağı Bulgur"),
                Ingredient(name: "1 adet Havuç")
            ],
            recipe: [
                "Sebzeleri soteleyin.",
                "Bulgurla pişirin."
            ],
            categories: "Akşam Yemeği",
            isFavorite: false
        ),
        
        // Tavuklu Şehriye
        Food(
            imageName: "corba_aksam",
            name: "Tavuklu Şehriye",
            cookingTime: 25,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "150 gr Tavuk"),
                Ingredient(name: "1 avuç Şehriye")
            ],
            recipe: [
                "Tavuğu haşlayın.",
                "Şehriye ile pişirin."
            ],
            categories: "Akşam Yemeği",
            isFavorite: false
        ),
        
        // Sufle (Tatlı)
        Food(
            imageName: "sufle",
            name: "Sufle",
            cookingTime: 60,
            dificultlyLevel: .hard,
            ingredients: [
                Ingredient(name: "100 gr Bitter Çikolata"),
                Ingredient(name: "2 adet Yumurta")
            ],
            recipe: [
                "Çikolatayı eritin.",
                "Karıştırın ve fırında pişirin."
            ],
            categories: "Tatlı",
            isFavorite: false
        ),
        
        // Kazandibi
        Food(
            imageName: "kazandibi",
            name: "Kazandibi",
            cookingTime: 45,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "1 litre Süt"),
                Ingredient(name: "1 bardak Şeker")
            ],
            recipe: [
                "Muhallebiyi pişirin.",
                "Tabanı yakın."
            ],
            categories: "Tatlı",
            isFavorite: false
        ),
        
        // Trileçe
        Food(
            imageName: "trilece",
            name: "Trileçe",
            cookingTime: 60,
            dificultlyLevel: .hard,
            ingredients: [
                Ingredient(name: "3 bardak Süt"),
                Ingredient(name: "4 adet Yumurta")
            ],
            recipe: [
                "Keki hazırlayın.",
                "Sütlü sosla ıslatın."
            ],
            categories: "Tatlı",
            isFavorite: false
        ),
        
        // Supangle
        Food(
            imageName: "supangle",
            name: "Supangle",
            cookingTime: 20,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "3 bardak Süt"),
                Ingredient(name: "3 kaşık Kakao")
            ],
            recipe: [
                "Tüm malzemeyi pişirin.",
                "Soğutun."
            ],
            categories: "Tatlı",
            isFavorite: false
        ),
        
        // Tiramisu
        Food(
            imageName: "tiramisu",
            name: "Tiramisu",
            cookingTime: 30,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "200 gr Labne"),
                Ingredient(name: "1 paket Kedi Dili")
            ],
            recipe: [
                "Kedi dillerini ıslatın.",
                "Kremayla katlayın."
            ],
            categories: "Tatlı",
            isFavorite: false
        ),
        
        // Patates Kızartması
        Food(
            imageName: "patates_kizartma",
            name: "Patates Kızartması",
            cookingTime: 20,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "2 adet Patates"),
                Ingredient(name: "1 çay kaşığı Tuz")
            ],
            recipe: [
                "Patatesleri doğrayın.",
                "Kızartın."
            ],
            categories: "Atıştırmalık",
            isFavorite: false
        ),
        
        // Patlamış Mısır
        Food(
            imageName: "popcorn",
            name: "Patlamış Mısır",
            cookingTime: 10,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 avuç Mısır"),
                Ingredient(name: "1 kaşık Yağ")
            ],
            recipe: [
                "Tencerede kapaklı şekilde patlatın."
            ],
            categories: "Atıştırmalık",
            isFavorite: false
        ),
        
        // Kruvasan
        Food(
            imageName: "kruvasan",
            name: "Kruvasan",
            cookingTime: 5,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 adet Kruvasan"),
                Ingredient(name: "1 yemek kaşığı Çikolata")
            ],
            recipe: [
                "Fırında ısıtın.",
                "Çikolata ekleyin."
            ],
            categories: "Atıştırmalık",
            isFavorite: false
        ),
        
        // Meyveli Smoothie
        Food(
            imageName: "smoothie",
            name: "Meyveli Smoothie",
            cookingTime: 5,
            dificultlyLevel: .easy,
            ingredients: [
                Ingredient(name: "1 adet Muz"),
                Ingredient(name: "1 bardak Süt")
            ],
            recipe: [
                "Blenderdan geçirin."
            ],
            categories: "Atıştırmalık",
            isFavorite: false
        ),
        
        // Çikolatalı Muffin
        Food(
            imageName: "muffin",
            name: "Çikolatalı Muffin",
            cookingTime: 25,
            dificultlyLevel: .medium,
            ingredients: [
                Ingredient(name: "1 su bardağı Un"),
                Ingredient(name: "2 kaşık Kakao")
            ],
            recipe: [
                "Hamuru hazırlayın.",
                "Muffin kalıplarında pişirin."
            ],
            categories: "Atıştırmalık",
            isFavorite: false
        )
    ]
}
