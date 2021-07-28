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
    @State private var isShowingAlert = false
    @State var un: String = ""
    @State var pw: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Toggle("通知", isOn: $showMessage)
                    Toggle("English", isOn:$isEnglish)
                    NavigationLink(destination: VersionView()) {
                        Text("バージョン")
                    }
                }
                .frame(height: 300)
                
                Button("店舗管理者としてログイン") {
                    isShowingAlert = true
                }
                .frame(width: 300, height: 100, alignment: .center)
                .border(Color.black)
                TextFieldAlertView(
                    un: $un,
                    pw: $pw,
                    isShowingAlert: $isShowingAlert,
                    placeholder: "hhh",
                    isSecureTextEntry: true,
                    title: "認証",
                    message: "",
                    leftButtonTitle: "キャンセル",
                    rightButtonTitle: "ログイン",
                    leftButtonAction: nil,
                    rightButtonAction: {
                        print("パスワード認証リクエスト")
                    }
                )
                
            
                Spacer()
            }
            .navigationBarTitle("設定")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
