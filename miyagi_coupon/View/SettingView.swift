//
//  SettingView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import SwiftUI

struct SettingView: View {
    @State private var showMessage = true
    @State private var isEnglish = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle("通知", isOn: $showMessage)
                Toggle("English", isOn:$isEnglish)
                NavigationLink(destination: VersionView()) {
                    Text("バージョン")
                }
            }
            .navigationTitle("設定")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
