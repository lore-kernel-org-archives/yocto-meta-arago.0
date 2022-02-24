Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.321.1645733099742718571
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 12:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BEBBD40C85;
	Thu, 24 Feb 2022 20:04:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfsH2_YH1mLN; Thu, 24 Feb 2022 20:04:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9EB5D40C7F;
	Thu, 24 Feb 2022 20:04:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 06FBF1747A2;
	Thu, 24 Feb 2022 15:04:56 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/3] meta-arago: convert licenses to SPDX format
Date: Thu, 24 Feb 2022 20:04:53 +0000
Message-Id: <20220224200455.2601205-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Update LICENSE variable to use SPDX license identifiers.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/busybox/softap-udhcpd-config_1.0.bb            | 2 +-
 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend             | 2 +-
 meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend | 2 +-
 .../acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb           | 2 +-
 .../pdm-anomaly-detection/pdm-anomaly-detection_git.bb          | 2 +-
 .../recipes-bsp/switch-config/switch-config_git.bb              | 2 +-
 .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb         | 2 +-
 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb       | 2 +-
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb                     | 2 +-
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc      | 2 +-
 .../recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb        | 2 +-
 .../recipes-devtools/input-utils/input-utils_1.0.bb             | 2 +-
 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb     | 2 +-
 .../recipes-devtools/util-scripts/glsdk-util-scripts.bb         | 2 +-
 meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb | 2 +-
 meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb          | 2 +-
 meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb          | 2 +-
 meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb         | 2 +-
 .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb           | 2 +-
 .../recipes-graphics/tslib/ts-calibrate-init_1.0.bb             | 2 +-
 meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb         | 2 +-
 .../recipes-kernel/timestamping/timestamping_4.1.bb             | 2 +-
 .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb           | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb              | 2 +-
 meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb       | 2 +-
 .../recipes-support/makedumpfile/makedumpfile_1.5.0.bb          | 2 +-
 meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb          | 2 +-
 meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb              | 2 +-
 29 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_=
1.0.bb b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.=
bb
index ffc4d223..0c896fed 100644
--- a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Configuration files for SoftAP with udhcpd"
 SECTION =3D "console/network"
 HOMEPAGE =3D "http://udhcp.busybox.net/"
-LICENSE =3D "GPLv2 & BSD-4-Clause"
+LICENSE =3D "GPL-2.0-only & BSD-4-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dde10de48642ab74318e893a61105a=
fbb"
=20
 PR =3D "r1"
diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-a=
rago-distro/recipes-core/dbus/dbus_%.bbappend
index 4bf6578a..da612c59 100644
--- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
+++ b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
@@ -1,3 +1,3 @@
 PR:append =3D ".arago1"
=20
-LICENSE =3D "GPLv2+"
+LICENSE =3D "GPL-2.0-or-later"
diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbapp=
end b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
index 6018cca8..860a0797 100644
--- a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
@@ -1,3 +1,3 @@
 PR:append =3D ".arago0"
=20
-LICENSE =3D "GPLv2+"
+LICENSE =3D "GPL-2.0-or-later"
diff --git a/meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis=
-atemsys_3.0.1.28.bb b/meta-arago-extras/recipes-apps/acontis-ethercat-de=
mo/acontis-atemsys_3.0.1.28.bb
index 94e0c563..897db273 100644
--- a/meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-atemsy=
s_3.0.1.28.bb
+++ b/meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-atemsy=
s_3.0.1.28.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "acontis atemsys kernel module for EtherCAT master"
 HOMEPAGE =3D "https://www.acontis.com/en/ethercat-for-ti-processors.html=
"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D65dd37ccb3e888dc57e47d925b80b=
38a"
=20
 SRC_URI =3D "https://www.acontis.com/files/support/ethercat/EC-Master-At=
emsys-V${PV}-Linux.tar.gz;subdir=3D${P}"
diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-ano=
maly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detect=
ion/pdm-anomaly-detection_git.bb
index 8f70ac2a..93317486 100644
--- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb
+++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Predictive maintenance demo for anomaly detection using Rec=
urrent Neural Network (RNN)"
-LICENSE =3D "BSD-3-Clause & MIT & GPLv3"
+LICENSE =3D "BSD-3-Clause & MIT & GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88016d2cbc82d0d2efbb0865891e=
9d6"
=20
 inherit qt5
diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_gi=
t.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index f3993f1e..77fd3ecc 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Ethernet Switch configuration management"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://switch-config.c;beginline=3D1;endline=3D14;=
md5=3D659ff9658cbaba3110b81804af60de75"
=20
 PV =3D "2.0"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-=
wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-w=
l18xx.bb
index 67179602..65a72c77 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.=
bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.=
bb
@@ -3,7 +3,7 @@
=20
 require hostap.inc
