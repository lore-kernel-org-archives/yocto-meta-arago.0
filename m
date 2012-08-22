Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 97A6F52A4B
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 17:43:34 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MHhXFp021442
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 12:43:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MHhXnK026994
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 12:43:33 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 22 Aug 2012 12:43:33 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago-extras][PATCH] recipes: Add various Wifi and
	Bluetooth demo applications
Thread-Index: AQHNgH8FZCwPxrCkAEqcIvR53pVWRJdmGhGQ
Date: Wed, 22 Aug 2012 17:43:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2A8720@DFLE09.ent.ti.com>
References: <1345651858-3619-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1345651858-3619-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [meta-arago-extras][PATCH] recipes: Add various Wifi and Bluetooth demo applications
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 17:43:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch. I am sending an updated patch that places these applicat=
ions in recipes-connectivity which makes more sense.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Wednesday, August 22, 2012 11:11 AM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-arago-extras][PATCH] recipes: Add various Wifi and Bluetooth=
 demo applications

* Add the battleship, bluetooth-gui and wifi-direct-demo application.
* These applications are missing proper license information inside of
  their git repository so LIC_FILES_CHKSUM is missing in the recipe.
* Working with appropriate teams to fix this issue.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/battleship/battleship_git.bb      |   46 ++++++++++++++++
 .../battleship/files/battleship.desktop            |    9 +++
 .../recipes-core/bluetooth-gui/bluetooth-gui.bb    |   56 ++++++++++++++++=
++++
 .../bluetooth-gui/files/bluetooth-icon.png         |  Bin 0 -> 12479 bytes
 .../bluetooth-gui/files/bt_demo.desktop            |    9 +++
 .../bluetooth-gui/files/desc_bluetooth.html        |    5 ++
 .../files/wifi-direct-demo.desktop                 |    9 +++
 .../wifi-direct-demo/files/wifi_exit.sh            |    3 +
 .../wifi-direct-demo/files/wifi_init.sh            |   13 +++++
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |   51 ++++++++++++++++=
++
 10 files changed, 201 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/battleship/battleship_gi=
t.bb
 create mode 100644 meta-arago-extras/recipes-core/battleship/files/battles=
hip.desktop
 create mode 100644 meta-arago-extras/recipes-core/bluetooth-gui/bluetooth-=
gui.bb
 create mode 100755 meta-arago-extras/recipes-core/bluetooth-gui/files/blue=
tooth-icon.png
 create mode 100755 meta-arago-extras/recipes-core/bluetooth-gui/files/bt_d=
emo.desktop
 create mode 100644 meta-arago-extras/recipes-core/bluetooth-gui/files/desc=
_bluetooth.html
 create mode 100644 meta-arago-extras/recipes-core/wifi-direct-demo/files/w=
ifi-direct-demo.desktop
 create mode 100644 meta-arago-extras/recipes-core/wifi-direct-demo/files/w=
ifi_exit.sh
 create mode 100644 meta-arago-extras/recipes-core/wifi-direct-demo/files/w=
ifi_init.sh
 create mode 100644 meta-arago-extras/recipes-core/wifi-direct-demo/wifi-di=
rect-demo_git.bb

