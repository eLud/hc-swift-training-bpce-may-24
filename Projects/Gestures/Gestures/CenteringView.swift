//
//  CenteringView.swift
//  Gestures
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI

struct CenteringView<Content>: View where Content: View{

    var content: () -> (Content)

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                content()
                Spacer()
            }
            Spacer()
        }
    }
}

struct CenteringView_Previews: PreviewProvider {
    static var previews: some View {
        CenteringView {
            Text("Bla")
        }
    }
}
