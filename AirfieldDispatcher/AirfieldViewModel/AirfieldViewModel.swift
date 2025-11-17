import Foundation
import SwiftUI

class AirfieldViewModel: ObservableObject {
    // MARK: - Data
    @Published var pageWelcomeAirfield: Int = 0
    @Published var pageLevelAirfield: [Int] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // MARK: - App Template's
    @Published var viewWelcomeAirfield: Bool = true
    @Published var viewHelpAirfield: Bool = false
    @Published var viewLevelAirfield: Bool = false
    @Published var viewGameAirfield: Bool = false
    
    @Published var pageHelpAirfield: Int = 0
    @Published var currentLevelAirfield: Int = 0
    
    @Published var gameTitle: [String] = [
        "Trainee Dispatcher",
        "Junior Assistant",
        "Shift Operator",
        "Line Coordinator",
        "Air Supervisor",
        "Runway Controller",
        "Terminal Specialist",
        "Senior Controller",
        "Chief Dispatcher",
        "Director of Air"
    ]
    @Published var gameDescription: [String] = [
        "You’ve taken the first step toward mastering the skies. Every decision counts as you begin learning the basics of air traffic coordination.",
        "Your training is paying off as you begin assisting with real departures. Each cleared plane boosts your confidence and skill.",
        "You’re now responsible for monitoring multiple flights. Precision and quick thinking are key as your role in the control tower expands.",
        "Managing routine departures is second nature. Smooth coordination between pilots and ground crews ensures safe takeoffs.",
        "You now oversee ground movements and air traffic flow. Every command you give plays a vital role in keeping safe and efficient.",
        "Handling multiple takeoffs is a challenge. Timing and accuracy are everything as you direct planes onto the runway.",
        "You’ve earned the trust to manage airspace coordination at a major terminal. Complex flight schedules and push your skills.",
        "High-volume traffic is no longer overwhelming you’re in control. Your sharp making ensures every plane takes off.",
        "From the control tower, you oversee every detail of flight. The pressure is immense, but your experience makes precise.",
        "You’ve reached the top of your field. Every plane in the sky moves according to your direction."
    ]
    @Published var gameSubject: [String] = [
        "Starting your journey in air traffic control.",
        "Gaining your first real experience on the job.",
        "Trusted with your first operational responsibilities.",
        "Managing routine departures with growing confidence.",
        "Overseeing flight movements on the ground and in the air.",
        "Efficiently managing runway operations for multiple flights.",
        "Handling complex airspace coordination at a major terminal.",
        "Expertly managing high-volume air traffic operations.",
        "Leading the control tower with authority and precision.",
        "Reaching the pinnacle of your career as the ultimate decision-maker."
    ]
    
    // MARK: - Game Template's
    @Published var viewPauseGameAirfield: Bool = false
    @Published var viewWinGameAirfield: Bool = false
    @Published var viewLoseGameAirfield: Bool = false
    @Published var viewWinShowAirfield: Bool = false
    @Published var viewLoseShowAirfield: Bool = false
    @Published var viewHintShowAirfield: Bool = false
    
