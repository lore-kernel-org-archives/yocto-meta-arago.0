Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C94AC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 23:27:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2372.1741822019801324120
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 16:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jNZNWp92;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CNQwKZ1160655
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 18:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741822018;
	bh=147Pnyet0Co03yEeBJm9RrW1nAO5xI/R9YlwD2w4Fp8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jNZNWp929DxK5xji8SoyllTbAD2RY8gOtxM8yZEaT89gSA/Ben3GH17FmLEhKf5X7
	 7XafUHlPb7g+rlDjtRtiGXjui9u/1B9NLPWwpAFL4VI+54apGGqzXNLeXVirI9ROFD
	 +a6mUIEbOU1Y0HXFAuI9BcDGxKA5Y6Uam++Tcv30=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CNQwDI054334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 18:26:58 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 18:26:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 18:26:57 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CNQteg023082;
	Wed, 12 Mar 2025 18:26:57 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <detheridge@ti.com>,
        <vijayp@ti.com>
Subject: [meta-arago][scarthgap][PATCH 2/2] weston-init: weston-init -> weston-init-arago
Date: Wed, 12 Mar 2025 18:26:29 -0500
Message-ID: <20250312232628.1260171-4-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312232628.1260171-2-rs@ti.com>
References: <20250312232628.1260171-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 23:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16014

From: Randolph Sapp <rs@ti.com>

Make a weston-init-arago package to replace weston-init and use the
emptty display manager. This is based around my initial RFC to oe-core.
This should only be necessary on scarthgap as I doubt any of the changes
proposed on that thread would be approved for a backport.

This also addresses the current issue of with weston occasionally
starting before all the required devices are registered with the drm
subsystem.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf      |  3 +-
 meta-arago-distro/conf/layer.conf             |  4 +-
 .../packagegroup-arago-tisdk-graphics.bb      |  2 +-
 .../wayland/weston-init-arago.bb              | 72 +++++++++++++++++
 .../beaglebone/weston.ini                     |  0
 .../wayland/weston-init-arago/emptty.conf     | 77 +++++++++++++++++++
 .../weston-launch-calibrator.sh               |  0
 .../weston.ini                                |  0
 .../wayland/weston-init.bbappend              | 14 ----
 9 files changed, 154 insertions(+), 18 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
 rename meta-arago-distro/recipes-graphics/wayland/{weston-init => weston-init-arago}/beaglebone/weston.ini (100%)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
 rename meta-arago-distro/recipes-graphics/wayland/{weston-init => weston-init-arago}/weston-launch-calibrator.sh (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston-init => weston-init-arago}/weston.ini (100%)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 24d8b005..b536e5b1 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -69,7 +69,8 @@ PACKAGECONFIG:pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6",
 PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
 
 # Set this to empty string to prevent xwayland config from being added
-PACKAGECONFIG:pn-weston-init = ""
+PACKAGECONFIG:pn-weston-init-arago = ""
+PREFERRED_RPROVIDER_virtual-emptty-conf = "weston-init-arago"
 
 # Enable testing for opencl and vulkan with piglit
 PACKAGECONFIG:append:pn-piglit = " \
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 4a0e424d..8eb59e61 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -36,8 +36,8 @@ BBFILES_DYNAMIC += " \
 BB_DANGLINGAPPENDS_WARNONLY = "true"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-    weston-init->weston \
