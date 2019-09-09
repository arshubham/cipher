<p align="center">
  <img src="https://github.com/arshubham/cipher/blob/master/data/images/icons/128/com.github.arshubham.cipher.svg" alt="preview"/>
</p>
<div>
  <h1 align="center">CIPHER</h1>
  <h2 align="center">Encode and decode text</h2>
  <p align="center">A simple application for encoding and decoding text</p>
  <p align="center">Designed for <a href="https://elementary.io">elementary OS</p>
</div>
<p align="center">
  <a href="https://appcenter.elementary.io/com.github.arshubham.cipher.desktop">
    <img src="https://appcenter.elementary.io/badge.svg" alt="App Center">
  </a>
</p>
<p align="center">
<img src="https://raw.githubusercontent.com/arshubham/cipher/master/data/images/Screenshot1.png" alt="screenshot-light">
<img src="https://raw.githubusercontent.com/arshubham/cipher/master/data/images/Screenshot2.png" alt="screenshot-dark">

# :closed_book: Contents
- [Features](https://github.com/manavbabber/cipher/blob/master/README.md#sparkles-features)      
- [Prerequisites](https://github.com/manavbabber/cipher#hammer_and_wrench-prerequisites)
- [Installation](https://github.com/manavbabber/cipher/blob/master/README.md#link-installation)
- [Contributing Workflow](https://github.com/manavbabber/cipher/blob/master/README.md#computer-contributing-workflow)
- [Special Thanks](https://github.com/manavbabber/cipher/blob/master/README.md#tada-special-thanks)
- [License](https://github.com/manavbabber/cipher#page_facing_up-license)

# :sparkles: Features
<br>
Cipher is a free and open souce text encoding and decoding app specially designed for elementary os. The Cipher app can currently encode and decode between six different ciphers namely:<br><br>

- Caesar Shift Cipher
- Atbash Cipher
- Polybius Square Cipher
- Rot13 Cipher
- Base64 Encoding
- ASCII Encoding
- Hashing Functions (MD5, SHA1, SHA256)

<br>
</p>


# :hammer_and_wrench: Prerequisites

- `valac`
- `granite`
- `gobject-2.0`
- `gtk+-3.0`
- `glib-2.0`
- `gee-0.8`
- `meson`


# :link: Installation
<br>

```
git clone https://github.com/arshubham/cipher.git
cd cipher
meson build --prefix=/usr
```
 
```
cd build
ninja
sudo ninja install
```
# :computer: Contributing workflow
Here’s how we suggest you go about proposing a change to this project:

1. [Fork this project][fork] to your account.
2. [Create a branch][branch] for the change you intend to make.
3. Make your changes to your fork.
4. [Send a pull request][pr] from your fork’s branch to our `master` branch


[fork]: https://help.github.com/articles/fork-a-repo/
[branch]: https://help.github.com/articles/creating-and-deleting-branches-within-your-repository
[pr]: https://help.github.com/articles/using-pull-requests/


:collision: [Contributors](https://github.com/arshubham/cipher/blob/master/AUTHORS.md)



# :page_facing_up: License 
This project is distributed under the terms of the GNU General Public License, version 3 - see the [LICENSE.md](LICENSE.md) file for details.


