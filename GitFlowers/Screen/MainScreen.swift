
import SwiftUI

struct MainView: View {
    
    var CommitCount : Int = 0
    
    var body : some View {
        VStack{
            HStack{
                Spacer()
                VStack(spacing: 10){
                    Button(action: {
                        
                    }){
                        Image(systemName: "gift")
                            .font(.title)
                            .foregroundStyle(Color(UIColor(hex: "229B00")))
                            .cornerRadius(50)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(UIColor(hex: "229B00")),
                                        lineWidth: 2)
                            )
                    }
                    Button(action: {
                        
                    }){
                        Image(systemName: "person.crop.circle")
                            .font(.title)
                            .foregroundStyle(Color(UIColor(hex: "229B00")))
                            .cornerRadius(50)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(UIColor(hex: "229B00")),
                                        lineWidth: 2)
                            )
                    }
                }
                .padding(.trailing,30)
                .padding(.bottom,20)
            }
            
            ProgressView(value: 20,total: 100)
                .tint(Color(UIColor(hex: "229B00")))
                .frame(height: 20)
                .scaleEffect(x: 1,y: 40, anchor:.center)
                .clipShape(Capsule())
                .padding(.horizontal,100)
            
            Text("\(CommitCount)")
                .font(.system(size: 100))
                .foregroundStyle(Color(UIColor(hex: "229B00")))
                .padding(.bottom,400)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// カラーコードで指定するやつ
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}
