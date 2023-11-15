//
//  ContentView.swift
//  structuredRevamp
//
//  Created by Salvo on 14/11/23.
//

import SwiftUI
import PopupView

struct ContentView: View {
    
    @State var mainDate = Date()
    var monthName: String {
        mainDate.getMonthName()
    }
    var day: Int {
        mainDate.getDay()
    }
    
    @State var isPresentedDataPicker = false
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    mainDate = Date()
                }, label: {
                    Text("\(monthName)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.autoWB)
                    Text("\(day)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.main)
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    isPresentedDataPicker = true
                }, label: {
                    Image(systemName: "calendar")
                        .foregroundStyle(.main)
                        .font(.title)
                }).popup(isPresented: $isPresentedDataPicker, view: {
                    DataPickerView(selectedData: $mainDate)
                }, customize: {
                    $0
                        .type(.toast)
                        .isOpaque(true)
                        .position(.top)
                        .closeOnTap(false)
                        .closeOnTapOutside(true)
                        .dragToDismiss(true)
                        .backgroundColor(.black.opacity(0.2))
                })
                
                Image(systemName: "gear")
                    .foregroundStyle(.main)
                    .font(.title)
                    .padding(.trailing)
            }
            TabView() {
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Text("Mon")
                            Text("13")
                            HStack{
                                Circle()
                                    .frame(width: 20)
                                    .padding(-8)
                                    .overlay(content: {
                                        Image(systemName: "trophy.fill")
                                            .foregroundStyle(.autoWBOpposite)
                                            .scaleEffect(0.5)
                                    })
                            }
                        }
                    })
                    .padding()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Text("Mon")
                            Text("13")
                            HStack{
                                Circle()
                                    .frame(width: 20)
                                    .padding(-8)
                                    .overlay(content: {
                                        Image(systemName: "trophy.fill")
                                            .foregroundStyle(.autoWBOpposite)
                                            .scaleEffect(0.5)
                                    })
                            }
                        }
                    })
                    .padding()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Text("Mon")
                            Text("13")
                            HStack{
                                Circle()
                                    .frame(width: 20)
                                    .padding(-8)
                                    .overlay(content: {
                                        Image(systemName: "trophy.fill")
                                            .foregroundStyle(.autoWBOpposite)
                                            .scaleEffect(0.5)
                                    })
                            }
                        }
                    })
                    .padding()
                }
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Text("Mon")
                            Text("13")
                            HStack{
                                Circle()
                                    .frame(width: 20)
                                    .padding(-8)
                                    .overlay(content: {
                                        Image(systemName: "trophy.fill")
                                            .foregroundStyle(.autoWBOpposite)
                                            .scaleEffect(0.5)
                                    })
                            }
                        }
                    })
                    .padding()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Text("Mon")
                            Text("13")
                            HStack{
                                Circle()
                                    .frame(width: 20)
                                    .padding(-8)
                                    .overlay(content: {
                                        Image(systemName: "trophy.fill")
                                            .foregroundStyle(.autoWBOpposite)
                                            .scaleEffect(0.5)
                                    })
                            }
                        }
                    })
                    .padding()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Text("Mon")
                            Text("13")
                            HStack{
                                Circle()
                                    .frame(width: 20)
                                    .padding(-8)
                                    .overlay(content: {
                                        Image(systemName: "trophy.fill")
                                            .foregroundStyle(.autoWBOpposite)
                                            .scaleEffect(0.5)
                                    })
                            }
                        }
                    })
                    .padding()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 100)
            .padding(-20)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView(mainDate: Date())
}
