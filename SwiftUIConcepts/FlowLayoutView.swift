//
//  FlowLayoutView.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 09/01/24.
//

//import SwiftUI
//
//struct SubViewsWrappingConcept: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: [CGSize] = []
    
    static func reduce(value: inout [CGSize], nextValue: () -> [CGSize]) {
        value.append(contentsOf: nextValue())
    }
}

/*
struct FlowLayoutView: View {
    let items: [String]
    let spacing: CGFloat
    var horizontalPadding: CGFloat = 0
    @Binding var selectedItem: String

    // State to store the total height of the content
    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        VStack {
            ScrollView {
                innerBody
                    .padding(.horizontal, horizontalPadding)
                    .frame(height: totalHeight)
            }
        }
    }
    
    private var innerBody: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
            .onPreferenceChange(SizePreferenceKey.self) { preferences in
                self.totalHeight = preferences.reduce(0, { $0 + $1.height }) + CGFloat(preferences.count - 1) * self.spacing
            }
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ForEach(self.items, id: \.self) { item in
            itemView(for: item)
                .padding([.horizontal, .vertical], self.spacing / 2) // Adjust padding for each item
                .alignmentGuide(.leading, computeValue: { d in
                    if (abs(width - d.width) > g.size.width) {
                        width = 0
                        height -= d.height
                    }
                    let result = width
                    if item != self.items.last {
                        width -= d.width + self.spacing
                    }
                    return result
                })
                .alignmentGuide(.top, computeValue: { d in
                    let result = height
                    if item == self.items.last {
                        height = 0 // Reset for the next item
                    }
                    return result
                })
                .background(GeometryReader { geo in
                    Color.clear.preference(key: SizePreferenceKey.self,
                                           value: [geo.size])
                })
        }
    }
    
    // An example item view, replace with your actual subview
    @ViewBuilder
    private func itemView(for text: String) -> some View {
        Button {
            selectedItem = text
        } label: {
            Text(text)
                .padding(.vertical,5)
                .padding(.horizontal,10)
                .background(selectedItem == text ?  .cyan:Color.gray, in: Capsule())
                .foregroundColor(.white)
        }
        .background(.yellow)
        .padding(.vertical,spacing)
    }
}

struct SampleView: View {
    @State var selectedItem: String = "enumerated"
    var body: some View {
        FlowLayoutView(items: ["asda","enumerated","Array","count","SubViews Wrapping Concept","offset"], spacing: 10, horizontalPadding: 10, selectedItem: $selectedItem)
            .padding()
    }
}

// Example usage
struct FlowLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
            .background(.red.opacity(0.3))
    }
}
*/
 
struct FlowLayoutView: View {
    // Data source for your subviews
    let items: [String]
    // Spacing between subviews
    let verticleSpacing: CGFloat
    var horizontalPadding: CGFloat = 5
    @Binding var selectedItem: String
    @State private var totalHeight: CGFloat = .infinity

    var body: some View {
            ScrollView {
                VStack {
                    GeometryReader { geometry in
                        self.generateContent(in: geometry)
                            .onPreferenceChange(SizePreferenceKey.self) { preferences in
                                print(preferences)
                                self.totalHeight =  geometry.size.height
                                //preferences.reduce(0, { $0 + $1.height }) + CGFloat(preferences.count) * self.verticleSpacing
                                
                                print("geometry", geometry.size.height, self.totalHeight)
                                
                            }
                    }
                    
                }
                .background(GeometryReader { geometryTop in
                
                    Color.clear.onAppear(perform: {
                        print("geometryV: ", geometryTop.size)
                    })

                })
            }
            .background(.green)
            .background(GeometryReader { geometryTop in
            
                Color.clear.onAppear(perform: {
                    print("geometryTop: ", geometryTop.size)
                })

            })
                    
        //        .frame(maxHeight: totalHeight)
        
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        // Use a ZStack to allow subviews to "wrap" to the next line
        return ZStack(alignment: .topLeading) {
            ForEach(self.items, id: \.self) { item in
                self.itemView(for: item)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            // Move to next line if the item does not fit in current line
                            width = 0
                            height -= lastHeight
                            lastHeight = d.height
                        }
                        let result = width
                        if item == self.items.last {
                            width = 0 // last item
                        } else {
                            width -= d.width + self.verticleSpacing
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if item == self.items.last {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
        .background(GeometryReader { geo in
            Color.clear.preference(key: SizePreferenceKey.self,
                                   value: [geo.size])
            .onAppear(perform: {
                print("ZZZ: ", geo.size)
            })
        })
    }
    
    // An example item view, replace with your actual subview
    @ViewBuilder
    private func itemView(for text: String) -> some View {
        Button {
            selectedItem = text
        } label: {
            Text(text)
                .padding(verticleSpacing)
                .background(selectedItem == text ?  .cyan:Color.gray, in: Capsule())
                .foregroundColor(.white)
        }
        .padding(.vertical,verticleSpacing)
    }
}

struct SampleView: View {
    @State var selectedItem: String = "enumerated"
    var body: some View {
        VStack {
            Text("This the model presenattion")
            Rectangle()
                .frame(height: 200)
            FlowLayoutView(items: ["asda","enumerated","Array","count","SubViews Wrapping Concept","offset", "asd","asdefawefase","asdasdasd","iuwjfbkas","sdhjgS UKDagd","aoiwjdN CKUDFKGAIDSONAJBDDVSD","asda","afwete","ttyjghf","segther","dlaikhlahsf", "ahdjgse siegfisudg", "sjhejfgasuegfaubhgdu","suuegfasdhvksd", "sfsd", "sfsdffb"],
                           verticleSpacing: 10,
                           selectedItem: $selectedItem)
                .padding()
            Text("This the model presenattion")
        }
    }
}

// Example usage
struct FlowLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
            .background(.red.opacity(0.3))
    }
}

// Array(repeating: "Item", count: 20).enumerated().map { "\($0.element) \($0.offset)" }
//#Preview {
//    SubViewsWrappingConcept()
//}
