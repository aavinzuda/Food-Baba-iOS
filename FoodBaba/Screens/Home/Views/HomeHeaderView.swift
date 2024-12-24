//
//  HomeHeaderView.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 25/12/24.
//

import SwiftUI

//MARK: - Header View
struct HomeHeaderView: View {
    
    @StateObject private var viewModel: HomeHeaderViewViewModel = .shared
    
    @State private var updatingSearchItem: String = "Pizza"
    
    private let searchItems: [String] = [
        "Pizza", "Noodles", "Maggie", "Italian"
    ]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    locationButton
                    locationLabel
                }
                
                Spacer()
                
                profileButton
            }
            .opacity(viewModel.headerPhase.opacity)
            
            searchBarButton
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
    
    
    @ViewBuilder
    private var locationButton: some View {
        FBButton {
            
        } label: {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "location.fill")
                    .resizable()
                    .foregroundStyle(.orange)
                    .frame(width: 18, height: 18)
                
                Text(viewModel.currentLocationShortName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.primary))
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .fontWeight(.semibold)
                    .frame(width: 12, height: 7)
                    .foregroundStyle(.gray)
            }
        }
    }
    
    
    @ViewBuilder
    private var locationLabel: some View {
        Text(viewModel.currentLocationFullName)
            .font(.footnote)
            .foregroundStyle(Color(.secondary))
    }
    
    
    @ViewBuilder
    private var profileButton: some View {
        FBButton {
            
        } label: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundStyle(.gray)
                .frame(width: 30, height: 30)
        }
    }
    
    
    @ViewBuilder
    private var searchBarButton: some View {
        FBButton {
            
        } label: {
            
            ZStack {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(.gray.opacity(0.2))
                
                HStack {
                    Text("Search for '\(self.updatingSearchItem)'")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundStyle(Color(.secondary))
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .foregroundStyle(.gray)
                            .frame(width: 15, height: 16)
                        
                        Rectangle()
                            .frame(width: 0.7)
                            .padding(.vertical)
                            .foregroundStyle(Color(.secondary))
                        
                        Image(systemName: "mic.fill")
                            .resizable()
                            .foregroundStyle(.appIconOrange)
                            .frame(width: 12, height: 17)
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
                    if let randomItem = self.searchItems.randomElement() {
                        if randomItem != self.updatingSearchItem {
                            withAnimation { self.updatingSearchItem = randomItem }
                        } else {
                            withAnimation { self.updatingSearchItem = "Pizza" }
                        }
                    }
                }
            }
        }
    }
}
