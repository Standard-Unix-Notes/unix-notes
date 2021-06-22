# PIV cards

Although the Yubikeys above support PIV credentials, encrypting and 
decrypting with a PIV credential requires the use of a different 
command for the encryption and decryption.

Currently the *notes* application at the initial release v1.0 only 
supports GnuPG encryption. I hope to include PIV based encryption keys 
in a future release by making the encryption and decryption code auto detect 
from the 'config' file.

Please let me know if you will find this useful.
