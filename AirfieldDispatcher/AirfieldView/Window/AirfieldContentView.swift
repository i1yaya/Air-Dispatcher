import SwiftUI

struct AirfieldContentView: View {
    @ObservedObject private var viewModel = AirfieldViewModel()
    
    var body: some View {
        ZStack {
            AirfieldMenuView(viewModel: self.viewModel)
            
            AirfieldHelpView(viewModel: self.viewModel)
                .opacity(viewModel.viewHelpAirfield ? 1 : 0)
            
            AirfieldWelcomeView(viewModel: self.viewModel)
                .opacity(viewModel.viewWelcomeAirfield ? 1 : 0)
            
            AirfieldLevelView(viewModel: self.viewModel)
                .opacity(viewModel.viewLevelAirfield ? 1 : 0)
            
            AirfieldGameView(viewModel: self.viewModel)
                .opacity(viewModel.viewGameAirfield ? 1 : 0)
        }
        .onAppear() {
            viewModel.loadDataAirfield()
            
            viewModel.checkWelcomeView()
            viewModel.checkCurrentLevel()
        }
    }
}
