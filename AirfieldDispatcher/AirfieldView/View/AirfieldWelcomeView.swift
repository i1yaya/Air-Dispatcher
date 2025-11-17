import SwiftUI

struct AirfieldWelcomeView: View {
    @ObservedObject public var viewModel: AirfieldViewModel
    
    var body: some View {
        ZStack {
            Image("DispatcherMenuBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
                .opacity(0.75)
            
            Image("DispatcherWelcomeFrame")
                .resizable()
                .scaledToFit()
                .frame(height: 310)
        }
        .onTapGesture {
            withAnimation() {
                viewModel.pageWelcomeAirfield = 2
                viewModel.viewWelcomeAirfield = false
                
                viewModel.saveDataAirfield()
            }
        }
    }
}


