# Uninstalling Standard(?) Unix Notes

Uninstalling is simple to do. 


## Source Tarball

The included makefile from the source distribution includes a uninstall 
script. This is available via git clone or a download of the tarball 
from a release.

```shell
$ sudo make uninstall
```

## Debian .deb package

```shell
$ sudo dpkg -r unix-notes-(VER).deb
```

