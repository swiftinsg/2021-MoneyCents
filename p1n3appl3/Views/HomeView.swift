//
//  HomeView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var isNewLogPresented = false
    @Binding var logs: [Log]
    
    struct CustomColour {
        static let BlueT = Color("Blue Titmouse")
        static let Cornflower = Color("Cornflower Blue")
        static let LightNavy = Color("Light Navy")
        static let HawkesB = Color("Hawkes Blue")
        static let LightCyan = Color("Light Cyan")
    }
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Polishing Cloth")
                                .foregroundColor(.white)
                            Spacer()
                            Text("$2.00 / $29.00")
                                .foregroundColor(.white)
                        }
                        .padding(.top)
                        ProgressView(value: 2, total: 29)
                            .padding(.bottom)
                            .accentColor(.white)
                    }
                    .listRowBackground(CustomColour.Cornflower)
                }
                
                Section(header: Text("Recent Transactions")) {
                    HStack {
                        NavigationLink(destination:HomeMiloView() ) {
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
                            .padding(4)
                        }.sheet(isPresented: $isNewLogPresented) {
                            NewLogView(logs: $logs)                }
                    }
                    
                    NavigationLink(destination:  Text("Second View")) {
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Allowance")
                                    .font(.headline)
                                Text("25 Oct 2021")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text("$10.00")
                                .foregroundColor(.blue)
                        }
                        .padding(4)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle()) // for iOS 15 list style on iOS 14
        .navigationTitle("Home")
        .navigationBarItems(trailing: Button(action: {
            isNewLogPresented = true
        }, label: {
            Image(systemName: "plus")
        }))
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(logs: .constant([]))
    }
}

