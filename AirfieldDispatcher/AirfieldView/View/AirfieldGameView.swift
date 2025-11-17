import SwiftUI

struct AirfieldGameView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var device = UIDevice()
    
    @ObservedObject public var viewModel: AirfieldViewModel
    
    var body: some View {
        ZStack {
            ZStack {
                Image("DispatcherGameBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                
                VStack {
                    HStack {
                        Button {
                            withAnimation() {
                                viewModel.viewPauseGameAirfield = true
                            }
                        } label: {
                            Image("DispatcherPauseButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                        
                        ZStack {
                            Image("DispatcherTimerFrame")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 75)
                            
                            VStack {
                                HStack {
                                    Text("\(viewModel.timeGameAirfield)")
                                        .font(.system(size: 26))
                                        .foregroundColor(.white)
                                        .fontWeight(.black)
                                        .shadow(color: .black, radius: 2)
                                    
                                    if viewModel.viewHintShowAirfield {
                                        Text("- 5")
                                            .font(.system(size: 26))
                                            .foregroundColor(.red)
                                            .fontWeight(.black)
                                            .shadow(color: .black, radius: 2)
                                    }
                                }
                                    
                                Spacer()
                            }
                            .frame(height: 55)
                        }
                        
                        if viewModel.activeHintButton {
                            Button {
                                withAnimation() {
                                    viewModel.gameHintAction()
                                }
                            } label: {
                                Image("DispatcherHintButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 55)
                            }
                        } else {
                            Image("DispatcherHintButtonUnActive")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Image("DispatcherGameGround")
                            .resizable()
                            .scaledToFit()
                            .frame(height: device.deviceModel == .iPhone8 || device.deviceModel == .iPhone8Plus ? 475 : 500)
                        
                        VStack {
                            HStack {
                                ForEach(viewModel.topHints[viewModel.levelGameAirfield]) { hint in
                                    Text("\(hint.target)")
                                        .font(.system(size: 14))
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2)
                                        .frame(width: viewModel.heightGameAirfield)
                                }
                            }
                            .padding(.leading, 12.5)
                            
                            HStack {
                                VStack {
                                    ForEach(viewModel.leftHints[viewModel.levelGameAirfield]) { hint in
                                        Text("\(hint.target)")
                                            .font(.system(size: 14))
                                            .fontWeight(.black)
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 2)
                                            .frame(height: viewModel.heightGameAirfield)
                                    }
                                }
                                .padding(.leading, -25.0)
                                
                                AirFieldView(viewModel: self.viewModel)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        if viewModel.viewWinShowAirfield {
                            Image("DispatcherGameBlock1")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        } else if viewModel.viewLoseShowAirfield {
                            Image("DispatcherGameBlock2")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        } else {
                            Image("DispatcherGameBlock0")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                        
                        if viewModel.viewWinShowAirfield {
                            Image("DispatcherGameField1")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        } else if viewModel.viewLoseShowAirfield {
                            Image("DispatcherGameField2")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        } else {
                            Button {
                                withAnimation() {
                                    viewModel.checkGameResult()
                                }
                            } label: {
                                Image("DispatcherGameField0")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 55)
                            }
                        }
                    }
                }
                .padding(.vertical, 50.0)
            }
            
            ZStack {
                Image("DispatcherMenuBackgroundGame")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                    .opacity(0.75)
                
                VStack {
                    Image("DispatcherTapFrame")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 10)
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            Image("DispatcherLevelCard\(viewModel.levelGameAirfield)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 65)
                        }
                        .frame(width: 345)
                        
                        ZStack {
                            Image("DispatcherLevelInfo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 345)
                            
                            VStack {
                                VStack {
                                    HStack {
                                        Text("LEVEL \(viewModel.levelGameAirfield + 1)")
                                            .font(.system(size: 14))
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.leading)
                                            .opacity(0.5)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 315)
                                    
                                    HStack {
                                        Text("\(viewModel.gameTitle[viewModel.levelGameAirfield])")
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                            .fontWeight(.black)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 315)
                                }
                                
                                VStack {
                                    HStack {
                                        Text("\(viewModel.gameDescription[viewModel.levelGameAirfield])")
                                            .font(.system(size: 14))
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 315)
                                    
                                    HStack {
                                        Text("\(viewModel.gameSubject[viewModel.levelGameAirfield])")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.leading)
                                            .opacity(0.5)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 315)
                                }
                                .padding(.top, 1.0)
                            }
                        }
                        .padding(.top, -55.0)
                    }
                    .padding(.top, 25.0)
                }
            }
            .onTapGesture {
                withAnimation() {
                    viewModel.pageGameAirfield = 1
                }
            }
            .opacity(viewModel.pageGameAirfield == 0 ? 1 : 0)
            
            ZStack {
                Image("DispatcherMenuBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                    .opacity(0.75)
                
                ZStack {
                    Image("DispatcherGroundPause")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 280)
                    
                    VStack {
                        HStack {
                            Text("LEVEL \(viewModel.levelGameAirfield + 1)")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .multilineTextAlignment(.leading)
                                .opacity(0.75)
                            
                            Spacer()
                        }
                        .frame(width: 225)
                        
                        Spacer()
                    }
                    .frame(height: 240)
                    
                    VStack {
                        Button {
                            withAnimation() {
                                viewModel.viewPauseGameAirfield = false
                            }
                        } label: {
                            Image("DispatcherGroundContinueButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                        
                        Button {
                            withAnimation() {
                                viewModel.setupAirfieldDispatcherGame(viewModel.levelGameAirfield)
                                viewModel.viewPauseGameAirfield = false
                            }
                        } label: {
                            Image("DispatcherGroundRestartButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                        
                        Button {
                            withAnimation() {
                                viewModel.viewGameAirfield = false
                                viewModel.viewPauseGameAirfield = false
                            }
                        } label: {
                            Image("DispatcherGroundMenuButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                    }
                    .padding(.top, 30.0)
                }
            }
            .opacity(viewModel.viewPauseGameAirfield ? 1 : 0)
            
            ZStack {
                Image("DispatcherMenuBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                    .opacity(0.75)
                
                ZStack {
                    Image("DispatcherGroundWin")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 225)
                    
                    VStack {
                        HStack {
                            Text("LEVEL \(viewModel.levelGameAirfield + 1)")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .multilineTextAlignment(.leading)
                                .opacity(0.75)
                            
                            Spacer()
                        }
                        .frame(width: 225)
                        
                        Spacer()
                    }
                    .frame(height: 185)
                    
                    VStack {
                        if viewModel.levelGameAirfield < 9 {
                            Button {
                                withAnimation() {
                                    viewModel.levelGameAirfield += 1
                                    
                                    viewModel.setupAirfieldDispatcherGame(viewModel.levelGameAirfield)
                                    viewModel.viewWinGameAirfield = false
                                }
                            } label: {
                                Image("DispatcherGroundContinueButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 55)
                            }
                        } else {
                            Button {
                                withAnimation() {
                                    viewModel.setupAirfieldDispatcherGame(viewModel.levelGameAirfield)
                                    viewModel.viewWinGameAirfield = false
                                }
                            } label: {
                                Image("DispatcherGroundRestartButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 55)
                            }
                        }
                        
                        Button {
                            withAnimation() {
                                viewModel.viewGameAirfield = false
                                viewModel.viewWinGameAirfield = false
                            }
                        } label: {
                            Image("DispatcherGroundMenuButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                    }
                    .padding(.top, 30.0)
                }
            }
            .opacity(viewModel.viewWinGameAirfield ? 1 : 0)
            
            ZStack {
                Image("DispatcherMenuBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                    .opacity(0.75)
                
                ZStack {
                    Image("DispatcherGroundLose")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 225)
                    
                    VStack {
                        HStack {
                            Text("LEVEL \(viewModel.levelGameAirfield + 1)")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .multilineTextAlignment(.leading)
                                .opacity(0.75)
                            
                            Spacer()
                        }
                        .frame(width: 225)
                        
                        Spacer()
                    }
                    .frame(height: 185)
                    
                    VStack {
                        Button {
                            withAnimation() {
                                viewModel.setupAirfieldDispatcherGame(viewModel.levelGameAirfield)
                                viewModel.viewLoseGameAirfield = false
                            }
                        } label: {
                            Image("DispatcherGroundRestartButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                        
                        Button {
                            withAnimation() {
                                viewModel.viewGameAirfield = false
                                viewModel.viewLoseGameAirfield = false
                            }
                        } label: {
                            Image("DispatcherGroundMenuButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 55)
                        }
                    }
                    .padding(.top, 30.0)
                }
            }
            .opacity(viewModel.viewLoseGameAirfield ? 1 : 0)
        }
        .onReceive(timer) { _ in
            if viewModel.viewGameAirfield && viewModel.pageGameAirfield == 1 && !viewModel.viewPauseGameAirfield && !viewModel.viewWinGameAirfield && !viewModel.viewLoseGameAirfield && !viewModel.viewHintShowAirfield {
                if viewModel.timeGameAirfield > 1 {
                    withAnimation() {
                        viewModel.checkHintButtonActive()
                        
                        viewModel.timeGameAirfield -= 1
                    }
                } else if viewModel.timeGameAirfield == 1 {
                    withAnimation() {
                        viewModel.checkHintButtonActive()
                        
                        viewModel.timeGameAirfield -= 1
                        viewModel.setupLose()
                    }
                }
            }
        }
    }
}
