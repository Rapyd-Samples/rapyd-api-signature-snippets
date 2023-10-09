function generateRapydAPISignature($httpMethod, $urlPath, $salt, $timestamp, $accessKey, $secretKey, $requestBody) {

    // Create the string to be signed
    $toSign = "$httpMethod$urlPath$salt$timestamp$accessKey$secretKey$requestBody";

    // Calculate the HMAC-SHA256 hash using the secret key
    $hashSignature = hash_hmac('sha256', $toSign, $secretKey);
    $signature = base64_encode($hashSignature);

    return $signature;
}
