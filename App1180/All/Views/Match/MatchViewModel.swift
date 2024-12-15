//
//  MatchViewModel.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI
import CoreData

final class MatchViewModel: ObservableObject {
    
    @Published var results: [String] = ["Win", "Defeat", "Draw"]
    @Published var curResult: String = "Win"

    @Published var picks: [String] = ["1", "2", "3", "4"]
    @Published var curPic1: String = ""
    @Published var curPic2: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isMatch: Bool = false
    
    @Published var mPic1: String = ""
    @Published var mPic2: String = ""
    @Published var mTime: Date = Date()
    @Published var mDate: Date = Date()
    @Published var mTeam1: String = ""
    @Published var mTeam2: String = ""
    @Published var mPlace: String = ""
    @Published var mRes: String = ""

    @Published var matches: [MatchModel] = []
    @Published var selectedMatch: MatchModel?

    func addMatch() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MatchModel", into: context) as! MatchModel

        loan.mPic1 = mPic1
        loan.mPic2 = mPic2
        loan.mTime = mTime
        loan.mDate = mDate
        loan.mTeam1 = mTeam1
        loan.mTeam2 = mTeam2
        loan.mPlace = mPlace
        loan.mRes = mRes

        CoreDataStack.shared.saveContext()
    }

    func fetchMatches() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MatchModel>(entityName: "MatchModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.matches = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.matches = []
        }
    }
}
