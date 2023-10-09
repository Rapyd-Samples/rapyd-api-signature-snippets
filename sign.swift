import Foundation
import CommonCrypto

func generateRapydAPISignature(httpMethod: String, urlPath: String, salt: String, timeStamp: String, accessKey: String, secretKey: String, requestBody: String) -> String {

    let toSign = "\(httpMethod)|\(urlPath)|\(salt)|\(timeStamp)|\(accessKey)|\(secretKey)|\(requestBody)"


    guard let secretKeyData = secretKey.data(using: .utf8) else {
        fatalError("Failed to convert the secret key to Data")
    }


    var hmacContext = CCHmacContext()
    CCHmacInit(&hmacContext, CCHmacAlgorithm(kCCHmacAlgSHA256), (secretKeyData as NSData).bytes, secretKeyData.count)
    CCHmacUpdate(&hmacContext, toSign, toSign.count)
    
    var hmacDigest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    CCHmacFinal(&hmacContext, &hmacDigest)

    let signatureData = Data(hmacDigest)

    let signature = signatureData.base64EncodedString()
    
    return signature
}
