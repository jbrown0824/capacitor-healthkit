import Capacitor
import HealthKit

var healthStore: HKHealthStore = HKHealthStore()

@objc(CapacitorHealthkit)
public class CapacitorHealthkit: CAPPlugin {
    func getSampleType(sampleName: String) -> HKSampleType? {
        switch sampleName {
        case "stepCount":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        case "flightsClimbed":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!
        case "appleExerciseTime":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!
        case "activeEnergyBurned":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        case "basalEnergyBurned":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!
        case "distanceWalkingRunning":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        case "distanceCycling":
            return HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!
        case "sleepAnalysis":
            return HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
        case "workoutType":
            return HKWorkoutType.workoutType()
        default:
            return nil
        }
    }

    func getTypes(items: [String]) -> Set<HKObjectType> {
        var types: Set<HKObjectType> = []
        for item in items {
            switch item {
            case "steps":
                types.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!)
            case "stairs":
                types.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!)
            case "duration":
                types.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!)
            case "activity":
                types.insert(HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!)
                types.insert(HKWorkoutType.workoutType())
                types.insert(HKObjectType.activitySummaryType())
            case "calories":
                types.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!)
                types.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!)
            case "distance":
                types.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!)
                types.insert(HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)!)
            default:
                print("no match in case")
            }
        }
        return types
    }

    func returnWorkoutActivityTypeValueDictionnary(activityType: HKWorkoutActivityType) -> String {
        // from https://github.com/georgegreenoflondon/HKWorkoutActivityType-Descriptions/blob/master/HKWorkoutActivityType%2BDescriptions.swift
        switch activityType {
        case HKWorkoutActivityType.americanFootball:
            return "American Football"
        case HKWorkoutActivityType.archery:
            return "Archery"
        case HKWorkoutActivityType.australianFootball:
            return "Australian Football"
        case HKWorkoutActivityType.badminton:
            return "Badminton"
        case HKWorkoutActivityType.baseball:
            return "Baseball"
        case HKWorkoutActivityType.basketball:
            return "Basketball"
        case HKWorkoutActivityType.bowling:
            return "Bowling"
        case HKWorkoutActivityType.boxing:
            return "Boxing"
        case HKWorkoutActivityType.climbing:
            return "Climbing"
        case HKWorkoutActivityType.crossTraining:
            return "Cross Training"
        case HKWorkoutActivityType.curling:
            return "Curling"
        case HKWorkoutActivityType.cycling:
            return "Cycling"
        case HKWorkoutActivityType.dance:
            return "Dance"
        case HKWorkoutActivityType.danceInspiredTraining:
            return "Dance Inspired Training"
        case HKWorkoutActivityType.elliptical:
            return "Elliptical"
        case HKWorkoutActivityType.equestrianSports:
            return "Equestrian Sports"
        case HKWorkoutActivityType.fencing:
            return "Fencing"
        case HKWorkoutActivityType.fishing:
            return "Fishing"
        case HKWorkoutActivityType.functionalStrengthTraining:
            return "Functional Strength Training"
        case HKWorkoutActivityType.golf:
            return "Golf"
        case HKWorkoutActivityType.gymnastics:
            return "Gymnastics"
        case HKWorkoutActivityType.handball:
            return "Handball"
        case HKWorkoutActivityType.hiking:
            return "Hiking"
        case HKWorkoutActivityType.hockey:
            return "Hockey"
        case HKWorkoutActivityType.hunting:
            return "Hunting"
        case HKWorkoutActivityType.lacrosse:
            return "Lacrosse"
        case HKWorkoutActivityType.martialArts:
            return "Martial Arts"
        case HKWorkoutActivityType.mindAndBody:
            return "Mind and Body"
        case HKWorkoutActivityType.mixedMetabolicCardioTraining:
            return "Mixed Metabolic Cardio Training"
        case HKWorkoutActivityType.paddleSports:
            return "Paddle Sports"
        case HKWorkoutActivityType.play:
            return "Play"
        case HKWorkoutActivityType.preparationAndRecovery:
            return "Preparation and Recovery"
        case HKWorkoutActivityType.racquetball:
            return "Racquetball"
        case HKWorkoutActivityType.rowing:
            return "Rowing"
        case HKWorkoutActivityType.rugby:
            return "Rugby"
        case HKWorkoutActivityType.running:
            return "Running"
        case HKWorkoutActivityType.sailing:
            return "Sailing"
        case HKWorkoutActivityType.skatingSports:
            return "Skating Sports"
        case HKWorkoutActivityType.snowSports:
            return "Snow Sports"
        case HKWorkoutActivityType.soccer:
            return "Soccer"
        case HKWorkoutActivityType.softball:
            return "Softball"
        case HKWorkoutActivityType.squash:
            return "Squash"
        case HKWorkoutActivityType.stairClimbing:
            return "Stair Climbing"
        case HKWorkoutActivityType.surfingSports:
            return "Surfing Sports"
        case HKWorkoutActivityType.swimming:
            return "Swimming"
        case HKWorkoutActivityType.tableTennis:
            return "Table Tennis"
        case HKWorkoutActivityType.tennis:
            return "Tennis"
        case HKWorkoutActivityType.trackAndField:
            return "Track and Field"
        case HKWorkoutActivityType.traditionalStrengthTraining:
            return "Traditional Strength Training"
        case HKWorkoutActivityType.volleyball:
            return "Volleyball"
        case HKWorkoutActivityType.walking:
            return "Walking"
        case HKWorkoutActivityType.waterFitness:
            return "Water Fitness"
        case HKWorkoutActivityType.waterPolo:
            return "Water Polo"
        case HKWorkoutActivityType.waterSports:
            return "Water Sports"
        case HKWorkoutActivityType.wrestling:
            return "Wrestling"
        case HKWorkoutActivityType.yoga:
            return "Yoga"
        // iOS 10
        case HKWorkoutActivityType.barre:
            return "Barre"
        case HKWorkoutActivityType.coreTraining:
            return "Core Training"
        case HKWorkoutActivityType.crossCountrySkiing:
            return "Cross Country Skiing"
        case HKWorkoutActivityType.downhillSkiing:
            return "Downhill Skiing"
        case HKWorkoutActivityType.flexibility:
            return "Flexibility"
        case HKWorkoutActivityType.highIntensityIntervalTraining:
            return "High Intensity Interval Training"
        case HKWorkoutActivityType.jumpRope:
            return "Jump Rope"
        case HKWorkoutActivityType.kickboxing:
            return "Kickboxing"
        case HKWorkoutActivityType.pilates:
            return "Pilates"
        case HKWorkoutActivityType.snowboarding:
            return "Snowboarding"
        case HKWorkoutActivityType.stairs:
            return "Stairs"
        case HKWorkoutActivityType.stepTraining:
            return "Step Training"
        case HKWorkoutActivityType.wheelchairWalkPace:
            return "Wheelchair Walk Pace"
        case HKWorkoutActivityType.wheelchairRunPace:
            return "Wheelchair Run Pace"
        // iOS 11
        case HKWorkoutActivityType.taiChi:
            return "Tai Chi"
        case HKWorkoutActivityType.mixedCardio:
            return "Mixed Cardio"
        case HKWorkoutActivityType.handCycling:
            return "Hand Cycling"
        // iOS 13
        case HKWorkoutActivityType.discSports:
            return "Disc Sports"
        case HKWorkoutActivityType.fitnessGaming:
            return "Fitness Gaming"
        // Catch-all
        default:
            return "Other"
        }
    }

    @objc func isAvailable(_ call: CAPPluginCall) {
        if HKHealthStore.isHealthDataAvailable() {
            return call.resolve()
        } else {
            return call.reject("Health data not available")
        }
    }

    @objc func isEditionAuthorized(_ call: CAPPluginCall) {
        guard let sampleName = call.options["sampleName"] as? String else {
            return call.reject("Must provide sampleName")
        }

        let sampleType: HKSampleType? = getSampleType(sampleName: sampleName)
        if (sampleType == nil) {
            return call.reject("Cannot match sample name")
        }

        if (healthStore.authorizationStatus(for: sampleType!) == .sharingAuthorized) {
            return call.resolve()
        } else {
            return call.reject("Permission Denied to Access data")
        }
    }

    @objc func multipleIsEditionAuthorized(_ call: CAPPluginCall) {
        guard let sampleNames = call.options["sampleNames"] as? [String] else {
            return call.reject("Must provide sampleNames")
        }

        for sampleName in sampleNames {
            guard let sampleType: HKSampleType = getSampleType(sampleName: sampleName) else {
                return call.reject("Cannot match sample name")
            }
            if (healthStore.authorizationStatus(for: sampleType) != .sharingAuthorized) {
                return call.reject("Permission Denied to Access data")
            }
        }
        return call.resolve()
    }

    @objc func requestAuthorization(_ call: CAPPluginCall) {
        if !HKHealthStore.isHealthDataAvailable() {
            return call.reject("Health data not available")
        }
        guard let _all = call.options["all"] as? [String] else {
            return call.reject("Must provide all")
        }
        guard let _read = call.options["read"] as? [String] else {
            return call.reject("Must provide read")
        }

//        let writeTypes: Set<HKSampleType> = getTypes(items: _write).union(getTypes(items: _all))
        let readTypes: Set<HKObjectType> = getTypes(items: _read).union(getTypes(items: _all))

        healthStore.requestAuthorization(toShare: nil, read: readTypes) { (success, error) in
            if !success {
                call.reject("Could not get permission")
                return
            }
            call.resolve()
        }
    }

    enum HKSampleError: Error {
        case sleepRequestFailed
        case workoutRequestFailed
        case quantityRequestFailed
        case sampleTypeFailed
        case deniedDataAccessFailed

        var outputMessage: String {
            switch self {
            case .sleepRequestFailed:
                return "sleepRequestFailed"
            case .workoutRequestFailed:
                return "workoutRequestFailed"
            case .quantityRequestFailed:
                return "quantityRequestFailed"
            case .sampleTypeFailed:
                return "sampleTypeFailed"
            case .deniedDataAccessFailed:
                return "deniedDataAccessFailed"
            }
        }
    }

    func generateOutput(sampleName: String, results: [HKSample]?) -> [[String: Any]]? {
        var output: [[String: Any]] = []
        for result in results! {
            if (sampleName == "sleepAnalysis") {
                guard let sample = result as? HKQuantitySample else {
                    return nil
                }
                let sleepSD = sample.startDate as NSDate
                let sleepED = sample.endDate as NSDate
                let sleepInterval = sleepED.timeIntervalSince(sleepSD as Date)
                let sleepHoursBetweenDates = sleepInterval / 3600

                output.append([
                    "uuid": sample.uuid.uuidString,
                    "startDate": ISO8601DateFormatter().string(from: sample.startDate),
                    "endDate": ISO8601DateFormatter().string(from: sample.endDate),
                    "duration": sleepHoursBetweenDates,
                    "source": sample.sourceRevision.source.name,
                    "sourceBundleId": sample.sourceRevision.source.bundleIdentifier
                ])
            } else if (sampleName == "workoutType") {
                guard let sample = result as? HKWorkout else {
                    return nil
                }

                var TEBData: Double? = -1
                var TDData: Double? = -1
                var TFCData: Double? = -1
                var TSSCData: Double? = -1

                var unitTEB: HKUnit?
                if ((sample.totalEnergyBurned) != nil) {
                    if  (sample.totalEnergyBurned?.is(compatibleWith: HKUnit.kilocalorie()))! {
                        unitTEB = HKUnit.kilocalorie()
                    }
                    guard unitTEB != nil else { return nil }
                    TEBData = sample.totalEnergyBurned?.doubleValue(for: unitTEB!)
                }

                var unitTD: HKUnit?
                if ((sample.totalDistance) != nil) {
                    if (sample.totalDistance?.is(compatibleWith: HKUnit.meter()))! {
                        unitTD = HKUnit.meter()
                    }
                    guard unitTD != nil else { return nil }
                    TDData = sample.totalDistance?.doubleValue(for: unitTD!)
                }

                var unitTFC: HKUnit?
                if ((sample.totalFlightsClimbed) != nil) {
                    if  (sample.totalFlightsClimbed?.is(compatibleWith: HKUnit.count()))! {
                        unitTFC = HKUnit.count()
                    }
                    guard unitTFC != nil else { return nil }
                    TFCData = sample.totalFlightsClimbed?.doubleValue(for: unitTFC!)
                }

                var unitTSSC: HKUnit?
                if ((sample.totalSwimmingStrokeCount) != nil) {
                    if (sample.totalSwimmingStrokeCount?.is(compatibleWith: HKUnit.count()))! {
                        unitTSSC = HKUnit.count()
                    }
                    guard unitTSSC != nil else { return nil }
                    TSSCData = sample.totalSwimmingStrokeCount?.doubleValue(for: unitTSSC!)
                }

                let workoutSD = sample.startDate as NSDate
                let workoutED = sample.endDate as NSDate
                let workoutInterval = workoutED.timeIntervalSince(workoutSD as Date)
                let workoutHoursBetweenDates = workoutInterval / 3600

                output.append([
                    "uuid": sample.uuid.uuidString,
                    "startDate": ISO8601DateFormatter().string(from: sample.startDate),
                    "endDate": ISO8601DateFormatter().string(from: sample.endDate),
                    "duration": workoutHoursBetweenDates,
                    "source": sample.sourceRevision.source.name,
                    "sourceBundleId": sample.sourceRevision.source.bundleIdentifier,
                    "workoutActivityId": sample.workoutActivityType.rawValue,
                    "workoutActivityName": self.returnWorkoutActivityTypeValueDictionnary(activityType: sample.workoutActivityType),
                    "totalEnergyBurned": TEBData!, // kilocalorie
                    "totalDistance": TDData!, // meter
                    "totalFlightsClimbed": TFCData!, // count
                    "totalSwimmingStrokeCount": TSSCData! // count
                ])
            } else {
                guard let sample = result as? HKQuantitySample else {
                    return nil
                }
                var unit: HKUnit?
                var unitName: String?

                if sample.quantityType.is(compatibleWith: HKUnit.meter()) {
                    unit = HKUnit.meter()
                    unitName = "meter"
                } else if sample.quantityType.is(compatibleWith: HKUnit.count()) {
                    unit = HKUnit.count()
                    unitName = "count"
                } else if sample.quantityType.is(compatibleWith: HKUnit.minute()) {
                    unit = HKUnit.minute()
                    unitName = "minute"
                } else if sample.quantityType.is(compatibleWith: HKUnit.kilocalorie()) {
                    unit = HKUnit.kilocalorie()
                    unitName = "kilocalorie"
                } else {
                    print("Error: unknown unit type")
                }

                let quantitySD : NSDate
                let quantityED : NSDate
                quantitySD = sample.startDate as NSDate
                quantityED = sample.endDate as NSDate
                let quantityInterval = quantityED.timeIntervalSince(quantitySD as Date)
                let quantitySecondsInAnHour: Double = 3600
                let quantityHoursBetweenDates = quantityInterval / quantitySecondsInAnHour

                output.append([
                    "uuid": sample.uuid.uuidString,
                    "value": sample.quantity.doubleValue(for: unit!),
                    "unitName": unitName!,
                    "startDate": ISO8601DateFormatter().string(from: sample.startDate),
                    "endDate": ISO8601DateFormatter().string(from: sample.endDate),
                    "duration": quantityHoursBetweenDates,
                    "source": sample.sourceRevision.source.name,
                    "sourceBundleId": sample.sourceRevision.source.bundleIdentifier
                ])
            }
        }
        return output
    }

    @objc func queryHKitSampleType(_ call: CAPPluginCall) {
        guard let _sampleName = call.options["sampleName"] as? String else {
            return call.reject("Must provide sampleName")
        }
        guard let _startDate = call.options["startDate"] as? Date else {
            return call.reject("Must provide startDate")
        }
        guard let _endDate = call.options["endDate"] as? Date else {
            return call.reject("Must provide endDate")
        }
        guard let _limit = call.options["limit"] as? Int else {
            return call.reject("Must provide limit")
        }

        let limit: Int = (_limit == 0) ? HKObjectQueryNoLimit : _limit

        let predicate = HKQuery.predicateForSamples(withStart: _startDate, end: _endDate, options: HKQueryOptions.strictStartDate)

        guard let sampleType: HKSampleType = getSampleType(sampleName: _sampleName) else {
            return call.reject("Error in sample name")
        }

        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: limit, sortDescriptors: nil) {
            query, results, error in
            guard let output: [[String: Any]] = self.generateOutput(sampleName: _sampleName, results: results) else {
                return call.reject("Error happened while generating outputs")
            }
            call.resolve([
                "countReturn": output.count,
                "resultData": output
            ])
        }
        healthStore.execute(query)
    }

    @objc func multipleQueryHKitSampleType(_ call: CAPPluginCall) {
        guard let _sampleNames = call.options["sampleNames"] as? [String] else {
            call.reject("Must provide sampleNames")
            return
        }
        guard let _startDate = call.options["startDate"] as? Date else {
            call.reject("Must provide startDate")
            return
        }
        guard let _endDate = call.options["endDate"] as? Date else {
            call.reject("Must provide endDate")
            return
        }
        guard let _limit = call.options["limit"] as? Int else {
            call.reject("Must provide limit")
            return
        }

        let limit: Int = (_limit == 0) ? HKObjectQueryNoLimit : _limit

        var output: [String: [String: Any]] = [:]

        let dispatchGroup = DispatchGroup()

        for _sampleName in _sampleNames {
            dispatchGroup.enter()

            self.queryHKitSampleTypeSpecial(sampleName: _sampleName, startDate: _startDate, endDate: _endDate, limit: limit) { result in
                switch result {
                case .success(let sampleOutput):
                    output[_sampleName] = sampleOutput
                case .failure(let error):

                    var errorMessage = ""
                    if let localError = error as? HKSampleError {
                        errorMessage = localError.outputMessage
                    } else {
                        errorMessage = error.localizedDescription
                    }
                    output[_sampleName] = ["errorDescription": errorMessage]
                }
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            print(output.description)
            call.resolve(output)
        }
    }

    func queryHKitSampleTypeSpecial(sampleName: String, startDate: Date, endDate: Date, limit: Int, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: HKQueryOptions.strictStartDate)

        guard let sampleType: HKSampleType = getSampleType(sampleName: sampleName) else {
            return completion(.failure(HKSampleError.sampleTypeFailed))
        }

        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: limit, sortDescriptors: nil) {
            query, results, error in
            guard let output: [[String: Any]] = self.generateOutput(sampleName: sampleName, results: results) else {
                return completion(.failure(HKSampleError.sampleTypeFailed))
            }
            completion(.success([
                "countReturn": output.count,
                "resultData": output
            ]))
        }
        healthStore.execute(query)
    }

    func generateActivitySummaryOutput(results: [HKActivitySummary]) -> [[String: Any]]? {
        var output: [[String: Any]] = []
        let calendar = Calendar.current
        for result in results {
            let dateComponents = result.dateComponents(for: calendar)

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"

            let date = dateComponents.date

            let row: [String: Any] = [
                "activeEnergyBurned": result.activeEnergyBurned.doubleValue(for: HKUnit.kilocalorie()),
                "activeEnergyBurnedGoal": result.activeEnergyBurned.doubleValue(for: HKUnit.kilocalorie()),
                "appleExerciseTime": result.appleExerciseTime.doubleValue(for: HKUnit.minute()),
                "appleExerciseTimeGoal": result.appleExerciseTimeGoal.doubleValue(for: HKUnit.minute()),
                "appleStandHours": result.appleStandHours.doubleValue(for: HKUnit.count()),
                "appleStandHoursGoal": result.appleStandHoursGoal.doubleValue(for: HKUnit.count()),
                "date": ISO8601DateFormatter().string(from: dateComponents.date!),
            ];

            output.append(row)

            print(row)
        }

        return output
    }

    @objc func queryHKActivitySummary(_ call: CAPPluginCall) {
		let calendar = NSCalendar.current

		guard let _startDate = call.options["startDate"] as? Date else {
			return call.reject("Must provide startDate")
		}
		guard let _endDate = call.options["endDate"] as? Date else {
			return call.reject("Must provide endDate")
		}

		let units: Set<Calendar.Component> = [.day, .month, .year, .era]

		var startDateComponents = calendar.dateComponents(units, from: startDate)
		startDateComponents.calendar = calendar

		var endDateComponents = calendar.dateComponents(units, from: endDate)
		endDateComponents.calendar = calendar

		// Create the predicate for the query
		let summariesWithinRange = HKQuery.predicate(forActivitySummariesBetweenStart: startDateComponents,
													 end: endDateComponents)

		let query = HKActivitySummaryQuery(predicate: summariesWithinRange) { (query, summariesOrNil, errorOrNil) -> Void in

             guard let summaries = summariesOrNil else {
                 // Handle any errors here.
                 return call.reject("*** Unable to get activity summaries ***")
             }

            guard let output: [[String: Any]] = self.generateActivitySummaryOutput(results: summaries) else {
                return call.reject("Error happened while generating outputs")
            }

			 call.resolve([
				 "countReturn": output.count,
				 "resultData": output
			 ])
         }

         healthStore.execute(query)
//             guard let _sampleName = call.options["sampleName"] as? String else {
//                 return call.reject("Must provide sampleName")
//             }
//             guard let _startDate = call.options["startDate"] as? Date else {
//                 return call.reject("Must provide startDate")
//             }
//             guard let _endDate = call.options["endDate"] as? Date else {
//                 return call.reject("Must provide endDate")
//             }
//             guard let _limit = call.options["limit"] as? Int else {
//                 return call.reject("Must provide limit")
//             }
//
//             let limit: Int = (_limit == 0) ? HKObjectQueryNoLimit : _limit
//
//             let predicate = HKQuery.predicateForSamples(withStart: _startDate, end: _endDate, options: HKQueryOptions.strictStartDate)
//
//             guard let sampleType: HKSampleType = getSampleType(sampleName: _sampleName) else {
//                 return call.reject("Error in sample name")
//             }
//
//             let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: limit, sortDescriptors: nil) {
//                 query, results, error in
//                 guard let output: [[String: Any]] = self.generateOutput(sampleName: _sampleName, results: results) else {
//                     return call.reject("Error happened while generating outputs")
//                 }
//                 call.resolve([
//                     "countReturn": output.count,
//                     "resultData": output
//                 ])
//             }
//             healthStore.execute(query)
        }
}