diff --git a/meta-arago-extras/recipes-core/battleship/battleship_git.bb b/=
meta-arago-extras/recipes-core/battleship/battleship_git.bb
new file mode 100644
index 0000000..43c7421
--- /dev/null
+++ b/meta-arago-extras/recipes-core/battleship/battleship_git.bb
@@ -0,0 +1,46 @@
+DESCRIPTION =3D "Battleship game with wifi direct"
+SECTION =3D "network"
+LICENSE =3D "BSD"
+RDEPENDS +=3D "wpa-supplicant"
+
+PR =3D "r0"
+
+COMPATIBLE_MACHINE =3D "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-e=
vm)"
+
+BRANCH =3D "dbus"
+SRCREV =3D "644e7d37e982e3f8f3b93b01e115b11a6da161bb"
+PR_append =3D "+gitr${SRCREV}"
+
+SRC_URI =3D "git://git.profusion.mobi/users/lucas/battleship.git;protocol=
=3Dgit;branch=3D${BRANCH} \
+           file://battleship.desktop"
+
+require recipes-core/matrix/matrix-gui-paths.inc
+
+S =3D "${WORKDIR}/git"
+
+inherit qt4e
+
+PLATFORM_am37x-evm =3D "omap3evm"
+PLATFORM_omapl138 =3D "am1808"
+PLATFORM_am335x-evm =3D "am335x"
+PLATFORM ?=3D "UNKNOWN"
+
+do_install () {
+       install -d ${D}${bindir}
+       install -m 755 tmp/battleship ${D}/${bindir}/battleship
+       install -d 2755 ${D}${MATRIX_APP_DIR}/battleship
+       install -m 644 ${S}/data/battleship-icon.png ${D}${MATRIX_APP_DIR}/=
battleship
+       install -m 644 ${WORKDIR}/battleship.desktop ${D}${MATRIX_APP_DIR}/=
battleship
+}
+
+PACKAGES +=3D "${PN} matrix-gui-wifi-battleship-demo"
+
+FILES_${PN} +=3D" \
+	${bindir}/battleship \
+	"
+
+FILES_matrix-gui-wifi-battleship-demo +=3D " \
+	${MATRIX_APP_DIR}/battleship/* \
+    "
+
+RDEPENDS_matrix-gui-wifi-battleship-demo +=3D "matrix-gui-apps-images matr=
ix-gui-submenus-wifi ${PN}"
diff --git a/meta-arago-extras/recipes-core/battleship/files/battleship.des=
ktop b/meta-arago-extras/recipes-core/battleship/files/battleship.desktop
new file mode 100644
index 0000000..f8ff5a2
--- /dev/null
+++ b/meta-arago-extras/recipes-core/battleship/files/battleship.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=3DBattleship
+GenericName=3DDemo App
+Icon=3D/usr/share/matrix-gui-2.0/apps/battleship/battleship-icon.png
+Type=3DApplication
+Exec=3Dbattleship
+Categories=3Dwifi
+X-ProgramType=3Dgui
diff --git a/meta-arago-extras/recipes-core/bluetooth-gui/bluetooth-gui.bb =
b/meta-arago-extras/recipes-core/bluetooth-gui/bluetooth-gui.bb
new file mode 100644
index 0000000..3c35d89
--- /dev/null
+++ b/meta-arago-extras/recipes-core/bluetooth-gui/bluetooth-gui.bb
@@ -0,0 +1,56 @@
+DESCRIPTION =3D "Bluetooth GUI Application"
+SECTION =3D "network"
+LICENSE =3D "BSD"
+RDEPENDS +=3D "pulseaudio"
+
+PR =3D "r10"
+
+COMPATIBLE_MACHINE =3D "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-e=
vm)"
+
+BRANCH =3D "master"
+SRCREV =3D "d9fc6f1ab023230170672d5243cbee58d740e7fe"
+PR_append =3D "+gitr${SRCREV}"
+
+SRC_URI =3D "git://git.profusion.mobi/users/lucas/BT_Demo.git;protocol=3Dg=
it;branch=3D${BRANCH} \
+           file://bluetooth-icon.png \
+           file://desc_bluetooth.html \
+           file://bt_demo.desktop"
+
+require recipes-core/matrix/matrix-gui-paths.inc
+
+
+S =3D "${WORKDIR}/git"
+
+inherit qt4e
+
+PLATFORM_am37x-evm =3D "omap3evm"
+PLATFORM_omapl138 =3D "am1808"
+PLATFORM_am335x-evm =3D "am335x"
+PLATFORM ?=3D "UNKNOWN"
+
+do_install () {
+       install -d ${D}${bindir}
+       install -m 755 BT_Demo ${D}/${bindir}/bluetooth-gui
+       install -m 755 ${S}/scripts/BT_Init_${PLATFORM}.sh ${D}${bindir}/BT=
_Init.sh
+       install -m 755 ${S}/scripts/BT_Exit.sh ${D}${bindir}
+       install -d 2755 ${D}${MATRIX_APP_DIR}/bt_demo
+       install -m 644 ${WORKDIR}/bt_demo.desktop ${D}${MATRIX_APP_DIR}/bt_=
demo
+       install -m 644 ${WORKDIR}/desc_bluetooth.html ${D}${MATRIX_APP_DIR}=
/bt_demo
+       install -m 644 ${WORKDIR}/bluetooth-icon.png ${D}${MATRIX_APP_DIR}/=
bt_demo
+}
+
+PACKAGES +=3D "${PN} matrix-gui-bluetooth-demos"
+
+FILES_${PN} +=3D" \
+	${bindir}/bluetooth-gui \
+	${bindir}/BT_Init.sh \
+	${bindir}/BT_Exit.sh \
+	"
+FILES_matrix-gui-bluetooth-demos +=3D " \
+    	${MATRIX_APP_DIR}/bt_demo/* \
+        "
+
+RDEPENDS_matrix-gui-bluetooth-demos +=3D "matrix-gui-apps-images matrix-gu=
i-submenus-wifi ${PN}"
+
+SRC_URI[md5sum] =3D "357da8591816ff05e81f31379bde9a01"
+SRC_URI[sha256sum] =3D "aad229f585b21bf2eb4d3dee4b123271683b357bf0625b6da1=
ebced881595e6d"
diff --git a/meta-arago-extras/recipes-core/bluetooth-gui/files/bluetooth-i=
con.png b/meta-arago-extras/recipes-core/bluetooth-gui/files/bluetooth-icon=
.png
new file mode 100755
index 0000000000000000000000000000000000000000..3411afa0aa0a205731f22ab4033=
825c7f18a69fa
GIT binary patch
literal 12479
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
JPDHLkV1hvelhyzL

