//
//  EditView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/15.
//

import SwiftUI
import Kingfisher

struct ShopEditView: View {
    @State public var shop: Shop
    @State private var ttt: String?
    var body: some View {
        List {
            ShopInfoSection
            CouponInfoSection
        }
    }
    
    var ShopInfoSection: some View {
        Section(header: Text("基本情報")) {
            HStack {
                Text("店舗名")
                    .font(.headline)
                TextField("店舗名", text: $shop.name)
            }
            HStack {
                Text("予算")
                    .font(.headline)
                TextField("min", value: $shop.min_budget, formatter: NumberFormatter())
                Text("--")
                TextField("max", value: $shop.min_budget, formatter: NumberFormatter())
            }
            HStack {
                Text("お店からのメッセージ")
                    .font(.headline)
                MultilineTextView(text: $shop.massage ?? "")
            }
            .frame(width: 300, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack {
                Text("位置情報")
                TextField("位置情報", text: $shop.location ?? "")
            }
            HStack {
                Text("外部サイトURL")
                TextField("外部サイトURL", text: $shop.site_url ?? "")
            }
            KFImage(URL(string: shop.image!))
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            
            Button(action: {
                ttt = shop.image
            }, label: {
                Text("店舗写真の変更")
            })
        }
    }
    
    var CouponInfoSection: some View {
        Section(header: Text("クーポン")) {
            Text(ttt ?? "")
        }
    }
    
}

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

struct ShopEditView_Previews: PreviewProvider {
    static var previews: some View {
        ShopEditView(shop: Shop.data[0])
    }
}
