import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
    GeneratedPluginRegistrant.register(with: self)
//      scanPassport()
     // readNfc()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
 
    
//    func scanPassport( ) {
//        if #available(iOS 15, *) {
//            let passportReader = PassportReader()
//
//
//
//
//    let passportNumber = "AE1364912"
//
//
//              let dob = "950720"
//              let doe = "270617"
//
//           let passportUtils = PassportUtils()
//           let mrzKey = passportUtils.getMRZKey( passportNumber: passportNumber, dateOfBirth: dob, dateOfExpiry: doe)
//
//
//           passportReader.passiveAuthenticationUsesOpenSSL = false
//
//
//            let dataGroups : [DataGroupId] = [.COM, .SOD, .DG1, .DG2, .DG3, .DG4, .DG5, .DG6, .DG7, .DG8, .DG9,.DG10,.DG11, .DG12,.DG13, .DG14, .DG15]
//
//
//           Task {
//               let customMessageHandler : (NFCViewDisplayMessage)->String? = { (displayMessage) in
//                   switch displayMessage {
//                       case .requestPresentPassport:
//                           return "احمل iPhone بالقرب من البطاقة الوطنية."
//                       default:
//                           // Return nil for all other messages so we use the provided default
//                           return nil
//                   }
//               }
//
//               do {
//
//
//       let passport = try await passportReader.readPassport( mrzKey: mrzKey , tags: dataGroups)
//
//          // print("flutter nfc reader ======err == \(error) ===\(passport)")
//
//                   var fullname = "--"
//                   var motherName = "--"
//                               var lastName = "--"
//                               var gander = "--"
//                               var birthday = "--"
//                               var city = "--"
//                               var cardNumber = "--"
//                               var releaseDate = "--"
//                               var familyNumber = "--"
//                               var image = "--"
//
//                   fullname = passport.firstName
//
//                   lastName = passport.lastName
//                   gander = passport.gender
//                   birthday = passport.dateOfBirth
//                   city = passport.placeOfBirth ?? "e"
//                   cardNumber = passport.personalNumber ?? "e"
//                   releaseDate = passport.documentExpiryDate
//
//                   motherName = passport.dumpPassportData(selectedDataGroups: [.DG11], includeActiveAuthenticationData: true).description
//              let data = "{\"fullname\":\"\(fullname)\",\"mother_name\":\"\(motherName)\",\"last_name\":\"\(lastName)\",\"gander\":\"\(gander)\",\"birthday\":\"\(birthday)\",\"city\":\"\(city)\",\"card_number\":\"\(cardNumber)\",\"family_number\":\"\(familyNumber)\",\"release_date\":\"\(releaseDate)\",\"image\":\"\"}"
//
//
//
//
//
//
//
//                   DispatchQueue.main.async {
//                 print( data)
//
//                   }
//               } catch {
//
//                 print("098765789098765434567")
//
//               }
//           }
//        } else {
//            // Fallback on earlier versions
//        }
//       }
//
//

}
