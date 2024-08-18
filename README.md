# KDE Plasma widget to display Arch Linux package updates

A simple widget listing recent Arch Linux package updates.

## Installation

### Using the .plasmoid package

Download the latest release from the KDE store or from GitHub. Use the install tool provided by Plasma by choosing 
`Install Widget From Local File` and then choosing the installed .plasmoid file:

![alt text](https://github.com/PohjanPojka/archpkg-plasmoid/blob/main/images/installwidget.png?raw=true)

### Using `kpackagetool6`

You can clone the repository and install the widget using the package tool provided by Plasma

``` bash
git clone https://github.com/PohjanPojka/archpkg-plasmoid && kpackagetool6 -i ./archpkg-plasmoid/package
```
