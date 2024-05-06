Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1937FC10F16
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 15:47:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.23999.1715010454224248432
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 06 May 2024 08:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nVGjle58;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 446FlXeY042241;
	Mon, 6 May 2024 10:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715010453;
	bh=r35MG8DaeWNhPrmv9zTe2pLOxMwhsSb0yVWDjmtHWhI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nVGjle58jIeWGrlx4wvh3ctR/Gw5UJ0aXDV1Tv2ePvWRSIuw+qvlBGBe8s4Pf22LG
	 nW3Yub7NdTvZwBMkChyonI9S6YFb8ROrSyA12fT/6k/yipc3VjalHERst/074gOmoG
	 F5rRDgPSiQZU+ZVxZBrRCnydKJrkSuVKrioMWvjU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 446FlXib022554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 May 2024 10:47:33 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 10:47:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 10:47:32 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 446FlWOe009483;
	Mon, 6 May 2024 10:47:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s40Yu-0007iP-J4; Mon, 06 May 2024 10:47:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] recipes: Update WORKDIR references to UNPACKDIR
Date: Mon, 6 May 2024 10:47:32 -0500
Message-ID: <20240506154732.29615-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240506154732.29615-1-reatmon@ti.com>
References: <20240506154732.29615-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 06 May 2024 15:47:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15328

This is a correspnding patch to match one from Richard Purdie in
oe-core. [1]

Since we want to be able to stop unpacking to WORKDIR, correct the WORKDIR
references in recipe do_compile/do_install tasks to use UNPACKDIR in the
appropraite places instead.

[1] https://git.openembedded.org/openembedded-core/commit/?id=d73595df69667fe9d12ecd407b77a0b8dae2109c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../matrix/matrix-gui-ethernet-demos_2.0.bb   |  2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb     | 14 +++++-----
 .../recipes-core/psplash/psplash_git.bbappend |  2 +-
 .../recipes-core/systemd/systemd_%.bbappend   | 26 +++++++++----------
 .../recipes-core/thermal-init/thermal-init.bb |  2 +-
 .../recipes-core/udev/eudev_%.bbappend        |  4 +--
 .../recipes-qt/qt5/qtbase-conf_1.0.bb         |  4 +--
 .../recipes-qt/qt5/qtbase_%.bbappend          |  4 +--
 .../strongswan/strongswan_%.bbappend          |  2 +-
 .../recipes-connectivity/hostap/hostap.inc    |  4 +--
 .../wpa-supplicant/wpa-supplicant.inc         | 12 ++++-----
 .../recipes-core/llvm/llvm-common.bb          |  4 +--
 .../opkg/opkg-bash-completion.bb              |  2 +-
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb  |  2 +-
 .../tensorflow-lite-demo_git.bb               | 12 ++++-----
 .../tensorflow-lite/tensorflow-lite_1.15.bb   | 24 ++++++++---------
 .../netopeer2-server/netopeer2-server_git.bb  |  4 +--
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    |  4 +--
 .../recipes-ti/tiovx/tiovx-app-host.bb        |  2 +-
 .../recipes-ti/tiovx/tiovx-sys-iface.bb       |  2 +-
 20 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
