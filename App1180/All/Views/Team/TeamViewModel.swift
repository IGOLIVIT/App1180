//
//  TeamViewModel.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI
import CoreData

final class TeamViewModel: ObservableObject {
    
    @AppStorage("teamName") var teamName: String = ""
    @AppStorage("teamPhoto") var teamPhoto: String = ""
    @AppStorage("teamVic") var teamVic: String = ""
    @AppStorage("teamPlay") var teamPlay: String = ""
    @AppStorage("teamEx") var teamEx: String = ""

    @Published var picks: [String] = ["1", "2", "3", "4"]
    @Published var curPic: String = ""

    @Published var isAdd: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isMatch: Bool = false
    
    @Published var tName: String = ""
    @Published var tVic: String = ""
    @Published var tPlay: String = ""
    @Published var tEx: String = ""
    
    @Published var plPic: String = ""
    @Published var plName: String = ""
    @Published var plSName: String = ""
    @Published var plPos: String = ""
    @Published var plEx: String = ""
    @Published var plNum: String = ""

    @Published var players: [PlayerModel] = []
    @Published var selectedPlayer: PlayerModel?

    func addPlayer() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlayerModel", into: context) as! PlayerModel

        loan.plPic = plPic
        loan.plName = plName
        loan.plSName = plSName
        loan.plPos = plPos
        loan.plEx = plEx
        loan.plNum = plNum

        CoreDataStack.shared.saveContext()
    }

    func fetchPlayers() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlayerModel>(entityName: "PlayerModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.players = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.players = []
        }
    }
}
