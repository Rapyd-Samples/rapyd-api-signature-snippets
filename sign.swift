import Foundation
import CommonCrypto
import CryptoKit

func generateRapydAPISignature(httpMethod: String, urlPath: String, salt: String, timeStamp: String, accessKey: String, secretKey: String, requestBody: String) -> String {

    let toSign = "\(httpMethod.lowercased())\(urlPath)\(salt)\(timeStamp)\(accessKey)\(secretKey)\(requestBody)"

    guard let secretKeyData = secretKey.data(using: .utf8) else {
        fatalError("Failed to convert the secret key to Data")
    }
    var hmacContext = CCHmacContext()
    CCHmacInit(&hmacContext, CCHmacAlgorithm(kCCHmacAlgSHA256), (secretKeyData as NSData).bytes, (secretKeyData as NSData).count)
    CCHmacUpdate(&hmacContext, toSign, toSign.count)

    print(CC_SHA256_DIGEST_LENGTH)
    
    var hmacDigest = [UInt8](repeating: 0, count: Int(32))
    CCHmacFinal(&hmacContext, &hmacDigest)

    let signatureData = Data(hmacDigest)

    print(signatureData.map { String(format: "%02x", $0) }.joined())

    let signature = signatureData.base64EncodedString()
    
    return signature
}




let httpMethod: String = "GET"
let urlPath: String = "/v1/data/countries"
let salt: String = "3a06aa8493949c68d0b4c7c5"
let timeStamp: String =  "1697743479"
let accessKey: String = "1520A41D56DFC66C2587"
let secretKey: String = "057f1eca5046912d83c1887dc0cbb6b2cea46575613ab828cccbec51f17de0f64a29c0c419b9e5ca"
let requestBody: String = ""


let signature = generateRapydAPISignature(httpMethod: httpMethod, urlPath: urlPath, salt: salt, timeStamp: timeStamp, accessKey: accessKey, secretKey: secretKey, requestBody: requestBody)

print(signature)