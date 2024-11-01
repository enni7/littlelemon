//
//  Menu.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                Text("Little Lemon")
                    .font(.title)
                Text("Chicago")
                    .fontWeight(.light)
                    .padding([.bottom], 4)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    .font(.subheadline)
            }
            .padding([.horizontal], 24)
            .padding([.bottom], 8)

            FetchedObjects { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(dish.title ?? "-")")
                                Text("\(dish.category ?? "-")".capitalized)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text("\(dish.price ?? "") $")
                            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50,
                                   height: 50)
                        }
                    }
                }
                .listStyle(.inset)
                .refreshable {
                    getMenuData()
                }
            }
            Spacer()
        }
        .onAppear{
            getMenuDataIfNeeded()
        }
    }

}

// MARK: Handle Core Data
extension Menu {
    private func getMenuDataIfNeeded(){
        guard PersistenceController.shared.isEmpty() ?? true else { return }
        getMenuData()
    }
    
    private func getMenuData(){

        PersistenceController.shared.clear()

        let menuPath = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: menuPath)
        guard let url = url else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    if let menuList = try? decoder.decode(MenuList.self, from: data) {
                        menuList.menu.forEach{ item in
                            let dish = Dish(context: viewContext)
                            dish.title = item.title
                            dish.image = item.image
                            dish.price = item.price
                            dish.category = item.category
                        }
                        try? viewContext.save()
                    } else {
                        throw NSError()
                    }
                } catch {
                    print("An error occurred during json decode")
                }
            }
        }
        task.resume()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
