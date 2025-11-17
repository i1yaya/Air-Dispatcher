import SwiftUI

struct AirFieldView: View {
    @ObservedObject public var viewModel: AirfieldViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.leftHints[viewModel.levelGameAirfield]) { row in
                HStack {
                    ForEach(viewModel.topHints[viewModel.levelGameAirfield]) { column in
                        if viewModel.currentField[row.id][column.id] == -1 {
                            Image("GameTile0")
                                .resizable()
                                .scaledToFit()
                                .frame(height: viewModel.heightGameAirfield)
                                .opacity(0.0)
                        } else if viewModel.currentField[row.id][column.id] == 0 || viewModel.currentField[row.id][column.id] == 3 {
                            Button {
                                withAnimation() {
                                    viewModel.currentField[row.id][column.id] = 1
                                    
                                    viewModel.checkHintButtonActive()
                                }
                            } label: {
                                Image("GameTile\(viewModel.currentField[row.id][column.id])")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: viewModel.heightGameAirfield)
                            }
                        } else if viewModel.currentField[row.id][column.id] == 1 {
                            Button {
                                withAnimation() {
                                    viewModel.currentField[row.id][column.id] = 0
                                    
                                    viewModel.checkHintButtonActive()
                                }
                            } label: {
                                Image("GameTile\(viewModel.currentField[row.id][column.id])")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: viewModel.heightGameAirfield)
                            }
                        } else if viewModel.currentField[row.id][column.id] == 2 {
                            Image("GameTile\(viewModel.currentField[row.id][column.id])")
                                .resizable()
                                .scaledToFit()
                                .frame(height: viewModel.heightGameAirfield)
                        }
                    }
                }
            }
        }
    }
}


