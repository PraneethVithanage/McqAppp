//
//  ContentView.swift
//  McqApp
//
//  Created by praneeth vithanage on 2021-09-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // for light status bar
        Home().preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home:View {
    
 @State var index = 0
    
    var body : some View {
        GeometryReader{_ in
            VStack{
                Image("main_icon")
                    .resizable()
                    .frame(width: 60, height: 60,alignment: .center)
                    .padding(.top,40)
                    .padding(.bottom,10)
                
                Text("MCQ Hub").foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom,40)
                
                ZStack{
                    SingUp(index: self.$index)
                        // change view order....
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)
                }
               

            }.padding()
        }
        
        .background(Color("color1").edgesIgnoringSafeArea(.all))
    }
}

//Curve .....

struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            
            // right side curve
            
            path.move(to: CGPoint( x:rect.width , y: 100))
            path.addLine(to: CGPoint(x:rect.width,y:rect.height))
            path.addLine(to: CGPoint(x:0,y:rect.height))
            path.addLine(to: CGPoint(x:0,y:0))
            
            
        }
    }
    
}

struct CShapeLeft : Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            
            // left side curve
            
            path.move(to: CGPoint( x:0 , y: 100))
            path.addLine(to: CGPoint(x:0,y:rect.height))
            path.addLine(to: CGPoint(x:rect.width,y:rect.height))
            path.addLine(to: CGPoint(x:rect.width,y:0))
            
            
        }
    }
    
}

struct Login : View {
    
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    
    var body : some View{
        
        ZStack(alignment:.bottom) {
            
            VStack{
                HStack{
                    VStack(spacing:10){
                        Text("Login").foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height:5)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.top,30) // for the top curver
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "envelope.fill").foregroundColor(Color("color3"))
                        
                        TextField("Email Adress",text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)
                
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill").foregroundColor(Color("color3"))
                        
                        SecureField("Password",text: self.$password)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)

                HStack{
                    Spacer(minLength: 0)
                    Button(action: {
                       
                    }){
                        Text("Forget Password").foregroundColor(Color.white.opacity(0.5))
                    }
                }.padding(.top,15)
                
            }.padding()
            // bottom padding
            .padding(.bottom,65)
            .background(Color("color2"))
            .clipShape(CShape())
            .contentShape(CShape())
            .cornerRadius(35)
            .onTapGesture {
                self.index = 0
            }
            .padding(.horizontal,20)
            
            //Button ....
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,50)
                    .background(Color("color3"))
                    .clipShape(Capsule())
                    // shadow....
                    .shadow(color:Color.white.opacity(0.1),radius:5,x:0,y:5)
            }
            
            // moving view down...
            .offset(y:25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

// SingUp Page

struct SingUp : View {
    
    @State var email = ""
    @State var password = ""
    @State var repassword = ""
    @Binding var index : Int
    
    var body : some View{
        
        ZStack(alignment:.bottom) {
            
            VStack{
                HStack{
                    
                    Spacer(minLength: 0)
                    VStack(spacing:10){
                        
                        Text("Sing Up").foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height:5)
                        
                    }
                    
                }
                .padding(.top,40) // for the top curver
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "envelope.fill").foregroundColor(Color("color3"))
                        
                        TextField("Email Adress",text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)
                
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill").foregroundColor(Color("color3"))
                        
                        SecureField("Password",text: self.$password)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)
                 
                //repalce the fogget password  with reenter password...
                //so smae height will maintaind...
                
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill").foregroundColor(Color("color3"))
                        
                        SecureField("Password",text: self.$repassword)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)
                
            }.padding()
            // bottom padding
            .padding(.bottom,65)
            .background(Color("color2"))
            // clipping the content shape also for tap gesture
            .clipShape(CShapeLeft())
            .contentShape(CShapeLeft())
            .onTapGesture {
                self.index = 1
            }
            .shadow(color:Color.black.opacity(0.1),radius:5,x:0,y:-5)
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            //Button ....
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                Text("SING UP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,50)
                    .background(Color("color3"))
                    .clipShape(Capsule())
                    // shadow....
                    .shadow(color:Color.white.opacity(0.1),radius:5,x:0,y:5)
            }
            
            // moving view down...
            .offset(y:25)
            // hiding view when its in background
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
