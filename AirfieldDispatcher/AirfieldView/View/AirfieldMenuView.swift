import SwiftUI

struct AirfieldMenuView: View {
    @ObservedObject public var viewModel: AirfieldViewModel
    
    var body: some View {
        ZStack {
            Image("DispatcherMenuBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            VStack {
                Image("DispatcherMenuFrame0")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 164)
                
                ZStack {
                    Image("DispatcherMenuFrame1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 360)
                    
                    VStack {
                        Spacer()
                        
                        ForEach(0..<3) { index in
                            Button {
                                switch index {
                                case 0:
                                    withAnimation() {
                                        viewModel.checkCurrentLevel()
                                        viewModel.setupAirfieldDispatcherGame(viewModel.currentLevelAirfield)
                                    }
                                case 1:
                                    withAnimation() {
                                        viewModel.viewLevelAirfield = true
                                    }
                                case 2:
                                    withAnimation() {
                                        viewModel.pageHelpAirfield = 0
                                        viewModel.viewHelpAirfield = true
                                    }
                                default:
                                    print("Error: unowned")
                                }
                            } label: {
                                Image("DispatcherMenuButton\(index)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 55)
                            }
                        }
                    }
                    .frame(height: 275)
                }
                
                Image("DispatcherMenuFrame2")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 164)
            }
        }
    }
}
