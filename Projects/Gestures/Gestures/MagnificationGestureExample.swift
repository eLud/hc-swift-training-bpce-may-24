//
//  MagnificationGestureExample.swift
//  Gestures
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI

struct MagnifyGestureExample: View {
    @State var isMagnifying = false
    @State var scale: CGFloat = 1.0

    var body: some View {
        Circle()
            .fill(isMagnifying ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(scale)
            .gesture(magnification)
    }

    var magnification: some Gesture {
        MagnifyGesture()
            .onChanged { value in
                isMagnifying = true
                scale = value.magnification
            }
            .onEnded { _ in
                isMagnifying = false
                withAnimation {
                    scale = 1.0
                }
            }
    }
}

extension MagnifyGestureExample {
    static var code: String {
        """
        struct MagnifyGestureExample: View {
            @State var isMagnifying = false
            @State var scale: CGFloat = 1.0

            var body: some View {
                Circle()
                    .fill(isMagnifying ? Color.red : Color.blue)
                    .frame(width: 100, height: 100, alignment: .center)
                    .scaleEffect(scale)
                    .gesture(magnification)
            }

            var magnification: some Gesture {
                MagnifyGesture()
                    .onChanged { value in
                        isMagnifying = true
                        scale = value.magnification
                    }
                    .onEnded { _ in
                        isMagnifying = false
                        scale = 1.0
                    }
            }
        }
        """
    }

    static var magnifyValueDoc: String {
    """
    /// The type representing the gesture's value.
    public struct Value : Equatable, Sendable {

        /// The time associated with the gesture's current event.
        public var time: Date

        /// The relative amount that the gesture has magnified by.
        ///
        /// A value of 2.0 means that the user has interacted with the gesture
        /// to increase the magnification by a factor of 2 more than before the
        /// gesture.
        public var magnification: CGFloat

        /// The current magnification velocity.
        public var velocity: CGFloat

        /// The initial anchor point of the gesture in the modified view's
        /// coordinate space.
        public var startAnchor: UnitPoint

        /// The initial center of the gesture in the modified view's coordinate
        /// space.
        public var startLocation: CGPoint

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: MagnifyGesture.Value, b: MagnifyGesture.Value) -> Bool
    }
    """
    }
}

struct MagnificationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        MagnifyGestureExample()
    }
}
