//
//  BudgetView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct BudgetView: View {
    var body: some View {
        NavigationView {
            List{
                Section() {
                    NavigationLink(destination: Text("Second View")) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Food")
                            }
                            Spacer()
                            Text("$40.00")
                                .foregroundColor(.red)
                        }
                    }
                    
                    NavigationLink(destination: Text("Second View")) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Transport")
                            }
                            Spacer()
                            Text("$5.00")
                                .foregroundColor(.red)
                        }
                    }
                }
                
                Section (){
                    NavigationLink(destination: Text("Second View")){
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Total")
                            }
                            Spacer()
                            Text("$45.00")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Budget")
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
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}
