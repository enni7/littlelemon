//
//  Menu.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    
    var body: some View {
        
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                HeroView()
                TextField("Search menu", text: $searchText)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.ultraThinMaterial)
                    )
                    .padding([.horizontal], 24)
            }
            .padding([.vertical], 24)
            .background {
                Color.greenBg
            }
            
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
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
                        .listRowInsets(.init(top: 12,
                                             leading: 24,
                                             bottom: 12,
                                             trailing: 24))
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
    
    ///Filter elements
    private func buildPredicate() -> NSPredicate {
        guard !searchText.isEmpty else { return NSPredicate(value: true)}
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
    ///Sort elements
    private func buildSortDescriptors() -> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare))]
    }
    
    private func getMenuDataIfNeeded(){
        guard PersistenceController.shared.isEmpty() ?? true else { return }
        getMenuData()
    }
    
    ///Retrieve and save menu data
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
