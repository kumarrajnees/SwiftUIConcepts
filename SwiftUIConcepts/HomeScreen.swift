//
//  HomeScreen.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 08/12/23.
//

import SwiftUI

struct HomeScreen: View {

    @EnvironmentObject var vm: UserStateViewModel

    var body: some View {

        if(vm.isBusy){
            ProgressView()
        }else{
            Text("Home Screen")
                .navigationTitle("Home")
                .toolbar {

                        Button {
                            Task{
                                await vm.signOut()
                            }
                        } label: {
                            Image(systemName:  "rectangle.portrait.and.arrow.right")
                        }


                }
        }
    }
}