-    weston-init->kbd \
+    weston-init-arago->weston \
+    weston-init-arago->kbd \
 "
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index a82db154..4f2f00b9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 GFX_WAYLAND = "\
-    weston-init \
+    weston-init-arago \
     weston-examples \
 "
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
new file mode 100644
index 00000000..033c32f1
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
@@ -0,0 +1,72 @@
+SUMMARY = "Configuration files for the Weston Wayland compositor"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI:append = " \
+    file://weston.ini \
+    file://weston-launch-calibrator.sh \
+    file://emptty.conf \
+"
+
+S = "${WORKDIR}"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
+PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
+PACKAGECONFIG:append:qemuppc64 = " use-pixman"
+
+PACKAGECONFIG[xwayland] = ",,"
+PACKAGECONFIG[no-idle-timeout] = ",,"
+PACKAGECONFIG[use-pixman] = ",,"
+
+DEFAULTBACKEND ??= ""
+DEFAULTBACKEND:qemuall ?= "drm"
+
+do_install() {
+	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+	install -D -p -m0644 ${WORKDIR}/emptty.conf ${D}${sysconfdir}/emptty/conf
+
+	if [ -n "${DEFAULTBACKEND}" ]; then
+		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
+		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
+		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', d)}" = "yes" ]; then
+		sed -i -e "/^\[core\]/a use-pixman=true" ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
+
+	install -dm 755 -o weston -g weston ${D}/home/weston
+	install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
+}
+
+inherit useradd
+
+USERADD_PACKAGES = "${PN}"
+
+# rdepends on weston which depends on virtual/egl
+#
+require ${COREBASE}/meta/recipes-graphics/wayland/required-distro-features.inc
+
+RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)} emptty"
+
+FILES:${PN} += "\
+    ${sysconfdir}/xdg/weston/weston.ini \
+    ${sysconfdir}/emptty/conf \
+    /home/weston \
+    ${bindir}/weston-launch-calibrator \
+    "
+
+CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
+RPROVIDES:${PN}:append = " virtual-emptty-conf"
+RCONFLICTS:${PN} += "weston-init"
+
+USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,nopasswdlogin weston"
+GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r nopasswdlogin"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/beaglebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-init/beaglebone/weston.ini
rename to meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
new file mode 100644
index 00000000..7520bc0b
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
@@ -0,0 +1,77 @@
+# TTY, where emptty will start.
+TTY_NUMBER=7
+
+# Enables switching to defined TTY number.
+SWITCH_TTY=true
+
+# Enables printing of /etc/issue in daemon mode.
+PRINT_ISSUE=true
+
+# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-gen.sh.
+PRINT_MOTD=true
+
+# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
+DEFAULT_USER=weston
+
+# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin group. Possible values are "true" or "false".
+AUTOLOGIN=true
+
+# The default session used, if Autologin is enabled. If session is not found in list of session, it proceeds to manual selection.
+AUTOLOGIN_SESSION=Weston
+
+# If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
+AUTOLOGIN_MAX_RETRY=0
+
+# Default LANG, if user does not have set own in init script.
+#LANG=en_US.UTF-8
+
+# Starts desktop with calling "dbus-launch".
+DBUS_LAUNCH=true
+
+# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
+XINITRC_LAUNCH=false
+
+# Prints available WM/DE each on new line instead of printing on single line.
+VERTICAL_SELECTION=false
+
+# Defines the way, how is logging handled. Possible values are "rotate", "appending" or "disabled".
+#LOGGING=rotate
+
+# Overrides path of log file
+#LOGGING_FILE=/var/log/emptty/[TTY_NUMBER].log
+
+# Arguments passed to Xorg server.
+#XORG_ARGS=
+
+# Allows to use dynamic motd script to generate custom MOTD.
+#DYNAMIC_MOTD=false
+
+# Allows to override default path to dynamic motd.
+#DYNAMIC_MOTD_PATH=/etc/emptty/motd-gen.sh
+
+# Allows to override default path to static motd.
+#MOTD_PATH=/etc/emptty/motd
+
+# Foreground color, available only in daemon mode.
+#FG_COLOR=LIGHT_BLACK
+
+# Background color, available only in daemon mode.
+#BG_COLOR=BLACK
+
+# Enables numlock in daemon mode. Possible values are "true" or "false".
+#ENABLE_NUMLOCK=false
+
+# Defines the way, how is logging of session errors handled. Possible values are "rotate", "appending" or "disabled".
+SESSION_ERROR_LOGGING=rotate
+
+# Overrides path of session errors log file
+#SESSION_ERROR_LOGGING_FILE=/var/log/emptty/session-errors.[TTY_NUMBER].log
+
+# If set true, it will not use `.emptty-xauth` file, but the standard `~/.Xauthority` file. This allows to handle xauth issues.
+#DEFAULT_XAUTHORITY=false
+
+#If set true, Xorg will be started as rootless, if system allows and emptty is running in daemon mode.
+#ROOTLESS_XORG=false
+
+#If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
+IDENTIFY_ENVS=false
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-launch-calibrator.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-init/weston-launch-calibrator.sh
rename to meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
rename to meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
deleted file mode 100644
index 4d5db58c..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-PR:append = ".arago12"
-
-SRC_URI:append = " \
-    file://weston.ini \
-    file://weston-launch-calibrator.sh \
-"
-
-do_install:append() {
-    install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
-}
-
-FILES:${PN}:append = "${bindir}/weston-launch-calibrator"
-- 
2.48.1


