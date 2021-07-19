//
//  CouponView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/18.
//

import SwiftUI

struct CouponView: View {
    let coupon : Coupon
    let sw = UIScreen.screenWidth
    @State private var isUsed = false
    
    var body: some View {
        VStack(spacing:0) {
            ZStack {
                HStack {
                    VStack {
                        HStack {
                            Image(systemName: "applelogo")
                                .resizable()
                                .frame(width: 32, height: 32)
                            VStack(alignment:.leading) {
                                Text(coupon.name)
                                    .font(Font.custom("Tamil MN Bold", size: 16))
                                Rectangle()
                                    .frame(height:2)
                            }
                            Spacer()
                        }
                        .padding(10)
                        HStack(alignment:.top) {
                            Image(coupon.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(coupon.detail)
                                .font(Font.custom("Tamil MN", size: 12))
                        }
                    }
                    .foregroundColor(Color(hex: 0x707070))
                    .frame(width: 0.8*0.84*sw, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Line()
                       .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                       .frame(width: 1, height: 150)
                    Text("クーポン券")
                        .rotationEffect(Angle(degrees: 270))
                        .fixedSize()
                        .frame(width: 40, height: 150, alignment: .center)
                    
                }
                .frame(width: 0.84*sw, height: 150,alignment: .center)
                .background(Color(hex: 0xfaf2e8))
                .padding(5)
            }
            .background(Color(.white))
            
            Text("押してから30分間有効")
                .font(Font.custom("Tamil MN Bold", size: 16))
                .padding(.top, 12)
            
            // TODO: draggable switch ...
            Toggle("", isOn: $isUsed)
                .toggleStyle(CheckboxStyle())
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}

struct CheckboxStyle: ToggleStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
 
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .purple : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
 
    }
}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        CouponView(coupon: Coupon.data[0])
    }
}
