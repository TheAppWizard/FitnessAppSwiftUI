//
//  ContentView.swift
//  FitnessAppSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 24/01/21.
// The App Wizard
// Instagram : theappwizard2408


import SwiftUI


private let gradient = AngularGradient(
    gradient: Gradient(colors: [Color("OrangeS"), Color("PinkS")]),
    center: .center,
    startAngle: .degrees(180),
    endAngle: .degrees(0))


private let gradient2 = AngularGradient(
    gradient: Gradient(colors: [Color("PurpleS"), Color("BlueS")]),
    center: .center,
    startAngle: .degrees(180),
    endAngle: .degrees(0))


struct ContentView: View {
    var body: some View {
       
        FinalUI()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



































struct FinalUI: View {
    var body: some View {
        ZStack{
                RadialGradient(gradient: Gradient(colors: [Color("DarkL"), Color("DarkD")]), center: .center, startRadius: 5, endRadius: 500)
                    .edgesIgnoringSafeArea(.all)
           
            
       
      
            
        ScrollView(.vertical,showsIndicators: false) {
                VStack{
                    Wave().offset( y: 120)
                    
                        Spacer().frame(height: 30, alignment: .center)

                        Text("today")
                            .font(.system(size: 40))
                            .fontWeight(.thin)
                            .foregroundColor(Color.white)

                        Spacer().frame(height: 5, alignment: .center)

                        StatusRing()
                    
                         Text("15:45")
                        .font(.system(size: 40))
                        .fontWeight(.thin)
                        .foregroundColor(Color.white)
                    
                       Image("arrowd")
                            .resizable().frame(width: 20, height: 50, alignment: .center)
                        .opacity(0.8)
                    
                         

                        Spacer()
                    
                        WaveUI().offset(y: 220)
                    
                    }
          }
        }
    }
}
        
    
struct StatusRing: View {
    
       @State private var borderanim1: CGFloat = 0.0
       let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
        @State private var borderanim2: CGFloat = 0.0
        let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
    
    
    
    var body: some View {
        ZStack{
           
            ZStack{
            Circle()
                    .stroke(Color.gray, lineWidth: 20).opacity(0.3)
                    .frame(width: 300, height: 300, alignment: .center)
                 
            
            
                     Circle()
                        .trim( from: 0, to: self.borderanim1)
                        .stroke(gradient, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                        .frame(width: 300, height: 300, alignment: .center)
                        .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                        .rotationEffect(.degrees(-90))
                                       .onReceive(timer1) { _ in
                                           withAnimation {
                                            guard self.borderanim1 < 0.65 else { return }
                                            self.borderanim1 += 0.65
                                           }
                                       }
             
                
            }.frame(width: 400, height: 400, alignment: .center)
            
            
                 Circle()
                    
                    .stroke(Color.gray, lineWidth: 20).opacity(0.3)
                  .frame(width: 230, height: 230, alignment: .center)
                 
                     Circle()
                           .trim( from: 0, to: self.borderanim2)
                           .stroke(gradient2, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                           .frame(width: 230, height: 230, alignment: .center)
                           .rotationEffect(.degrees(-270))
                           .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                           .rotationEffect(.degrees(-90))
                                       .onReceive(timer2) { _ in
                                           withAnimation {
                                            guard self.borderanim2 < 0.7 else { return }
                                            self.borderanim2 += 0.7
                                           }
                                       }
            VStack{
                
                HStack{
                
                        Text("5.15")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .foregroundColor(Color.white)
                            
                        Text("Km")
                            .font(.headline)
                                .fontWeight(.thin)
                                .foregroundColor(Color.white)
               
                }
                    
                    Spacer().frame(height: 25, alignment: .center)
                    
                    HStack{
                    
                        Text("5500")
                             .font(.largeTitle)
                             .fontWeight(.thin)
                              .foregroundColor(Color.white)
                                
                            Text("st")
                               .font(.headline)
                               .fontWeight(.thin)
                               .foregroundColor(Color.white)
                   
                    }
                
              }
            
        }
    }
}



struct Wave: View {
    let screen = UIScreen.main.bounds
        @State var isAnimated = false
        var body: some View {
           
       
      
                
           VStack {
          
                // Wave
                 getWavePath(interval: screen.width*1.5, amplitude: 140, base: 170 + screen.height/2)
                    .foregroundColor(Color("DarkD"))
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    .offset(x: isAnimated ? -1*screen.width * 1.5 : 0)
                    .animation(
                        Animation.linear(duration: 3)
                            .repeatForever(autoreverses: false)
                    )
            
            
           }
           .onAppear() {
                self.isAnimated = true
            }
                
                
}
       
    
            
        
    
    //Wave Function Produces Sine Wave
        func getWavePath(interval: CGFloat, amplitude: CGFloat = 100, base: CGFloat = UIScreen.main.bounds.height/2) -> Path {
            Path {
                path in
                path.move(to: CGPoint(x: 0, y: base))
                path.addCurve(
                    to: CGPoint(x: 1*interval , y: base),
                    control1: CGPoint(x: interval * (0.35), y: amplitude + base ),
                    control2: CGPoint(x: interval * (0.65), y: -amplitude + base)
                )
                path.addCurve(
                    to: CGPoint(x: 2*interval , y: base),
                    control1: CGPoint(x: interval * (1.35), y: amplitude + base ),
                    control2: CGPoint(x: interval * (1.65), y: -amplitude + base)
                )
                path.addLine(to: CGPoint(x: 2*interval, y: screen.height))
                path.addLine(to: CGPoint(x: 0, y: screen.height))
                
            }
        }
    }


struct WaveUI: View {
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
        
    var body: some View {
            ZStack{
                
                
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 400, height: 950, alignment: .center)
                    .foregroundColor(Color("DarkD"))
                
                VStack{
                
                    
                    
                    Text("STATUS") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    Spacer().frame( height: 30, alignment: .center)
                    
                    
                
               //----
                   VStack{
                    HStack{
                        Image(systemName: "figure.walk")
                            .resizable()
                            .frame(width: 25, height: 40, alignment: .center)
                            .foregroundColor(Color.white)
                            .opacity(0.45)
                        
                        Spacer().frame(width: 100, alignment: .center)
                        
                        Text("5500") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                        
                        Spacer().frame(width: 60, alignment: .center)
                        
                        Text("Steps") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                        
                    }
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 350, height: 10, alignment: .center)
                            .foregroundColor(.gray).opacity(0.1)
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(LinearGradient(
                                 gradient: .init(colors: [Color("PurpleS"), Color("BlueS")]),
                                 startPoint: .init(x: 0, y: 0),
                                endPoint: .init(x: 0.5, y: 0)
                               ))
                            .frame(width: 200, height: 10, alignment: .center)
                            .offset(x: -75)
                            
                        
                    }
                    
                }
                //----
                    
                    Spacer().frame( height: 60, alignment: .center)
                    
                    //----
                        VStack{
                         HStack{
                             Image(systemName: "suit.heart.fill")
                                 .resizable()
                                 .frame(width: 30, height: 30, alignment: .center)
                                 .foregroundColor(Color.white)
                                .opacity(0.45)
                             
                             Spacer().frame(width: 120, alignment: .center)
                             
                             Text("72") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                             
                             Spacer().frame(width: 100, alignment: .center)
                             
                             Text("BPM") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                             
                         }
                         ZStack{
                             
                             RoundedRectangle(cornerRadius: 25.0)
                                 .frame(width: 350, height: 10, alignment: .center)
                                .foregroundColor(.gray).opacity(0.3)
                            
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(LinearGradient(
                                     gradient: .init(colors: [Color("OrangeS"), Color("PinkS")]),
                                     startPoint: .init(x: 0, y: 0),
                                    endPoint: .init(x: 0.5, y: 0)
                                   ))
                                .frame(width: 180, height: 10, alignment: .center)
                                .offset(x: -82)
                                .foregroundColor(Color.red)
                             
                         }
                         
                     }
                     //----
                    
                    Spacer().frame( height: 60, alignment: .center)
                    
                    //----
                        VStack{
                         HStack{
                             Image(systemName: "flame")
                                 .resizable()
                                 .frame(width: 30, height: 40, alignment: .center)
                                 .foregroundColor(Color.white)
                                .opacity(0.45)
                                
                             
                             Spacer().frame(width: 110, alignment: .center)
                             
                             Text("0.35") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                             
                             Spacer().frame(width: 90, alignment: .center)
                             
                             Text("KCal") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                             
                         }
                         ZStack{
                             
                             RoundedRectangle(cornerRadius: 25.0)
                                 .frame(width: 350, height: 10, alignment: .center)
                                .foregroundColor(.gray).opacity(0.3)
                            
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(LinearGradient(
                                     gradient: .init(colors: [Color("PurpleS"), Color("PinkS")]),
                                     startPoint: .init(x: 0, y: 0),
                                    endPoint: .init(x: 0.5, y: 0)
                                   ))
                                .frame(width: 100, height: 10, alignment: .center)
                                .offset(x: -121)
                             
                         }
                         
                     }
                     //----
                    
                    Spacer().frame( height: 60, alignment: .center)
                    
                    //----
                        VStack{
                         HStack{
                             Image(systemName: "arrow.up.forward")
                                 .resizable()
                                 .frame(width: 30, height: 30, alignment: .center)
                                 .foregroundColor(Color.white)
                                .opacity(0.45)
                             
                             Spacer().frame(width: 100, alignment: .center)
                             
                             Text("5.15") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                             
                             Spacer().frame(width: 100, alignment: .center)
                             
                             Text("Km") .font(.system(size: 30)).fontWeight(.thin).foregroundColor(Color.white)
                             
                         }
                         ZStack{
                             
                             RoundedRectangle(cornerRadius: 25.0)
                                 .frame(width: 350, height: 10, alignment: .center)
                                .foregroundColor(.gray).opacity(0.3)
                            
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(LinearGradient(
                                     gradient: .init(colors: [Color("PurpleS"), Color("BlueS")]),
                                     startPoint: .init(x: 0, y: 0),
                                    endPoint: .init(x: 0.5, y: 0)
                                   ))
                                .frame(width: 280, height: 10, alignment: .center)
                                .offset(x: -35)
                               
                         }
                         
                     }
                     //----
               
                    Spacer()
                    
                }.padding(.all)
                
                Wave().offset( y: 120)
            }
        }
}


