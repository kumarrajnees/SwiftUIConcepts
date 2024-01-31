//
//  SwiftUIConceptsApp.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 11/10/23.
//

import SwiftUI

@main
struct SwiftUIConceptsApp: App {
    @StateObject var userStateViewModel = UserStateViewModel()

    var body: some Scene {
           WindowGroup {
               // SheetWithoutData()
//               SheetWithData()
               SampleView()
               
//               HomeTabView()
//               ProgrammaticNavigation()
//               NavigationView{
//                   ApplicationSwitcher()
//               }
//               .task {
//                   print("Start Execution")
//                   let data =   DispatchQuesGroupConcept().executeTask()
//                   print(data)
//                   print("End Execution")
////                   DispatchQuesGroupConcept().executeTaskAndNotify()
//
//               }
//               .navigationViewStyle(.stack)
//               .environmentObject(userStateViewModel)
           }
           
       }
   }

    

   struct ApplicationSwitcher: View {

       @EnvironmentObject var vm: UserStateViewModel

       var body: some View {
           if (vm.isLoggedIn) {
                   HomeScreen()
           } else {
               LoginScreen()
           }

       }
}
