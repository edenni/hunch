//
//  SettingView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import SwiftUI
import Combine
import Amplify

struct SettingView: View {
    @State private var showMessage = true
    @State private var isEnglish = false
    @State private var isShowingAlert = false
    
    @ObservedObject var signinmodel: SignInViewModel
    @State private var buttonText: String

    init(signinmodel: SignInViewModel) {
        self.signinmodel = signinmodel
        switch signinmodel.state {
        case .signedIn:
            buttonText = "ログアウト"
        default:
            buttonText = "店舗管理者としてログイン"
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0xf3f3f3).edgesIgnoringSafeArea(.all)
                VStack {
                    List {
                        Toggle("通知", isOn: $showMessage)
                        Toggle("English", isOn:$isEnglish)
                        NavigationLink(destination: VersionView()) {
                            Text("バージョン")
                        }
                    }
                    .frame(height: 250)
                    Spacer()
                    switch signinmodel.state {
                    case .nosignin:
                        LoginButton(isShowingAlert: isShowingAlert, signinmodel: signinmodel)
                    case .signedIn:
                        LogoutButton(signinmodel: signinmodel)
                    default:
                        Text("Login Error")
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("設定")
        }
    }
}

struct LoginButton: View {
    @State var isShowingAlert: Bool
    @ObservedObject var signinmodel: SignInViewModel
    var body: some View {
        Button("店舗管理者としてログイン") {
            isShowingAlert = true
        }
        .frame(width: 250, height: 60, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
            .stroke(Color.black, lineWidth: 1))
        TextFieldAlertView(
            username: $signinmodel.username,
            password: $signinmodel.password,
            isShowingAlert: $isShowingAlert,
            isSecureTextEntry: true,
            title: "認証",
            message: "",
            leftButtonTitle: "キャンセル",
            rightButtonTitle: "ログイン",
            leftButtonAction: nil,
            rightButtonAction: {
                signinmodel.signIn()
                print(signinmodel.state)
            }
        )
    }
}

struct LogoutButton: View {
    @ObservedObject var signinmodel: SignInViewModel
    var body: some View {
        Button("ログアウト") {
            signinmodel.signOut()
            print(signinmodel.state)
        }
        .frame(width: 250, height: 60, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
            .stroke(Color.black, lineWidth: 1))
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(signinmodel: SignInViewModel(userSession: UserSession()))
    }
}
