//
//  RotateGestureExample.swift
//  Gestures
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI

struct RotateGestureExample: View {
    @State var isRotating = false
    @State var rotationAngle = Angle(degrees: 0.0)

    var body: some View {
        Rectangle()
            .fill(isRotating ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .rotationEffect(rotationAngle)
            .gesture(rotation)
    }

    var rotation: some Gesture {
        RotateGesture()
            .onChanged { value in
                isRotating = true
                rotationAngle = value.rotation
            }
            .onEnded { _ in
                isRotating = false
                withAnimation {
                    rotationAngle = .zero
                }
            }
    }
}

extension RotateGestureExample {
    static var code: String {
        """
        struct RotateGestureExample: View {
            @State var isRotating = false
            @State var rotationAngle = Angle(degrees: 0.0)

            var body: some View {
                Rectangle()
                    .fill(isRotating ? Color.red : Color.blue)
                    .frame(width: 100, height: 100, alignment: .center)
                    .rotationEffect(rotationAngle)
                    .gesture(rotation)
            }

            var rotation: some Gesture {
                RotateGesture()
                    .onChanged { value in
                        isRotating = true
                        rotationAngle = value.rotation
                    }
                    .onEnded { _ in
                        isRotating = false
                        withAnimation {
                            rotationAngle = .zero
                        }
                    }
            }
        }
        """
    }

    static var rotateValueDoc: String {
        """
        /// The type representing the gesture's value.
        public struct Value : Equatable, Sendable {

            /// The time associated with the gesture's current event.
            public var time: Date

            /// The relative amount that the gesture has rotated by.
            ///
            /// A value of 30 degrees means that the user has interacted with the
            /// gesture to rotate by 30 degrees relative to the amount before the
            /// gesture.
            public var rotation: Angle

            /// The current rotation velocity.
            public var velocity: Angle

            /// The initial anchor point of the gesture in the modified view's
            /// coordinate space.
            public var startAnchor: UnitPoint

            /// The initial center of the gesture in the modified view's coordinate
            /// space.
            public var startLocation: CGPoint
        }
    """
    }
}

struct RotationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        RotateGestureExample()
    }
}
