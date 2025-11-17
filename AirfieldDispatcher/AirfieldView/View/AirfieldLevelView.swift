import SwiftUI

struct AirfieldLevelView: View {
    @ObservedObject public var viewModel: AirfieldViewModel
    
    var body: some View {
        ZStack {
            Image("DispatcherLevelBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            VStack {
                HStack {
                    Button {
                        withAnimation() {
                            viewModel.viewLevelAirfield = false
                        }
                    } label: {
                        Image("DispatcherCloseButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 55)
                    }
                    
                    Spacer()
                    
                    Image("DispatcherLevelFrame")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 21)
                }
                .padding(.horizontal, 15.0)
                
                Spacer()
                
                VStack {
                    HStack {
                        if viewModel.pageLevelAirfield[0] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(0)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(0)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(0)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal, 15.0)
                    
                    HStack {
                        if viewModel.pageLevelAirfield[1] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(1)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(1)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(1)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                        
                        Spacer()
                        
                        if viewModel.pageLevelAirfield[2] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(2)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(2)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(2)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal, 15.0)
                    
                    HStack {
                        if viewModel.pageLevelAirfield[3] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(3)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(3)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(3)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal, 15.0)
                    
                    HStack {
                        if viewModel.pageLevelAirfield[4] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(4)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(4)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(4)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                        
                        Spacer()
                        
                        if viewModel.pageLevelAirfield[5] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(5)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(5)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(5)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal, 15.0)
                    
                    HStack {
                        if viewModel.pageLevelAirfield[6] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(6)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(6)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(6)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal, 15.0)
                    
                    HStack {
                        if viewModel.pageLevelAirfield[7] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(7)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(7)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(7)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                        
                        Spacer()
                        
                        if viewModel.pageLevelAirfield[8] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(8)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(8)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(8)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal, 15.0)
                    
                    HStack {
                        if viewModel.pageLevelAirfield[9] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(9)
                                }
                            } label: {
                                Image("DispatcherLevelCard\(9)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 65)
                            }
                        } else {
                            Image("DispatcherLevelCard\(9)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal, 15.0)
                }
                
                Spacer()
            }
            .padding(.vertical, 50.0)
        }
    }
}

