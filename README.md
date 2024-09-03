# Installer for Macs

## Table of Contents

* [Overview](#overview)
* [Installation](#installation)
* [Requirements](#requirements)
* [Applications Installed](#applications-installed)
* [Usage](#usage)
* [Troubleshooting](#troubleshooting)
* [Contributing](#contributing)
* [License](#license)
* [Acknowledgments](#acknowledgments)

## Overview

This project provides a comprehensive installer script for Macs, designed to streamline the installation process for various applications. The script is written in Bash and utilizes the `installer` and `brew` commands to ensure a seamless installation experience.

## Installation

To use this installer, follow these steps:

1. Clone this repository to your local machine using `git clone https://github.com/your-username/your-repo-name.git`.
2. Navigate to the project directory in the terminal using `cd your-repo-name`.
3. Make the `DownloadAll.sh` script executable by running `chmod +x DownloadAll.sh`.
4. Run the `DownloadAll.sh` script by typing `./DownloadAll.sh` and pressing Enter.

## Requirements

* macOS High Sierra (10.13) or later
* `installer` command installed (comes pre-installed on macOS)
* `brew` command installed (can be installed by running `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""`)

## Applications Installed

The following applications are installed by the script:

* WARP (latest version)
* Chrome (latest version)
* LockDown Browser (latest version)

## Usage

1. The script will prompt you to confirm the installation of each application. Type `y` to confirm or `n` to skip.
2. The script will automatically download and install the selected applications.
3. Once the installation is complete, the script will display a success message.

## Troubleshooting

If you encounter any issues during installation, please check the script's output for error messages. You can also try the following:

* Check the script's permissions by running `ls -l DownloadAll.sh`. Ensure that the script has execute permissions.
* Check the `brew` installation by running `brew --version`. Ensure that `brew` is installed and up-to-date.
* **Brew will auto install if you don't have it installed if you run the Helper.sh script**

## Contributing

If you'd like to contribute to this project, please fork the repository and submit a pull request with your changes. Please ensure that your changes are properly documented and follow the existing coding style.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments

This project was created by Astranix and Dashtiss.
