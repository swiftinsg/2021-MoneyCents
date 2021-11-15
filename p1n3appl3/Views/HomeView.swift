//
//  HomeView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Goals")) {
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Polishing Cloth")
                            Spacer()
                            Text("$2.00 / $29.00")
                        }
                        .padding(.top)
                        ProgressView(value: 2, total: 29)
                            .padding(.bottom)
                    }
                }
                
                Section(header: Text("Recent Transactions")) {
                    NavigationLink(destination: Text("Second View")) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Milo")
                                    .font(.headline)
                                Text("24 Oct 2021")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text("$0.80")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