literal 0
HcmV?d00001

diff --git a/meta-arago-extras/recipes-core/bluetooth-gui/files/bt_demo.des=
ktop b/meta-arago-extras/recipes-core/bluetooth-gui/files/bt_demo.desktop
new file mode 100755
index 0000000..f462500
--- /dev/null
+++ b/meta-arago-extras/recipes-core/bluetooth-gui/files/bt_demo.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=3DBluetooth
+GenericName=3DBluetooth
+Icon=3D/usr/share/matrix-gui-2.0/apps/bt_demo/bluetooth-icon.png
+Type=3DApplication
+Exec=3Dbluetooth-gui --blacklist-alsa-cards=3D"L138 EVM,omap3evm,AM335X EV=
M"
+X-ProgramType=3Dgui
+X-MATRIX-Description=3D/usr/share/matrix-gui-2.0/apps/bt_demo/desc_bluetoo=
th.html
diff --git a/meta-arago-extras/recipes-core/bluetooth-gui/files/desc_blueto=
oth.html b/meta-arago-extras/recipes-core/bluetooth-gui/files/desc_bluetoot=
h.html
new file mode 100644
index 0000000..9c70972
--- /dev/null
+++ b/meta-arago-extras/recipes-core/bluetooth-gui/files/desc_bluetooth.htm=
l
@@ -0,0 +1,5 @@
+<h1> Bluetooth GUI </h1>
+
+<h2>Warning: The WiFi/Bluetooth daughter card is required in order for blu=
etooth to operate correctly.
+Please ensure it is attached before continuing.</h2>
+
diff --git a/meta-arago-extras/recipes-core/wifi-direct-demo/files/wifi-dir=
ect-demo.desktop b/meta-arago-extras/recipes-core/wifi-direct-demo/files/wi=
fi-direct-demo.desktop
new file mode 100644
index 0000000..606dbba
--- /dev/null
+++ b/meta-arago-extras/recipes-core/wifi-direct-demo/files/wifi-direct-dem=
o.desktop
@@ -0,0 +1,9 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=3DWiFi-Direct Demo
+GenericName=3DDemo App
+Icon=3D/usr/share/matrix-gui-2.0/apps/wifi-direct-demo/wifi-direct-icon.pn=
g
+Type=3DApplication
+Exec=3Dwifi-direct-demo
+Categories=3Dwifi
+X-ProgramType=3Dgui
diff --git a/meta-arago-extras/recipes-core/wifi-direct-demo/files/wifi_exi=
t.sh b/meta-arago-extras/recipes-core/wifi-direct-demo/files/wifi_exit.sh
new file mode 100644
index 0000000..baf436b
--- /dev/null
+++ b/meta-arago-extras/recipes-core/wifi-direct-demo/files/wifi_exit.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+killall udhcpd
diff --git a/meta-arago-extras/recipes-core/wifi-direct-demo/files/wifi_ini=
t.sh b/meta-arago-extras/recipes-core/wifi-direct-demo/files/wifi_init.sh
new file mode 100644
index 0000000..a240e20
--- /dev/null
+++ b/meta-arago-extras/recipes-core/wifi-direct-demo/files/wifi_init.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+if [ -z  $1 ]
+then
+    echo "start Client"
+    udhcpc -i wlan0
+else
+    echo "start Daemon"
+    echo 1 > /proc/sys/net/ipv4/ip_forward
+    ifconfig wlan0 192.168.0.1
+    udhcpd /etc/udhcpd.conf
+    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
+fi
diff --git a/meta-arago-extras/recipes-core/wifi-direct-demo/wifi-direct-de=
mo_git.bb b/meta-arago-extras/recipes-core/wifi-direct-demo/wifi-direct-dem=
o_git.bb
new file mode 100644
index 0000000..2e235ec
--- /dev/null
+++ b/meta-arago-extras/recipes-core/wifi-direct-demo/wifi-direct-demo_git.=
bb
@@ -0,0 +1,51 @@
+DESCRIPTION =3D "Wifi Direct Demo"
+SECTION =3D "network"
+LICENSE =3D "BSD"
+RDEPENDS +=3D "wpa-supplicant"
+
+PR =3D "r0"
+
+COMPATIBLE_MACHINE =3D "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
+
+BRANCH =3D "dbus"
+SRCREV =3D "0950a67d9fe9a70668a993774e65ba9d457d750c"
+PR_append =3D "+gitr${SRCREV}"
+
+SRC_URI =3D "git://git.profusion.mobi/users/lucas/wifi-direct-demo.git;pro=
tocol=3Dgit;branch=3D${BRANCH} \
+           file://wifi-direct-demo.desktop"
+
+require recipes-core/matrix/matrix-gui-paths.inc
+
+
+S =3D "${WORKDIR}/git"
+
+inherit qt4e
+
+PLATFORM_am37x-evm =3D "omap3evm"
+PLATFORM_omapl138 =3D "am1808"
+PLATFORM_am335x-evm =3D "am335x"
+PLATFORM ?=3D "UNKNOWN"
+
+do_install () {
+       install -d ${D}${bindir}
+       install -m 755 ${S}/scripts/wifi_init.sh ${D}${bindir}/
+       install -m 755 ${S}/scripts/wifi_exit.sh ${D}${bindir}/
+       install -m 755 tmp/wifi-direct-demo ${D}/${bindir}/
+       install -d 2755 ${D}${MATRIX_APP_DIR}/wifi-direct-demo
+       install -m 644 ${S}/images/wifi-direct-icon.png ${D}${MATRIX_APP_DI=
R}/wifi-direct-demo
+       install -m 644 ${WORKDIR}/wifi-direct-demo.desktop ${D}${MATRIX_APP=
_DIR}/wifi-direct-demo
+}
+
+PACKAGES +=3D "${PN} matrix-gui-wifi-direct-demo"
+
+FILES_${PN} +=3D" \
+	${bindir}/wifi-direct-demo \
+	${bindir}/wifi_init.sh \
+	${bindir}/wifi_exit.sh \
+	"
+
+FILES_matrix-gui-wifi-direct-demo +=3D " \
+	${MATRIX_APP_DIR}/wifi-direct-demo/* \
+	"
+
+RDEPENDS_matrix-gui-wifi-direct-demo +=3D "matrix-gui-apps-images matrix-g=
ui-submenus-wifi ${PN}"
--=20
1.7.0.4


