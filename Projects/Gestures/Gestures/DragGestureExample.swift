//
//  DragGestureExample.swift
//  Gestures
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI

struct DragGestureExample: View {
    @State var isDragging = false
    @State var offset: CGSize = .zero

    var body: some View {
        Circle()
            .fill(isDragging ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .offset(offset)
            .gesture(drag)
    }

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                isDragging = true
                offset = value.translation
            }
            .onEnded { value in
                isDragging = false
                withAnimation {
                    offset = value.predictedEndTranslation
                }
            }
    }
}

extension DragGestureExample {
    static var code: String {
        """
        struct DragGestureExample: View {
            @State var isDragging = false
            @State var offset: CGSize = .zero

            var body: some View {
                Circle()
                    .fill(isDragging ? Color.red : Color.blue)
                    .frame(width: 100, height: 100, alignment: .center)
                    .offset(offset)
                    .gesture(drag)
            }

            var drag: some Gesture {
                DragGesture()
                    .onChanged { value in
                        isDragging = true
                        offset = value.translation
                    }
                    .onEnded { _ in
                        isDragging = false
                        offset = .zero
                    }
            }
        }
        """
    }

    static var gestureValueDoc: String {
        """
        public struct Value : Equatable {
            /// The time associated with the drag gesture's current event.
            public var time: Date

            /// The location of the drag gesture's current event.
            public var location: CGPoint

            /// The location of the drag gesture's first event.
            public var startLocation: CGPoint

            /// The total translation from the start of the drag gesture to the
            /// current event of the drag gesture.
            ///
            /// This is equivalent to `location.{x,y} - startLocation.{x,y}`.
            public var translation: CGSize { get }

            /// A prediction, based on the current drag velocity, of where the final
            /// location will be if dragging stopped now.
            public var predictedEndLocation: CGPoint { get }

            /// A prediction, based on the current drag velocity, of what the final
            /// translation will be if dragging stopped now.
            public var predictedEndTranslation: CGSize { get }
        }
        """
    }
}

struct DragGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureExample()
    }
}