=20
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D292eece3f2ebbaa25608eed846=
4018a3"
=20
 PR:append =3D "e"
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/=
meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
index f425d163..fff33f62 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Virtual Tunnels over TCP/IP networks with traffic shapi=
ng, compression and encryption."
 HOMEPAGE =3D "http://vtun.sourceforge.net/"
 SECTION =3D "console/network"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://vtun.h;startline=3D1;endline=3D17;md5=3D9ac=
9e7fefca60c72400239e0de40cde8"
=20
 DEPENDS =3D "zlib lzo openssl bison-native flex-native"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplican=
t/wpa-supplicant-wl18xx.bb
index 04ae405e..9552e2e5 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-wl18xx.bb
@@ -3,7 +3,7 @@
=20
 require wpa-supplicant.inc
=20
-LICENSE =3D "GPLv2 | BSD-3-Clause"
+LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D292eece3f2ebbaa25608eed846=
4018a3 \
                     file://../README;md5=3D3f01d778be8f953962388307ee38e=
d2b \
                     file://wpa_supplicant.c;beginline=3D1;endline=3D17;m=
d5=3D35e6d71fea6b15f61a9fac935bcf410f"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-=
supplicant.inc
index dad2b824..53354375 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t.inc
@@ -5,7 +5,7 @@ SUMMARY =3D "Client for Wi-Fi Protected Access (WPA)"
 HOMEPAGE =3D "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER =3D "http://hostap.epitest.fi/bugz/"
 SECTION =3D "network"
-LICENSE =3D "GPLv2 | BSD-3-Clause"
+LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
=20
 inherit pkgconfig
=20
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-de=
mos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-de=
mos_2.0.bb
index 2982d32e..364dac99 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0=
.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0=
.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Ethernet example applications"
=20
 require matrix-gui-apps-git.inc
=20
-LICENSE =3D "CC-BY-SA-3.0 & GPLv2+"
+LICENSE =3D "CC-BY-SA-3.0 & GPL-2.0-or-later"
=20
 LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM} \
                      file://../../udhcpd_eth1.conf;beginline=3D1;endline=
=3D14;md5=3D70668b1ed5416406a61ef9abdd90d601 \
diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils_1=
.0.bb b/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
index 18efcd53..064a6faa 100644
--- a/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
+++ b/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Utilities for the Linux input drivers"
 HOMEPAGE =3D "http://packages.tanglu.org/source/aequorea/input-utils"
=20
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
=20
 PV =3D "1.0"
diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb =
b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 768d5505..3d3af349 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Diagnostic tool for TI OMAP processors"
 HOMEPAGE =3D "https://github.com/omapconf/omapconf"
=20
-LICENSE =3D "GPLv2 | BSD-3-Clause"
+LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e=
914"
=20
 PV =3D "1.75+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-s=
cripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-sc=
ripts.bb
index 49337130..cf187a29 100644
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Utility scripts for debug"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://debug/filter-dmesg-rproc.sh;md5=3Dce264e7cb=
c036fd2f37073947c2f0800"
 PR =3D "r1"
=20
diff --git a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git=
.bb b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
index 79ec067d..643a1768 100644
--- a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
+++ b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "UVC gadget userspace sample application"
-LICENSE =3D "GPLv2+"
+LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://uvc-gadget.c;beginline=3D1;endline=3D18;md5=
=3D414860c3c534dc95d81da9564cfb8d2a"
=20
 SRC_URI =3D "git://git.ideasonboard.org/uvc-gadget.git;branch=3Dmaster"
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb b/met=
a-arago-extras/recipes-extended/ltp/ltp_20200120.bb
index 0ecfcc9e..e0086141 100644
--- a/meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Linux Test Project"
 DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IBM=
, OSDL, and Bull with a goal to deliver test suites to the open source co=
mmunity that validate the reliability, robustness, and stability of Linux=
. The Linux Test Project is a collection of tools for testing the Linux k=
ernel and related features."
 HOMEPAGE =3D "https://linux-test-project.github.io/"
 SECTION =3D "console/utils"
-LICENSE =3D "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
+LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-=
2.1-or-later & BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "\
     file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
     file://testcases/kernel/controllers/freezer/COPYING;md5=3D0636e73ff0=
215e8d672dc4c32c317bb3 \
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb b/met=
a-arago-extras/recipes-extended/ltp/ltp_20210524.bb
index 2836f1bc..0b84727e 100644
--- a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
+++ b/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Linux Test Project"
 DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IBM=
, OSDL, and Bull with a goal to deliver test suites to the open source co=
mmunity that validate the reliability, robustness, and stability of Linux=
. The Linux Test Project is a collection of tools for testing the Linux k=
ernel and related features."
 HOMEPAGE =3D "https://linux-test-project.github.io/"
 SECTION =3D "console/utils"
