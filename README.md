# README for Clickjacking Script

## Overview

This repository contains a Bash script designed to create a simple HTML page that demonstrates clickjacking techniques. The script allows users to embed a specified domain within an iframe, providing a secure preview of the embedded content.

## Features

- Prompts the user for a domain URL.
- Option to save the generated HTML file.
- Displays a progress bar while saving the file.
- Opens the generated HTML file in Firefox for viewing.
- Cleans up temporary files after use.

## Requirements

- Bash shell
- Firefox browser
- Internet connection (for loading external resources)

## Usage

1. Clone the repository:

   ```
   git clone https://github.com/yourusername/clickjacking-script.git
   cd clickjacking-script
   
   ```
2. Make the script executable:

   ```
   chmod 777 clickjacking.sh
   
   ```
3. Run the script:

   ```
   ./clickjacking.sh
   
   ```
4. Follow the prompts:
   - Enter the full URL of the domain you want to embed (e.g.,
   - ```
     https://example.com
     ```
   - Choose whether to save the generated HTML file.

## Code Explanation

- **Variables**: The script defines color variables for terminal output.
- **Function website**: Generates the HTML content with the specified domain embedded in an iframe.
- **Function show_progress**: Displays a progress bar while saving the file.
- **Main Logic**: Handles user input and calls the appropriate functions based on whether the user wants to save the file.

## Example

When prompted, if you enter URL and choose to save the file, the script will create an HTML file named
example.html (or any name you specify) and open it in Firefox.

## Cleanup

The script automatically removes temporary files after displaying the HTML page.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes.

## Contact

For any questions or feedback, please reach out to mailto:amalbabu2803@gmail.com.
