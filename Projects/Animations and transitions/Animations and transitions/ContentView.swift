//
//  ContentView.swift
//  Animations and transitions
//
//  Created by Ludovic Ollagnier on 03/10/2022.
//

import SwiftUI
import DeckUI

struct ContentView: View {

    @Namespace var anim

    var body: some View {
        Presenter(deck: deck, showCamera: false)
    }

    var deck: Deck {
        Deck(title: "Animations and transition") {
            Slide(alignment: .leading) {
                Title("Animation & Transitions")
            }
            Slide {
                Title("Summary")
                Bullets {
                    Words("Identity")
                    Words("Transitions")
                    Words("Animations")
                }
            }
            Slide {
                Title("Are two views the same?")
                RawView {
                    HStack(spacing: 100.0) {
                        Spacer()
                        IdentityExample(offset: -250, color: .green)
                        IdentityExample(offset: 250, color: .red)
                        Spacer()
                    }.padding(.top, 100)
                }
            }
            Slide {
                Title("Are two views the same?")
                Columns {
                    Column {
                        Words("If yes, we should animate between those views")
                        RawView {
                            AnimationExample()
                                .padding(.leading, 200)
                        }
                    }
                    Column {
                        Words("If no, we should transition between those views")
                        RawView {
                            TransitionExample()
                                .padding(.leading, 200)

                        }
                    }
                }
            }
            Slide {
                Title("Identity")
                Bullets {
                    Words("SwiftUI uses identity to identify views")
                    Words("We can have explicit identity")
                    Words("But most of the time, structural (or implicit) identity is used")
                    Words("When using if clauses in a view, we create different branches in code, and thus, different structural identities")

                }
            }
            Slide {
                Title("Transitions, because different identities")
                Columns {
                    Column {
                        Code(.swift) {
                            """
            var body: some View {
                VStack {
                    if isTop {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.green)
                            .offset(y: -250)
                            .transition(.opacity.animation(.easeInOut))
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                            .offset(y: 250)
                            .transition(.opacity.animation(.easeInOut))
                    }
                }
            }
            """
                        }
                    }
                    Column {
                        RawView {
                            TransitionExample()
                        }
                    }
                }
            }
            Slide {
                Title("Animations, because same identities")
                Columns {
                    Column {
                        Code(.swift) {
                            """
                var body: some View {
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(isTop ? .green : .red)
                            .offset(y: isTop ? -250 : 250)
                            .animation(.easeInOut, value: isTop)
                    }
                }
                """
                        }
                    }
                    Column {
                        RawView {
                            AnimationExample()
                        }
                    }
                }
            }
            Slide {
                Title("MatchedGeometryEffect")
                Columns {
                    Column {
                        Code(.swift) {
                    """
                    @Namespace private var anim

                    var body: some View {
                        VStack {
                            if isTop {
                                Text("This is some title")
                                    .foregroundColor(.green)
                                    .offset(y: 100)
                                    .matchedGeometryEffect(id: "title", in: anim)
                            }
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(isTop ? .green : .red)
                                .frame(width: 250, height: 250)
                                .offset(y: isTop ? -250 : 250)
                                .animation(.easeInOut, value: isTop)
                            if !isTop {
                                Text("This is some title")
                                    .foregroundColor(.red)
                                    .offset(y: -100)
                                    .matchedGeometryEffect(id: "title", in: anim)
                            }
                        }.frame(width: 400, height: 800)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundColor(.white))
                        .onTapGesture {
                            withAnimation {
                                isTop.toggle()
                            }
                        }

                    }
                    """
                        }
                    }
                    Column {
                        RawView {
                            MatchedGeometryExample()
                        }
                    }
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
