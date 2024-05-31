Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF19C27C50
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:45:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.22641.1717184735725124532
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QZQwJ04H;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjYWK111633;
	Fri, 31 May 2024 14:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184734;
	bh=atXxHrfD2JYGGx5mpMCrH6Gol1lCBO6q4W4s+5LwEck=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QZQwJ04HLtYgb4zIAPyW6jCYWVW8KfE4MArLzbwC9Rj0907zvnHIjIXULMyksTDjD
	 CzPrFB/T828Ae4uPUeXtvlHM13qawnIAFO1Vp97ZOa4RrLaL3LVpOo6UOOMC2W367f
	 3Kb6z6rh5JFHmPYWDHTZ2qT8KQB0MjD8bvUTIfUQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJjYis039345
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:45:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:45:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:45:34 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjYGo033169;
	Fri, 31 May 2024 14:45:34 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sD8By-0006Eg-6O; Fri, 31 May 2024 14:45:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3 1/3] recipes: Update to UNPACKDIR for files going into WORKDIR
Date: Fri, 31 May 2024 14:45:31 -0500
Message-ID: <20240531194533.23925-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531194533.23925-1-reatmon@ti.com>
References: <20240531194533.23925-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 May 2024 19:45:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15345

For recipes that have file:// in SRC_URI, the files are placed into
WORKDIR.  Moving forward [1], that directory will be UNPACKDIR and
eventually move to somewhere other than WORKDIR.  So update all
references to WORKDIR that are looking for these file to use UNPACKDIR
instead.

[1] https://git.openembedded.org/openembedded-core/commit/?id=e022d62ba917790af2121da57646271ef17c03fa

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/matrix/matrix-gui_2.0.bb     | 14 +++++-----
 .../recipes-core/psplash/psplash_git.bbappend |  2 +-
 .../recipes-core/systemd/systemd_%.bbappend   | 26 +++++++++----------
 .../recipes-core/thermal-init/thermal-init.bb |  2 +-
 .../recipes-core/udev/eudev_%.bbappend        |  4 +--
 .../recipes-qt/qt5/qtbase-conf_1.0.bb         |  4 +--
 .../recipes-qt/qt5/qtbase_%.bbappend          |  2 +-
 .../strongswan/strongswan_%.bbappend          |  2 +-
 .../recipes-core/llvm/llvm-common.bb          |  4 +--
 .../opkg/opkg-bash-completion.bb              |  2 +-
 .../netopeer2-server/netopeer2-server_git.bb  |  4 +--
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    |  4 +--
 12 files changed, 35 insertions(+), 35 deletions(-)

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
index 8ae8110b..b1205b5a 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -26,7 +26,7 @@ SRC_URI += "\
 python do_patch:append() {
     import shutil
 
-    work_dir = d.getVar("WORKDIR")
+    work_dir = d.getVar("UNPACKDIR")
     s = d.getVar("S")
 
     if not bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d):
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
-- 
2.17.1


