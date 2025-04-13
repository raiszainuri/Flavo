struct BoothDataSeeder {
    static func seed() -> [BoothData] {
        return [
            BoothData(
                name: "Kasturi",
                description: "Aneka makanan khas nusantara.",
                image: "booths/kasturi",
                priceRange: "Rp 15.000 - Rp 30.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Nasi Goreng", price: 20000, image: "foods/nasi_goreng",
                        tags: ["Nasi", "Goreng"]),
                    FoodData(
                        name: "Ayam Geprek", price: 25000, image: "foods/ayam_geprek",
                        tags: ["Ayam", "Pedas", "Goreng"]),
                ]
            ),
            BoothData(
                name: "Mustafa Minang",
                description: "Masakan khas Minang dengan bumbu khas.",
                image: "booths/mustafaMinang",
                priceRange: "Rp 15.000 - Rp 30.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Rendang", price: 29000, image: "foods/rendang",
                        tags: ["Daging", "Pedas"]),
                    FoodData(
                        name: "Dendeng Balado", price: 30000,
                        image: "foods/dendeng_balado", tags: ["Daging", "Pedas"]),
                ]
            ),
            BoothData(
                name: "Mie Ayam Kriuk",
                description: "Mie ayam dengan topping kriuk renyah.",
                image: "booths/mieAyamKriuk",
                priceRange: "Rp 20.000 - Rp 30.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Mie Ayam Kriuk", price: 25000,
                        image: "foods/mie_ayam_kriuk_food", tags: ["Mie", "Ayam"]),
                    FoodData(
                        name: "Mie Ayam Spesial", price: 28000,
                        image: "foods/mie_ayam_spesial", tags: ["Mie", "Ayam"]),
                ]
            ),
            BoothData(
                name: "La Ding",
                description: "Hidangan mie khas dengan bumbu spesial.",
                image: "booths/laDings",
                priceRange: "Rp 20.000 - Rp 30.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Mie Goreng Spesial", price: 27000,
                        image: "foods/mie_goreng_spesial", tags: ["Mie", "Goreng"]),
                    FoodData(
                        name: "Mie Kuah Pedas", price: 26000,
                        image: "foods/mie_kuah_pedas", tags: ["Mie", "Pedas", "Kuah"]),
                ]
            ),
            BoothData(
                name: "Ahza Snack and Beverage",
                description: "Camilan dan minuman segar untuk teman bersantai.",
                image: "booths/ahza",
                priceRange: "Rp 5.000 - Rp 20.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Boba Milk Tea", price: 18000,
                        image: "foods/boba_milk_tea",
                        tags: ["Minuman", "Boba", "Susu"]),
                    FoodData(
                        name: "Churros Coklat", price: 15000,
                        image: "foods/churros_coklat", tags: ["Churros", "Manis"]),
                ]
            ),
            BoothData(
                name: "Bakso Bakwan Malang Josss",
                description: "Bakso Malang dengan bakwan renyah.",
                image: "booths/ikanBaksoMalangJos",
                priceRange: "Rp 10.000 - Rp 20.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Bakso Urat", price: 18000, image: "foods/bakso_urat",
                        tags: ["Bakso", "Kuah"]),
                    FoodData(
                        name: "Bakso Malang Komplit", price: 20000,
                        image: "foods/bakso_malang_komplit",
                        tags: ["Bakso", "Bakwan", "Kuah"]),
                ]
            ),
            BoothData(
                name: "Wartas Ibu Iwan",
                description: "Menu rumahan yang menggugah selera.",
                image: "booths/wartasIbuIwan",
                priceRange: "Rp 15.000 - Rp 20.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Tempe Mendoan", price: 15000,
                        image: "foods/tempe_mendoan", tags: ["Kedelai"]),
                    FoodData(
                        name: "Sambal Terasi", price: 18000,
                        image: "foods/sambal_terasi", tags: ["Pedas"]),
                ]
            ),
            BoothData(
                name: "Kedai Laris Manis",
                description: "Kedai makanan dengan harga terjangkau.",
                image: "booths/kedaiLarisManis",
                priceRange: "Rp 15.000 - Rp 30.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Nasi Ayam", price: 25000, image: "foods/nasi_ayam",
                        tags: ["Nasi", "Ayam", "Goreng"]),
                    FoodData(
                        name: "Es Teh Manis", price: 5000,
                        image: "foods/es_teh_manis", tags: ["Minuman", "Manis"]),
                ]
            ),
            BoothData(
                name: "Kedai Soto Pak Gembul",
                description: "Soto segar dengan berbagai pilihan lauk.",
                image: "booths/kedaiPakGembul",
                priceRange: "Rp 20.000 - Rp 40.000",
                location: "GOP 9",
                foods: [
                    FoodData(
                        name: "Soto Ayam", price: 25000, image: "foods/soto_ayam",
                        tags: ["Ayam", "Kuah"]),
                    FoodData(
                        name: "Soto Daging", price: 35000, image: "foods/soto_daging",
                        tags: ["Daging", "Kuah"]),
                ]
            ),
        ]
    }
}
