//
//  TrainingViewModel.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI
import CoreData

final class TrainingViewModel: ObservableObject {
    
    @Published var days: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @Published var curDay: String = "Mon"
    @Published var dayForAdd: String = "Mon"
    
    @Published var picks: [String] = ["card", "c2", "c3", "c4", "c5", "c6"]
    @Published var curPic: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isMatch: Bool = false
    
    @Published var trPic: String = ""
    @Published var trSTime: Date = Date()
    @Published var trFTime: Date = Date()
    @Published var trType: String = ""
    @Published var trPeople: String = ""
    @Published var trDescr: String = ""
    @Published var trDay: String = ""

    @Published var trainings: [TrainingModel] = []
    @Published var selectedTraining: TrainingModel?

    func addTraining() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TrainingModel", into: context) as! TrainingModel

        loan.trPic = trPic
        loan.trSTime = trSTime
        loan.trFTime = trFTime
        loan.trType = trType
        loan.trPeople = trPeople
        loan.trDescr = trDescr
        loan.trDay = trDay

        CoreDataStack.shared.saveContext()
    }

    func fetchTrainings() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TrainingModel>(entityName: "TrainingModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.trainings = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.trainings = []
        }
    }
}