    @Published var activeHintButton: Bool = true
    @Published var levelGameAirfield: Int = 0
    @Published var pageGameAirfield: Int = 0
    @Published var timeGameAirfield: Int = 60
    @Published var heightGameAirfield: CGFloat = 60
    @Published var leftHints: [[AirfieldTarget]] = [
        [AirfieldTarget(id: 0, target: 2), AirfieldTarget(id: 1, target: 1), AirfieldTarget(id: 2, target: 3)],
        [AirfieldTarget(id: 0, target: 1), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 1), AirfieldTarget(id: 3, target: 2), AirfieldTarget(id: 4, target: 1)],
        [AirfieldTarget(id: 0, target: 1), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 0), AirfieldTarget(id: 3, target: 1), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 1)],
        [AirfieldTarget(id: 0, target: 1), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 2), AirfieldTarget(id: 3, target: 1), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 2)],
        [AirfieldTarget(id: 0, target: 3), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 1), AirfieldTarget(id: 3, target: 2), AirfieldTarget(id: 4, target: 1), AirfieldTarget(id: 5, target: 2), AirfieldTarget(id: 6, target: 2), AirfieldTarget(id: 7, target: 1)],
        [AirfieldTarget(id: 0, target: 1), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 1), AirfieldTarget(id: 3, target: 2), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 3), AirfieldTarget(id: 6, target: 1), AirfieldTarget(id: 7, target: 3)],
        [AirfieldTarget(id: 0, target: 3), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 2), AirfieldTarget(id: 3, target: 3), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 2), AirfieldTarget(id: 6, target: 4)],
        [AirfieldTarget(id: 0, target: 3), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 3), AirfieldTarget(id: 3, target: 3), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 2), AirfieldTarget(id: 6, target: 2)],
        [AirfieldTarget(id: 0, target: 1), AirfieldTarget(id: 1, target: 3), AirfieldTarget(id: 2, target: 2), AirfieldTarget(id: 3, target: 1), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 3), AirfieldTarget(id: 6, target: 3), AirfieldTarget(id: 7, target: 2), AirfieldTarget(id: 8, target: 1), AirfieldTarget(id: 9, target: 2)],
        [AirfieldTarget(id: 0, target: 2), AirfieldTarget(id: 1, target: 4), AirfieldTarget(id: 2, target: 3), AirfieldTarget(id: 3, target: 4), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 2), AirfieldTarget(id: 6, target: 4), AirfieldTarget(id: 7, target: 3), AirfieldTarget(id: 8, target: 1)]
    ]
    @Published var topHints: [[AirfieldTarget]] = [
        [AirfieldTarget(id: 0, target: 2), AirfieldTarget(id: 1, target: 3), AirfieldTarget(id: 2, target: 1)],
        [AirfieldTarget(id: 0, target: 3), AirfieldTarget(id: 1, target: 1), AirfieldTarget(id: 2, target: 3)],
        [AirfieldTarget(id: 0, target: 3), AirfieldTarget(id: 1, target: 1), AirfieldTarget(id: 2, target: 1), AirfieldTarget(id: 3, target: 2)],
        [AirfieldTarget(id: 0, target: 2), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 3), AirfieldTarget(id: 3, target: 1), AirfieldTarget(id: 4, target: 2)],
        [AirfieldTarget(id: 0, target: 5), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 2), AirfieldTarget(id: 3, target: 3), AirfieldTarget(id: 4, target: 2)],
        [AirfieldTarget(id: 0, target: 2), AirfieldTarget(id: 1, target: 3), AirfieldTarget(id: 2, target: 3), AirfieldTarget(id: 3, target: 4), AirfieldTarget(id: 4, target: 3)],
        [AirfieldTarget(id: 0, target: 5), AirfieldTarget(id: 1, target: 1), AirfieldTarget(id: 2, target: 4), AirfieldTarget(id: 3, target: 3), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 3)],
        [AirfieldTarget(id: 0, target: 2), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 4), AirfieldTarget(id: 3, target: 3), AirfieldTarget(id: 4, target: 3), AirfieldTarget(id: 5, target: 3)],
        [AirfieldTarget(id: 0, target: 3), AirfieldTarget(id: 1, target: 2), AirfieldTarget(id: 2, target: 4), AirfieldTarget(id: 3, target: 3), AirfieldTarget(id: 4, target: 3), AirfieldTarget(id: 5, target: 5)],
        [AirfieldTarget(id: 0, target: 5), AirfieldTarget(id: 1, target: 3), AirfieldTarget(id: 2, target: 4), AirfieldTarget(id: 3, target: 1), AirfieldTarget(id: 4, target: 2), AirfieldTarget(id: 5, target: 7), AirfieldTarget(id: 6, target: 3)]
    ]
    @Published public var currentField: [[Int]] = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
    ]
    @Published var targetField: [[Int]] = [
        [1, 1, 0],
        [0, 1, 0],
        [1, 1, 1]
    ]

    public func checkGameResult() {
        var topCount: Int = 0
        var topFlag: Bool = true
        
        for topHint in 0...topHints[levelGameAirfield].count - 1 {
            topCount = 0
            
            for row in 0...currentField.count - 1 {
                if currentField[row][topHint] == 1 {
                    topCount += currentField[row][topHint]
                }
            }
            
            if topCount != topHints[levelGameAirfield][topHint].target {
                topFlag = false
                break
            }
        }
        
        if topFlag {
            var leftCount: Int = 0
            var leftFlag: Bool = true
            
            for leftHint in 0...leftHints[levelGameAirfield].count - 1 {
                leftCount = 0
                
                for column in 0...currentField[leftHint].count - 1 {
                    if currentField[leftHint][column] == 1 {
                        leftCount += currentField[leftHint][column]
                    }
                }
                
                if leftCount != leftHints[levelGameAirfield][leftHint].target {
                    leftFlag = false
                    break
                }
            }
            
            if leftFlag {
                withAnimation() {
                    setupWin()
                }
            } else {
                withAnimation() {
                    setupLose()
                }
            }
        } else {
            withAnimation() {
                setupLose()
            }
        }
    }

    public func setupLose() {
        withAnimation() {
            viewLoseShowAirfield = true
            
            for row in 0...currentField.count - 1 {
                for column in 0...currentField[row].count - 1 {
                    if currentField[row][column] == 1 {
                        withAnimation() {
                            currentField[row][column] = 2
                        }
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation() {
                    self.viewLoseGameAirfield = true
                    self.viewLoseShowAirfield = false
                }
            }
        }
    }
    
    public func setupWin() {
        withAnimation() {
            viewWinShowAirfield = true
            
            if levelGameAirfield < 9 {
                pageLevelAirfield[levelGameAirfield + 1] = 1
                saveDataAirfield()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation() {
                    self.viewWinGameAirfield = true
                    self.viewWinShowAirfield = false
                }
            }
        }
    }
    
    public func checkHintButtonActive() {
//        if timeGameAirfield > 10 {
//            var hintActive: Bool = false
//            
//            for row in 0...currentField.count - 1 {
//                for column in 0...currentField[row].count - 1 {
//                    if currentField[row][column] == 0 && targetField[row][column] == 1 {
//                        hintActive = true
//                        
//                        break
//                    }
//                    
//                    if hintActive {
//                        break
//                    }
//                }
//                
//                if hintActive {
//                    break
//                }
//            }
//            
//            if hintActive {
//                withAnimation() {
//                    activeHintButton = true
//                }
//            } else {
//                withAnimation() {
//                    activeHintButton = false
//                }
//            }
//        } else {
//            withAnimation() {
//                activeHintButton = false
//            }
//        }
    }
    
    public func gameHintAction() {
//        var hintTileRow: Int = 0
//        var hintTileColumn: Int = 0
//        var hintActive: Bool = false
//        
//        for row in 0...currentField.count - 1 {
//            for column in 0...currentField[row].count - 1 {
//                if currentField[row][column] == 0 && targetField[row][column] == 1 {
//                    hintTileRow = row
//                    hintTileColumn = column
//                    hintActive = true
//                    
//                    break
//                }
//                
//                if hintActive {
//                    break
//                }
//            }
//            
//            if hintActive {
//                break
//            }
//        }
//        
//        if hintActive {
//            if timeGameAirfield > 10 {
//                withAnimation() {
//                    viewHintShowAirfield = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                        withAnimation() {
//                            self.viewHintShowAirfield = false
//                            self.timeGameAirfield -= 5
//                        }
//                    }
//                    currentField[hintTileRow][hintTileColumn] = 3
//                }
//            }
//        }
    }
    
    public func checkCurrentLevel() {
        var currentLevel: Int = 0
        
        for index in 0...pageLevelAirfield.count - 1 {
            if pageLevelAirfield[index] == 0 {
                currentLevel = (index - 1)
                break
            } else {
                currentLevel = 9
            }
        }
        
        currentLevelAirfield = currentLevel
    }
    
    public func checkWelcomeView() {
        if pageWelcomeAirfield == 2 {
            viewWelcomeAirfield = false
        } else {
            withAnimation() {
                viewWelcomeAirfield = true
            }
        }
    }
    
    public func setupAirfieldDispatcherGame(_ level: Int) {
        activeHintButton = true
        viewHintShowAirfield = false
        viewPauseGameAirfield = false
        viewWinGameAirfield = false
        viewLoseGameAirfield = false
        viewWinShowAirfield = false
        viewLoseShowAirfield = false
        
        pageGameAirfield = 0
        levelGameAirfield = level
        
        switch levelGameAirfield {
        case 0:
            heightGameAirfield = 60
            timeGameAirfield = 20
            
            currentField = [
                [0, 0, 0],
                [0, 0, 0],
                [0, 0, 0]
            ]
            targetField = [
                [1, 1, 0],
                [0, 1, 0],
                [1, 1, 1]
            ]
        case 1:
            heightGameAirfield = 60
            timeGameAirfield = 20
            
            currentField = [
                [0, 0, 0],
                [-1, 0, 0],
                [0, -1, 0],
                [0, 0, 0],
                [0, 0, 0]
            ]
            targetField = [
                [1, 0, 0],
                [-1, 1, 1],
                [1, -1, 0],
                [1, 0, 1],
                [0, 0, 1]
            ]
        case 2:
            heightGameAirfield = 50
            timeGameAirfield = 20
            
            currentField = [
                [-1, 0, 0, -1],
                [0, 0, -1, 0],
                [-1, 0, 0, 0],
                [0, 0, 0, -1],
                [0, 0, 0, 0],
                [-1, 0, -1, -1]
            ]
            targetField = [
                [-1, 0, 1, -1],
                [1, 0, -1, 1],
                [-1, 0, 0, 0],
                [1, 0, 0, -1],
                [1, 0, 0, 1],
                [-1, 1, -1, -1]
            ]
        case 3:
            heightGameAirfield = 40
            timeGameAirfield = 30
            
            currentField = [
                [0, -1, 0, -1, 0],
                [-1, 0, 0, 0, 0],
                [0, 0, -1, 0, 0],
                [0, 0, 0, 0, 0],
                [0, -1, 0, 0, -1],
                [-1, 0, 0, -1, 0]
            ]
            targetField = [
                [0, -1, 1, -1, 0],
                [-1, 1, 0, 0, 1],
                [1, 0, -1, 0, 1],
                [0, 0, 1, 0, 0],
                [1, -1, 0, 1, -1],
                [-1, 1, 1, -1, 0]
            ]
        case 4:
            heightGameAirfield = 40
            timeGameAirfield = 30
            
            currentField = [
                [0, 0, 0, 0, 0],
                [0, -1, 0, 0, 0],
                [-1, 0, 0, -1, 0],
                [-1, 0, 0, 0, 0],
                [0, 0, -1, 0, 0],
                [0, 0, 0, 0, -1],
                [0, 0, 0, 0, -1],
                [0, 0, 0, 0, 0]
            ]
            targetField = [
                [1, 1, 0, 0, 1],
                [1, -1, 0, 1, 0],
                [-1, 0, 1, -1, 0],
                [-1, 1, 0, 1, 0],
                [0, 0, -1, 0, 1],
                [1, 0, 0, 1, -1],
                [1, 0, 1, 0, -1],
                [1, 0, 0, 0, 0]
            ]
        case 5:
            heightGameAirfield = 40
            timeGameAirfield = 30
            
            currentField = [
                [0, 0, 0, -1, 0],
                [-1, 0, 0, 0, 0],
                [0, -1, 0, 0, -1],
                [0, -1, 0, -1, 0],
                [0, -1, 0, 0, -1],
                [0, 0, -1, 0, 0],
                [0, -1, -1, 0, 0],
                [0, 0, 0, -1, 0]
            ]
            targetField = [
                [0, 0, 0, -1, 1],
                [-1, 1, 0, 1, 0],
                [0, -1, 1, 0, -1],
                [1, -1, 0, -1, 1],
                [0, -1, 1, 1, -1],
                [1, 1, -1, 1, 0],
                [0, -1, -1, 1, 0],
                [0, 1, 1, -1, 1]
            ]
        case 6:
            heightGameAirfield = 30
            timeGameAirfield = 40
            
            currentField = [
                [0, -1, 0, 0, -1, 0],
                [-1, 0, 0, 0, 0, 0],
                [0, -1, 0, 0, -1, 0],
                [0, 0, 0, -1, 0, 0],
                [0, -1, 0, 0, 0, 0],
                [0, 0, -1, 0, 0, -1],
                [0, 0, 0, 0, 0, 0]
            ]
            targetField = [
                [1, -1, 1, 1, -1, 0],
                [-1, 1, 0, 0, 1, 0],
                [1, -1, 0, 0, -1, 1],
                [1, 0, 1, -1, 0, 1],
                [1, -1, 1, 0, 0, 0],
                [0, 0, -1, 1, 1, -1],
                [1, 0, 1, 1, 0, 1]
            ]
        case 7:
            heightGameAirfield = 30
            timeGameAirfield = 40
            
            currentField = [
                [0, -1, 0, 0, -1, 0],
                [-1, 0, 0, 0, 0, -1],
                [0, 0, 0, 0, 0, 0],
                [0, -1, 0, 0, 0, -1],
                [-1, 0, 0, 0, -1, 0],
                [0, -1, 0, 0, 0, -1],
                [0, -1, 0, 0, -1, 0]
            ]
            targetField = [
                [0, -1, 1, 1, -1, 1],
                [-1, 1, 0, 0, 1, -1],
                [1, 0, 0, 0, 1, 1],
                [0, -1, 1, 1, 1, -1],
                [-1, 1, 0, 0, -1, 1],
                [0, -1, 1, 1, 0, -1],
                [1, -1, 1, 0, -1, 0]
            ]
        case 8:
            heightGameAirfield = 30
            timeGameAirfield = 60
            
            currentField = [
                [-1, 0, -1, 0, 0, 0],
                [0, -1, 0, 0, 0, 0],
                [0, 0, 0, -1, -1, 0],
                [0, 0, -1, 0, -1, 0],
                [0, -1, 0, 0, -1, -1],
                [0, 0, 0, 0, 0, 0],
                [0, -1, 0, -1, 0, 0],
                [-1, -1, 0, 0, 0, 0],
                [0, -1, -1, -1, -1, 0],
                [0, -1, 0, 0, 0, -1]
            ]
            targetField = [
                [-1, 1, -1, 0, 0, 0],
                [1, -1, 1, 0, 1, 0],
                [1, 0, 0, -1, -1, 1],
                [0, 0, -1, 0, -1, 1],
                [0, -1, 1, 1, -1, -1],
                [0, 1, 0, 0, 1, 1],
                [1, -1, 0, -1, 1, 1],
                [-1, -1, 1, 1, 0, 0],
                [0, -1, -1, -1, -1, 1],
                [0, -1, 1, 1, 0, -1]
            ]
        case 9:
            heightGameAirfield = 30
            timeGameAirfield = 60
            
            currentField = [
                [0, 0, -1, -1, 0, -1, 0],
                [0, -1, 0, 0, 0, 0, 0],
                [0, -1, 0, 0, 0, 0, -1],
                [0, 0, 0, -1, -1, 0, 0],
                [-1, 0, -1, 0, 0, 0, 0],
                [-1, 0, 0, 0, -1, 0, -1],
                [0, 0, 0, -1, -1, 0, 0],
                [0, -1, 0, 0, 0, 0, 0],
                [0, -1, -1, 0, 0, 0, -1]
            ]
            targetField = [
                [0, 0, -1, -1, 1, -1, 1],
                [1, -1, 1, 0, 0, 1, 1],
                [1, -1, 1, 0, 1, 0, -1],
                [1, 1, 1, -1, -1, 1, 0],
                [-1, 1, -1, 0, 0, 1, 0],
                [-1, 0, 0, 1, -1, 1, -1],
                [1, 1, 1, -1, -1, 1, 0],
                [1, -1, 0, 0, 0, 1, 1],
                [0, -1, -1, 0, 0, 1, -1]
            ]
        default:
            print("Error: unowned level")
        }
        
        viewGameAirfield = true
    }
    
    public func saveDataAirfield() {
        UserDefaults.standard.set(pageWelcomeAirfield, forKey: "Airfield_Dispatcher_Welcome")
        UserDefaults.standard.set(pageLevelAirfield, forKey: "Airfield_Dispatcher_Levels")
    }
    
    public func loadDataAirfield() {
        pageWelcomeAirfield = UserDefaults.standard.integer(forKey: "Airfield_Dispatcher_Welcome")
        pageLevelAirfield = UserDefaults.standard.array(forKey: "Airfield_Dispatcher_Levels") as? [Int] ?? [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
}
