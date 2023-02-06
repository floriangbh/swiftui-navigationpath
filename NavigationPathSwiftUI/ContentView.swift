//
//  ContentView.swift
//  NavigationPathSwiftUI
//
//  Created by Florian GABACH on 03/02/2023.
//

import SwiftUI

enum NavigationKey: Hashable, Identifiable {
    case screenA
    case screenB
    case screenC
    
    var id: String {
        String(describing: self)
    }
}

class Router: ObservableObject {
    @Published var paths = NavigationPath()
}
    

struct ContentView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationStack(path: $router.paths) {
            VStack {
                Text("ROOT")
                Button {
                    router.paths.append(NavigationKey.screenA)
                } label: {
                    Text("Go to A")
                }
            }
            .navigationDestination(for: NavigationKey.self) { key in
                switch key {
                case .screenA:
                    ContentViewA()
                case .screenB:
                    ContentViewB()
                case .screenC:
                    ContentViewC()
                }
            }
        }
    }
}

struct ContentViewA: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("A")
            Button {
                router.paths.append(NavigationKey.screenB)
            } label: {
                Text("Go to B")
            }
        }
        .onAppear {
            print("OnAppear: A ")
        }
    }
}

struct ContentViewB: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("B")
            Button {
                router.paths.append(NavigationKey.screenC)
            } label: {
                Text("Go to C")
            }
        }
        .onAppear {
            print("OnAppear: B")
        }
    }
}

struct ContentViewC: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("C")
            Button {
                router.paths = NavigationPath()
            } label: {
                Text("Pop back to root")
            }
        }
        .onAppear {
            print("OnAppear: C")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Router())
    }
}
