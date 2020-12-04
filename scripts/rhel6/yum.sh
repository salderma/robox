#!/bin/bash

# Check whether the install media is mounted, and if necessary mount it.
if [ ! -f /media/media.repo ]; then
  mount /dev/cdrom /media
fi

# Setup the install DVD as the yum repo location.
cp /media/media.repo /etc/yum.repos.d/media.repo
printf "enabled=1\n" >> /etc/yum.repos.d/media.repo
printf "baseurl=file:///media/\n" >> /etc/yum.repos.d/media.repo

# Import the Red Hat signing key.
rpm --import /media/RPM-GPG-KEY-redhat-release

# Setup the EPEL repo.
base64 --decode > epel-release-6-8.noarch.rpm <<-EOF
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
AAAEdAAAAAYAAAQPAAAACAAABIwAAAAGAAAEEAAAAAgAAASqAAAABgAABBQAAAAGAAAEyAAAAAEA
AAQVAAAABAAABOQAAAAGAAAEFwAAAAgAAAT8AAAAAgAABBgAAAAEAAAFIAAAAAgAAAQZAAAACAAA
BUAAAAAIAAAEGgAAAAgAAAXXAAAACAAABB0AAAAEAAAF/AAAAAEAAAQeAAAACAAABgAAAAABAAAE
HwAAAAgAAAYPAAAAAQAABCgAAAAGAAAGEAAAAAEAAAQ4AAAABAAABhgAAAAOAAAEOQAAAAgAAAZQ
AAAADgAABDoAAAAIAAAIxQAAAA4AAAQ+AAAABgAACvcAAAABAAAEQAAAAAYAAAr/AAAAAQAABEcA
AAAEAAALCAAAAAYAAARIAAAABAAACyAAAAAGAAAESQAAAAgAAAs4AAAABgAABFgAAAAEAAALQAAA
AAIAAARZAAAACAAAC0gAAAACAAAEXAAAAAQAAAtQAAAABgAABF0AAAAIAAALaAAAAAYAAAReAAAA
CAAAC7oAAAAFAAAEYgAAAAYAAAwXAAAAAQAABGQAAAAGAAAMGwAAAAEAAARlAAAABgAADCAAAAAB
AAAEZgAAAAYAAAwjAAAAAQAABGwAAAAGAAAMJQAAAAEAAAR0AAAABAAADEAAAAAGAAAEdQAAAAQA
AAxYAAAABgAABHYAAAAIAAAMcAAAAAMAAAR3AAAABAAADIgAAAAGAAAEeAAAAAQAAAygAAAABgAA
E5MAAAAEAAAMuAAAAAFDAGVwZWwtcmVsZWFzZQA2ADgARXh0cmEgUGFja2FnZXMgZm9yIEVudGVy
cHJpc2UgTGludXggcmVwb3NpdG9yeSBjb25maWd1cmF0aW9uAFRoaXMgcGFja2FnZSBjb250YWlu
cyB0aGUgRXh0cmEgUGFja2FnZXMgZm9yIEVudGVycHJpc2UgTGludXggKEVQRUwpIHJlcG9zaXRv
cnkKR1BHIGtleSBhcyB3ZWxsIGFzIGNvbmZpZ3VyYXRpb24gZm9yIHl1bSBhbmQgdXAyZGF0ZS4A
AABQlziBYnVpbGR2bS0wNS5waHgyLmZlZG9yYXByb2plY3Qub3JnAAAAAABWmUZlZG9yYSBQcm9q
ZWN0AEZlZG9yYSBQcm9qZWN0AEdQTHYyAEZlZG9yYSBQcm9qZWN0AFN5c3RlbSBFbnZpcm9ubWVu
dC9CYXNlAGh0dHA6Ly9kbC5mZWRvcmFwcm9qZWN0Lm9yZy9wdWIvZXBlbC8AbGludXgAbm9hcmNo
ACMgTm90IG5lZWRlZCBmb3IgZWw2IGFzIHNvdXJjZXMgaGFzIGJlZW4gcmVtb3ZlZAojZWNobyAi
IyBlcGVsIHJlcG8gLS0gYWRkZWQgYnkgZXBlbC1yZWxlYXNlICIgXAojICAgID4+IC9ldGMvc3lz
Y29uZmlnL3Jobi9zb3VyY2VzCiNlY2hvICJ5dW0gZXBlbCBodHRwOi8vZG93bmxvYWQuZmVkb3Jh
LnJlZGhhdC5jb20vcHViL2VwZWwvNi9cJEFSQ0giIFwKIyAgICA+PiAvZXRjL3N5c2NvbmZpZy9y
aG4vc291cmNlcwAjc2VkIC1pICcvXnl1bVwgZXBlbC9kJyAvZXRjL3N5c2NvbmZpZy9yaG4vc291
cmNlcwojc2VkIC1pICcvXlwjXCBlcGVsXCByZXBvXCAvZCcgL2V0Yy9zeXNjb25maWcvcmhuL3Nv
dXJjZXMAAAAAAAAGcQAAAHoAAAQgAAADvQAAEAAAAEfRgaSBpIGkgaRB7YGkAAAAAAAAAAAAAAAA
UJc38VCXN/FQlzfxUJc38VCXOIFQlzfxNjI2ZTE4ZmZiMzU2NWUyOWFiOTRjMDJlMTFiNTkzYjdh
ZGVkN2NhOTEwZTAzYWJjMTY3ZWZhZTM4YWNjZmFjZgA5MDE4YTc2MTI5ZTFmMzE5NzJmYjZhMmIx
NTA5MGVmNTExY2M3MTZlYWJiMzg1Y2Y4MTU4M2ZiNjlmODgwNTUzADQzMjkyOGNkN2FjMzU1NjZh
N2U2ZDAyOTE0YzNjZjIxOTA2YzkwOGYwYWQ3ZmU2ZDg4NGJmZmRlNTAyOGE2MjAAY2Q0OTE1MGNl
NDQ0MjA5ZTQ2ZDAzNjc4YWZlMzA2YzgyNGVlOGRjOWVlNDhlZmI2NGQ1NWNkNWQwMDJjZjViYwAA
MDNhNTVjZmJiYmZjZGZjNzVmZWQ4YWVjYTUzODNmZWYxMmRlNGYwMTlkNWZmMTVjNThmMWU2NTgx
NDY1MDA3ZQAAAAAAAAAAAAAAAAAAAAAAABEAAAARAAAAAAAAAAJyb290AHJvb3QAcm9vdAByb290
AHJvb3QAcm9vdAByb290AHJvb3QAcm9vdAByb290AHJvb3QAcm9vdABlcGVsLXJlbGVhc2UtNi04
LnNyYy5ycG0AAAAA////////////////////////////////Y29uZmlnKGVwZWwtcmVsZWFzZSkA
ZXBlbC1yZWxlYXNlAAAAAAAFAAAAEQAQAAAIAAAADAEAAAoBAAAKAQAACgEAAAovYmluL3NoAC9i
aW4vc2gAY29uZmlnKGVwZWwtcmVsZWFzZSkAcmVkaGF0LXJlbGVhc2UAcnBtbGliKENvbXByZXNz
ZWRGaWxlTmFtZXMpAHJwbWxpYihGaWxlRGlnZXN0cykAcnBtbGliKFBheWxvYWRGaWxlc0hhdmVQ
cmVmaXgpAHJwbWxpYihQYXlsb2FkSXNYeikAAAA2LTgANgAzLjAuNC0xADQuNi4wLTEANC4wLTEA
NS4yLTEAAAAAAABmZWRvcmEtcmVsZWFzZQAANC44LjAAAABQlljAT6pcQE8MKEBMtE3ATGKQwEw3
D0BL1tHASaPhQEh/NEBGBmRARgZkQEYGZEBF9+PARfVAwDxzdGFobm1hQGZlZG9yYXByb2plY3Qu
b3JnPiAtIDYtOABKZW5zIFBldGVyc2VuIDxwZXRlcnNlbkByZWRoYXQuY29tPiAtIDYtNwBKZW5z
IFBldGVyc2VuIDxwZXRlcnNlbkByZWRoYXQuY29tPiAtIDYtNgBNaWNoYWVsIFN0YWhua2UgPHN0
YWhubWFAZmVkb3JhcHJvamVjdC5vcmc+IC0gNi01AFNldGggVmlkYWwgPHNrdmlkYWwgYXQgZmVk
b3JhcHJvamVjdC5vcmc+IC0gNi00AERlbm5pcyBHaWxtb3JlIDxkZW5uaXNAYXVzaWwudXM+IC0g
Ni0zAERlbm5pcyBHaWxtb3JlIDxkZW5uaXNAYXVzaWwudXM+IC0gNi0xAEZlZG9yYSBSZWxlYXNl
IEVuZ2luZWVyaW5nIDxyZWwtZW5nQGxpc3RzLmZlZG9yYXByb2plY3Qub3JnPiAtIDYtMgBUb20g
InNwb3QiIENhbGxhd2F5IDx0Y2FsbGF3YUByZWRoYXQuY29tPiAtIDYuMQBNaWNoYWVsIFN0YWhu
a2UgPG1hc3RhaG5rZUBnbWFpbC5jb20+IC0gNi0wAE1pY2hhZWwgU3RhaG5rZSA8bWFzdGFobmtl
QGdtYWlsLmNvbT4gLSA0LTQATWljaGFlbCBTdGFobmtlIDxtYXN0YWhua2VAZ21haWwuY29tPiAt
IDQtMwBNaWNoYWVsIFN0YWhua2UgPG1hc3RhaG5rZUBnbWFpbC5jb20+IC0gNC0yAE1pY2hhZWwg
U3RhaG5rZSA8bWFzdGFobmtlQGdtYWlsLmNvbT4gLSA0LTEALSBGaXggVVJMIGJ6ICM4NzA2ODYA
LSBhZGQgcHBjNjQgdG8gZ2hjX2FyY2hlcwAtIGFkZCAvZXRjL3JwbS9tYWNyb3MuZ2hjLXNycG0g
ZnJvbSBmZWRvcmEgcmVkaGF0LXJwbS1tYWNyb3MALSBGaXggYnVnICM2Mjc2MTEALSBjb25mbGlj
dCBmZWRvcmEtcmVsZWFzZQAtIHVzZSBtZXRhbGluayB1cmxzIG5vdCBtaXJyb3JsaXN0IG9uZXMA
LSBzZXR1cCBmb3IgRUwtNgotIG5ldyBrZXkALSBSZWJ1aWx0IGZvciBodHRwczovL2ZlZG9yYXBy
b2plY3Qub3JnL3dpa2kvRmVkb3JhXzExX01hc3NfUmVidWlsZAAtIGZpeCBsaWNlbnNlIHRhZwAt
IEJ1bXBlZCBpbiBkZXZlbCB0byBSSEVMIDYuIChXZSBjYW4gZHJlYW0pLgAtIENoYW5nZWQgZGVz
Y3JpcHRpb24gYWdhaW4ALSBSZW1vdmVkIGNwIGluIHBvc3R1bgotIFJlbW92ZWQgdGhlIGZpbGUg
ZXBlbC1yZWxlYXNlIC0gcHJvdmlkZXMgbm8gdmFsdWUKLSBSZW1vdmVkIGRpc3QgdGFnIGFzIHBl
ciByZXZpZXcgYnVnICMyMzMyMzYKLSBDaGFuZ2VkIGRlc2NyaXB0aW9uAC0gRml4ZWQgdXAyZGF0
ZSBpc3N1ZXMuAC0gSW5pdGlhbCBQYWNrYWdlAC9iaW4vc2gAL2Jpbi9zaAAAAAAAAQAAAAEAAAAB
AAAAAQAAAAEAAAABAAAAAQAAAAIAAAADAAAABAAAAAUAAAAGAAAAAAAAAAAQAAAIAAAACDYtOAA2
LTgAAAAAAAAAAAEAAAACAAAAAgAAAAMAAAAEUlBNLUdQRy1LRVktRVBFTC02AG1hY3Jvcy5naGMt
c3JwbQBlcGVsLXRlc3RpbmcucmVwbwBlcGVsLnJlcG8AZXBlbC1yZWxlYXNlLTYAR1BMAC9ldGMv
cGtpL3JwbS1ncGcvAC9ldGMvcnBtLwAvZXRjL3l1bS5yZXBvcy5kLwAvdXNyL3NoYXJlL2RvYy8A
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
AAAKWVo=
EOF

# Install the EPEL release RPM.
yum --assumeyes install epel-release-6-8.noarch.rpm

# Delete the RPM file.
rm --force epel-release-6-8.noarch.rpm

# Setup the EPEL release signing key.
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

# Update EPEL to use HTTPS and switch to archive server.
sed -i -e "s/^#baseurl/baseurl/g" /etc/yum.repos.d/epel.repo
sed -i -e "s/^mirrorlist/#mirrorlist/g" /etc/yum.repos.d/epel.repo
sed -i -e "s/http:\/\/download.fedoraproject.org\/pub\/epel\//https:\/\/archives.fedoraproject.org\/pub\/archive\/epel\//g" /etc/yum.repos.d/epel.repo

# Install the basic packages we'd expect to find.
yum --assumeyes install sudo dmidecode yum-utils bash-completion man man-pages vim-enhanced sysstat bind-utils jwhois wget dos2unix unix2dos lsof telnet net-tools coreutils grep gawk sed curl patch sysstat make cmake libarchive texinfo autoconf automake libtool gcc-c++ libstdc++-devel gcc cpp ncurses-devel glibc-devel glibc-headers kernel-headers psmisc
