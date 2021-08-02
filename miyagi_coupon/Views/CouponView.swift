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
                HStack(spacing: 0) {
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
    //                    .frame(width: 0.8*0.84*sw, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Line()
                           .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                           .frame(width: 1, height: 150)
                            .padding(0)
                    }
                    .frame(width: 0.84*sw*0.8, height: 150,alignment: .center)
                    .background(Color(hex: 0xfaf2e8))
                    .padding(0)
                    
                
                    if !isUsed {
                        ZStack {
                            Text("クーポン券")
                                .rotationEffect(Angle(degrees: 270))
                                .fixedSize()
                                .frame(width: 40, height: 150, alignment: .center)
                        }
                        .frame(width: 0.84*sw*0.2, height: 150,alignment: .center)
                        .background(Color(hex: 0xfaf2e8))
                        .padding(0)
                    }
                    else {
                        ZStack {
                            
                        }
                        .frame(width: 0.84*sw*0.2, height: 150,alignment: .center)
                        .padding(0)
                    }
                }
            }
            .padding(5)
            .background(Color.white)
            
            Text("押してから30分間有効")
                .font(Font.custom("Tamil MN Bold", size: 16))
                .foregroundColor(Color(hex: 0xff5555))
                .padding(.top, 7)
                .padding(.bottom, 4)
            
            if !isUsed {
                MTSlideToOpen(textLabelLeadingPadding: 30, textFont: Font.custom("Tamil MN Bold", size: 20) ,textColor: Color(hex: 0xfbfbfb), thumbnailColor: Color(hex: 0xfbfbfb),
                              sliderBackgroundColor: Color(hex: 0x09ac86),
                                          didReachEndAction: { view in
    //                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    //                                view.resetState()
                                            isUsed = true
                    })
                    .frame(width: 320, height: 60)
                    .background(Color.yellow)
                    .cornerRadius(28)
            }
            else {
                Text("利用可能期間9999/9/9")
                    .frame(width: 320, height: 60)
                    .foregroundColor(Color.white)
                    .background(Color(hex: 0xa8a8a8))
                    .cornerRadius(28)
            }
            
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
