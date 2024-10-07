# Rapyd API Signature Snippets

Welcome to the **Rapyd API Signature Snippets** repository! This collection of code samples is designed to help developers easily create and verify signatures when interacting with Rapyd APIs.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Available Snippets](#available-snippets)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

When working with Rapyd's APIs, every request must be signed using a combination of request parameters and your API secret key. These signatures ensure the integrity of your request and prevent tampering.

This repository provides code snippets in multiple languages to help you:
- Generate request signatures.
- Verify response signatures.

## Prerequisites

Before using these snippets, you need:
1. A **Rapyd** account. If you don’t have one, [sign up here](https://dashboard.rapyd.net/signup).
2. Your Rapyd **Access Key** and **Secret Key** from the [Rapyd Dashboard](https://dashboard.rapyd.net/).
3. A basic understanding of how [HMAC](https://en.wikipedia.org/wiki/HMAC) signatures work.

## Available Snippets

The repository contains code snippets in the following languages:
- **Python**
- **Node.js**
- **Java**
- **PHP**
- **Ruby**
- **C#**

These examples demonstrate how to create the required HMAC signature using your API secret key, the request payload, and other required parameters (HTTP method, URL, timestamp).

## Installation

To use a snippet in your project, follow the steps below:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Rapyd-Samples/rapyd-api-signature-snippets.git

2. **Navigate to the directory** for the language you wish to use:
    ```bash
   cd rapyd-api-signature-snippets/<language>

3. Install dependencies if applicable (Python, Node.js, etc.). Refer to the README in each folder for detailed instructions.

## Usage

Each snippet shows how to generate a signature for a request to Rapyd's API. Here's a general outline of how to use them:

1. **Update your API key**s in the snippet:
- Access Key
- Secret Key
2. **Set the request parameters**:
- HTTP method (e.g., GET, POST)
- API endpoint
- Request body (if applicable)
- Timestamp
3. **Generate the signature** The snippet will automatically generate the signature required for your request.
4. **Send the API request** Use the generated signature in the Authorization header of your request.

For specific instructions, refer to the comments in each language's snippet.

## Example 

  ```bash
  import requests
  import time
  import hmac
  import hashlib
  
  # Replace with your own keys
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
  
  # API request parameters
  http_method = "POST"
  url_path = "/v1/checkout"
  timestamp = str(int(time.time()))
  
  # Create the signature
  signature = generate_signature(http_method, url_path, timestamp, access_key, secret_key)
  
  # Make the API request
  response = requests.post(url, headers={"Authorization": signature}, data={...})
  
  print(response.json())
```

## Contributing
We welcome contributions! If you’d like to add more snippets or improve existing ones, feel free to submit a pull request or open an issue. Make sure to follow the contributing guidelines.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
