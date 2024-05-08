Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42662C19F4F
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 16:01:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.665.1715184071077330232
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 May 2024 09:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=byCi7i6+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448G18xc078491;
	Wed, 8 May 2024 11:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715184068;
	bh=e9S0fFexb7G8Zt5dW2wOJk9sa1+E7JmMwGJW07giakE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=byCi7i6+E/C16wV0HQhY3K3QQjKBw5jlMUvoQ7sV7t4rTrjrQqLo1tpV9LacKrDEb
	 D/3s1BsrrNBen1BvAwMTIBsnx9+ZTeKKnOzogZJFFPDVEBWDsdC8tcpwWP4D+NNkwu
	 FuMxYaODFhudBraC/9jIYHYsyXH06v+4agSYuEPs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448G18lj002038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 May 2024 11:01:08 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 11:01:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 11:01:08 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 448G18ZN032460;
	Wed, 8 May 2024 11:01:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s4jj9-0004Tb-Uh; Wed, 08 May 2024 11:01:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 2/2] recipes: Update S = WORKDIR recipes to use ${S} correctly
Date: Wed, 8 May 2024 11:01:07 -0500
Message-ID: <20240508160107.17164-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508160107.17164-1-reatmon@ti.com>
References: <20240508160107.17164-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 May 2024 16:01:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15332

This is a corresponding patch to match one from Richard Purdie in
oe-core. [1]

Where recipes use S = ${WORKDIR}, ensure they are referencing ${S} correctly
to access files as soon we want to stop doing this in WORKDIR at which point
they would break unless corrected.

[1] https://git.openembedded.org/openembedded-core/commit/?id=f25dd633fffe6560f191526d1869e657e129bad9

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: After reviewing what all was being changed, I decided to make
smaller changes for this patch series while the whole UNPACKDIR
change is worked out upstream.

 .../recipes-core/matrix/matrix-lighttpd-config.bb             | 2 +-
 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb   | 2 +-
 .../recipes-core/arago-gpl-notice/arago-gpl-notice.bb         | 2 +-
 meta-arago-distro/recipes-core/thermal-init/thermal-init.bb   | 2 +-
 meta-arago-distro/recipes-core/udev/eudev_%.bbappend          | 4 ++--
 meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb           | 4 ++--
 .../recipes-support/strongswan/strongswan_%.bbappend          | 2 +-
 meta-arago-extras/recipes-core/llvm/llvm-common.bb            | 4 ++--
 .../recipes-devtools/opkg/opkg-bash-completion.bb             | 2 +-
 .../recipes-graphics/tslib/ts-calibrate-init_1.0.bb           | 2 +-
 .../recipes-sysrepo/nw-configurator/nw-configurator.bb        | 2 +-
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
index 314f1510..68e5b578 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://COPYING"
 
 do_install() {
 	install -d ${D}${sysconfdir}/lighttpd
-	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
+	install -m 0644 ${S}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
 }
 
 FILES:${PN} = "${sysconfdir}/lighttpd/lighttpd.conf.matrix"
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
index b6575118..ac056dac 100644
--- a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
@@ -14,5 +14,5 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 do_install:append () {
     # install systemd unit files
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/telnetd.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${S}/telnetd.service ${D}${systemd_system_unitdir}
 }
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index 885123b4..a130f9cb 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -22,7 +22,7 @@ do_install(){
 		install -d ${D}${bindir}
 		install -d ${D}${systemd_system_unitdir}
 		install -m 0755 ${S}/print-gplv3-packages.sh ${D}${bindir}/gplv3-notice
-		install -m 0644 ${WORKDIR}/gplv3-notice.service ${D}${systemd_system_unitdir}
+		install -m 0644 ${S}/gplv3-notice.service ${D}${systemd_system_unitdir}
 	fi
 }
 
diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
index 56f1ba1a..edd67a65 100644
--- a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
+++ b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
@@ -13,7 +13,7 @@ inherit update-rc.d
 
 do_install() {
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+    install -m 0755 ${S}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
 FILES:${PN} = "${sysconfdir} ${bindir}"
diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
index 4817e840..967fc882 100644
--- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
+++ b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
@@ -16,7 +16,7 @@ SRC_URI:append = " \
 do_install:append() {
     install -d ${D}/${bindir}
 
-    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
-    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
+    install -m 0755 ${S}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
+    install -m 0755 ${S}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
     ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
 }
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
index 63894c47..3fe1b310 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
@@ -12,9 +12,9 @@ SRC_URI = "file://qt_env.sh \
 # Add custom Arago qtbase Environment script and eglfs_kms configuration file
 do_install () {
     install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
+    install -m 0644 ${S}/qt_env.sh ${D}${sysconfdir}/profile.d/
     install -d ${D}${sysconfdir}/qt5
-    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
+    install -m 0644 ${S}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
 }
 
 FILES:${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
index ae313c74..d1236a8f 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -14,5 +14,5 @@ EXTRA_OECONF += " \
 SRC_URI += "file://pkcs11_plugin.conf"
 
 do_install:append () {
-	install -m 0644 ${WORKDIR}/pkcs11_plugin.conf ${D}${sysconfdir}/strongswan.d/
+	install -m 0644 ${S}/pkcs11_plugin.conf ${D}${sysconfdir}/strongswan.d/
 }
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bb b/meta-arago-extras/recipes-core/llvm/llvm-common.bb
index b69a5775..23d2feaf 100644
--- a/meta-arago-extras/recipes-core/llvm/llvm-common.bb
+++ b/meta-arago-extras/recipes-core/llvm/llvm-common.bb
@@ -9,12 +9,12 @@ SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_common_sysroot_preprocess"
 
 llvm_common_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 0755 ${S}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
 do_install:class-native() {
     install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
+    install -m 0755 ${S}/llvm-config ${D}${bindir}
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
index df0b1440..017c30f0 100644
--- a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://opkg-bash-completion"
 
 do_install() {
     install -d ${D}${datadir}/bash-completion/completions
-    install -m 0644 ${WORKDIR}/opkg-bash-completion \
+    install -m 0644 ${S}/opkg-bash-completion \
                     ${D}${datadir}/bash-completion/completions/opkg
 }
 
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index fe30919f..7ce58d87 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -24,5 +24,5 @@ do_install(){
 	# Install the init script
 	# TODO: replace init script with systemd files
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ts-calibrate
+	install -m 0755 ${S}/init ${D}${sysconfdir}/init.d/ts-calibrate
 }
diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
index 13f07750..dbe05681 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
@@ -12,7 +12,7 @@ DEPENDS = "sysrepo"
 inherit autotools pkgconfig
 
 do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${WORKDIR}/nw-configurator.c -o nw-configurator -lsysrepo
+	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${S}/nw-configurator.c -o nw-configurator -lsysrepo
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


