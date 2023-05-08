//
//  ContentView.swift
//  ReadingCode
//
//  Created by 박경민 on 2023/05/06.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("Origicode") var Origicode: String = ""
    @AppStorage("Origiregion") var Origiregion: String = ""
    @State var info = false
    var body: some View {
        VStack {
            Button("Read region"){
                let dynamicPath = "/var/containers/Shared/SystemGroup/systemgroup.com.apple.mobilegestaltcache/Library/Caches/com.apple.MobileGestalt.plist"
                
                let stringsData = try! Data(contentsOf: URL(fileURLWithPath: dynamicPath))
                var plist = try! PropertyListSerialization.propertyList(from: stringsData, options: [], format: nil) as! [String: Any]
                plist = plist["CacheExtra"] as! [String: Any]
                Origicode = plist["zHeENZu+wbg7PUprwNwBWg"] as! String
                Origiregion = plist["h63QSdBCiT/z0WU6rdQv6Q"] as! String
                info = true
            }.padding()
                .buttonStyle(.borderedProminent)
                .cornerRadius(10)
                .tint(.blue)
                .alert("Your Code", isPresented: $info){} message:{
                        Text("\(Origicode), \(Origiregion) is your code.")
                }
        }
        }
    }

