# AutoGitCommit

🔄 Automate your GitHub green streak 🌱! Elevate your profile with daily commits, effortlessly maintaining a lush contribution graph. 🚀

## Overview

AutoGitCommit is a script designed to help you automatically generate commits in your repository, ensuring your GitHub activity graph remains consistently green. Perfect for showcasing your daily coding habit!

## Features

- **Automated Commits**: Set it and forget it! Commit changes to your repo automatically.
- **Customizable**: Easily modify the script to adjust the number of commits or the message.
- **Easy Setup**: With just a few steps, you're ready to go.

## Getting Started

### Prerequisites

- Git installed on your machine.
- A GitHub repository.

### Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/AutoGitCommit.git
```
2. Navigate to the cloned repository:

```bash
cd AutoGitCommit
```
3. Make the script executable:
```bash
chmod +x commits.sh
```
### Usage

Run the script within your Git repository:
```bash
./commits.sh
```


## How It Works

AutoGitCommit works by adding an "a" to a `COMMITS.md` file, committing the change with a specific message, and then pushing it to your remote repository. It repeats this process a specified number of times (default is 100).

## Customization

You can edit `AutoGitCommit.sh` to change the number of commits or modify the commit message according to your preference.

## Caution

- Use responsibly: Frequent and automated commits might be considered spammy by some services.
- Ensure you have permission to push to the repository.

## Contributions

Contributions are welcome! If you have improvements or bug fixes, please open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by the desire to showcase consistent coding activity on GitHub.
- Thanks to all contributors and users for their support and feedback.

