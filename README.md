# Magno's dotfiles 🐧

> Works on Ubuntu 16.04 LTS and 18.04 LTS

![Screenshot preview](preview.png)

## Requirements

```bash
sudo apt install -y git xclip
ssh-keygen -t rsa -b 4096
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Install the public key on your BitBucket <http://bit.ly/1VMnKa3> or GitHub <https://git.io/vw0D8> account.

## Installation

**Warning**: If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using `curl`

```bash
curl -L https://git.io/fhhLe | sudo bash
```

### Using `wget`

```bash
wget -q -O - https://git.io/fhhLe | sudo bash
```

### Or using `git`

```bash
# HTTPS
git clone https://github.com/magnobiet/dotfiles.git .dotfiles && cd $_

# SSH
git clone git@github.com:magnobiet/dotfiles.git .dotfiles && cd $_

sudo ./install
```

![Screenshot](screenshot.png)

## License

This project is licensed under the [MIT License](https://magno.mit-license.org/2016). Copyright © Magno Biét
