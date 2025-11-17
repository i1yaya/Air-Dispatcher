import SwiftUI

struct AirfieldHelpView: View {
    @ObservedObject public var viewModel: AirfieldViewModel
    
    var body: some View {
        ZStack {
            Image("DispatcherMenuBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
                .opacity(0.75)
            
            Image("DispatcherHelpFrame\(viewModel.pageHelpAirfield)")
                .resizable()
                .scaledToFit()
                .frame(height: 400)
        }
        .onTapGesture {
            withAnimation() {
                if viewModel.pageHelpAirfield < 2 {
                    viewModel.pageHelpAirfield += 1
                } else {
                    viewModel.viewHelpAirfield = false
                }
            }
        }
    }
}