index 364dac99..8359314f 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git/ethernet_apps"
 
 do_install:append() {
     install -d ${D}${sysconfdir}
-    install -m 0755 ${WORKDIR}/udhcpd_eth1.conf ${D}${sysconfdir}
+    install -m 0755 ${UNPACKDIR}/udhcpd_eth1.conf ${D}${sysconfdir}
 }
 
 # Make sure ethernet submenu and app images has been installed
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
index fbff1671..1c1b3bbc 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
@@ -42,22 +42,22 @@ do_install(){
 	cp -rfL ${S}/* ${D}${MATRIX_WEB_DIR}
 
 	# Install our php.ini file
-	install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
+	install -m 0644 ${UNPACKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
 
 	# Set the proper path in the init script
-	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/${MATRIX_INITSCRIPT}
-	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/${MATRIX_INITSCRIPT}
-	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/${MATRIX_INITSCRIPT}
+	sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${UNPACKDIR}/${MATRIX_INITSCRIPT}
+	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${UNPACKDIR}/${MATRIX_INITSCRIPT}
+	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${UNPACKDIR}/${MATRIX_INITSCRIPT}
 
 	# Install the script
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
+		install -m 0755 ${UNPACKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
 	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${systemd_system_unitdir}
-		install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_unitdir}
-		install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${MATRIX_BASE_DIR}/matrix-gui-2.0
+		install -m 0644 ${UNPACKDIR}/matrix-gui-2.0.service ${D}${systemd_system_unitdir}
+		install -m 0755 ${UNPACKDIR}/${MATRIX_INITSCRIPT} ${D}${MATRIX_BASE_DIR}/matrix-gui-2.0
 	fi
 }
 
diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
index 652c71f3..952f13fd 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
+++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
@@ -11,5 +11,5 @@ SRC_URI += "file://psplash-18bpp.patch                      \
 "
 
 do_configure:prepend() {
-    install -m 0644 ${WORKDIR}/psplash-bar-img.h ${S}/
+    install -m 0644 ${UNPACKDIR}/psplash-bar-img.h ${S}/
 }
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 428a16f7..424f39da 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -20,20 +20,20 @@ SRC_URI:append = " \
 
 do_install:append() {
     install -d ${D}${sysconfdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
 
     install -d ${D}${sysconfdir}/udev/scripts/
-    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scripts/
-    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scripts/
+    install -m 0755 ${UNPACKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scripts/
+    install -m 0755 ${UNPACKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scripts/
 
     install -d ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${WORKDIR}/10-eth.network ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${WORKDIR}/15-eth.network ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${WORKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${WORKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${UNPACKDIR}/10-eth.network ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${UNPACKDIR}/15-eth.network ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${UNPACKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${UNPACKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
 
     install -d ${D}${sysconfdir}/systemd/system/sysinit.target.wants
-    install -m 0644 ${WORKDIR}/sync-clocks.service ${D}${sysconfdir}/systemd/system/
+    install -m 0644 ${UNPACKDIR}/sync-clocks.service ${D}${sysconfdir}/systemd/system/
     ln -sf ../sync-clocks.service ${D}${sysconfdir}/systemd/system/sysinit.target.wants/sync-clocks.service
 
     # Allow automount from udev
@@ -45,13 +45,13 @@ do_install:append() {
     sed -i 's/PrivateNetwork=yes/PrivateNetwork=no/g' ${D}${sysconfdir}/systemd/system/systemd-hostnamed.service
 
     install -d ${D}${sysconfdir}/systemd/
-    install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
+    install -m 0644 ${UNPACKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
 
     install -d ${D}${libdir}/udev/rules.d
-    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
 }
 
 FILES:udev += " \
diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
index 56f1ba1a..4f3aa217 100644
--- a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
+++ b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
@@ -13,7 +13,7 @@ inherit update-rc.d
 
 do_install() {
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+    install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
 FILES:${PN} = "${sysconfdir} ${bindir}"
diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
index 4817e840..c5758a21 100644
--- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
+++ b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
@@ -16,7 +16,7 @@ SRC_URI:append = " \
 do_install:append() {
     install -d ${D}/${bindir}
 
-    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
-    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
+    install -m 0755 ${UNPACKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
+    install -m 0755 ${UNPACKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
     ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
 }
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
index 63894c47..83a2cba3 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
@@ -12,9 +12,9 @@ SRC_URI = "file://qt_env.sh \
 # Add custom Arago qtbase Environment script and eglfs_kms configuration file
 do_install () {
     install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
+    install -m 0644 ${UNPACKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
     install -d ${D}${sysconfdir}/qt5
-    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
+    install -m 0644 ${UNPACKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
 }
 
 FILES:${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 8ae8110b..1d70e747 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -26,11 +26,11 @@ SRC_URI += "\
 python do_patch:append() {
     import shutil
 
-    work_dir = d.getVar("WORKDIR")
+    unpack_dir = d.getVar("UNPACKDIR")
     s = d.getVar("S")
 
     if not bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d):
-        shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
+        shutil.copy(os.path.join(unpack_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
 }
 
 # Add symbolic link qt5/examples for backward compatibility
diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
index ae313c74..efedd7fb 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -14,5 +14,5 @@ EXTRA_OECONF += " \
 SRC_URI += "file://pkcs11_plugin.conf"
 
 do_install:append () {
-	install -m 0644 ${WORKDIR}/pkcs11_plugin.conf ${D}${sysconfdir}/strongswan.d/
+	install -m 0644 ${UNPACKDIR}/pkcs11_plugin.conf ${D}${sysconfdir}/strongswan.d/
 }
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
index 6695d3a3..ec9f4c86 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -25,7 +25,7 @@ SRC_URI = "git://git.ti.com/git/wilink8-wlan/hostap.git;protocol=https;branch=${
 S = "${WORKDIR}/git/hostapd"
 
 do_configure() {
-	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+	install -m 0644 ${UNPACKDIR}/defconfig ${S}/.config
 	echo "CFLAGS += -I${STAGING_INCDIR}" >> .config
         echo "CFLAGS += -I${STAGING_INCDIR}/libnl3/" >> .config
 	echo "LIBS += -L${STAGING_LIBDIR}" >> .config
@@ -40,7 +40,7 @@ do_install() {
 	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
 	install -m 0755 ${S}/hostapd ${D}${sbindir}
 	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
-	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
+	install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/hostapd
 }
 
 # The default hostapd.conf file that is fetched from upstream is using
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 9767e9ad..797a9fe7 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -35,7 +35,7 @@ FILES:wpa-supplicant-cli = "${sbindir}/wpa_cli"
 FILES:${PN} += "${datadir}/dbus-1/system-services/*"
 
 do_configure () {
-	install -m 0755 ${WORKDIR}/defconfig .config
+	install -m 0755 ${UNPACKDIR}/defconfig .config
 	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> .config
 }
 
@@ -54,16 +54,16 @@ do_install () {
 	install -m 755 wpa_cli        ${D}${sbindir}
 
 	install -d ${D}${docdir}/wpa_supplicant
-	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
+	install -m 644 README ${UNPACKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
 
 	install -d ${D}${sysconfdir}/default
-	install -m 600 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}/wpa_supplicant.conf
-	install -m 600 ${WORKDIR}/p2p_supplicant.conf ${D}${sysconfdir}/p2p_supplicant.conf
+	install -m 600 ${UNPACKDIR}/wpa_supplicant.conf ${D}${sysconfdir}/wpa_supplicant.conf
+	install -m 600 ${UNPACKDIR}/p2p_supplicant.conf ${D}${sysconfdir}/p2p_supplicant.conf
 
 	install -d ${D}${sysconfdir}/network/if-pre-up.d/
 	install -d ${D}${sysconfdir}/network/if-post-down.d/
 	install -d ${D}${sysconfdir}/network/if-down.d/
-	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
+	install -m 755 ${UNPACKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
 	cd ${D}${sysconfdir}/network/ && \
 	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
 
@@ -78,7 +78,7 @@ do_install () {
 	fi
 
 	install -d ${D}/etc/default/volatiles
-	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
+	install -m 0644 ${UNPACKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 }
 
 pkg_postinst:wpa-supplicant () {
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bb b/meta-arago-extras/recipes-core/llvm/llvm-common.bb
index b69a5775..9668375e 100644
--- a/meta-arago-extras/recipes-core/llvm/llvm-common.bb
+++ b/meta-arago-extras/recipes-core/llvm/llvm-common.bb
@@ -9,12 +9,12 @@ SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_common_sysroot_preprocess"
 
 llvm_common_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 0755 ${UNPACKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
 do_install:class-native() {
     install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/llvm-config ${D}${bindir}
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
index df0b1440..a5c78ead 100644
--- a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://opkg-bash-completion"
 
 do_install() {
     install -d ${D}${datadir}/bash-completion/completions
-    install -m 0644 ${WORKDIR}/opkg-bash-completion \
+    install -m 0644 ${UNPACKDIR}/opkg-bash-completion \
                     ${D}${datadir}/bash-completion/completions/opkg
 }
 
diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
index 3bcd6c7f..98cbb699 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
@@ -38,7 +38,7 @@ do_install() {
     install -m 755 ${S}/Client/Build/ARM/Out/h265vdec_pp ${D}${bindir}
 
     install -d ${D}${datadir}/ti/examples/h265vdec
-    install -m 644 ${WORKDIR}/Testparams.cfg ${D}${datadir}/ti/examples/h265vdec
+    install -m 644 ${UNPACKDIR}/Testparams.cfg ${D}${datadir}/ti/examples/h265vdec
 
     install -d ${D}${docdir}/${PN}
     for doc in ${S}/Docs/*; do
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
index fcbc84ab..32496baf 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
@@ -18,9 +18,9 @@ PR = "r1"
 
 BRANCH = "master"
 SRC_URI  = "git://git.ti.com/git/apps/tensorflow-lite-examples.git;protocol=https;branch=${BRANCH} \
-            http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${WORKDIR}/model;destsuffix=model \
-            http://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenetv1;subdir=${WORKDIR}/model;destsuffix=model \
-            http://raw.githubusercontent.com/google-coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segmentation;subdir=${WORKDIR}/test_data;destsuffix=test_data"
+            http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${UNPACKDIR}/model;destsuffix=model \
+            http://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenetv1;subdir=${UNPACKDIR}/model;destsuffix=model \
+            http://raw.githubusercontent.com/google-coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segmentation;subdir=${UNPACKDIR}/test_data;destsuffix=test_data"
 
 SRC_URI[deeplabv3.md5sum] = "4a24db5a5fb05c47586a1197765e8548"
 SRC_URI[deeplabv3.sha256sum] = "68a539782c2c6a72f8aac3724600124a85ed977162b44e84cbae5db717c933c6"
@@ -55,9 +55,9 @@ do_install() {
     install -d ${D}${datadir}/tensorflow-lite/demos
     install -m 0755 ${S}/tflite_classification ${D}${datadir}/tensorflow-lite/demos
     install -m 0755 ${S}/tflite_segmentation ${D}${datadir}/tensorflow-lite/demos
-    install -m 0644 ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite ${D}${datadir}/tensorflow-lite/demos
-    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224.tflite ${D}${datadir}/tensorflow-lite/demos
-    install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp ${D}${datadir}/tensorflow-lite/demos
+    install -m 0644 ${UNPACKDIR}/model/deeplabv3_257_mv_gpu.tflite ${D}${datadir}/tensorflow-lite/demos
+    install -m 0644 ${UNPACKDIR}/model/mobilenet_v1_1.0_224.tflite ${D}${datadir}/tensorflow-lite/demos
+    install -m 0644 ${UNPACKDIR}/test_data/bird_segmentation.bmp ${D}${datadir}/tensorflow-lite/demos
     install -m 0755 ${S}/scripts/run*.sh ${D}${datadir}/tensorflow-lite/demos
 }
 
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
index e4a1ec85..979acbd9 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};rev=590d6eef
     git://github.com/google/farmhash;destsuffix=farmhash/;branch=master;rev=816a4ae622e964763ca0862d9dbd19324a1eaf45;protocol=https \
     git://github.com/google/flatbuffers;destsuffix=flatbuffers/;branch=master;rev=v1.11.0;protocol=https \
     https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
-    http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
+    http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${UNPACKDIR}/model;destsuffix=model \
     file://apply-modification-for-tflite-${PV}-to-eigen.patch \
     file://0001-Makefile-add-label_image-example-${PV}.patch \
     file://tflite-benchmark.sh \
@@ -57,14 +57,14 @@ do_cp_downloaded_build_deps() {
     mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
     mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
 
-    cp -rf ${WORKDIR}/eigen-eigen-8071cda5714d/* "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen"
-    cp -rf ${WORKDIR}/gemmlowp/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp/"
-    cp -rf ${WORKDIR}/googletest/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest/"
-    cp -rf ${WORKDIR}/abseil-cpp/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl/"
-    cp -rf ${WORKDIR}/farmhash/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash/"
-    cp -rf ${WORKDIR}/neon_2_sse/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse/"
-    cp -rf ${WORKDIR}/flatbuffers/* "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers/"
-    cp -rf ${WORKDIR}/fft/*         "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d"
+    cp -rf ${UNPACKDIR}/eigen-eigen-8071cda5714d/* "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen"
+    cp -rf ${UNPACKDIR}/gemmlowp/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp/"
+    cp -rf ${UNPACKDIR}/googletest/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest/"
+    cp -rf ${UNPACKDIR}/abseil-cpp/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl/"
+    cp -rf ${UNPACKDIR}/farmhash/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash/"
+    cp -rf ${UNPACKDIR}/neon_2_sse/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse/"
+    cp -rf ${UNPACKDIR}/flatbuffers/* "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers/"
+    cp -rf ${UNPACKDIR}/fft/*         "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d"
 }
 addtask do_cp_downloaded_build_deps after do_unpack before do_patch
 
@@ -114,7 +114,7 @@ do_install() {
     install -m 0644 ${S}/tensorflow/lite/kernels/internal/*.h ${D}${includedir}/tensorflow/lite/kernels/internal/
 
     install -d ${D}${libdir}/pkgconfig
-    install -m 0644 ${WORKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow-lite.pc
+    install -m 0644 ${UNPACKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow-lite.pc
     sed -i 's:@version@:${PV}:g
         s:@libdir@:${libdir}:g
         s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
@@ -125,9 +125,9 @@ do_install() {
     install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${BPN}/examples
     install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${BPN}/examples
     install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${BPN}/examples
-    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${BPN}/examples
+    install -m 0644 ${UNPACKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${BPN}/examples
     # install scripts for benchmarking
-    install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}${datadir}/${BPN}/examples
+    install -m 0755 ${UNPACKDIR}/tflite-benchmark.sh ${D}${datadir}/${BPN}/examples
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
index edd4d60d..7905aa00 100644
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
@@ -38,10 +38,10 @@ do_install:append () {
     install -d ${D}${sysconfdir}/netopeer2
     install -d ${D}${sysconfdir}/init.d
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -m 0755 ${WORKDIR}/netopeer2-server ${D}${sysconfdir}/init.d/
+        install -m 0755 ${UNPACKDIR}/netopeer2-server ${D}${sysconfdir}/init.d/
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/netopeer2-serverd.service ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/netopeer2-serverd.service ${D}${systemd_system_unitdir}
     fi
 }
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
index 4400df70..ae0e8a27 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
@@ -40,12 +40,12 @@ do_install:append () {
     install -o root -g root ${S}/modules/ietf-netconf.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf@2011-06-01.yang
     install -d ${D}${sysconfdir}/init.d
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -m 0775 ${WORKDIR}/sysrepo ${D}${sysconfdir}/init.d/
+        install -m 0775 ${UNPACKDIR}/sysrepo ${D}${sysconfdir}/init.d/
         install -d ${D}${libdir}/sysrepo/plugins
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/sysrepod.service ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/sysrepod.service ${D}${systemd_system_unitdir}
     fi
 }
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
index ec8355e0..5028f077 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
@@ -45,7 +45,7 @@ do_install () {
     install -d ${D}${datadir}/ti/examples/openvx
     install -m 644 ${S}/products.mak ${D}${datadir}/ti/examples/openvx
     install -m 644 ${S}/makefile ${D}${datadir}/ti/examples/openvx
-    install -m 644 ${WORKDIR}/setenv.sh ${D}${datadir}/ti/examples/openvx
+    install -m 644 ${UNPACKDIR}/setenv.sh ${D}${datadir}/ti/examples/openvx
     cp -r ${S}/host ${D}${datadir}/ti/examples/openvx
     cp -r ${S}/khronos_example  ${D}${datadir}/ti/examples/openvx
     cp -r ${S}/shared ${D}${datadir}/ti/examples/openvx
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
index 3a900e5f..c28efe24 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
@@ -34,7 +34,7 @@ do_install () {
     install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx
 #   Install the scripts for loading dsp firmware
     install -d ${D}${bindir}/
-    install -m 0755 ${WORKDIR}/reload-dsp-fw.sh ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/reload-dsp-fw.sh ${D}${bindir}
 }
 
 ALTERNATIVE:${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
-- 
2.17.1


