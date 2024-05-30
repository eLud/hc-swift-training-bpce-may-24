//
//  ContentView.swift
//  Gestures
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI
import DeckUI

struct ContentView: View {
    var body: some View {
        Presenter(deck: deck)
    }

    var deck: Deck {
        Deck(title: "SwiftUI Gestures") {
            Slide(alignment: .leading) {
                Title("SwiftUI Gestures")
            }
            Slide {
                Title("Summary")
                Bullets {
                    Words("DragGesture")
                    Words("MagnificationGesture")
                    Words("RotationGesture")
                }
            }
            Slide {
                Title("DragGesture")
                Columns {
                    Column {
                        Code(.swift) {
                            DragGestureExample.code
                        }
                    }
                    Column {
                        RawView {
                            CenteringView {
                                DragGestureExample()
                            }
                        }
                    }
                }
            }
            Slide {
                Title("DragGesture.Value")
                Code(.swift) {
                    DragGestureExample.gestureValueDoc
                }
            }
            Slide {
                Title("MagnifyGesture")
                Columns {
                    Column {
                        Code(.swift) {
                            MagnifyGestureExample.code
                        }
                    }
                    Column {
                        RawView {
                            CenteringView {
                                MagnifyGestureExample()
                            }
                        }
                    }
                }
            }
            Slide {
                Title("MagnifyGesture.Value")
                Code(.swift) {
                    RotateGestureExample.rotateValueDoc
                }
            }
            Slide {
                Title("RotateGesture")
                Columns {
                    Column {
                        Code(.swift) {
                            RotateGestureExample.code
                        }
                    }
                    Column {
                        RawView {
                            CenteringView {
                                RotateGestureExample()
                            }
                        }
                    }
                }
            }
            Slide {
                Title("RotateGesture.Value")
                Code(.swift) {
                    RotateGestureExample.rotateValueDoc
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