-LICENSE =3D "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
+LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-=
2.1-or-later & BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "\
     file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
     file://testcases/kernel/controllers/freezer/COPYING;md5=3D0636e73ff0=
215e8d672dc4c32c317bb3 \
diff --git a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb b/me=
ta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
index 923af613..b07ff724 100644
--- a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
+++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Developer's Image Library (DevIL) is a c=
ross-platform image \
                library utilizing simple syntax to load, save, convert, \
                manipulate, filter and display a variety of images."
 HOMEPAGE =3D "https://github.com/DentonW/DevIL"
-LICENSE =3D "LGPLv2"
+LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9=
594"
=20
 SRC_URI =3D "git://github.com/dentonw/devil.git;protocol=3Dhttps;branch=3D=
master \
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1=
.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.=
0.bb
index 68a8efe7..8804544f 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Test applications for OMAP DRM interface"
=20
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://viddec3test.c;beginline=3D1;endline=3D16;md=
5=3Dc391f44e40a29096285e3121923041df"
=20
 DEPENDS =3D "ffmpeg libdce libdrm virtual/libgbm ti-sgx-ddk-um wayland"
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1=
.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index 1f66158b..db48d746 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -3,7 +3,7 @@
 DESCRIPTION =3D "TS calibration init script"
 RDEPENDS:${PN} +=3D "tslib"
=20
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://init;beginline=3D2;endline=3D11;md5=3D4b2e3=
b15f01cf63d2cb7988afdcc6c60"
=20
 PR =3D "r4"
diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb b/me=
ta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
index 8edbd939..2d7f370f 100644
--- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Linux Kernel PCI test"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
=20
 BRANCH =3D "ti-linux-5.4.y"
diff --git a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4=
.1.bb b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
index c9151c03..cdef66db 100644
--- a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
+++ b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Linux Kernel timestamping"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
=20
 SRC_URI =3D "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.ta=
r.xz"
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo=
/dual-camera-demo_1.0.bb
index f2fff127..c7d5a817 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Qt Dual Camera Demo"
 HOMEPAGE =3D "https://gitorious.org/dual-camera-demo/"
 SECTION =3D "multimedia"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7ca707704d3354a64feeb4f19f52=
eb5"
=20
 DEPENDS +=3D "libdrm cmem"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plu=
gins-ti/gstreamer1.0-plugins-ducati_git.bb
index e45de0dd..ff0e87fd 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "GStreamer elements to use the multimedia accelerators a=
vailable on some TI parts"
-LICENSE =3D "LGPLv2"
+LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
=20
 require gstreamer1.0-plugins-ti.inc
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugin=
s-ti/gstreamer1.0-plugins-vpe_git.bb
index 841a403f..a6f024f5 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "GStreamer elements to use the Video Processing Engine (=
VPE) found on some TI devices"
=20
-LICENSE =3D "LGPLv2"
+LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
=20
 require gstreamer1.0-plugins-ti.inc
diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb b/=
meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
index 12ac1b51..366b5369 100644
--- a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
+++ b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Qt Touch-Friendly WebBroswer"
 HOMEPAGE =3D "http://blog.qt.io/blog/2016/07/18/qt-webbrowser-1-0/"
 SECTION =3D "multimedia"
-LICENSE =3D "GPL-3.0 & GFDL-1.3"
+LICENSE =3D "GPL-3.0-only & GFDL-1.3"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.GPLv3;md5=3Da40e2bb02b1ac431f461afd03ff9d1d6 \
     file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
diff --git a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_=
1.5.0.bb b/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.=
5.0.bb
index 59dbaba9..29e6c18d 100644
--- a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.b=
b
+++ b/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.b=
b
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Make dump file utility"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/met=
a-arago-extras/recipes-support/mstpctl/mstpd_git.bb
index f4a3c248..a410f584 100644
--- a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
+++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Multiple Spanning Tree Protocol Daemon"
=20
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4325afd396febcb659c36b4953313=
5d4 \
                     file://debian/copyright;md5=3D332234a99007d25da40f41=
ee96aa388f"
=20
diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb b/meta-ar=
ago-extras/recipes-ti/fftlib/ti-fftw_git.bb
index 70d5e0c3..df9e9708 100644
--- a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
+++ b/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "TI FFTW"
 HOMEPAGE =3D "http://git.ti.com/fftlib"
-LICENSE =3D "GPL-2.0 & BSD-3-Clause"
+LICENSE =3D "GPL-2.0-only & BSD-3-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://docs/TI-FFTW_3.1.0_manifest.html;md5=3Daaa2=
75ec704a738216ba696898941b44 \
                     file://fftw-3.3.4/COPYING;md5=3D59530bdf33659b29e73d=
4adb9f9f6552"
--=20
2.25.1

