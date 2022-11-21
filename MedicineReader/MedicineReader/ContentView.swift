//
//  ContentView.swift
//  MedicineReader
//
//  Created by Hamza Jabali on 23/02/1444 AH.
//

import AVFoundation
import SwiftUI
import VisionKit

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    @State var SelectedIndex = 2
    let TabBarImageNames = ["newspaper", "cart", "camera.viewfinder", "person.crop.circle.badge.questionmark", "person"]
    
    @State private var showScannerSheet = false
    @State private var texts:[Scan] = []

    @State private var usrnm = ""
    @State private var pwd = ""
    @State private var wusrnm = 0
    @State private var wpwd = 0
    @State private var showlogsc = false
    
    var body: some View {
        VStack{
            ZStack{
                switch SelectedIndex {
                case 0:
                    Color.white
                    VStack{
                        Image("logo")
                        Spacer()
                        Image(systemName: "newspaper")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.black)
                        Text("News Area")
                            .font(.largeTitle)
                            .foregroundColor(Color("LightBlue"))
                        Spacer()
                    }
                case 1:
                    Color.white
                    VStack{
                        Image("logo")
                        Spacer()
                        Image(systemName: "cart")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.black)
                        Text("Store Area")
                            .font(.largeTitle)
                            .foregroundColor(Color("LightBlue"))
                        Spacer()
                    }
                case 2:
                    Color.white
                    VStack{
                        Image("logo")
                        Spacer()
                        if texts.count > 0 {
                            ScrollView {
                            ForEach(texts){text in
                                Spacer()
                                /*Text(text.content)*/
                                    .foregroundColor(Color("LightGreen"))
                                    .font(.title)
                                Spacer()
                                if text.content == "PREMOSAN" || text.content == "premosan" || text.content == "PREMOSA" || text.content == "20 Tablets PREMOSAN Metoclopramide Hydrochloride 10mg" || text.content == "premosa" ||
                                    text.content == "20 Tablets PREMOSAN Metoclopramide Hydrochloride 10mg Anti-emetic, regulator for Gastrointestinal motility fu phar Produced by Julphar Gulf Pharmaceutical Industries, P.O Box 997, Ras Al Khaimah, U.A.E." {
                                    Text("PREMOSAN")
                                    Image("premosan")
                                    Text("الإستخدامات:")
                                        .font(.title3)
                                        .foregroundColor(Color("LightBlue"))
                                    Text("لتخفيف حرقة المعدة وتسريع التئام التقرحات في المريء لدى الأشخاص المصابين بمرض الارتجاع المعدي المريئي.")
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                    Text("طريقة التناول:")
                                        .font(.title3)
                                        .foregroundColor(Color("LightGreen"))
                                    Text("يجب تناول الدواء على معدة فارغة , أي قبل  ٣٠ دقيقة من كل وجبة وقبل النوم.")
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                else if text.content == "Ezolvin" || text.content == "ezolvin" || text.content == "EZOLVIN" || text.content == "ezolv" {
                                    Image("ezolvin")
                                    Text("الإستخدامات:")
                                        .font(.title3)
                                        .foregroundColor(Color("LightBlue"))
                                    Text(" أحد الأدوية الطاردة للبلغم، إذ يعمل على تخفيف لزوجته وبذلك يصبح التخلص منه عن طريق السعال أكثر سهولة.")
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                    Text("طريقة التناول:")
                                        .font(.title3)
                                        .foregroundColor(Color("LightGreen"))
                                    Text(" 1 إلى 2 أقراص للأشخاص البالغين، وقرص واحد للأطفال بسن 5 - 10 سنوات.")
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                else {
                                    Text("لم يتم إدراج بيانات لهذا الدواء بعد.")
                                        .foregroundColor(Color("LightGreen"))
                                        .multilineTextAlignment(.center)
                                }
                                Spacer()
                            }
                            }
                        }
                        else{
                            Image(systemName: "camera")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(.black)
                            Text("No Result")
                                .font(.largeTitle)
                                .foregroundColor(Color("LightBlue"))
                        }
                        Spacer()
                    }
                case 3:
                    Color.white
/*                    .ignoresSafeArea() */
                    VStack {
                        Image("logo")
                        Spacer()
                        if showlogsc == true {
                            Text("Choose Contact Method:")
                                .font(.title2)
                            HStack {
                                Button("Call") {
                                    self.dialNumber(number: "+966582551522")
                                }
                                .foregroundColor(Color("LightBlue"))
                                .font(.title2)
                                .frame(width:300, height:50)
                                .background(Color.black)
                                .cornerRadius(10)
                            }
                            HStack {
                                Button("Chat") {
                                    
                                }
                                .foregroundColor(Color("LightBlue"))
                                .font(.title2)
                                .frame(width:300, height:50)
                                .background(Color.black)
                                .cornerRadius(10)
                            }
                        }
                        else {
                            Image(systemName: "person.fill.questionmark")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(Color("LightBlue"))
                            Text("Would you want a consultation?")
                                .font(.title)
                                .foregroundColor(Color("LightBlue"))
                            HStack {
                                Button("Sign In") {
                                    SelectedIndex = 4
                                }
                                .foregroundColor(.white)
                                .font(.title2)
                                .frame(width:200, height:50)
                                .background(Color.black)
                                .cornerRadius(10)
                            }
                        }
                        Spacer()
                    }
                case 4:
                    Color.white
/*                    .ignoresSafeArea()    */
                        VStack{
                            if showlogsc == true {
                                Image("logo")
                                Text("You're logged in @\(usrnm)")
                                    .font(.largeTitle)
                                    .foregroundColor(Color("LightBlue"))
                                    .bold()
                                    .padding()
                                Button("Logout") {
                                    self.showlogsc = false
                                }
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width:300, height:50)
                                .background(Color.black)
                                .cornerRadius(10)
                                Spacer()
                            }
                            else {
                                Image("logo")
                                Text("LoginPanel")
                                    .font(.largeTitle)
                                    .foregroundColor(Color("LightBlue"))
                                    .bold()
                                    .padding()
                                TextField("User Name", text: $usrnm)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color.black.opacity(0.05))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .border(.red, width: CGFloat(wusrnm))
                                SecureField("Password", text: $pwd)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color.black.opacity(0.05))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .border(.red, width: CGFloat(wpwd))
                                
                                Button("Sign In") {
                                    autheticateLogin(usrnm: usrnm, pwd: pwd)
                                }
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width:300, height:50)
                                .background(Color.black)
                                .cornerRadius(10)
                                
                                NavigationLink(destination: Text("You're logged in @\(usrnm)"), isActive: $showlogsc) {
                                    EmptyView()
                                }
                                HStack {
                                    Text("You don't have account?")
                                        .foregroundColor(.black)
                                    Text("Sign Up")
                                        .foregroundColor(Color("LightBlue"))
                                }
                                HStack {
                                    Image("applelogo")
                                        .padding(.horizontal)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("Sign In With Apple")
                                        .font(.title3)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding()
                                .frame(width:300, height:50)
                                .background(Color.black)
                                .cornerRadius(10)
                                HStack {
                                    Image("googlelogo")
                                        .padding(.horizontal)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("Sign In With Google")
                                        .font(.title3)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding()
                                .frame(width:300, height:50)
                                .background(Color.black)
                                .cornerRadius(10)
                                Spacer()
                            }
                        }
                default:
                    NavigationView{
                    }
                    .navigationBarTitle(Text("Scanning Area"), displayMode: .inline)
                }
            }
            HStack{
                ForEach(0..<5) {num in
                    if num == 2 {
                        Button(action: {
                            if SelectedIndex == 2 {
                                self.showScannerSheet = true
                            }
                            else {
                                SelectedIndex = num
                            }
                        }, label: {
                            Spacer()
                            Image(systemName: TabBarImageNames[num])
                                .font(.system(size:44, weight: .bold))
                                .foregroundColor(SelectedIndex == num ? Color("LightBlue") : .init(white:0.4))
                            Spacer()
                        })
                            .sheet(isPresented: $showScannerSheet, content: {
                                self.makeScannerView()
                            })
                    }
                    else {
                        Button(action: {
                            SelectedIndex = num
                        }, label: {
                            Spacer()
                            Image(systemName: TabBarImageNames[num])
                                .font(.system(size:24, weight: .bold))
                                .foregroundColor(SelectedIndex == num ? Color("LightBlue") : .init(white:0.4))
                            Spacer()
                        })
                    }

                }
                
            }
        }
            /*.navigationBarTitle(Text("Scanning Area"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showScannerSheet = true
            }, label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(.title)
            })
            .sheet(isPresented: $showScannerSheet, content: {
                self.makeScannerView()
            })
            )*/
    }

    func autheticateLogin(usrnm: String, pwd: String) {
        if usrnm == "Admin" {
            wusrnm = 0
            if pwd == "1420" {
                wpwd = 0
                showlogsc = true
            }
            else {
                    wpwd = 2
                }
        }
        else if usrnm == "Hamza" {
            wusrnm = 0
            if pwd == "1234" {
                wpwd = 0
                showlogsc = true
            }
            else {
                    wpwd = 2
                }
        }
    }

    private func makeScannerView()-> Camera {
        Camera(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = Scan(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }

    func dialNumber(number : String) {

     if let url = URL(string: "tel://\(number)"),
       UIApplication.shared.canOpenURL(url) {
          if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler:nil)
           } else {
               UIApplication.shared.openURL(url)
           }
       } else {
                // add error message here
       }
    }
    
    func openLink() {
        if let url = URL(string: "www.tawk.to/chat/6322f12637898912e96950f9/1gd07s09q?pop=1") {
              if #available(iOS 10, *){
                  UIApplication.shared.open(url)
              }else{
                  UIApplication.shared.openURL(url)
              }

          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

