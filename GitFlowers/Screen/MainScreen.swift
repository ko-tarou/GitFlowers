
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
                            .foregroundStyle(Color(UIColor(hex: "229B00")))
                    }
                    Button(action: {
                        
                    }){
                        Image(systemName: "person.crop.circle")
                            .foregroundStyle(Color(UIColor(hex: "229B00")))
                    }
                }
                .padding(.trailing,50)
            }
            
            Text("\(CommitCount)")
                .font(.system(size: 100))
                .foregroundStyle(Color(UIColor(hex: "229B00")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}
