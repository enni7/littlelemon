//
//  MenuBreakdown.swift
//  LittleLemon
//
//  Created by Anna Izzo on 01/11/24.
//

import SwiftUI

struct MenuBreakdown: View {
    
    @Binding var activeFilter: MenuCategory?
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("ORDER FOR DELIVERY!")
                    .font(.headline)
                Spacer()
            }
            HStack {
                ForEach(MenuCategory.allCases, id: \.rawValue) { category in
                    Text(category.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(6)
                        .padding([.horizontal], 6)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(activeFilter == category ? .accentColor : .littleWhite)
                        }
                        .onTapGesture {
                            applyFilter(selectedFilter: category)
                        }
                    if category != .drinks {
                        Spacer()
                    }
                }
            }
        }
    }
}

extension MenuBreakdown {
    private func applyFilter(selectedFilter: MenuCategory){
        if selectedFilter == activeFilter {
            self.activeFilter = nil
        } else {
            self.activeFilter = selectedFilter
        }
    }
}

struct MenuBreakdown_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdown(activeFilter: .constant(.mains))
    }
}
