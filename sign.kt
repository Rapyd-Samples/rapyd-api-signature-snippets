import java.nio.charset.StandardCharsets
import java.security.MessageDigest
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import java.util.Base64

fun generateSignature(httpMethod: String, urlPath: String, salt: String, timestamp: String, accessKey: String, secretKey: String, body: String): String? {
    try {
        val toSign = httpMethod + urlPath + salt + timestamp + accessKey + secretKey + body
        val StrhashCode = hmacDigest(toSign, secretKey, "HmacSHA256")
        val signature = Base64.getEncoder().encodeToString(StrhashCode.toByteArray())
        return signature
    } catch (e: Exception) {
        e.printStackTrace()
    }
    return null
}

fun hmacDigest(msg: String, keyString: String, algo: String): String? {
    var digest: String? = null
    try {
        val key = SecretKeySpec(keyString.toByteArray(StandardCharsets.US_ASCII), algo)
        val mac = Mac.getInstance(algo)
        mac.init(key)
        val bytes = mac.doFinal(msg.toByteArray(StandardCharsets.UTF_8))
        val hash = StringBuilder()
        for (i in bytes.indices) {
            val hex = Integer.toHexString(0xFF and bytes[i].toInt())
            if (hex.length == 1) {
                hash.append('0')
            }
            hash.append(hex)
        }
        digest = hash.toString()
    } catch (e: Exception) {
        e.printStackTrace()
    }
    return digest
}
