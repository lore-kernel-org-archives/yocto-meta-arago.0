Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D71C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:03:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.19630.1714493021557372129
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EPTub/sX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43UG3cXg083188;
	Tue, 30 Apr 2024 11:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714493018;
	bh=XsyzKeW/okrBT7MWvgM5H6Vj0/LT1pdMYpdP8GId3DY=;
	h=From:To:CC:Subject:Date;
	b=EPTub/sX/d6tEAz/w53vAKUsys1aePkVsNrmvGQKUDbBQN9ghjpwPj7EkMFrwhDbm
	 WIv/q4awtsaxAYUx3hKCtgAMUjqBiTwctxBzlz+dIWI29mVIpJJjL8szj+jolgomIT
	 JrWYm2m1tsrGhyiQCvk4pyHVXGzNfeihrcPdF0Ic=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43UG3cTA008342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 11:03:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 11:03:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 11:03:37 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43UG3bvM056970;
	Tue, 30 Apr 2024 11:03:37 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>,
        <detheridge@ti.com>
Subject: [meta-arago][master][PATCH] all: purge matrix ui and all dependent packages
Date: Tue, 30 Apr 2024 11:03:03 -0500
Message-ID: <20240430160302.3350718-2-rs@ti.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:03:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15314

From: Randolph Sapp <rs@ti.com>

Purge the old Matrix UI. This thing was cool but it required modifying
too many other packages, does not have a dedicated maintainer, and
relied on deprecated components.

There have been 2 replacements for this tool that have cropped up in the
last year alone. Surely one of those is suitable for the task now. If
not, now there is proper motivation.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-demos/conf/layer.conf              |   12 -
 .../image-gallery/image-gallery_git.bb        |   31 -
 ...th-QtWidgets-per-Qt5-migration-guide.patch |  232 ---
 ...i-toAscii-with-fromLatin1-toLatin1-p.patch |   71 -
 .../thermostat-demo/qt-tstat_2.0.bb           |   38 -
 .../matrix/matrix-gui-3d-demos_2.0.bb         |   47 -
 .../matrix/matrix-gui-analytics-demos_2.0.bb  |   26 -
 .../matrix/matrix-gui-apps-git.inc            |   14 -
 .../matrix/matrix-gui-apps-images_2.0.bb      |   16 -
 .../recipes-core/matrix/matrix-gui-apps.inc   |   43 -
 .../matrix-gui-armbenchmarks-demos_2.0.bb     |   17 -
 .../matrix/matrix-gui-browser-demos_2.0.bb    |   15 -
 .../matrix/matrix-gui-browser_2.0.bb          |   23 -
 .../matrix/matrix-gui-camera-loopback_2.0.bb  |   12 -
 .../matrix/matrix-gui-clocks_2.0.bb           |   26 -
 .../matrix/matrix-gui-crypto-demos_2.0.bb     |   14 -
 .../matrix/matrix-gui-display-control_2.0.bb  |   14 -
 .../udhcpd_eth1.conf                          |  128 --
 .../matrix/matrix-gui-ethernet-demos_2.0.bb   |   30 -
 .../matrix/matrix-gui-generic-pm_2.0.bb       |   16 -
 .../matrix/matrix-gui-helper-scripts.bb       |   16 -
 .../matrix/matrix-gui-hmi-demos_2.0.bb        |   46 -
 .../matrix-gui-machinevision-demos_2.0.bb     |   58 -
 .../matrix/matrix-gui-mc-demos_2.0.bb         |   27 -
 .../matrix/matrix-gui-multimedia-demos_2.0.bb |   70 -
 .../matrix/matrix-gui-opencl-demos_2.0.bb     |   36 -
 .../matrix/matrix-gui-oprofile-demos_2.0.bb   |   14 -
 .../recipes-core/matrix/matrix-gui-paths.inc  |    3 -
 .../matrix/matrix-gui-pm-demos_2.0.bb         |   35 -
 .../matrix/matrix-gui-pru-demos_2.0.bb        |   14 -
 .../matrix/matrix-gui-qt4-demos_2.0.bb        |   14 -
 .../matrix/matrix-gui-qt5-demos_2.0.bb        |   33 -
 .../matrix/matrix-gui-settings-demos_2.0.bb   |   23 -
 .../matrix/matrix-gui-submenus_2.0.bb         |  106 --
 .../matrix/matrix-gui-tidl-demos_2.0.bb       |   96 --
 .../matrix/matrix-gui-touch-demos_2.0.bb      |   14 -
 .../matrix/matrix-gui-usb-demos_2.0.bb        |   14 -
 .../matrix/matrix-gui-utility-demos_2.0.bb    |   31 -
 .../matrix/matrix-gui-v4l2-demos_2.0.bb       |   14 -
 .../matrix-gui-video-analytics-demos_2.0.bb   |   28 -
 .../matrix/matrix-gui-wifi-demos_2.0.bb       |   14 -
 ...-Stop-matrix-when-running-a-GUI-demo.patch |   84 --
 ...-workaround-for-GUI-apps-with-weston.patch |  126 --
 .../recipes-core/matrix/matrix-gui/init       |   49 -
 .../recipes-core/matrix/matrix-gui/init.eglfs |   60 -
 .../matrix/matrix-gui/matrix-gui-2.0.service  |   18 -
 .../recipes-core/matrix/matrix-gui/php.ini    | 1342 -----------------
 .../recipes-core/matrix/matrix-gui_2.0.bb     |   69 -
 .../matrix/matrix-lighttpd-config.bb          |   32 -
 .../matrix/matrix-lighttpd-config/COPYING     |   31 -
 .../lighttpd.conf.matrix                      |  344 -----
 .../recipes-core/matrix/refresh-screen_2.0.bb |   20 -
 .../images/tisdk-default-image.bb             |    2 -
 .../packagegroup-arago-tisdk-matrix.bb        |  197 ---
 .../packagegroup-arago-tisdk-qte.bb           |    1 -
 .../recipes-core/packagegroups/ti-world.bb    |    2 -
 ...-native-Fix-host-contamination-issue.patch |   55 -
 .../recipes-devtools/php/php_%.bbappend       |   29 -
 58 files changed, 3992 deletions(-)
 delete mode 100644 meta-arago-demos/recipes-apps/image-gallery/image-galle=
ry_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat/=
0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
 delete mode 100644 meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat/=
0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
 delete mode 100644 meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat_=
2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-3d-demo=
s_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-analyti=
cs-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-apps-gi=
t.inc
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-apps-im=
ages_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-apps.inc
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-armbenc=
hmarks-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-browser=
-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-browser=
_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-camera-=
loopback_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-clocks_=
2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-crypto-=
demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-display=
-control_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-etherne=
t-demos/udhcpd_eth1.conf
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-etherne=
t-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-generic=
-pm_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-helper-=
scripts.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-hmi-dem=
os_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-machine=
vision-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-mc-demo=
s_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-multime=
dia-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-opencl-=
demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-oprofil=
e-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-paths.i=
nc
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-pm-demo=
s_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-pru-dem=
os_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-qt4-dem=
os_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-qt5-dem=
os_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-setting=
s-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-submenu=
s_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-tidl-de=
mos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-touch-d=
emos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-usb-dem=
os_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-utility=
-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-v4l2-de=
mos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-video-a=
nalytics-demos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui-wifi-de=
mos_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui/0001-ex=
ecute_command-Stop-matrix-when-running-a-GUI-demo.patch
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui/0001-ex=
ecute_command-workaround-for-GUI-apps-with-weston.patch
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui/init
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui/init.eg=
lfs
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-=
gui-2.0.service
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui/php.ini
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-lighttpd-co=
nfig.bb
 delete mode 100644 meta-arago-demos/recipes-core/matrix/matrix-lighttpd-co=
nfig/COPYING
 delete mode 100755 meta-arago-demos/recipes-core/matrix/matrix-lighttpd-co=
nfig/lighttpd.conf.matrix
 delete mode 100644 meta-arago-demos/recipes-core/matrix/refresh-screen_2.0=
.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-matrix.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/php/php/0001-php-nat=
ive-Fix-host-contamination-issue.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/php/php_%.bbappend

diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/layer=
.conf
index 9c7f92db..cb18f840 100644
--- a/meta-arago-demos/conf/layer.conf
+++ b/meta-arago-demos/conf/layer.conf
@@ -21,18 +21,6 @@ LAYERDEPENDS_meta-arago-demos =3D " \
     qt5-layer \
 "
=20
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
-    matrix-gui-multimedia-demos->amsdk-av-files \
-    matrix-gui-oprofile-demos->oprofile \
-    matrix-gui-oprofile-demos->oprofile-example \
-    matrix-gui-usb-demos->bonnie++ \
-    matrix-gui-armbenchmarks-demos->arm-benchmarks \
-    matrix-gui-armbenchmarks-demos->lmbench \
-    matrix-gui-armbenchmarks-demos->nbench-byte \
-    matrix-gui-machinevision-demos->point-cloud-viewer \
-    matrix-lighttpd-config->lighttpd \
-"
-
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
     gstreamer1.0-plugins-bad \
 "
diff --git a/meta-arago-demos/recipes-apps/image-gallery/image-gallery_git.=
bb b/meta-arago-demos/recipes-apps/image-gallery/image-gallery_git.bb
deleted file mode 100644
index 1a6737cf..00000000
--- a/meta-arago-demos/recipes-apps/image-gallery/image-gallery_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION =3D "Image Gallery"
-HOMEPAGE =3D "https://gitorious.org/image-gallery"
-SECTION =3D "multimedia"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9c57cc1cdee589f97cbba69e95a89a1=
5"
-
-require recipes-core/matrix/matrix-gui-paths.inc
-
-inherit qt5
-
-PR =3D "r5"
-
-BRANCH =3D "master"
-SRCREV =3D "d9a2f2e27f59f3bbcde91efc6afba8cd04f3b4be"
-
-SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/image-gallery.git;protocol=
=3Dhttps;branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${B}/image-gallery ${D}/${bindir}/image-gallery
-	install -d ${D}${MATRIX_APP_DIR}/qt-image-gallery
-	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-gallery
-}
-
-PACKAGES +=3D "matrix-gui-apps-image-gallery"
-
-RDEPENDS:matrix-gui-apps-image-gallery  =3D "matrix-gui-apps-images matrix=
-gui-submenus-camera ${PN}"
-
-FILES:matrix-gui-apps-image-gallery +=3D "${MATRIX_APP_DIR}/*"
diff --git a/meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat/0002-Re=
place-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch b/meta-arago-demos=
/recipes-apps/thermostat-demo/qt-tstat/0002-Replace-QtGui-with-QtWidgets-pe=
r-Qt5-migration-guide.patch
deleted file mode 100644
index d9bbba93..00000000
--- a/meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat/0002-Replace-Q=
tGui-with-QtWidgets-per-Qt5-migration-guide.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-From 90f70d188b5893fd86aab4f90ac96c9a69ae4e88 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 14 Oct 2013 18:35:30 -0400
-Subject: [PATCH] Replace QtGui with QtWidgets per Qt5 migration guide
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- awayscreen.h          | 2 +-
- keyboard/keyboard.cpp | 2 +-
- keyboard/keyboard.h   | 2 +-
- main.cpp              | 2 +-
- mainwindow.cpp        | 2 +-
- mainwindow.h          | 2 +-
- optionswidget.h       | 2 +-
- schedulepoint.cpp     | 2 +-
- schedulepoint.h       | 2 +-
- schedulescreen.h      | 2 +-
- settingscreen.cpp     | 2 +-
- settingscreen.h       | 2 +-
- thermostatdemo.h      | 2 +-
- thermostatwidget.h    | 2 +-
- weatherdatawidget.cpp | 2 +-
- weatherwidget.h       | 2 +-
- 16 files changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/awayscreen.h b/awayscreen.h
-index 2a2b040..b8827b9 100644
---- a/awayscreen.h
-+++ b/awayscreen.h
-@@ -1,7 +1,7 @@
- #ifndef AWAYSCREEN_H
- #define AWAYSCREEN_H
-=20
--#include <QtGui>
-+#include <QtWidgets>
-=20
- class GlobalSettings;
-=20
-diff --git a/keyboard/keyboard.cpp b/keyboard/keyboard.cpp
-index 9261031..0d14530 100644
---- a/keyboard/keyboard.cpp
-+++ b/keyboard/keyboard.cpp
-@@ -37,7 +37,7 @@
-=20
- #include "keyboard.h"
- #include "ui_keyboard.h"
--#include <QtGui>
-+#include <QtWidgets>
-=20
- Keyboard::Keyboard(QWidget *parent) :
-     QWidget(parent),
-diff --git a/keyboard/keyboard.h b/keyboard/keyboard.h
-index 2d5c584..960915c 100644
---- a/keyboard/keyboard.h
-+++ b/keyboard/keyboard.h
-@@ -2,7 +2,7 @@
- #define KEYBOARD_H
-=20
- #include <QWidget>
--#include <QtGui>
-+#include <QtWidgets>
- namespace Ui {
- class Keyboard;
- }
-diff --git a/main.cpp b/main.cpp
-index 18234c9..8e0df39 100644
---- a/main.cpp
-+++ b/main.cpp
-@@ -1,4 +1,4 @@
--#include <QtGui>=0D
-+#include <QtWidgets>=0D
- =0D
- #include "mainwindow.h"=0D
- #include "weatherwidget.h"=0D
-diff --git a/mainwindow.cpp b/mainwindow.cpp
-index b3f8994..d8a0a57 100644
---- a/mainwindow.cpp
-+++ b/mainwindow.cpp
-@@ -9,7 +9,7 @@
- #include "weatherdata.h"=0D
- #include "utilities.h"=0D
- =0D
--#include <QtGui>=0D
-+#include <QtWidgets>=0D
- =0D
- #include <QtDebug>=0D
- =0D
-diff --git a/mainwindow.h b/mainwindow.h
-index f59d992..1d46fba 100644
---- a/mainwindow.h
-+++ b/mainwindow.h
-@@ -1,7 +1,7 @@
- #ifndef MAINWINDOW_H=0D
- #define MAINWINDOW_H=0D
- =0D
--#include <QtGui>=0D
-+#include <QtWidgets>=0D
- #include "webdata.h"=0D
- =0D
- =0D
-diff --git a/optionswidget.h b/optionswidget.h
-index b321280..c797ac2 100644
---- a/optionswidget.h
-+++ b/optionswidget.h
-@@ -1,7 +1,7 @@
- #ifndef OPTIONSWIDGET_H=0D
- #define OPTIONSWIDGET_H=0D
- =0D
--#include <QtGui>=0D
-+#include <QtWidgets>=0D
- #include "awayscreen.h"=0D
- #include "schedulescreen.h"=0D
- #include "settingscreen.h"=0D
-diff --git a/schedulepoint.cpp b/schedulepoint.cpp
-index cdaba40..99c7b18 100644
---- a/schedulepoint.cpp
-+++ b/schedulepoint.cpp
-@@ -4,7 +4,7 @@
- #include "globalsettings.h"=0D
- #include "utilities.h"=0D
- =0D
--#include <QtGui>=0D
-+#include <QtWidgets>=0D
- =0D
- =0D
- #define MAXTEMP 100=0D
-diff --git a/schedulepoint.h b/schedulepoint.h
-index 1f6d662..38d6acd 100644
---- a/schedulepoint.h
-+++ b/schedulepoint.h
-@@ -1,7 +1,7 @@
- #ifndef SCHEDULEPOINT_H=0D
- #define SCHEDULEPOINT_H=0D
- =0D
--#include <QtGui>=0D
-+#include <QtWidgets>=0D
- #include <QApplication>=0D
- #include <QColor>=0D
- #include <QGraphicsItem>=0D
-diff --git a/schedulescreen.h b/schedulescreen.h
-index 9bc0897..c424a3f 100644
---- a/schedulescreen.h
-+++ b/schedulescreen.h
-@@ -1,7 +1,7 @@
- #ifndef SCHEDULESCREEN_H
- #define SCHEDULESCREEN_H
-=20
--#include <QtGui>
-+#include <QtWidgets>
- #include "schedulepoint.h"
-=20
- class GlobalSettings;
-diff --git a/settingscreen.cpp b/settingscreen.cpp
-index 2f19ae4..62b73b1 100644
---- a/settingscreen.cpp
-+++ b/settingscreen.cpp
-@@ -4,7 +4,7 @@
- #include "qkeyboardlineedit.h"
- #include "webdataengine/openweathermapdataengine.h"
-=20
--#include <QtGui>
-+#include <QtWidgets>
-=20
- #define MAXIMUM_CONTENT_HEIGHT 450
- #define MAXIMUM_CONTENT_WIDTH 800
-diff --git a/settingscreen.h b/settingscreen.h
-index 4edf175..172dbe2 100644
---- a/settingscreen.h
-+++ b/settingscreen.h
-@@ -1,7 +1,7 @@
- #ifndef SETTINGSCREEN_H
- #define SETTINGSCREEN_H
-=20
--#include <QtGui>
-+#include <QtWidgets>
-=20
- class GlobalSettings;
- class QKeyboardLineEdit;
-diff --git a/thermostatdemo.h b/thermostatdemo.h
-index 7223f0a..ca7b27e 100644
---- a/thermostatdemo.h
-+++ b/thermostatdemo.h
-@@ -1,7 +1,7 @@
- #ifndef THERMOSTATDEMO_H=0D
- #define THERMOSTATDEMO_H=0D
- =0D
--#include <QtGui/QMainWindow>=0D
-+#include <QtWidgets/QMainWindow>=0D
- =0D
- class ThermostatDemo : public QMainWindow=0D
- {=0D
-diff --git a/thermostatwidget.h b/thermostatwidget.h
-index ba8199b..bbe97ef 100644
---- a/thermostatwidget.h
-+++ b/thermostatwidget.h
-@@ -1,7 +1,7 @@
- #ifndef THERMOSTATWIDGET_H=0D
- #define THERMOSTATWIDGET_H=0D
- =0D
--#include <QtGui>=0D
-+#include <QtWidgets>=0D
- =0D
- class GlobalSettings;=0D
- =0D
-diff --git a/weatherdatawidget.cpp b/weatherdatawidget.cpp
-index 33e8185..20e8fe8 100644
---- a/weatherdatawidget.cpp
-+++ b/weatherdatawidget.cpp
-@@ -1,6 +1,6 @@
- #include "weatherdatawidget.h"
-=20
--#include <QtGui>
-+#include <QtWidgets>
- #include "globalsettings.h"
- #include "weatherdata.h"
- #include "utilities.h"
-diff --git a/weatherwidget.h b/weatherwidget.h
-index bffb368..40a7916 100644
---- a/weatherwidget.h
-+++ b/weatherwidget.h
-@@ -1,7 +1,7 @@
- #ifndef WEATHERWIDGET_H=0D
- #define WEATHERWIDGET_H=0D
- =0D
--#include <QtGui>=0D
-+#include <QtWidgets>=0D
- =0D
- #include <QtSvg/QSvgWidget>=0D
- =0D
---=20
-1.8.3.2
-
diff --git a/meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat/0003-Re=
place-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch b/meta-arago-demos=
/recipes-apps/thermostat-demo/qt-tstat/0003-Replace-fromAscii-toAscii-with-=
fromLatin1-toLatin1-p.patch
deleted file mode 100644
index 28d2bee5..00000000
--- a/meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat/0003-Replace-f=
romAscii-toAscii-with-fromLatin1-toLatin1-p.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 3be273cead085ac9cf45bc59236f6d6ef18dc349 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 14 Oct 2013 18:39:27 -0400
-Subject: [PATCH] Replace fromAscii()/toAscii() with fromLatin1()/toLatin1()
- per Qt5 migration guide
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- remoteaccessmanager.cpp                    | 10 +++++-----
- webdataengine/openweathermapdataengine.cpp |  2 +-
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/remoteaccessmanager.cpp b/remoteaccessmanager.cpp
-index 5eebdef..5a6c547 100644
---- a/remoteaccessmanager.cpp
-+++ b/remoteaccessmanager.cpp
-@@ -103,7 +103,7 @@ void RemoteAccessManager::processIncomingConnection()
-         }
-         else if(requestParser[1].contains(".jpg") || requestParser[1].con=
tains(".png"))
-         {
--            QFile imageFile(":"+QString::fromAscii(requestParser[1]));
-+            QFile imageFile(":"+QString::fromLatin1(requestParser[1]));
-=20
-             if(!imageFile.open(QFile::ReadOnly))
-                 ba =3D "HTTP/1.1 404 NOT FOUND";
-@@ -119,7 +119,7 @@ void RemoteAccessManager::processIncomingConnection()
-         }
-         else if(requestParser[1].contains(".js"))
-         {
--            QFile jsFile(":"+QString::fromAscii(requestParser[1]));
-+            QFile jsFile(":"+QString::fromLatin1(requestParser[1]));
-=20
-             if(!jsFile.open(QFile::ReadOnly))
-                 ba =3D "HTTP/1.1 404 NOT FOUND";
-@@ -135,7 +135,7 @@ void RemoteAccessManager::processIncomingConnection()
-         }
-         else if(requestParser[1].contains(".css"))
-         {
--            QFile cssFile(":"+QString::fromAscii(requestParser[1]));
-+            QFile cssFile(":"+QString::fromLatin1(requestParser[1]));
-=20
-             if(!cssFile.open(QFile::ReadOnly))
-                 ba =3D "HTTP/1.1 404 NOT FOUND";
-@@ -213,9 +213,9 @@ QByteArray RemoteAccessManager::hashToJSONByteArray(QH=
ash<QString, QVariant> has
-     {
-         it.next();
-         if(it.value().type() =3D=3D QVariant::Hash)
--            jsonByteArray+=3D"\""+it.key().toAscii()+"\""+QByteArray::fro=
mRawData(":",1)+""+hashToJSONByteArray(it.value().toHash())+",";
-+            jsonByteArray+=3D"\""+it.key().toLatin1()+"\""+QByteArray::fr=
omRawData(":",1)+""+hashToJSONByteArray(it.value().toHash())+",";
-         else
--            jsonByteArray +=3D "\""+it.key().toAscii()+"\""+QByteArray::f=
romRawData(":",1)+"\""+it.value().toByteArray()+"\""+QByteArray::fromRawDat=
a(",",1);
-+            jsonByteArray +=3D "\""+it.key().toLatin1()+"\""+QByteArray::=
fromRawData(":",1)+"\""+it.value().toByteArray()+"\""+QByteArray::fromRawDa=
ta(",",1);
-     }
-=20
-     jsonByteArray =3D jsonByteArray.left(jsonByteArray.size()-1);
-diff --git a/webdataengine/openweathermapdataengine.cpp b/webdataengine/op=
enweathermapdataengine.cpp
-index 0286dd5..de39f48 100644
---- a/webdataengine/openweathermapdataengine.cpp
-+++ b/webdataengine/openweathermapdataengine.cpp
-@@ -67,7 +67,7 @@ void OpenWeatherMapDataEngine::responseReceived()
-         QByteArray data =3D m_reply->readAll();
-         //qDebug() << data;
-=20
--        m_cityId =3D parseCityInformation(QString::fromAscii(data));
-+        m_cityId =3D parseCityInformation(QString::fromLatin1(data));
-         //docs say do not delete in the slot so well pass it off to the e=
vent loop
-         m_reply->deleteLater();
-         if(m_cityId =3D=3D -1)
---=20
-1.8.3.2
-
diff --git a/meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat_2.0.bb =
b/meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
deleted file mode 100644
index 29aa689d..00000000
--- a/meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION =3D "Qt Thermostat Demo"
-HOMEPAGE =3D "https://gitorious.org/thermostat-demo"
-
-LICENSE =3D "BSD-3-Clause & CC-BY-SA-2.0 & CC-BY-SA-3.0 & MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D93a105adb99011afa5baee932b56071=
4 \
-                    file://IMAGE-LICENSE;md5=3Dfce98146123de13a189c234a5e4=
cfa0d \
-                    file://API-LICENSE;md5=3D5e32280d79a1eab76729c50d79ecf=
e72 \
-                    file://remote/MIT-LICENSE.txt;md5=3D6a24093faaae5d5c19=
8578c88e220071 \
-"
-
-require recipes-core/matrix/matrix-gui-paths.inc
-
-inherit qt5
-
-PR =3D "r10"
-
-DEPENDS +=3D "qtsvg qtscript"
-
-BRANCH ?=3D "master"
-SRCREV =3D "665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1"
-
-SRC_URI =3D "git://git.ti.com/git/apps/thermostat-demo.git;protocol=3Dhttp=
s;branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}/usr/bin
-	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
-	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
-	install ${S}/matrix-files/desc_thermostat_demo.html  ${D}${MATRIX_APP_DIR=
}/qt_tstat
-	install ${S}/matrix-files/thermostat_demo_qt5.desktop  ${D}${MATRIX_APP_D=
IR}/qt_tstat/thermostat_demo.desktop
-}
-
-PACKAGES +=3D "matrix-gui-thermostat-demo"
-
-RDEPENDS:matrix-gui-thermostat-demo +=3D "matrix-gui-apps-images matrix-gu=
i-submenus-qt5"
-
-FILES:matrix-gui-thermostat-demo +=3D "${MATRIX_APP_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-3d-demos_2.0.b=
b b/meta-arago-demos/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
deleted file mode 100644
index 5478db9f..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-DESCRIPTION =3D "3D demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.9"
-
-S =3D "${WORKDIR}/git/3d_apps"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# Make sure 3D submenu has been installed and app images has been installed
-
-# TODO: in the future we may want to consider putting this into the libgles
-#       recipe directly.  Requires broad acceptance of matrix v2 though due
-#       to the matrix-gui-submenus-3d dependency.  So if matrix v2 moves
-#       into the same layer as libgles this may be acceptable, or perhaps
-#       we can use an RRECOMMENDS instead.
-
-PACKAGES =3D " \
-            matrix-3d-demo-kmscube      \
-"
-
-PACKAGES:append:omap-a15 =3D " \
-            matrix-3d-demo-kmscubevideo \
-"
-
-MATRIX_3D_DEMO_SGX_QAF_PARAM =3D "1000"
-
-do_install:prepend() {
-    find ${S} -name '*.desktop' -exec sed -i {} \
-        -e "s|-qaf=3D[0-9]*|-qaf=3D${MATRIX_3D_DEMO_SGX_QAF_PARAM}|g" \;
-}
-
-3D_DEMOS_RDEPENDS_MATRIX =3D "matrix-gui-apps-images matrix-gui-submenus-3=
d"
-3D_DEMOS_RDEPENDS =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
-3D_DEMOS_RDEPENDS:omap-a15 =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
-3D_DEMOS_RDEPENDS:ti43x    =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
-3D_DEMOS_RDEPENDS:ti33x    =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
-3D_DEMOS_RDEPENDS:k3       =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
-
-RDEPENDS:matrix-3d-demo-kmscube       =3D "${3D_DEMOS_RDEPENDS_MATRIX} kms=
cube"
-#RDEPENDS:matrix-3d-demo-kmscubevideo  =3D "${3D_DEMOS_RDEPENDS_MATRIX} om=
apdrmtest"
-RDEPENDS:matrix-3d-demo-kmscubevideo  =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
-
-# Split the matrix files by 3d demos
-FILES:matrix-3d-demo-kmscube          =3D "${MATRIX_APP_DIR}/3d_kmscube/*"
-FILES:matrix-3d-demo-kmscubevideo     =3D "${MATRIX_APP_DIR}/3d_kmscubevid=
eo/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-analytics-demo=
s_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-analytics-demos_=
2.0.bb
deleted file mode 100644
index 9d7eb444..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "Analytics demo descriptions for Matrix v2"
-
-require recipes-core/matrix/matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/analytics_apps"
-
-# Make sure analytics submenu and app images has been installed
-ANALYTICSDEMO_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-an=
alytics"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-
-PACKAGES =3D "matrix-analytics-pdm-anomaly-detection \
-"
-
-RDEPENDS:matrix-analytics-pdm-anomaly-detection =3D " \
-    bash \
-    ${ANALYTICSDEMO_RDEPENDS} \
-    pdm-anomaly-detection \
-"
-
-FILES:matrix-analytics-pdm-anomaly-detection =3D "${MATRIX_APP_DIR}/analyt=
ics_pdm_anomaly_detection/*"
-FILES:matrix-analytics-pdm-anomaly-detection +=3D "${bindir}/runPdmAnomaly=
Detection.sh"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc b=
/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
deleted file mode 100644
index 8effcd1b..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE =3D "CC-BY-SA-3.0"
-#By default all Matrix v2 applications use the same license.
-LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
-LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
-
-SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2-apps.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "73853d99f1210591daacc668a72468c03440e25a"
-BRANCH =3D "master"
-INC_PR =3D "r78"
-
-# Pull in the base package for installing matrix applications
-require matrix-gui-apps.inc
-
-INSANE_SKIP:${PN} +=3D "installed-vs-shipped"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-images_2.=
0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
deleted file mode 100644
index b7c34896..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION =3D "Image package for Matrix GUI v2 Applications"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/images"
-
-do_install(){
-    install -d ${D}${MATRIX_APP_DIR}
-    cp -rf ${S}/ ${D}${MATRIX_APP_DIR}
-}
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps.inc b/met=
a-arago-demos/recipes-core/matrix/matrix-gui-apps.inc
deleted file mode 100644
index adb998e1..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps.inc
+++ /dev/null
@@ -1,43 +0,0 @@
-require matrix-gui-paths.inc
-
-MATRIX_FILES_DIR ?=3D "${S}"
-
-# Append a generic function to the do_install step that will look in the
-# MATRIX_FILES_DIR for .desktop files and then:
-#   1.  Install all non-script files into the MATRIX_APP_DIR
-#   2.  Install all script files into ${bindir}
-do_install:append(){
-    cd ${MATRIX_FILES_DIR}
-    applist=3D`find . -name "*.desktop"`
-
-    for app in $applist
-    do
-        appdir=3D`dirname $app`
-        install -d ${D}${MATRIX_APP_DIR}/$appdir
-
-        # Get the non-script files which are the matrix metadata
-        matrix_apps=3D`find $appdir -type f ! -name "*\.sh"`
-        for m in $matrix_apps
-        do
-            install -m 0644 ${MATRIX_FILES_DIR}/$m ${D}${MATRIX_APP_DIR}/$=
appdir/
-        done
-
-        # Put the script files as executables in ${bindir}
-        scripts=3D`find $appdir -type f -name "*\.sh"`
-        for s in $scripts
-        do
-            if [ ! -d ${D}/${bindir} ]
-            then
-                install -d ${D}${bindir}
-            fi
-            install -m 0755 ${MATRIX_FILES_DIR}/$s ${D}${bindir}/
-        done
-    done
-
-    # Go back to the directory we started from in case there are
-    # other appends.
-    cd -
-}
-
-RDEPENDS:${PN}-dev =3D ""
-RRECOMMENDS:${PN}-dev =3D ""
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-armbenchmarks-=
demos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-armbenchmark=
s-demos_2.0.bb
deleted file mode 100644
index b6885a73..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2=
.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION =3D "Arm Benchmarks Applications for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.8"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/arm_apps"
-
-# Make sure arm submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-arm"
-
-# Make sure the benchmarks have been installed
-RDEPENDS:${PN} +=3D "arm-benchmarks lmbench nbench-byte matrix-gui-helper-=
scripts"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-browser-demos_=
2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-browser-demos_2.0.=
bb
deleted file mode 100644
index edbdd49b..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "Various Demo Browsers for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/browser_apps"
-
-# Make sure browser submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-browser"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-FILES:${PN} +=3D "${bindir}/runGoogleChrome.sh"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-browser_2.0.bb=
 b/meta-arago-demos/recipes-core/matrix/matrix-gui-browser_2.0.bb
deleted file mode 100644
index 1d58363f..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION =3D "Simple Qt web display using webengine"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D75a=
9adc782a6df0d3a5419743e9a9f18"
-SECTION =3D "multimedia"
-
-inherit qt5
-
-DEPENDS +=3D "qtwebkit"
-
-PR =3D "r17"
-
-SRCREV =3D "78ad5db716d1abc4c05abfe435f066b6b88454d5"
-
-BRANCH ?=3D "master"
-
-SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/matrix_browser.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${B}/matrix_browser ${D}/${bindir}
-}
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-camera-loopbac=
k_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-camera-loopback_=
2.0.bb
deleted file mode 100644
index a020514b..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION =3D "Camera loopback application for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.1"
-
-S =3D "${WORKDIR}/git/cameraloopback_apps"
-
-# Make sure loopback application is compiled and app images has been insta=
lled
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images av-examples"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-clocks_2.0.bb =
b/meta-arago-demos/recipes-core/matrix/matrix-gui-clocks_2.0.bb
deleted file mode 100644
index 3a178cd7..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-clocks_2.0.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "Clock setting descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.4"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/clocks_apps"
-
-do_install:prepend(){
-   install -d ${D}${MATRIX_BASE_DIR}/html-apps/
-
-   cp -rf ${S}/set_frequency/power-set-frequency ${D}${MATRIX_BASE_DIR}/ht=
ml-apps/
-
-}
-
-do_install:append(){
-    rm ${D}${MATRIX_APP_DIR}/set_frequency/set-frequency.php
-}
-# Make sure power submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-power matr=
ix-gui-generic-pm"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/html-apps/ \
-                ${MATRIX_BASE_DIR}/apps/ \
-"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-crypto-demos_2=
.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
deleted file mode 100644
index 7dc809a6..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "Cryptography demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.12"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git/cryptos_apps_scripts"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-
-# Make sure crypto submenu and app images has been installed. Also make su=
re openssl is available
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-cryptos op=
enssl matrix-gui-helper-scripts"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-display-contro=
l_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-display-control_=
2.0.bb
deleted file mode 100644
index 1f9a4d35..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-display-control_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "Display control descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/displaycontrol_apps"
-
-# Make sure display submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-display"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos=
/udhcpd_eth1.conf b/meta-arago-demos/recipes-core/matrix/matrix-gui-etherne=
t-demos/udhcpd_eth1.conf
deleted file mode 100644
index f394fa86..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos/udhcpd=
_eth1.conf
+++ /dev/null
@@ -1,128 +0,0 @@
-# udhcp_eth1.conf
-#
-# configuration for eth1 interface
-#
-# Copyright (C) {2012} Texas Instruments Incorporated - http://www.ti.com/
-#
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License as
-# published by the Free Software Foundation version 2.
-#
-# This program is distributed "as is" WITHOUT ANY WARRANTY of any
-# kind, whether express or implied; without even the implied warranty
-# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-
-# Sample udhcpd configuration file (/etc/udhcpd.conf)
-# Values shown are defaults
-
-# The start and end of the IP lease block
-start		192.168.30.20
-end		192.168.30.254
-
-# The interface that udhcpd will use
-interface	eth1
-
-# The maximum number of leases (includes addresses reserved
-# by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
-# if it's bigger than IP lease block, but it ok to make it
-# smaller than lease block.
-#max_leases	254
-
-# The amount of time that an IP will be reserved (leased to nobody)
-# if a DHCP decline message is received (seconds)
-#decline_time	3600
-
-# The amount of time that an IP will be reserved
-# if an ARP conflict occurs (seconds)
-#conflict_time	3600
-
-# How long an offered address is reserved (seconds)
-#offer_time	60
-
-# If client asks for lease below this value, it will be rounded up
-# to this value (seconds)
-#min_lease	60
-
-# The location of the pid file
-#pidfile	/var/run/udhcpd.pid
-
-# The location of the leases file
-#lease_file	/var/lib/misc/udhcpd.leases
-
-# The time period at which udhcpd will write out leases file.
-# If this is 0, udhcpd will never automatically write leases file.
-# Specified in seconds.
-#auto_time	7200
-
-# Every time udhcpd writes a leases file, the below script will be called
-#notify_file			# default: no script
-#notify_file	dumpleases	# useful for debugging
-
-# The following are bootp specific options
-# next server to use in bootstrap
-#siaddr		192.168.0.22	# default: 0.0.0.0 (none)
-# tftp server name
-#sname		zorak		# default: none
-# tftp file to download (e.g. kernel image)
-#boot_file	/var/nfs_root	# default: none
-
-# Static leases map
-#static_lease 00:60:08:11:CE:4E 192.168.0.54
-#static_lease 00:60:08:11:CE:3E 192.168.0.44
-
-# The remainder of options are DHCP options and can be specified with the
-# keyword 'opt' or 'option'. If an option can take multiple items, such
-# as the dns option, they can be listed on the same line, or multiple
-# lines.
-# Examples:
-opt	dns	8.8.8.8 8.8.4.4 #public google dns servers
-option	subnet	255.255.255.0
-opt	router	192.168.30.1
-#opt	wins	192.168.10.10
-#option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
-#option	domain	local
-option	lease	864000		# default: 10 days
-# Arbitrary option in hex form:
-option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
-
-# Currently supported options (for more info, see options.c):
-#opt lease      NUM
-#opt subnet     IP
-#opt broadcast  IP
-#opt router     IP_LIST
-#opt ipttl      NUM
-#opt mtu        NUM
-#opt hostname   STRING		# client's hostname
-#opt domain     STRING		# client's domain suffix
-#opt search     STRING_LIST	# search domains
-#opt nisdomain  STRING
-#opt timezone   NUM		# (localtime - UTC_time) in seconds. signed
-#opt tftp       STRING		# tftp server name
-#opt bootfile   STRING		# tftp file to download (e.g. kernel image)
-#opt bootsize   NUM		# size of that file
-#opt rootpath   STRING		# (NFS) path to mount as root fs
-#opt wpad       STRING
-#opt serverid   IP		# default: server's IP
-#opt message    STRING		# error message (udhcpd sends it on success too)
-#opt vlanid     NUM		# 802.1P VLAN ID
-#opt vlanpriority NUM		# 802.1Q VLAN priority
-# Options specifying server(s)
-#opt dns        IP_LIST
-#opt wins       IP_LIST
-#opt nissrv     IP_LIST
-#opt ntpsrv     IP_LIST
-#opt lprsrv     IP_LIST
-#opt swapsrv    IP
-# Options specifying routes
-#opt routes     IP_PAIR_LIST
-# Obsolete options, no longer supported
-#opt logsrv     IP_LIST	# 704/UDP log server (not syslog!)
-#opt namesrv    IP_LIST	# IEN 116 name server, obsolete (August 1979!!!)
-#opt cookiesrv  IP_LIST	# RFC 865 "quote of the day" server, rarely (never=
?) used
-#opt timesrv    IP_LIST	# RFC 868 time server, rarely (never?) used
-# TODO: in development
-#opt userclass  STRING		# RFC 3004. set of LASCII strings. "I am a printer=
" etc
-#opt sipserv    STRING LIST	# RFC 3361. flag byte, then: 0: domain names, =
1: IP addrs
-#opt staticroutes   STATIC_ROUTES
-#opt msstaticroutes STATIC_ROUTES
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos=
_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos_2.=
0.bb
deleted file mode 100644
index 364dac99..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "Ethernet example applications"
-
-require matrix-gui-apps-git.inc
-
-LICENSE =3D "CC-BY-SA-3.0 & GPL-2.0-or-later"
-
-LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM} \
-                     file://../../udhcpd_eth1.conf;beginline=3D1;endline=
=3D14;md5=3D70668b1ed5416406a61ef9abdd90d601 \
-"
-PR =3D "${INC_PR}.1"
-
-inherit allarch
-
-
-# Add a default configuration file for the eth1 connection
-SRC_URI +=3D "file://udhcpd_eth1.conf"
-
-S =3D "${WORKDIR}/git/ethernet_apps"
-
-do_install:append() {
-    install -d ${D}${sysconfdir}
-    install -m 0755 ${WORKDIR}/udhcpd_eth1.conf ${D}${sysconfdir}
-}
-
-# Make sure ethernet submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-ethernet"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/* \
-                ${sysconfdir}/udhcpd_eth1.conf"
-CONFFILES:${PN} +=3D "${sysconfdir}/udhcpd_eth1.conf"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-generic-pm_2.0=
.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
deleted file mode 100644
index d9c6adbb..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION =3D "Power management helper scripts"
-
-require matrix-gui-apps-git.inc
-
-LIC_FILES_CHKSUM :=3D "file://../../${LICENSE_CHECKSUM}"
-PR =3D "${INC_PR}.1"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/power_apps/pm_generic_power"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/setclockspeed.sh ${D}${bindir}=20=20=20=20
-    install -m 0755 ${S}/warnonpm.sh ${D}${bindir}=20=20=20=20
-}
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-helper-scripts=
.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-helper-scripts.bb
deleted file mode 100644
index 4db1d8d2..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-helper-scripts.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION =3D "Demo helper scripts for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/scripts"
-
-do_install:append(){
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/optimize-benchmark.sh ${D}${bindir}/=20
-}
-
-FILES:${PN} +=3D "{bindir}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-hmi-demos_2.0.=
bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
deleted file mode 100644
index 1427ef0a..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY =3D "HMI demo descriptions for Matrix v2"
-
-require recipes-core/matrix/matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/hmi_apps"
-
-# Make sure machinevision submenu and app images has been installed
-HMI_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-hmi"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-
-PACKAGES =3D "matrix-hmi-demo-evse \
-	    matrix-hmi-demo-protection-relays \
-	    matrix-hmi-demo-mmwavegesture \
-"
-
-RDEPENDS:matrix-hmi-demo-evse =3D " \
-    bash \
-    ${HMI_RDEPENDS} \
-    evse-hmi \
-"
-
-RDEPENDS:matrix-hmi-demo-protection-relays =3D " \
-    bash \
-    ${HMI_RDEPENDS} \
-    protection-relays-hmi \
-"
-
-RDEPENDS:matrix-hmi-demo-mmwavegesture =3D " \
-    bash \
-    ${HMI_RDEPENDS} \
-    mmwavegesture-hmi \
-"
-
-FILES:matrix-hmi-demo-evse    =3D "${MATRIX_APP_DIR}/hmi_evse/*"
-FILES:matrix-hmi-demo-evse  +=3D "${bindir}/runHmiEvse.sh"
-
-FILES:matrix-hmi-demo-protection-relays   =3D "${MATRIX_APP_DIR}/hmi_prote=
ction_relays/*"
-FILES:matrix-hmi-demo-protection-relays  +=3D "${bindir}/runHmiProtectionR=
elays.sh"
-
-FILES:matrix-hmi-demo-mmwavegesture    =3D "${MATRIX_APP_DIR}/hmi_mmwave/*"
-FILES:matrix-hmi-demo-mmwavegesture  +=3D "${bindir}/runHmiMmWave.sh"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-machinevision-=
demos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-machinevisio=
n-demos_2.0.bb
deleted file mode 100644
index 6cb9ba6d..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-machinevision-demos_2=
.0.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-DESCRIPTION =3D "Machine vision demo descriptions for Matrix v2"
-
-require recipes-core/matrix/matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.4"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git/machinevision_apps"
-
-# Make sure machinevision submenu and app images has been installed
-MACHINEVISION_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-ma=
chinevision"
-
-BARCODE_RDEPENDS =3D ""
-#BARCODE_RDEPENDS =3D " \
-#    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True,=
 False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
-#"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-
-PACKAGES =3D "matrix-machinevision-demo-dlp3dscanner \
-            matrix-machinevision-demo-barcoderoi \
-            matrix-machinevision-demo-barcoderoi-f2f \
-            matrix-machinevision-demo-simplepeopletracking \
-"
-
-RDEPENDS:matrix-machinevision-demo-dlp3dscanner =3D " \
-    ${MACHINEVISION_RDEPENDS} \
-"
-
-RDEPENDS:matrix-machinevision-demo-dlp3dscanner:append:dra7xx =3D " \
-    ${@['','point-cloud-viewer'][oe.utils.all_distro_features(d, 'opencv',=
 True, False) and bb.utils.contains('DISTRO_FEATURES', 'opengl', True, Fals=
e, d)]} \
-"
-
-RDEPENDS:matrix-machinevision-demo-barcoderoi =3D " \
-    ${MACHINEVISION_RDEPENDS} \
-    ${BARCODE_RDEPENDS} \
-"
-
-RDEPENDS:matrix-machinevision-demo-barcoderoi-f2f =3D " \
-    ${MACHINEVISION_RDEPENDS} \
-    ${BARCODE_RDEPENDS} \
-"
-
-RDEPENDS:matrix-machinevision-demo-simplepeopletracking =3D " \
-    ${MACHINEVISION_RDEPENDS} \
-"
-
-FILES:matrix-machinevision-demo-dlp3dscanner    =3D "${MATRIX_APP_DIR}/mac=
hinevision_dlp_3d_scanner/*"
-FILES:matrix-machinevision-demo-dlp3dscanner   +=3D "${bindir}/runDlp3DSca=
nner.sh"
-
-FILES:matrix-machinevision-demo-barcoderoi    =3D "${MATRIX_APP_DIR}/machi=
nevision_barcode_roi/*"
-FILES:matrix-machinevision-demo-barcoderoi   +=3D "${bindir}/runBarcodeRoi=
.sh"
-FILES:matrix-machinevision-demo-barcoderoi-f2f =3D "${MATRIX_APP_DIR}/mach=
inevision_barcode_roi_f2f/*"
-FILES:matrix-machinevision-demo-barcoderoi-f2f +=3D "${bindir}/runBarcodeR=
oiSave2File.sh"
-
-FILES:matrix-machinevision-demo-simplepeopletracking   =3D "${MATRIX_APP_D=
IR}/machinevision_simple_people_tracking/*"
-FILES:matrix-machinevision-demo-simplepeopletracking   +=3D "${bindir}/run=
SimplePeopleTracking.sh"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-mc-demos_2.0.b=
b b/meta-arago-demos/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
deleted file mode 100644
index d20143e6..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION =3D "Keystone multi-core demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/mc_demo_apps"
-
-# Make sure demo submenu and app images has been installed.
-MC_DEMOS_RDEPENDS =3D "matrix-gui-apps-images matrix-gui-submenus-mc-demo"
-
-PACKAGES =3D "matrix-mc-demo-ipc \
-            matrix-mc-demo-imageproc \
-"
-
-RDEPENDS:matrix-mc-demo-ipc        =3D "${MC_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-mc-demo-imageproc  =3D "${MC_DEMOS_RDEPENDS}"
-
-FILES:matrix-mc-demo-ipc        =3D "${MATRIX_APP_DIR}/mc_demo_ipc/*"
-FILES:matrix-mc-demo-imageproc  =3D "${MATRIX_APP_DIR}/mc_demo_imageproc/*"
-
-FILES:matrix-mc-demo-ipc       +=3D "${bindir}/mc_demo_ipc.sh"
-FILES:matrix-mc-demo-imageproc +=3D "${bindir}/mc_demo_imageproc.sh \
-                                   ${bindir}/mc_run_dsp.sh \
-"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-multimedia-dem=
os_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-multimedia-demo=
s_2.0.bb
deleted file mode 100644
index 3bfbc540..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.=
bb
+++ /dev/null
@@ -1,70 +0,0 @@
-DESCRIPTION =3D "Multimedia demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.7"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/multimedia_apps"
-
-# Make sure multimedia submenu and app images has been installed
-MULTIMEDIA_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-multi=
media amsdk-av-files"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-
-PACKAGES =3D "matrix-multimedia-demo-aac \
-            matrix-multimedia-demo-audiocapture \
-            matrix-multimedia-demo-h264dec      \
-            matrix-multimedia-demo-mpeg4aacdec   \
-            matrix-multimedia-demo-mpeg4dec     \
-            matrix-multimedia-demo-ivahdh264dec \
-            matrix-multimedia-demo-ivahdh264enc \
-            matrix-multimedia-demo-ivahdmjpegenc \
-            matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec \
-            matrix-multimedia-demo-h265dec \
-            matrix-multimedia-demo-dsp66imgproc \
-            matrix-multimedia-demo-dsp66imgproc-f2f \
-"
-
-RDEPENDS:matrix-multimedia-demo-aac =3D "${MULTIMEDIA_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-audiocapture =3D "${MULTIMEDIA_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-h264dec      =3D "${MULTIMEDIA_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-mpeg4aacdec   =3D "${MULTIMEDIA_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-mpeg4dec     =3D "${MULTIMEDIA_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-ivahdh264dec             =3D "${MULTIMEDIA=
_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-ivahdh264enc             =3D "${MULTIMEDIA=
_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-ivahdmjpegenc            =3D "${MULTIMEDIA=
_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec =3D "${MULTIMEDIA=
_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-h265dec      =3D "${MULTIMEDIA_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-dsp66imgproc  =3D "${MULTIMEDIA_RDEPENDS}"
-RDEPENDS:matrix-multimedia-demo-dsp66imgproc-f2f  =3D "${MULTIMEDIA_RDEPEN=
DS}"
-
-
-# Split the matrix files by multimedia demos
-FILES:matrix-multimedia-demo-aac =3D "${MATRIX_APP_DIR}/arm_multimedia_aac=
dec/*"
-FILES:matrix-multimedia-demo-audiocapture =3D "${MATRIX_APP_DIR}/arm_multi=
media_audiocapture/*"
-FILES:matrix-multimedia-demo-h264dec      =3D "${MATRIX_APP_DIR}/arm_multi=
media_h264dec/*"
-FILES:matrix-multimedia-demo-mpeg4aacdec   =3D "${MATRIX_APP_DIR}/arm_mult=
imedia_mpeg4aacdec/*"
-FILES:matrix-multimedia-demo-mpeg4dec     =3D "${MATRIX_APP_DIR}/arm_multi=
media_mpeg4dec/*"
-FILES:matrix-multimedia-demo-ivahdh264dec                =3D "${MATRIX_APP=
_DIR}/ivahd_multimedia_h264dec/*"
-FILES:matrix-multimedia-demo-ivahdh264enc                =3D "${MATRIX_APP=
_DIR}/ivahd_multimedia_h264enc/*"
-FILES:matrix-multimedia-demo-ivahdmjpegenc               =3D "${MATRIX_APP=
_DIR}/ivahd_multimedia_mjpegenc/*"
-FILES:matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec    =3D "${MATRIX_APP=
_DIR}/ivahd_multimedia_vip_vpe_mpeg4encdec/*"
-FILES:matrix-multimedia-demo-h265dec      =3D "${MATRIX_APP_DIR}/arm_multi=
media_h265dec/*"
-FILES:matrix-multimedia-demo-dsp66imgproc     =3D "${MATRIX_APP_DIR}/dsp66=
_multimedia_imgproc/*"
-FILES:matrix-multimedia-demo-dsp66imgproc-f2f     =3D "${MATRIX_APP_DIR}/d=
sp66_multimedia_imgproc_f2f/*"
-
-# Split the ${bindir} files by multimedia demos
-FILES:matrix-multimedia-demo-aac +=3D "${bindir}/runAACDec.sh"
-FILES:matrix-multimedia-demo-audiocapture +=3D "${bindir}/runAudioCapture.=
sh"
-FILES:matrix-multimedia-demo-h264dec      +=3D "${bindir}/runH264Dec.sh"
-FILES:matrix-multimedia-demo-mpeg4aacdec   +=3D "${bindir}/runMpeg4AacDec.=
sh"
-FILES:matrix-multimedia-demo-mpeg4dec     +=3D "${bindir}/runMpeg4Dec.sh"
-FILES:matrix-multimedia-demo-ivahdh264dec               +=3D "${bindir}/ru=
nIvahdH264Dec.sh"
-FILES:matrix-multimedia-demo-ivahdh264enc               +=3D "${bindir}/ru=
nIvahdH264Enc.sh"
-FILES:matrix-multimedia-demo-ivahdmjpegenc              +=3D "${bindir}/ru=
nIvahdMjpegEnc.sh"
-FILES:matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec   +=3D "${bindir}/ru=
nIvahdVipVpeMpeg4EncDec.sh"
-FILES:matrix-multimedia-demo-h265dec      +=3D "${bindir}/runH265Dec.sh"
-FILES:matrix-multimedia-demo-dsp66imgproc    +=3D "${bindir}/runDsp66ImgPr=
oc.sh"
-FILES:matrix-multimedia-demo-dsp66imgproc-f2f    +=3D "${bindir}/runDsp66I=
mgProcSave2File.sh"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-opencl-demos_2=
.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
deleted file mode 100644
index b0f38e16..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION =3D "OpenCL demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.2"
-
-inherit allarch features_check
-
-REQUIRED_DISTRO_FEATURES =3D "opencl"
-
-S =3D "${WORKDIR}/git/opencl_apps"
-
-# Make sure opencl submenu and app images has been installed
-OPENCL_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-opencl"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-
-PACKAGES =3D "matrix-opencl-demo-dsplibfft  \
-            matrix-opencl-demo-vecadd     \
-            matrix-opencl-demo-floatcompute \
-"
-
-RDEPENDS:matrix-opencl-demo-dsplibfft     =3D "${OPENCL_RDEPENDS}"
-RDEPENDS:matrix-opencl-demo-vecadd        =3D "${OPENCL_RDEPENDS}"
-RDEPENDS:matrix-opencl-demo-floatcompute  =3D "${OPENCL_RDEPENDS}"
-
-# Split the matrix files by opencl demos
-FILES:matrix-opencl-demo-dsplibfft     =3D "${MATRIX_APP_DIR}/opencl_dspli=
b_fft/*"
-FILES:matrix-opencl-demo-vecadd        =3D "${MATRIX_APP_DIR}/opencl_vecad=
d/*"
-FILES:matrix-opencl-demo-floatcompute  =3D "${MATRIX_APP_DIR}/opencl_float=
_compute/*"
-
-
-# Split the ${bindir} files by opencl demos
-FILES:matrix-opencl-demo-dsplibfft     +=3D "${bindir}/runOclDsplibFFT.sh"
-FILES:matrix-opencl-demo-vecadd        +=3D "${bindir}/runOclVecadd.sh"
-FILES:matrix-opencl-demo-floatcompute  +=3D "${bindir}/runOclFloatCompute.=
sh"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-oprofile-demos=
_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-oprofile-demos_2.=
0.bb
deleted file mode 100644
index b9dfda75..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "Oprofile demo applications for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.3"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/oprofile_apps"
-
-# Make sure profiling submenu and app images  has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-oprofile o=
profile oprofile-example"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-paths.inc b/me=
ta-arago-demos/recipes-core/matrix/matrix-gui-paths.inc
deleted file mode 100644
index 8c6e5682..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-paths.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-export MATRIX_BASE_DIR =3D "${datadir}/matrix-gui-2.0"
-export MATRIX_WEB_DIR =3D "${MATRIX_BASE_DIR}"
-export MATRIX_APP_DIR =3D "${MATRIX_WEB_DIR}/apps"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-pm-demos_2.0.b=
b b/meta-arago-demos/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
deleted file mode 100644
index 3daffbd5..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION =3D "Power management demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.4"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/power_apps"
-
-# Make sure power submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-power matr=
ix-gui-generic-pm"
-ALLOW_EMPTY:${PN} =3D "1"
-
-# Break out the individual files into separate packages.  That way only the
-# PM features supported for each device can be installed.  Prepend the list
-# so that we can get the files in ${bindir} first.
-PACKAGES =3D+ "${PN}-count ${PN}-dump-reg ${PN}-snapshot1 ${PN}-snapshot2 =
${PN}-suspend ${PN}-governor"
-
-# Split the matrix files by PM app
-FILES:${PN}-count +=3D "${MATRIX_APP_DIR}/pm_count/*"
-FILES:${PN}-dump-reg +=3D "${MATRIX_APP_DIR}/pm_dump_reg/*"
-FILES:${PN}-snapshot1 +=3D "${MATRIX_APP_DIR}/pm_snapshot_1/*"
-FILES:${PN}-snapshot2 +=3D "${MATRIX_APP_DIR}/pm_snapshot_2/*"
-FILES:${PN}-suspend +=3D "${MATRIX_APP_DIR}/pm_suspend/*"
-FILES:${PN}-governor +=3D "${MATRIX_APP_DIR}/pm_userspace_governor/* \
-                         ${MATRIX_APP_DIR}/pm_ondemand_governor/*"
-
-# Split the ${bindir} files by PM app
-FILES:${PN}-count +=3D "${bindir}/pm_count.sh"
-FILES:${PN}-dump-reg +=3D "${bindir}/pm_dump_reg.sh"
-FILES:${PN}-snapshot1 +=3D "${bindir}/pm_snapshot_1.sh"
-FILES:${PN}-snapshot2 +=3D "${bindir}/pm_snapshot_2.sh"
-FILES:${PN}-suspend +=3D "${bindir}/pm_suspend.sh"
-FILES:${PN}-governor +=3D "${bindir}/setgovernor.sh"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-pru-demos_2.0.=
bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
deleted file mode 100644
index afae3424..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "PRU demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/pru_apps"
-
-# Make sure pru submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-pru"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-qt4-demos_2.0.=
bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
deleted file mode 100644
index ed0da382..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "Qt4 demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/qt4_apps"
-
-# Make sure qt4 submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-qt4"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-qt5-demos_2.0.=
bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
deleted file mode 100644
index c5084c49..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION =3D "Qt5 demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/qt5_apps"
-
-# Make sure qt5 submenu and app images has been installed
-QT5_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-qt5"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-PACKAGES =3D "matrix-qt5-demo-animated \
-            matrix-qt5-demo-browser \
-            matrix-qt5-demo-calculator \
-            matrix-qt5-demo-deform \
-            matrix-qt5-demo-webkit-browser \
-"
-
-RDEPENDS:matrix-qt5-demo-animated =3D "${QT5_RDEPENDS}"
-RDEPENDS:matrix-qt5-demo-browser =3D "${QT5_RDEPENDS}"
-RDEPENDS:matrix-qt5-demo-calculator =3D "${QT5_RDEPENDS}"
-RDEPENDS:matrix-qt5-demo-deform =3D "${QT5_RDEPENDS}"
-RDEPENDS:matrix-qt5-demo-webkit-browser =3D "${QT5_RDEPENDS}"
-
-# Split the matrix files by qt5 demos
-FILES:matrix-qt5-demo-animated =3D "${MATRIX_APP_DIR}/qt5_animated_tiles/*"
-FILES:matrix-qt5-demo-browser =3D "${MATRIX_APP_DIR}/qt5_browser/*"
-FILES:matrix-qt5-demo-calculator =3D "${MATRIX_APP_DIR}/qt5_calculator/*"
-FILES:matrix-qt5-demo-deform =3D "${MATRIX_APP_DIR}/qt5_deform/*"
-FILES:matrix-qt5-demo-webkit-browser =3D "${MATRIX_APP_DIR}/qt5_webkit_bro=
wser/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-settings-demos=
_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-settings-demos_2.=
0.bb
deleted file mode 100644
index e59596a6..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION =3D "Settings demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.3"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/settings_apps"
-
-PACKAGES =3D+ "matrix-gui-weston-terminal-demo"
-
-# Make sure setting submenu and app images has been installed
-SETTINGS_DEMOS_RDEPENDS =3D " \
-    matrix-gui-apps-images \
-    matrix-gui-submenus-settings \
-"
-
-RDEPENDS:${PN} +=3D "${SETTINGS_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-gui-weston-terminal-demo +=3D "${SETTINGS_DEMOS_RDEPENDS}"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-FILES:matrix-gui-weston-terminal-demo =3D "${MATRIX_APP_DIR}/terminal"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-submenus_2.0.b=
b b/meta-arago-demos/recipes-core/matrix/matrix-gui-submenus_2.0.bb
deleted file mode 100644
index 71714ef2..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ /dev/null
@@ -1,106 +0,0 @@
-DESCRIPTION =3D "Submenu packages for Matrix GUI v2"
-
-require matrix-gui-apps-git.inc
-
-# This package does not use a subdirectory as ${S} so we need to
-# reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa=
9"
-
-PR =3D "${INC_PR}.20"
-
-# These packages make submenus in matrix and are not architecture specific
-inherit allarch
-
-S =3D "${WORKDIR}/git"
-
-# List of submenus to build packages for
-SUBMENUS =3D " arm_submenu \
-             3d_submenu \
-             cryptos_submenu \
-             display_submenu \
-             ethernet_submenu \
-             multimedia_submenu \
-             power_submenu \
-             pru_submenu \
-             qt4_submenu \
-             settings_submenu \
-             usb_submenu \
-             wifi_submenu \
-             oprofile_submenu \
-             utilities_submenu \
-             mc_demo_submenu \
-             opencl_submenu \
-             videoanalytics_submenu \
-             machinevision_submenu \
-             touch_submenu \
-             browser_submenu \
-	     hmi_submenu \
-             tidl_submenu \
-             analytics_submenu \
-"
-
-do_install(){
-    install -d ${D}${MATRIX_APP_DIR}
-
-    for x in ${SUBMENUS}
-    do
-        cp -rf ${S}/$x ${D}${MATRIX_APP_DIR}/
-    done
-}
-
-PACKAGES +=3D " ${PN}-arm \
-              ${PN}-3d \
-              ${PN}-cryptos \
-              ${PN}-display \
-              ${PN}-ethernet \
-              ${PN}-multimedia \
-              ${PN}-power \
-              ${PN}-pru \
-              ${PN}-qt4 \
-              ${PN}-qt5 \
-              ${PN}-settings \
-              ${PN}-usb \
-              ${PN}-wifi \
-              ${PN}-oprofile \
-              ${PN}-camera \
-              ${PN}-utility \
-              ${PN}-mc-demo \
-              ${PN}-opencl \
-              ${PN}-videoanalytics \
-              ${PN}-machinevision \
-              ${PN}-touch \
-              ${PN}-browser \
-              ${PN}-hmi \
-              ${PN}-tidl \
-              ${PN}-analytics \
-"
-
-# Make sure app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images bash"
-
-# Add the files for each submenu package
-FILES:${PN}-arm =3D "${MATRIX_APP_DIR}/arm_submenu/*"
-FILES:${PN}-3d =3D "${MATRIX_APP_DIR}/3d_submenu/*"
-FILES:${PN}-cryptos =3D "${MATRIX_APP_DIR}/cryptos_submenu/*"
-FILES:${PN}-display =3D "${MATRIX_APP_DIR}/display_submenu/*"
-FILES:${PN}-ethernet =3D "${MATRIX_APP_DIR}/ethernet_submenu/*"
-FILES:${PN}-multimedia =3D "${MATRIX_APP_DIR}/multimedia_submenu/*"
-FILES:${PN}-power =3D "${MATRIX_APP_DIR}/power_submenu/*"
-FILES:${PN}-pru =3D "${MATRIX_APP_DIR}/pru_submenu/*"
-FILES:${PN}-qt4 =3D "${MATRIX_APP_DIR}/qt4_submenu/*"
-FILES:${PN}-qt5 =3D "${MATRIX_APP_DIR}/qt5_submenu/*"
-FILES:${PN}-settings =3D "${MATRIX_APP_DIR}/settings_submenu/*"
-FILES:${PN}-usb =3D "${MATRIX_APP_DIR}/usb_submenu/*"
-FILES:${PN}-wifi =3D "${MATRIX_APP_DIR}/wifi_submenu/*"
-FILES:${PN}-oprofile =3D "${MATRIX_APP_DIR}/oprofile_submenu/*"
-FILES:${PN}-camera =3D "${MATRIX_APP_DIR}/camera_submenu/*"
-FILES:${PN}-utility =3D "${MATRIX_APP_DIR}/utilities_submenu/*"
-FILES:${PN}-mc-demo =3D "${MATRIX_APP_DIR}/mc_demo_submenu/*"
-FILES:${PN}-opencl =3D "${MATRIX_APP_DIR}/opencl_submenu/*"
-FILES:${PN}-videoanalytics =3D "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
-FILES:${PN}-machinevision =3D "${MATRIX_APP_DIR}/machinevision_submenu/*"
-FILES:${PN}-touch =3D "${MATRIX_APP_DIR}/touch_submenu/*"
-FILES:${PN}-browser =3D "${MATRIX_APP_DIR}/browser_submenu/*"
-FILES:${PN}-hmi =3D "${MATRIX_APP_DIR}/hmi_submenu/*"
-FILES:${PN}-tidl =3D "${MATRIX_APP_DIR}/tidl_submenu/*"
-FILES:${PN}-analytics =3D "${MATRIX_APP_DIR}/analytics_submenu/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-tidl-demos_2.0=
.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
deleted file mode 100644
index dd80d087..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
+++ /dev/null
@@ -1,96 +0,0 @@
-DESCRIPTION =3D "Deep learning vision demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/tidl_apps"
-
-# Make sure tidl submenu and app images has been installed
-TIDLDEMO_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-tidl"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
-
-PACKAGES =3D "matrix-tidl-demo-staticimg \
-            matrix-tidl-demo-staticimg-lg2 \
-            matrix-tidl-demo-staticimg-dsponly \
-            matrix-tidl-demo-pnexamples \
-            matrix-tidl-demo-livecam \
-            matrix-tidl-demo-livecam-lg2 \
-            matrix-tidl-demo-dogbreeds \
-            matrix-tidl-demo-objdet \
-            matrix-tidl-demo-objdet-livecam \
-            matrix-tidl-demo-segment \
-"
-
-RDEPENDS:matrix-tidl-demo-staticimg =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-staticimg-lg2 =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-staticimg-dsponly =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-pnexamples =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-livecam =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-livecam-lg2 =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-dogbreeds =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-objdet =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-objdet-livecam =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS:matrix-tidl-demo-segment =3D " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-FILES:matrix-tidl-demo-staticimg =3D "${MATRIX_APP_DIR}/tidl_demo_staticim=
g/*"
-FILES:matrix-tidl-demo-staticimg +=3D "${bindir}/runTidlStaticImg.sh"
-
-FILES:matrix-tidl-demo-staticimg-lg2 =3D "${MATRIX_APP_DIR}/tidl_demo_stat=
icimg_lg2/*"
-FILES:matrix-tidl-demo-staticimg-lg2 +=3D "${bindir}/runTidlStaticImg_lg2.=
sh"
-
-FILES:matrix-tidl-demo-staticimg-dsponly =3D "${MATRIX_APP_DIR}/tidl_demo_=
staticimg_dsponly/*"
-FILES:matrix-tidl-demo-staticimg-dsponly +=3D "${bindir}/runTidlStaticImg_=
dsponly.sh"
-
-FILES:matrix-tidl-demo-pnexamples =3D "${MATRIX_APP_DIR}/tidl_demo_pnexamp=
les/*"
-FILES:matrix-tidl-demo-pnexamples +=3D "${bindir}/runTidlPnExamples.sh"
-
-FILES:matrix-tidl-demo-livecam   =3D "${MATRIX_APP_DIR}/tidl_demo_livecam/=
*"
-FILES:matrix-tidl-demo-livecam   +=3D "${bindir}/runTidlLiveCam.sh"
-
-FILES:matrix-tidl-demo-livecam-lg2  =3D "${MATRIX_APP_DIR}/tidl_demo_livec=
am_lg2/*"
-FILES:matrix-tidl-demo-livecam-lg2  +=3D "${bindir}/runTidlLiveCam_lg2.sh"
-
-FILES:matrix-tidl-demo-dogbreeds =3D "${MATRIX_APP_DIR}/tidl_demo_dogbreed=
s/*"
-FILES:matrix-tidl-demo-dogbreeds +=3D "${bindir}/runTidlDogBreeds.sh"
-
-FILES:matrix-tidl-demo-objdet   =3D "${MATRIX_APP_DIR}/tidl_demo_objdet/*"
-FILES:matrix-tidl-demo-objdet   +=3D "${bindir}/runTidlObjdet.sh"
-
-FILES:matrix-tidl-demo-objdet-livecam   =3D "${MATRIX_APP_DIR}/tidl_demo_o=
bjdet_livecam/*"
-FILES:matrix-tidl-demo-objdet-livecam   +=3D "${bindir}/runTidlObjdet_live=
cam.sh"
-
-FILES:matrix-tidl-demo-segment   =3D "${MATRIX_APP_DIR}/tidl_demo_segment/=
*"
-FILES:matrix-tidl-demo-segment   +=3D "${bindir}/runTidlSegment.sh"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-touch-demos_2.=
0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
deleted file mode 100644
index 8e4ba444..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "Touch demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/touch_apps"
-
-# Make sure touch submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-touch"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-usb-demos_2.0.=
bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
deleted file mode 100644
index de6c8e4a..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "USB demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.3"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/usb_apps"
-
-# Make sure usb submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-usb bonnie=
++ matrix-gui-helper-scripts"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-utility-demos_=
2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-utility-demos_2.0.=
bb
deleted file mode 100644
index 44653d01..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION =3D "Keystone utility app demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/utilities_apps"
-
-do_install:prepend(){
-   install -d ${D}${MATRIX_BASE_DIR}/html-apps/
-   cp -rf ${S}/utility_eeprom/eeprom ${D}${MATRIX_BASE_DIR}/html-apps/
-   cp -rf ${S}/utility_filesystem/filesystem ${D}${MATRIX_BASE_DIR}/html-a=
pps/
-   cp -rf ${S}/utility_info/info ${D}${MATRIX_BASE_DIR}/html-apps/
-   cp -rf ${S}/utility_stats/stats ${D}${MATRIX_BASE_DIR}/html-apps/
-}
-
-do_install:append(){
-    rm ${D}${MATRIX_APP_DIR}/utility_eeprom/eeprom-utility.php
-    rm ${D}${MATRIX_APP_DIR}/utility_filesystem/filesystem-utility.php
-    rm ${D}${MATRIX_APP_DIR}/utility_info/info-utility.php
-    rm ${D}${MATRIX_APP_DIR}/utility_stats/stats-utility.php
-}
-
-# Make sure utility submenu and app images has been installed.
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-utility"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/html-apps/ \
-                ${MATRIX_BASE_DIR}/apps/ \
-"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-v4l2-demos_2.0=
.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
deleted file mode 100644
index 79360796..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "V4l2 demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.2"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/v4l2_apps"
-
-# Make sure display submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-display av=
-examples"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-video-analytic=
s-demos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-video-anal=
ytics-demos_2.0.bb
deleted file mode 100644
index 73fc4661..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-video-analytics-demos=
_2.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION =3D "Video Analytics demo descriptions for Matrix v2"
-
-require recipes-core/matrix/matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.0"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/videoanalytics_apps"
-
-# Make sure video analytics submenu and app images has been installed
-VIDEO_ANALYTICS_DEMO_RDEPENDS +=3D " \
-    matrix-gui-apps-images \
-    matrix-gui-submenus-videoanalytics \
-"
-
-PACKAGES =3D "matrix-video-analytics-opencv-opencl-opengl-demo \
-"
-
-#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_f=
eatures(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACH=
INE_FEATURES', 'dsp', True, False, d)]}
-RDEPENDS:matrix-video-analytics-opencv-opencl-opengl-demo =3D " \
-    ${VIDEO_ANALYTICS_DEMO_RDEPENDS} \
-"
-
-# Split the matrix files by demos
-FILES:matrix-video-analytics-opencv-opencl-opengl-demo =3D " \
-    ${MATRIX_APP_DIR}/videoanalytics_opencv_opencl_opengl_demo/* \
-"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-wifi-demos_2.0=
.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
deleted file mode 100644
index 2c77953b..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "Wifi demo descriptions for Matrix v2"
-
-require matrix-gui-apps-git.inc
-
-PR =3D "${INC_PR}.1"
-
-inherit allarch
-
-S =3D "${WORKDIR}/git/wifi_apps"
-
-# Make sure wifi submenu and app images has been installed
-RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-wifi"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/0001-execute_c=
ommand-Stop-matrix-when-running-a-GUI-demo.patch b/meta-arago-demos/recipes=
-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI=
-demo.patch
deleted file mode 100644
index 718f6d3e..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui/0001-execute_command-=
Stop-matrix-when-running-a-GUI-demo.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 7cbf63222897de4e9b021d8d007cca74be4ca56f Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Wed, 8 Apr 2015 07:34:22 -0400
-Subject: [PATCH] execute_command: Stop matrix when running a GUI demo.
-
-* With QT over EGLFS, all running QT apps will write to the
-  framebuffer whenever they have updates.
-* This can cause the following undesired behavior:
-  - flickering when both applications try to write updates at the
-    same time. For example, if a mouse is used for control, both QT
-    apps will update the mouse cursor, causing flickering between both
-    apps.
-  - Failure for a temporary background app (e.g. matrix) to come to
-    the foreground when demo exits. For example, when launching a qt
-    app via remote Matrix, the demo app will persist on the target's
-    display.
-* To work around this, stop matrix before launching a GUI demo, and
-  restart once the demo has completed.
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
----
- execute_command.sh |   21 +++++++++++++++++++++
- run_script.php     |    2 +-
- 2 files changed, 22 insertions(+), 1 deletion(-)
-
-diff --git a/execute_command.sh b/execute_command.sh
-index 018c632..c636b92 100755
---- a/execute_command.sh
-+++ b/execute_command.sh
-@@ -59,6 +59,11 @@ do
- 	outputfilename=3D$item=20
-   fi
-=20
-+  if [ $i -eq 2 ]
-+  then
-+    program_type=3D$item
-+  fi
-+
-   if [ $i -gt 1 ]
-   then
-     touch "lock/"$item
-@@ -68,10 +73,26 @@ do
-=20
- done
-=20
-+if [ $program_type =3D=3D gui ]
-+then
-+    /etc/init.d/matrix-gui-2.0 stop
-+
-+    chvt 4
-+    echo 0 > /sys/class/graphics/fbcon/cursor_blink
-+    echo -ne "\033[9;0]\033[14;0]" > /dev/tty4
-+
-+    refresh_screen background-black
-+fi
-+
- echo "Filename:"$filename
- echo "Output:"$outputfilename
- eval $filename > "tmp/"$outputfilename 2>&1
-=20
-+if [ $program_type =3D=3D gui ]
-+then
-+    /etc/init.d/matrix-gui-2.0 start
-+fi
-+
- #Using a more unique string to detect if the script is completed
- echo "_?!!MATRIX_SCRIPT_COMPLETED!!?_" >> "tmp/"$outputfilename
-=20
-diff --git a/run_script.php b/run_script.php
-index 9dd7a10..5b8351b 100644
---- a/run_script.php
-+++ b/run_script.php
-@@ -91,7 +91,7 @@ if($currently_locked=3D=3Dfalse)
- 	$random_string =3D strval(rand());
- 	$random_string .=3D strval(rand());
-=20
--	$script_command =3D "./execute_command.sh \"".addslashes($script_link). =
"\" ".$random_string.".txt ".$lock_list;
-+	$script_command =3D "./execute_command.sh \"".addslashes($script_link). =
"\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" ".$lock_list;
-=20
- 	$last_line =3D system($script_command." > /dev/null 2>/dev/null & ", $re=
tval);
- }
---=20
-1.7.9.5
-
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/0001-execute_c=
ommand-workaround-for-GUI-apps-with-weston.patch b/meta-arago-demos/recipes=
-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-w=
eston.patch
deleted file mode 100644
index 5a859354..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui/0001-execute_command-=
workaround-for-GUI-apps-with-weston.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From 9647ddc10dc9424b1433db2f8184268523d829da Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Wed, 28 Feb 2018 12:20:32 -0500
-Subject: [PATCH] execute_command: workaround for GUI apps with weston
-
-* For all GUI apps, shutdown matrix before launching
-  - This is needed since matrix is launched fullscreen, and another
-    GUI app may get hidden behind matrix with no way to recover.
-* For MM and 3D and null window apps, shutdown weston before launching
-  - These apps use KMS sink or DRM, which collides with weston
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- execute_command.sh | 39 ++++++++++++++++++++++++++++++++++++++-
- generate.php       |  4 ++++
- run_script.php     | 10 +++++++++-
- 3 files changed, 51 insertions(+), 2 deletions(-)
-
-diff --git a/execute_command.sh b/execute_command.sh
-index 325dcb9..180e71f 100755
---- a/execute_command.sh
-+++ b/execute_command.sh
-@@ -63,7 +63,22 @@ do
- 	outputfilename=3D$item=20
-   fi
-=20
--  if [ $i -gt 1 ]
-+  if [ $i -eq 2 ]
-+  then
-+    program_type=3D$item
-+  fi
-+
-+  if [ $i -eq 3 ]
-+  then
-+    category=3D$item
-+  fi
-+
-+  if [ $i -eq 4 ]
-+  then
-+    win_type=3D$item
-+  fi
-+
-+  if [ $i -gt 4 ]
-   then
-     touch "lock/"$item
-=20
-@@ -72,10 +87,32 @@ do
-=20
- done
-=20
-+if [ $program_type =3D=3D gui ]
-+then
-+  /etc/init.d/matrix-gui-2.0 stop
-+
-+  if [ $category =3D=3D 3d -o $category =3D=3D multimedia -o $category =
=3D=3D touch -o $win_type =3D=3D null ]
-+  then
-+    /etc/init.d/weston stop
-+    sleep 1
-+  fi
-+fi
-+
- echo "Filename:"$filename
- echo "Output:"$outputfilename
- eval $filename > "tmp/"$outputfilename 2>&1
-=20
-+if [ $program_type =3D=3D gui ]
-+then
-+  if [ $category =3D=3D 3d -o $category =3D=3D multimedia -o $category =
=3D=3D touch -o $win_type =3D=3D null ]
-+  then
-+    /etc/init.d/weston start
-+    sleep 1
-+  fi
-+
-+  /etc/init.d/matrix-gui-2.0 start
-+fi
-+
- #Using a more unique string to detect if the script is completed
- echo "_?!!MATRIX_SCRIPT_COMPLETED!!?_" >> "tmp/"$outputfilename
-=20
-diff --git a/generate.php b/generate.php
-index 10cfed4..cd88dd3 100644
---- a/generate.php
-+++ b/generate.php
-@@ -105,6 +105,10 @@ for($x =3D 0;$x<count($contents)&&strlen($contents[$x=
])>0;$x++)
- 		$top["Description_Link"] =3D get_contents("X-MATRIX-Description",$dotde=
sktop);
-=20
- 		$top["Lock"] =3D get_contents("X-MATRIX-LOCK",$dotdesktop);
-+
-+		$top["Category"] =3D get_contents("Categories",$dotdesktop);
-+
-+		$top["WinType"] =3D get_contents("WinType",$dotdesktop);
- 	}=20
-=20
- 	if($category =3D=3D -1)
-diff --git a/run_script.php b/run_script.php
-index 9dd7a10..d34a286 100644
---- a/run_script.php
-+++ b/run_script.php
-@@ -55,6 +55,7 @@ $submenu =3D isset($_GET["submenu"]) =3D=3D true ? $_GET=
["submenu"] : "main_menu" ;
- $found_app =3D get_application($var,$submenu,$_GET["app"]);
-=20
- $lock_list =3D $found_app["Lock"];
-+$win_type =3D $found_app["WinType"];
-=20
- //Verify that there is a lock specified for this application
- if($lock_list !=3D -1 )
-@@ -91,7 +92,14 @@ if($currently_locked=3D=3Dfalse)
- 	$random_string =3D strval(rand());
- 	$random_string .=3D strval(rand());
-=20
--	$script_command =3D "./execute_command.sh \"".addslashes($script_link). =
"\" ".$random_string.".txt ".$lock_list;
-+        if($win_type !=3D -1 )
-+	{
-+		$script_command =3D "./execute_command.sh \"".addslashes($script_link).=
 "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_ap=
p["Category"]."\" \"".$found_app["WinType"]."\"  ".$lock_list;
-+	}
-+	else
-+	{
-+		$script_command =3D "./execute_command.sh \"".addslashes($script_link).=
 "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_ap=
p["Category"]."\"  \"wayland\" ".$lock_list;
-+	}
-=20
- 	$last_line =3D system($script_command." > /dev/null 2>/dev/null & ", $re=
tval);
- }
---=20
-1.9.1
-
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/init b/meta-ar=
ago-demos/recipes-core/matrix/matrix-gui/init
deleted file mode 100644
index 5124c381..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui/init
+++ /dev/null
@@ -1,49 +0,0 @@
-#! /bin/sh
-
-matrixgui=3D"/usr/bin/matrix_browser"
-GUI_OPTS=3D"http://localhost:80/ __MATRIX_FLAGS__"
-PIDFILE=3D"/var/run/matrix-gui-2.0.pid"
-
-# Important System Environment Variables
-for sh in /etc/profile.d/*.sh ; do
-    [ -r "$sh" ] && . "$sh"
-done
-
-test -x "$matrixgui" || exit 0
-
-case "$1" in
-  start)
-    __SWITCH_FOREGROUND_VT__
-
-    #Clear out the the tmp and lock directory
-    cd __MATRIX_WEB_DIR__
-    rm -rf tmp/*
-    rm -rf lock/*
-    cd -
-
-	if [ -e $PIDFILE ]; then
-      PIDDIR=3D/proc/$(cat $PIDFILE)
-      if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" =3D "${matrixgu=
i}" ]; then
-        echo "$DESC already started; not starting."
-      else
-        echo "Removing stale PID file $PIDFILE."
-        rm -f $PIDFILE
-      fi
-    fi
-
-    echo -n "Starting Matrix GUI application"
-    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE -=
-exec $matrixgui -- $GUI_OPTS
-    echo "."
-    ;;
-
-  stop)
-    echo -n "Stopping Matrix GUI application"
-    start-stop-daemon --stop --quiet --pidfile $PIDFILE
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
-    exit 1
-esac
-
-exit 0
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/init.eglfs b/m=
eta-arago-demos/recipes-core/matrix/matrix-gui/init.eglfs
deleted file mode 100644
index df07c057..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui/init.eglfs
+++ /dev/null
@@ -1,60 +0,0 @@
-#! /bin/sh
-
-matrixgui=3D"/usr/bin/matrix_browser"
-GUI_OPTS=3D"http://localhost:80/ __MATRIX_FLAGS__"
-PIDFILE=3D"/var/run/matrix-gui-2.0.pid"
-
-# Important System Environment Variables
-for sh in /etc/profile.d/*.sh ; do
-    [ -r "$sh" ] && . "$sh"
-done
-
-test -x "$matrixgui" || exit 0
-
-case "$1" in
-  start)
-    chvt 4
-
-    #Clear out the the tmp and lock directory
-    cd __MATRIX_WEB_DIR__
-    rm -rf tmp/*
-    rm -rf lock/*
-    cd -
-
-	if [ -e $PIDFILE ]; then
-      PIDDIR=3D/proc/$(cat $PIDFILE)
-      if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" =3D "${matrixgu=
i}" ]; then
-        echo "$DESC already started; not starting."
-      else
-        echo "Removing stale PID file $PIDFILE."
-        rm -f $PIDFILE
-      fi
-    fi
-
-    echo 0 > /sys/class/graphics/fbcon/cursor_blink
-    echo -ne "\033[9;0]\033[14;0]" > /dev/tty4
-
-    echo -n "Starting Matrix GUI application"
-    start-stop-daemon --start --quiet --background -m --pidfile $PIDFILE -=
-exec $matrixgui -- $GUI_OPTS
-    echo "."
-    ;;
-
-  stop)
-    echo -n "Stopping Matrix GUI application"
-    start-stop-daemon --stop --quiet --pidfile $PIDFILE
-
-    refresh_screen "background-black"
-
-    echo -ne "\033[9;10]\033[14;10]" > /dev/tty4
-    echo 1 > /sys/class/graphics/fbcon/cursor_blink
-
-    chvt 1
-
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
-    exit 1
-esac
-
-exit 0
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0=
.service b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.s=
ervice
deleted file mode 100644
index 462803f3..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
+++ /dev/null
@@ -1,18 +0,0 @@
-[Unit]
-Description=3DMatrix GUI
-After=3Dweston.service lighttpd.service
-Requires=3Dweston.service
-Before=3Dgraphical.target
-
-[Service]
-Type=3Dforking
-Restart=3Dno
-TimeoutSec=3D5min
-IgnoreSIGPIPE=3Dno
-KillMode=3Dprocess
-GuessMainPID=3Dno
-RemainAfterExit=3Dyes
-ExecStart=3D/usr/share/matrix-gui-2.0/matrix-gui-2.0 start
-
-[Install]
-WantedBy=3Dmulti-user.target
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/php.ini b/meta=
-arago-demos/recipes-core/matrix/matrix-gui/php.ini
deleted file mode 100644
index 350e6122..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui/php.ini
+++ /dev/null
@@ -1,1342 +0,0 @@
-[PHP]
-
-;;;;;;;;;;;;;;;;;;;
-; About php.ini   ;
-;;;;;;;;;;;;;;;;;;;
-; This file controls many aspects of PHP's behavior.  In order for PHP to
-; read it, it must be named 'php.ini'.  PHP looks for it in the current
-; working directory, in the path designated by the environment variable
-; PHPRC, and in the path that was defined in compile time (in that order).
-; Under Windows, the compile-time path is the Windows directory.  The
-; path in which the php.ini file is looked for can be overridden using
-; the -c argument in command line mode.
-;
-; The syntax of the file is extremely simple.  Whitespace and Lines
-; beginning with a semicolon are silently ignored (as you probably guessed=
).
-; Section headers (e.g. [Foo]) are also silently ignored, even though
-; they might mean something in the future.
-;
-; Directives are specified using the following syntax:
-; directive =3D value
-; Directive names are *case sensitive* - foo=3Dbar is different from FOO=
=3Dbar.
-;
-; The value can be a string, a number, a PHP constant (e.g. E_ALL or M_PI)=
, one
-; of the INI constants (On, Off, True, False, Yes, No and None) or an expr=
ession
-; (e.g. E_ALL & ~E_NOTICE), or a quoted string ("foo").
-;
-; Expressions in the INI file are limited to bitwise operators and parenth=
eses:
-; |        bitwise OR
-; &        bitwise AND
-; ~        bitwise NOT
-; !        boolean NOT
-;
-; Boolean flags can be turned on using the values 1, On, True or Yes.
-; They can be turned off using the values 0, Off, False or No.
-;
-; An empty string can be denoted by simply not writing anything after the =
equal
-; sign, or by using the None keyword:
-;
-;  foo =3D         ; sets foo to an empty string
-;  foo =3D none    ; sets foo to an empty string
-;  foo =3D "none"  ; sets foo to the string 'none'
-;
-; If you use constants in your value, and these constants belong to a
-; dynamically loaded extension (either a PHP extension or a Zend extension=
),
-; you may only use these constants *after* the line that loads the extensi=
on.
-;
-;
-;;;;;;;;;;;;;;;;;;;
-; About this file ;
-;;;;;;;;;;;;;;;;;;;
-; This is the recommended, PHP 5-style version of the php.ini-dist file.  =
It
-; sets some non standard settings, that make PHP more efficient, more secu=
re,
-; and encourage cleaner coding.
-;
-; The price is that with these settings, PHP may be incompatible with some
-; applications, and sometimes, more difficult to develop with.  Using this
-; file is warmly recommended for production sites.  As all of the changes =
from
-; the standard settings are thoroughly documented, you can go over each on=
e,
-; and decide whether you want to use it or not.
-;
-; For general information about the php.ini file, please consult the php.i=
ni-dist
-; file, included in your PHP distribution.
-;
-; This file is different from the php.ini-dist file in the fact that it fe=
atures
-; different values for several directives, in order to improve performance=
, while
-; possibly breaking compatibility with the standard out-of-the-box behavio=
r of
-; PHP.  Please make sure you read what's different, and modify your scripts
-; accordingly, if you decide to use this file instead.
-;
-; - register_long_arrays =3D Off     [Performance]
-;     Disables registration of the older (and deprecated) long predefined =
array
-;     variables ($HTTP_*_VARS).  Instead, use the superglobals that were
-;     introduced in PHP 4.1.0
-; - display_errors =3D Off           [Security]
-;     With this directive set to off, errors that occur during the executi=
on of
-;     scripts will no longer be displayed as a part of the script output, =
and thus,
-;     will no longer be exposed to remote users.  With some errors, the er=
ror message
-;     content may expose information about your script, web server, or dat=
abase
-;     server that may be exploitable for hacking.  Production sites should=
 have this
-;     directive set to off.
-; - log_errors =3D On                [Security]
-;     This directive complements the above one.  Any errors that occur dur=
ing the
-;     execution of your script will be logged (typically, to your server's=
 error log,
-;     but can be configured in several ways).  Along with setting display_=
errors to off,
-;     this setup gives you the ability to fully understand what may have g=
one wrong,
-;     without exposing any sensitive information to remote users.
-; - output_buffering =3D 4096        [Performance]
-;     Set a 4KB output buffer.  Enabling output buffering typically result=
s in less
-;     writes, and sometimes less packets sent on the wire, which can often=
 lead to
-;     better performance.  The gain this directive actually yields greatly=
 depends
-;     on which Web server you're working with, and what kind of scripts yo=
u're using.
-; - register_argc_argv =3D Off       [Performance]
-;     Disables registration of the somewhat redundant $argv and $argc glob=
al
-;     variables.
-; - magic_quotes_gpc =3D Off         [Performance]
-;     Input data is no longer escaped with slashes so that it can be sent =
into
-;     SQL databases without further manipulation.  Instead, you should use=
 the
-;     database vendor specific escape string function on each input elemen=
t you
-;     wish to send to a database.
-; - variables_order =3D "GPCS"       [Performance]
-;     The environment variables are not hashed into the $_ENV.  To access
-;     environment variables, you can use getenv() instead.
-; - error_reporting =3D E_ALL        [Code Cleanliness, Security(?)]
-;     By default, PHP suppresses errors of type E_NOTICE.  These error mes=
sages
-;     are emitted for non-critical errors, but that could be a symptom of =
a bigger
-;     problem.  Most notably, this will cause error messages about the use
-;     of uninitialized variables to be displayed.
-; - allow_call_time_pass_reference =3D Off     [Code cleanliness]
-;     It's not possible to decide to force a variable to be passed by refe=
rence
-;     when calling a function.  The PHP 4 style to do this is by making the
-;     function require the relevant argument by reference.
-; - short_open_tag =3D Off           [Portability]
-;     Using short tags is discouraged when developing code meant for redis=
tribution
-;     since short tags may not be supported on the target server.
-
-;;;;;;;;;;;;;;;;;;;;
-; Language Options ;
-;;;;;;;;;;;;;;;;;;;;
-
-; Enable the PHP scripting language engine under Apache.
-engine =3D On
-
-; Enable compatibility mode with Zend Engine 1 (PHP 4.x)
-zend.ze1_compatibility_mode =3D Off
-
-; Allow the <? tag.  Otherwise, only <?php and <script> tags are recognize=
d.
-; NOTE: Using short tags should be avoided when developing applications or
-; libraries that are meant for redistribution, or deployment on PHP
-; servers which are not under your control, because short tags may not
-; be supported on the target server. For portable, redistributable code,
-; be sure not to use short tags.
-short_open_tag =3D Off
-
-; Allow ASP-style <% %> tags.
-asp_tags =3D Off
-
-; The number of significant digits displayed in floating point numbers.
-precision    =3D  14
-
-; Enforce year 2000 compliance (will cause problems with non-compliant bro=
wsers)
-y2k_compliance =3D On
-
-; Output buffering allows you to send header lines (including cookies) even
-; after you send body content, at the price of slowing PHP's output layer a
-; bit.  You can enable output buffering during runtime by calling the outp=
ut
-; buffering functions.  You can also enable output buffering for all files=
 by
-; setting this directive to On.  If you wish to limit the size of the buff=
er
-; to a certain size - you can use a maximum number of bytes instead of 'On=
', as
-; a value for this directive (e.g., output_buffering=3D4096).
-output_buffering =3D 4096
-
-; You can redirect all of the output of your scripts to a function.  For
-; example, if you set output_handler to "mb_output_handler", character
-; encoding will be transparently converted to the specified encoding.
-; Setting any output handler automatically turns on output buffering.
-; Note: People who wrote portable scripts should not depend on this ini
-;       directive. Instead, explicitly set the output handler using ob_sta=
rt().
-;       Using this ini directive may cause problems unless you know what s=
cript
-;       is doing.
-; Note: You cannot use both "mb_output_handler" with "ob_iconv_handler"
-;       and you cannot use both "ob_gzhandler" and "zlib.output_compressio=
n".
-; Note: output_handler must be empty if this is set 'On' !!!!
-;       Instead you must use zlib.output_handler.
-;output_handler =3D
-
-; Transparent output compression using the zlib library
-; Valid values for this option are 'off', 'on', or a specific buffer size
-; to be used for compression (default is 4KB)
-; Note: Resulting chunk size may vary due to nature of compression. PHP
-;       outputs chunks that are few hundreds bytes each as a result of
-;       compression. If you prefer a larger chunk size for better
-;       performance, enable output_buffering in addition.
-; Note: You need to use zlib.output_handler instead of the standard
-;       output_handler, or otherwise the output will be corrupted.
-zlib.output_compression =3D Off
-;zlib.output_compression_level =3D -1
-
-; You cannot specify additional output handlers if zlib.output_compression
-; is activated here. This setting does the same as output_handler but in
-; a different order.
-;zlib.output_handler =3D
-
-; Implicit flush tells PHP to tell the output layer to flush itself
-; automatically after every output block.  This is equivalent to calling t=
he
-; PHP function flush() after each and every call to print() or echo() and =
each
-; and every HTML block.  Turning this option on has serious performance
-; implications and is generally recommended for debugging purposes only.
-implicit_flush =3D Off
-
-; The unserialize callback function will be called (with the undefined cla=
ss'
-; name as parameter), if the unserializer finds an undefined class
-; which should be instantiated.
-; A warning appears if the specified function is not defined, or if the
-; function doesn't include/implement the missing class.
-; So only set this entry, if you really want to implement such a
-; callback-function.
-unserialize_callback_func=3D
-
-; When floats & doubles are serialized store serialize_precision significa=
nt
-; digits after the floating point. The default value ensures that when flo=
ats
-; are decoded with unserialize, the data will remain the same.
-serialize_precision =3D 100
-
-; Whether to enable the ability to force arguments to be passed by referen=
ce
-; at function call time.  This method is deprecated and is likely to be
-; unsupported in future versions of PHP/Zend.  The encouraged method of
-; specifying which arguments should be passed by reference is in the funct=
ion
-; declaration.  You're encouraged to try and turn this option Off and make
-; sure your scripts work properly with it in order to ensure they will work
-; with future versions of the language (you will receive a warning each ti=
me
-; you use this feature, and the argument will be passed by value instead o=
f by
-; reference).
-allow_call_time_pass_reference =3D Off
-
-;
-; Safe Mode
-;
-safe_mode =3D Off
-
-; By default, Safe Mode does a UID compare check when
-; opening files. If you want to relax this to a GID compare,
-; then turn on safe_mode_gid.
-safe_mode_gid =3D Off
-
-; When safe_mode is on, UID/GID checks are bypassed when
-; including files from this directory and its subdirectories.
-; (directory must also be in include_path or full path must
-; be used when including)
-safe_mode_include_dir =3D
-
-; When safe_mode is on, only executables located in the safe_mode_exec_dir
-; will be allowed to be executed via the exec family of functions.
-safe_mode_exec_dir =3D
-
-; Setting certain environment variables may be a potential security breach.
-; This directive contains a comma-delimited list of prefixes.  In Safe Mod=
e,
-; the user may only alter environment variables whose names begin with the
-; prefixes supplied here.  By default, users will only be able to set
-; environment variables that begin with PHP_ (e.g. PHP_FOO=3DBAR).
-;
-; Note:  If this directive is empty, PHP will let the user modify ANY
-; environment variable!
-safe_mode_allowed_env_vars =3D PHP_
-
-; This directive contains a comma-delimited list of environment variables =
that
-; the end user won't be able to change using putenv().  These variables wi=
ll be
-; protected even if safe_mode_allowed_env_vars is set to allow to change t=
hem.
-safe_mode_protected_env_vars =3D LD_LIBRARY_PATH
-
-; open_basedir, if set, limits all file operations to the defined directory
-; and below.  This directive makes most sense if used in a per-directory
-; or per-virtualhost web server configuration file. This directive is
-; *NOT* affected by whether Safe Mode is turned On or Off.
-;open_basedir =3D
-
-; This directive allows you to disable certain functions for security reas=
ons.
-; It receives a comma-delimited list of function names. This directive is
-; *NOT* affected by whether Safe Mode is turned On or Off.
-disable_functions =3D
-
-; This directive allows you to disable certain classes for security reason=
s.
-; It receives a comma-delimited list of class names. This directive is
-; *NOT* affected by whether Safe Mode is turned On or Off.
-disable_classes =3D
-
-; Colors for Syntax Highlighting mode.  Anything that's acceptable in
-; <span style=3D"color: ???????"> would work.
-;highlight.string  =3D #DD0000
-;highlight.comment =3D #FF9900
-;highlight.keyword =3D #007700
-;highlight.bg      =3D #FFFFFF
-;highlight.default =3D #0000BB
-;highlight.html    =3D #000000
-
-; If enabled, the request will be allowed to complete even if the user abo=
rts
-; the request. Consider enabling it if executing long request, which may e=
nd up
-; being interrupted by the user or a browser timing out.
-; ignore_user_abort =3D On
-
-; Determines the size of the realpath cache to be used by PHP. This value =
should
-; be increased on systems where PHP opens many files to reflect the quanti=
ty of
-; the file operations performed.
-; realpath_cache_size=3D16k
-
-; Duration of time, in seconds for which to cache realpath information for=
 a given
-; file or directory. For systems with rarely changing files, consider incr=
easing this
-; value.
-; realpath_cache_ttl=3D120
-
-;
-; Misc
-;
-; Decides whether PHP may expose the fact that it is installed on the serv=
er
-; (e.g. by adding its signature to the Web server header).  It is no secur=
ity
-; threat in any way, but it makes it possible to determine whether you use=
 PHP
-; on your server or not.
-expose_php =3D On
-
-
-;;;;;;;;;;;;;;;;;;;
-; Resource Limits ;
-;;;;;;;;;;;;;;;;;;;
-
-max_execution_time =3D 30     ; Maximum execution time of each script, in =
seconds
-max_input_time =3D 60	; Maximum amount of time each script may spend parsi=
ng request data
-;max_input_nesting_level =3D 64 ; Maximum input variable nesting level
-memory_limit =3D 128M      ; Maximum amount of memory a script may consume=
 (128MB)
-
-
-;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
-; Error handling and logging ;
-;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
-
-; error_reporting is a bit-field.  Or each number up to get desired error
-; reporting level
-; E_ALL             - All errors and warnings (doesn't include E_STRICT)
-; E_ERROR           - fatal run-time errors
-; E_RECOVERABLE_ERROR  - almost fatal run-time errors
-; E_WARNING         - run-time warnings (non-fatal errors)
-; E_PARSE           - compile-time parse errors
-; E_NOTICE          - run-time notices (these are warnings which often res=
ult
-;                     from a bug in your code, but it's possible that it w=
as
-;                     intentional (e.g., using an uninitialized variable a=
nd
-;                     relying on the fact it's automatically initialized t=
o an
-;                     empty string)
-; E_STRICT          - run-time notices, enable to have PHP suggest changes
-;                     to your code which will ensure the best interoperabi=
lity
-;                     and forward compatibility of your code
-; E_CORE_ERROR      - fatal errors that occur during PHP's initial startup
-; E_CORE_WARNING    - warnings (non-fatal errors) that occur during PHP's
-;                     initial startup
-; E_COMPILE_ERROR   - fatal compile-time errors
-; E_COMPILE_WARNING - compile-time warnings (non-fatal errors)
-; E_USER_ERROR      - user-generated error message
-; E_USER_WARNING    - user-generated warning message
-; E_USER_NOTICE     - user-generated notice message
-;
-; Examples:
-;
-;   - Show all errors, except for notices and coding standards warnings
-;
-;error_reporting =3D E_ALL & ~E_NOTICE
-;
-;   - Show all errors, except for notices
-;
-;error_reporting =3D E_ALL & ~E_NOTICE | E_STRICT
-;
-;   - Show only errors
-;
-;error_reporting =3D E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ER=
ROR
-;
-;   - Show all errors, except coding standards warnings
-;
-error_reporting =3D E_ALL
-
-; Print out errors (as a part of the output).  For production web sites,
-; you're strongly encouraged to turn this feature off, and use error loggi=
ng
-; instead (see below).  Keeping display_errors enabled on a production web=
 site
-; may reveal security information to end users, such as file paths on your=
 Web
-; server, your database schema or other information.
-;
-; possible values for display_errors:
-;
-; Off          - Do not display any errors
-; stderr       - Display errors to STDERR (affects only CGI/CLI binaries!)
-; On or stdout - Display errors to STDOUT (default)
-;
-; To output errors to STDERR with CGI/CLI:
-;display_errors =3D "stderr"
-;
-; Default
-;
-display_errors =3D Off
-
-; Even when display_errors is on, errors that occur during PHP's startup
-; sequence are not displayed.  It's strongly recommended to keep
-; display_startup_errors off, except for when debugging.
-display_startup_errors =3D Off
-
-; Log errors into a log file (server-specific log, stderr, or error_log (b=
elow))
-; As stated above, you're strongly advised to use error logging in place of
-; error displaying on production web sites.
-log_errors =3D On
-
-; Set maximum length of log_errors. In error_log information about the sou=
rce is
-; added. The default is 1024 and 0 allows to not apply any maximum length =
at all.
-log_errors_max_len =3D 1024
-
-; Do not log repeated messages. Repeated errors must occur in same file on=
 same
-; line unless ignore_repeated_source is set true.
-ignore_repeated_errors =3D Off
-
-; Ignore source of message when ignoring repeated messages. When this sett=
ing
-; is On you will not log errors with repeated messages from different file=
s or
-; source lines.
-ignore_repeated_source =3D Off
-
-; If this parameter is set to Off, then memory leaks will not be shown (on
-; stdout or in the log). This has only effect in a debug compile, and if
-; error reporting includes E_WARNING in the allowed list
-report_memleaks =3D On
-
-;report_zend_debug =3D 0
-
-; Store the last error/warning message in $php_errormsg (boolean).
-track_errors =3D Off
-
-; Turn off normal error reporting and emit XML-RPC error XML
-;xmlrpc_errors =3D 0
-; An XML-RPC faultCode
-;xmlrpc_error_number =3D 0
-
-; Disable the inclusion of HTML tags in error messages.
-; Note: Never use this feature for production boxes.
-;html_errors =3D Off
-
-; If html_errors is set On PHP produces clickable error messages that dire=
ct
-; to a page describing the error or function causing the error in detail.
-; You can download a copy of the PHP manual from http://www.php.net/docs.p=
hp
-; and change docref_root to the base URL of your local copy including the
-; leading '/'. You must also specify the file extension being used includi=
ng
-; the dot.
-; Note: Never use this feature for production boxes.
-;docref_root =3D "/phpmanual/"
-;docref_ext =3D .html
-
-; String to output before an error message.
-;error_prepend_string =3D "<font color=3D#ff0000>"
-
-; String to output after an error message.
-;error_append_string =3D "</font>"
-
-; Log errors to specified file.
-;error_log =3D filename
-
-; Log errors to syslog (Event Log on NT, not valid in Windows 95).
-;error_log =3D syslog
-
-
-;;;;;;;;;;;;;;;;;
-; Data Handling ;
-;;;;;;;;;;;;;;;;;
-;
-; Note - track_vars is ALWAYS enabled as of PHP 4.0.3
-
-; The separator used in PHP generated URLs to separate arguments.
-; Default is "&".
-;arg_separator.output =3D "&amp;"
-
-; List of separator(s) used by PHP to parse input URLs into variables.
-; Default is "&".
-; NOTE: Every character in this directive is considered as separator!
-;arg_separator.input =3D ";&"
-
-; This directive describes the order in which PHP registers GET, POST, Coo=
kie,
-; Environment and Built-in variables (G, P, C, E & S respectively, often
-; referred to as EGPCS or GPC).  Registration is done from left to right, =
newer
-; values override older values.
-variables_order =3D "GPCS"
-
-; Whether or not to register the EGPCS variables as global variables.  You=
 may
-; want to turn this off if you don't want to clutter your scripts' global =
scope
-; with user data.  This makes most sense when coupled with track_vars - in=
 which
-; case you can access all of the GPC variables through the $HTTP_*_VARS[],
-; variables.
-;
-; You should do your best to write your scripts so that they do not require
-; register_globals to be on;  Using form variables as globals can easily l=
ead
-; to possible security problems, if the code is not very well thought of.
-register_globals =3D Off
-
-; Whether or not to register the old-style input arrays, HTTP_GET_VARS
-; and friends.  If you're not using them, it's recommended to turn them of=
f,
-; for performance reasons.
-register_long_arrays =3D Off
-
-; This directive tells PHP whether to declare the argv&argc variables (that
-; would contain the GET information).  If you don't use these variables, y=
ou
-; should turn it off for increased performance.
-register_argc_argv =3D Off
-
-; When enabled, the SERVER and ENV variables are created when they're first
-; used (Just In Time) instead of when the script starts. If these variables
-; are not used within a script, having this directive on will result in a
-; performance gain. The PHP directives register_globals, register_long_arr=
ays,
-; and register_argc_argv must be disabled for this directive to have any a=
ffect.
-auto_globals_jit =3D On
-
-; Maximum size of POST data that PHP will accept.
-post_max_size =3D 8M
-
-; Magic quotes
-;
-
-; Magic quotes for incoming GET/POST/Cookie data.
-magic_quotes_gpc =3D Off
-
-; Magic quotes for runtime-generated data, e.g. data from SQL, from exec()=
, etc.
-magic_quotes_runtime =3D Off
-
-; Use Sybase-style magic quotes (escape ' with '' instead of \').
-magic_quotes_sybase =3D Off
-
-; Automatically add files before or after any PHP document.
-auto:prepend_file =3D
-auto_append_file =3D
-
-; As of 4.0b4, PHP always outputs a character encoding by default in
-; the Content-type: header.  To disable sending of the charset, simply
-; set it to be empty.
-;
-; PHP's built-in default is text/html
-default_mimetype =3D "text/html"
-;default_charset =3D "iso-8859-1"
-
-; Always populate the $HTTP_RAW_POST_DATA variable.
-;always_populate_raw_post_data =3D On
-
-
-;;;;;;;;;;;;;;;;;;;;;;;;;
-; Paths and Directories ;
-;;;;;;;;;;;;;;;;;;;;;;;;;
-
-; UNIX: "/path1:/path2"
-;include_path =3D ".:/php/includes"
-;
-; Windows: "\path1;\path2"
-;include_path =3D ".;c:\php\includes"
-
-; The root of the PHP pages, used only if nonempty.
-; if PHP was not compiled with FORCE_REDIRECT, you SHOULD set doc_root
-; if you are running php as a CGI under any web server (other than IIS)
-; see documentation for security issues.  The alternate is to use the
-; cgi.force_redirect configuration below
-doc_root =3D
-
-; The directory under which PHP opens the script using /~username used only
-; if nonempty.
-user_dir =3D
-
-; Directory in which the loadable extensions (modules) reside.
-extension_dir =3D "./"
-
-; Whether or not to enable the dl() function.  The dl() function does NOT =
work
-; properly in multithreaded servers, such as IIS or Zeus, and is automatic=
ally
-; disabled on them.
-enable_dl =3D On
-
-; cgi.force_redirect is necessary to provide security running PHP as a CGI=
 under
-; most web servers.  Left undefined, PHP turns this on by default.  You can
-; turn it off here AT YOUR OWN RISK
-; **You CAN safely turn this off for IIS, in fact, you MUST.**
-; cgi.force_redirect =3D 1
-
-; if cgi.nph is enabled it will force cgi to always sent Status: 200 with
-; every request.
-; cgi.nph =3D 1
-
-; if cgi.force_redirect is turned on, and you are not running under Apache=
 or Netscape
-; (iPlanet) web servers, you MAY need to set an environment variable name =
that PHP
-; will look for to know it is OK to continue execution.  Setting this vari=
able MAY
-; cause security issues, KNOW WHAT YOU ARE DOING FIRST.
-; cgi.redirect_status_env =3D ;
-
-; cgi.fix_pathinfo provides *real* PATH_INFO/PATH_TRANSLATED support for C=
GI.  PHP's
-; previous behaviour was to set PATH_TRANSLATED to SCRIPT_FILENAME, and to=
 not grok
-; what PATH_INFO is.  For more information on PATH_INFO, see the cgi specs=
.  Setting
-; this to 1 will cause PHP CGI to fix it's paths to conform to the spec.  =
A setting
-; of zero causes PHP to behave as before.  Default is 1.  You should fix y=
our scripts
-; to use SCRIPT_FILENAME rather than PATH_TRANSLATED.
- cgi.fix_pathinfo=3D1
-
-; FastCGI under IIS (on WINNT based OS) supports the ability to impersonate
-; security tokens of the calling client.  This allows IIS to define the
-; security context that the request runs under.  mod_fastcgi under Apache
-; does not currently support this feature (03/17/2002)
-; Set to 1 if running under IIS.  Default is zero.
-; fastcgi.impersonate =3D 1;
-
-; Disable logging through FastCGI connection
-; fastcgi.logging =3D 0
-
-; cgi.rfc2616_headers configuration option tells PHP what type of headers =
to
-; use when sending HTTP response code. If it's set 0 PHP sends Status: hea=
der that
-; is supported by Apache. When this option is set to 1 PHP will send
-; RFC2616 compliant header.
-; Default is zero.
-;cgi.rfc2616_headers =3D 0
-
-
-;;;;;;;;;;;;;;;;
-; File Uploads ;
-;;;;;;;;;;;;;;;;
-
-; Whether to allow HTTP file uploads.
-file_uploads =3D On
-
-; Temporary directory for HTTP uploaded files (will use system default if =
not
-; specified).
-;upload_tmp_dir =3D
-
-; Maximum allowed size for uploaded files.
-upload_max_filesize =3D 2M
-
-
-; Maximum number of files that can be uploaded via a single request
-max_file_uploads =3D 20
-
-;;;;;;;;;;;;;;;;;;
-; Fopen wrappers ;
-;;;;;;;;;;;;;;;;;;
-
-; Whether to allow the treatment of URLs (like http:// or ftp://) as files.
-allow_url_fopen =3D On
-
-; Whether to allow include/require to open URLs (like http:// or ftp://) a=
s files.
-allow_url_include =3D Off
-
-; Define the anonymous ftp password (your email address)
-;from=3D"john@doe.com"
-
-; Define the User-Agent string
-; user_agent=3D"PHP"
-
-; Default timeout for socket based streams (seconds)
-default_socket_timeout =3D 60
-
-; If your scripts have to deal with files from Macintosh systems,
-; or you are running on a Mac and need to deal with files from
-; unix or win32 systems, setting this flag will cause PHP to
-; automatically detect the EOL character in those files so that
-; fgets() and file() will work regardless of the source of the file.
-; auto_detect_line_endings =3D Off
-
-
-;;;;;;;;;;;;;;;;;;;;;;
-; Dynamic Extensions ;
-;;;;;;;;;;;;;;;;;;;;;;
-;
-; If you wish to have an extension loaded automatically, use the following
-; syntax:
-;
-;   extension=3Dmodulename.extension
-;
-; For example, on Windows:
-;
-;   extension=3Dmsql.dll
-;
-; ... or under UNIX:
-;
-;   extension=3Dmsql.so
-;
-; Note that it should be the name of the module only; no directory informa=
tion
-; needs to go here.  Specify the location of the extension with the
-; extension_dir directive above.
-
-
-; Windows Extensions
-; Note that ODBC support is built in, so no dll is needed for it.
-; Note that many DLL files are located in the extensions/ (PHP 4) ext/ (PH=
P 5)
-; extension folders as well as the separate PECL DLL download (PHP 5).
-; Be sure to appropriately set the extension_dir directive.
-
-;extension=3Dphp_bz2.dll
-;extension=3Dphp_curl.dll
-;extension=3Dphp_dba.dll
-;extension=3Dphp_dbase.dll
-;extension=3Dphp_exif.dll
-;extension=3Dphp_fdf.dll
-;extension=3Dphp_gd2.dll
-;extension=3Dphp_gettext.dll
-;extension=3Dphp_gmp.dll
-;extension=3Dphp_ifx.dll
-;extension=3Dphp_imap.dll
-;extension=3Dphp_interbase.dll
-;extension=3Dphp_ldap.dll
-;extension=3Dphp_mbstring.dll
-;extension=3Dphp_mcrypt.dll
-;extension=3Dphp_mhash.dll
-;extension=3Dphp_mime_magic.dll
-;extension=3Dphp_ming.dll
-;extension=3Dphp_msql.dll
-;extension=3Dphp_mssql.dll
-;extension=3Dphp_mysql.dll
-;extension=3Dphp_mysqli.dll
-;extension=3Dphp_oci8.dll
-;extension=3Dphp_openssl.dll
-;extension=3Dphp_pdo.dll
-;extension=3Dphp_pdo_firebird.dll
-;extension=3Dphp_pdo_mssql.dll
-;extension=3Dphp_pdo_mysql.dll
-;extension=3Dphp_pdo_oci.dll
-;extension=3Dphp_pdo_oci8.dll
-;extension=3Dphp_pdo_odbc.dll
-;extension=3Dphp_pdo_pgsql.dll
-;extension=3Dphp_pdo_sqlite.dll
-;extension=3Dphp_pgsql.dll
-;extension=3Dphp_pspell.dll
-;extension=3Dphp_shmop.dll
-;extension=3Dphp_snmp.dll
-;extension=3Dphp_soap.dll
-;extension=3Dphp_sockets.dll
-;extension=3Dphp_sqlite.dll
-;extension=3Dphp_sybase_ct.dll
-;extension=3Dphp_tidy.dll
-;extension=3Dphp_xmlrpc.dll
-;extension=3Dphp_xsl.dll
-;extension=3Dphp_zip.dll
-
-;;;;;;;;;;;;;;;;;;;
-; Module Settings ;
-;;;;;;;;;;;;;;;;;;;
-
-[Date]
-; Defines the default timezone used by the date functions
-;date.timezone =3D
-
-;date.default_latitude =3D 31.7667
-;date.default_longitude =3D 35.2333
-
-;date.sunrise_zenith =3D 90.583333
-;date.sunset_zenith =3D 90.583333
-
-[filter]
-;filter.default =3D unsafe_raw
-;filter.default_flags =3D
-
-[iconv]
-;iconv.input_encoding =3D ISO-8859-1
-;iconv.internal_encoding =3D ISO-8859-1
-;iconv.output_encoding =3D ISO-8859-1
-
-[sqlite]
-;sqlite.assoc_case =3D 0
-
-[Pcre]
-;PCRE library backtracking limit.
-;pcre.backtrack_limit=3D100000
-
-;PCRE library recursion limit.
-;Please note that if you set this value to a high number you may consume a=
ll
-;the available process stack and eventually crash PHP (due to reaching the
-;stack size limit imposed by the Operating System).
-;pcre.recursion_limit=3D100000
-
-[Syslog]
-; Whether or not to define the various syslog variables (e.g. $LOG_PID,
-; $LOG_CRON, etc.).  Turning it off is a good idea performance-wise.  In
-; runtime, you can define these variables by calling define_syslog_variabl=
es().
-define_syslog_variables  =3D Off
-
-[mail function]
-; For Win32 only.
-SMTP =3D localhost
-smtp_port =3D 25
-
-; For Win32 only.
-;sendmail_from =3D me@example.com
-
-; For Unix only.  You may supply arguments as well (default: "sendmail -t =
-i").
-;sendmail_path =3D
-
-; Force the addition of the specified parameters to be passed as extra par=
ameters
-; to the sendmail binary. These parameters will always replace the value of
-; the 5th parameter to mail(), even in safe mode.
-;mail.force_extra_parameters =3D
-
-[SQL]
-sql.safe_mode =3D Off
-
-[ODBC]
-;odbc.default_db    =3D  Not yet implemented
-;odbc.default_user  =3D  Not yet implemented
-;odbc.default_pw    =3D  Not yet implemented
-
-; Allow or prevent persistent links.
-odbc.allow_persistent =3D On
-
-; Check that a connection is still valid before reuse.
-odbc.check_persistent =3D On
-
-; Maximum number of persistent links.  -1 means no limit.
-odbc.max_persistent =3D -1
-
-; Maximum number of links (persistent + non-persistent).  -1 means no limi=
t.
-odbc.max_links =3D -1
-
-; Handling of LONG fields.  Returns number of bytes to variables.  0 means
-; passthru.
-odbc.defaultlrl =3D 4096
-
-; Handling of binary data.  0 means passthru, 1 return as is, 2 convert to=
 char.
-; See the documentation on odbc_binmode and odbc_longreadlen for an explan=
ation
-; of uodbc.defaultlrl and uodbc.defaultbinmode
-odbc.defaultbinmode =3D 1
-
-[MySQL]
-; Allow or prevent persistent links.
-mysql.allow_persistent =3D On
-
-; Maximum number of persistent links.  -1 means no limit.
-mysql.max_persistent =3D -1
-
-; Maximum number of links (persistent + non-persistent).  -1 means no limi=
t.
-mysql.max_links =3D -1
-
-; Default port number for mysql_connect().  If unset, mysql_connect() will=
 use
-; the $MYSQL_TCP_PORT or the mysql-tcp entry in /etc/services or the
-; compile-time value defined MYSQL_PORT (in that order).  Win32 will only =
look
-; at MYSQL_PORT.
-mysql.default_port =3D
-
-; Default socket name for local MySQL connects.  If empty, uses the built-=
in
-; MySQL defaults.
-mysql.default_socket =3D
-
-; Default host for mysql_connect() (doesn't apply in safe mode).
-mysql.default_host =3D
-
-; Default user for mysql_connect() (doesn't apply in safe mode).
-mysql.default_user =3D
-
-; Default password for mysql_connect() (doesn't apply in safe mode).
-; Note that this is generally a *bad* idea to store passwords in this file.
-; *Any* user with PHP access can run 'echo get_cfg_var("mysql.default_pass=
word")
-; and reveal this password!  And of course, any users with read access to =
this
-; file will be able to reveal the password as well.
-mysql.default_password =3D
-
-; Maximum time (in seconds) for connect timeout. -1 means no limit
-mysql.connect_timeout =3D 60
-
-; Trace mode. When trace_mode is active (=3DOn), warnings for table/index =
scans and
-; SQL-Errors will be displayed.
-mysql.trace_mode =3D Off
-
-[MySQLi]
-
-; Maximum number of links.  -1 means no limit.
-mysqli.max_links =3D -1
-
-; Default port number for mysqli_connect().  If unset, mysqli_connect() wi=
ll use
-; the $MYSQL_TCP_PORT or the mysql-tcp entry in /etc/services or the
-; compile-time value defined MYSQL_PORT (in that order).  Win32 will only =
look
-; at MYSQL_PORT.
-mysqli.default_port =3D 3306
-
-; Default socket name for local MySQL connects.  If empty, uses the built-=
in
-; MySQL defaults.
-mysqli.default_socket =3D
-
-; Default host for mysql_connect() (doesn't apply in safe mode).
-mysqli.default_host =3D
-
-; Default user for mysql_connect() (doesn't apply in safe mode).
-mysqli.default_user =3D
-
-; Default password for mysqli_connect() (doesn't apply in safe mode).
-; Note that this is generally a *bad* idea to store passwords in this file.
-; *Any* user with PHP access can run 'echo get_cfg_var("mysqli.default_pw")
-; and reveal this password!  And of course, any users with read access to =
this
-; file will be able to reveal the password as well.
-mysqli.default_pw =3D
-
-; Allow or prevent reconnect
-mysqli.reconnect =3D Off
-
-[mSQL]
-; Allow or prevent persistent links.
-msql.allow_persistent =3D On
-
-; Maximum number of persistent links.  -1 means no limit.
-msql.max_persistent =3D -1
-
-; Maximum number of links (persistent+non persistent).  -1 means no limit.
-msql.max_links =3D -1
-
-[OCI8]
-; enables privileged connections using external credentials (OCI_SYSOPER, =
OCI_SYSDBA)
-;oci8.privileged_connect =3D Off
-
-; Connection: The maximum number of persistent OCI8 connections per
-; process. Using -1 means no limit.
-;oci8.max_persistent =3D -1
-
-; Connection: The maximum number of seconds a process is allowed to
-; maintain an idle persistent connection. Using -1 means idle
-; persistent connections will be maintained forever.
-;oci8.persistent_timeout =3D -1
-
-; Connection: The number of seconds that must pass before issuing a
-; ping during oci_pconnect() to check the connection validity. When
-; set to 0, each oci_pconnect() will cause a ping. Using -1 disables
-; pings completely.
-;oci8.ping_interval =3D 60
-
-; Tuning: This option enables statement caching, and specifies how
-; many statements to cache. Using 0 disables statement caching.
-;oci8.statement_cache_size =3D 20
-
-; Tuning: Enables statement prefetching and sets the default number of
-; rows that will be fetched automatically after statement execution.
-;oci8.default_prefetch =3D 10
-
-; Compatibility. Using On means oci_close() will not close
-; oci_connect() and oci_new_connect() connections.
-;oci8.old_oci_close_semantics =3D Off
-
-[PostgresSQL]
-; Allow or prevent persistent links.
-pgsql.allow_persistent =3D On
-
-; Detect broken persistent links always with pg_pconnect().
-; Auto reset feature requires a little overheads.
-pgsql.auto_reset_persistent =3D Off
-
-; Maximum number of persistent links.  -1 means no limit.
-pgsql.max_persistent =3D -1
-
-; Maximum number of links (persistent+non persistent).  -1 means no limit.
-pgsql.max_links =3D -1
-
-; Ignore PostgreSQL backends Notice message or not.
-; Notice message logging require a little overheads.
-pgsql.ignore_notice =3D 0
-
-; Log PostgreSQL backends Notice message or not.
-; Unless pgsql.ignore_notice=3D0, module cannot log notice message.
-pgsql.log_notice =3D 0
-
-[Sybase]
-; Allow or prevent persistent links.
-sybase.allow_persistent =3D On
-
-; Maximum number of persistent links.  -1 means no limit.
-sybase.max_persistent =3D -1
-
-; Maximum number of links (persistent + non-persistent).  -1 means no limi=
t.
-sybase.max_links =3D -1
-
-;sybase.interface_file =3D "/usr/sybase/interfaces"
-
-; Minimum error severity to display.
-sybase.min_error_severity =3D 10
-
-; Minimum message severity to display.
-sybase.min_message_severity =3D 10
-
-; Compatibility mode with old versions of PHP 3.0.
-; If on, this will cause PHP to automatically assign types to results acco=
rding
-; to their Sybase type, instead of treating them all as strings.  This
-; compatibility mode will probably not stay around forever, so try applying
-; whatever necessary changes to your code, and turn it off.
-sybase.compatability_mode =3D Off
-
-[Sybase-CT]
-; Allow or prevent persistent links.
-sybct.allow_persistent =3D On
-
-; Maximum number of persistent links.  -1 means no limit.
-sybct.max_persistent =3D -1
-
-; Maximum number of links (persistent + non-persistent).  -1 means no limi=
t.
-sybct.max_links =3D -1
-
-; Minimum server message severity to display.
-sybct.min_server_severity =3D 10
-
-; Minimum client message severity to display.
-sybct.min_client_severity =3D 10
-
-[bcmath]
-; Number of decimal digits for all bcmath functions.
-bcmath.scale =3D 0
-
-[browscap]
-;browscap =3D extra/browscap.ini
-
-[Informix]
-; Default host for ifx_connect() (doesn't apply in safe mode).
-ifx.default_host =3D
-
-; Default user for ifx_connect() (doesn't apply in safe mode).
-ifx.default_user =3D
-
-; Default password for ifx_connect() (doesn't apply in safe mode).
-ifx.default_password =3D
-
-; Allow or prevent persistent links.
-ifx.allow_persistent =3D On
-
-; Maximum number of persistent links.  -1 means no limit.
-ifx.max_persistent =3D -1
-
-; Maximum number of links (persistent + non-persistent).  -1 means no limi=
t.
-ifx.max_links =3D -1
-
-; If on, select statements return the contents of a text blob instead of i=
ts id.
-ifx.textasvarchar =3D 0
-
-; If on, select statements return the contents of a byte blob instead of i=
ts id.
-ifx.byteasvarchar =3D 0
-
-; Trailing blanks are stripped from fixed-length char columns.  May help t=
he
-; life of Informix SE users.
-ifx.charasvarchar =3D 0
-
-; If on, the contents of text and byte blobs are dumped to a file instead =
of
-; keeping them in memory.
-ifx.blobinfile =3D 0
-
-; NULL's are returned as empty strings, unless this is set to 1.  In that =
case,
-; NULL's are returned as string 'NULL'.
-ifx.nullformat =3D 0
-
-[Session]
-; Handler used to store/retrieve data.
-session.save_handler =3D files
-
-; Argument passed to save_handler.  In the case of files, this is the path
-; where data files are stored. Note: Windows users have to change this
-; variable in order to use PHP's session functions.
-;
-; As of PHP 4.0.1, you can define the path as:
-;
-;     session.save_path =3D "N;/path"
-;
-; where N is an integer.  Instead of storing all the session files in
-; /path, what this will do is use subdirectories N-levels deep, and
-; store the session data in those directories.  This is useful if you
-; or your OS have problems with lots of files in one directory, and is
-; a more efficient layout for servers that handle lots of sessions.
-;
-; NOTE 1: PHP will not create this directory structure automatically.
-;         You can use the script in the ext/session dir for that purpose.
-; NOTE 2: See the section on garbage collection below if you choose to
-;         use subdirectories for session storage
-;
-; The file storage module creates files using mode 600 by default.
-; You can change that by using
-;
-;     session.save_path =3D "N;MODE;/path"
-;
-; where MODE is the octal representation of the mode. Note that this
-; does not overwrite the process's umask.
-;session.save_path =3D "/tmp"
-
-; Whether to use cookies.
-session.use_cookies =3D 1
-
-;session.cookie_secure =3D
-
-; This option enables administrators to make their users invulnerable to
-; attacks which involve passing session ids in URLs; defaults to 0.
-; session.use_only_cookies =3D 1
-
-; Name of the session (used as cookie name).
-session.name =3D PHPSESSID
-
-; Initialize session on request startup.
-session.auto_start =3D 0
-
-; Lifetime in seconds of cookie or, if 0, until browser is restarted.
-session.cookie_lifetime =3D 0
-
-; The path for which the cookie is valid.
-session.cookie_path =3D /
-
-; The domain for which the cookie is valid.
-session.cookie_domain =3D
-
-; Whether or not to add the httpOnly flag to the cookie, which makes it in=
accessible to browser scripting languages such as JavaScript.
-session.cookie_httponly =3D
-
-; Handler used to serialize data.  php is the standard serializer of PHP.
-session.serialize_handler =3D php
-
-; Define the probability that the 'garbage collection' process is started
-; on every session initialization.
-; The probability is calculated by using gc_probability/gc_divisor,
-; e.g. 1/100 means there is a 1% chance that the GC process starts
-; on each request.
-
-session.gc_probability =3D 1
-session.gc_divisor     =3D 1000
-
-; After this number of seconds, stored data will be seen as 'garbage' and
-; cleaned up by the garbage collection process.
-session.gc_maxlifetime =3D 1440
-
-; NOTE: If you are using the subdirectory option for storing session files
-;       (see session.save_path above), then garbage collection does *not*
-;       happen automatically.  You will need to do your own garbage
-;       collection through a shell script, cron entry, or some other metho=
d.
-;       For example, the following script would is the equivalent of
-;       setting session.gc_maxlifetime to 1440 (1440 seconds =3D 24 minute=
s):
-;          cd /path/to/sessions; find -cmin +24 | xargs rm
-
-; PHP 4.2 and less have an undocumented feature/bug that allows you to
-; to initialize a session variable in the global scope, albeit register_gl=
obals
-; is disabled.  PHP 4.3 and later will warn you, if this feature is used.
-; You can disable the feature and the warning separately. At this time,
-; the warning is only displayed, if bug_compat_42 is enabled.
-
-session.bug_compat_42 =3D 0
-session.bug_compat_warn =3D 1
-
-; Check HTTP Referer to invalidate externally stored URLs containing ids.
-; HTTP_REFERER has to contain this substring for the session to be
-; considered as valid.
-session.referer_check =3D
-
-; How many bytes to read from the file.
-session.entropy_length =3D 0
-
-; Specified here to create the session id.
-session.entropy_file =3D
-
-;session.entropy_length =3D 16
-
-;session.entropy_file =3D /dev/urandom
-
-; Set to {nocache,private,public,} to determine HTTP caching aspects
-; or leave this empty to avoid sending anti-caching headers.
-session.cache_limiter =3D nocache
-
-; Document expires after n minutes.
-session.cache_expire =3D 180
-
-; trans sid support is disabled by default.
-; Use of trans sid may risk your users security.
-; Use this option with caution.
-; - User may send URL contains active session ID
-;   to other person via. email/irc/etc.
-; - URL that contains active session ID may be stored
-;   in publically accessible computer.
-; - User may access your site with the same session ID
-;   always using URL stored in browser's history or bookmarks.
-session.use_trans_sid =3D 0
-
-; Select a hash function
-; 0: MD5   (128 bits)
-; 1: SHA-1 (160 bits)
-session.hash_function =3D 0
-
-; Define how many bits are stored in each character when converting
-; the binary hash data to something readable.
-;
-; 4 bits: 0-9, a-f
-; 5 bits: 0-9, a-v
-; 6 bits: 0-9, a-z, A-Z, "-", ","
-session.hash_bits_per_character =3D 5
-
-; The URL rewriter will look for URLs in a defined set of HTML tags.
-; form/fieldset are special; if you include them here, the rewriter will
-; add a hidden <input> field with the info which is otherwise appended
-; to URLs.  If you want XHTML conformity, remove the form entry.
-; Note that all valid entries require a "=3D", even if no value follows.
-url_rewriter.tags =3D "a=3Dhref,area=3Dhref,frame=3Dsrc,input=3Dsrc,form=
=3Dfakeentry"
-
-[MSSQL]
-; Allow or prevent persistent links.
-mssql.allow_persistent =3D On
-
-; Maximum number of persistent links.  -1 means no limit.
-mssql.max_persistent =3D -1
-
-; Maximum number of links (persistent+non persistent).  -1 means no limit.
-mssql.max_links =3D -1
-
-; Minimum error severity to display.
-mssql.min_error_severity =3D 10
-
-; Minimum message severity to display.
-mssql.min_message_severity =3D 10
-
-; Compatibility mode with old versions of PHP 3.0.
-mssql.compatability_mode =3D Off
-
-; Connect timeout
-;mssql.connect_timeout =3D 5
-
-; Query timeout
-;mssql.timeout =3D 60
-
-; Valid range 0 - 2147483647.  Default =3D 4096.
-;mssql.textlimit =3D 4096
-
-; Valid range 0 - 2147483647.  Default =3D 4096.
-;mssql.textsize =3D 4096
-
-; Limits the number of records in each batch.  0 =3D all records in one ba=
tch.
-;mssql.batchsize =3D 0
-
-; Specify how datetime and datetim4 columns are returned
-; On =3D> Returns data converted to SQL server settings
-; Off =3D> Returns values as YYYY-MM-DD hh:mm:ss
-;mssql.datetimeconvert =3D On
-
-; Use NT authentication when connecting to the server
-mssql.secure_connection =3D Off
-
-; Specify max number of processes. -1 =3D library default
-; msdlib defaults to 25
-; FreeTDS defaults to 4096
-;mssql.max_procs =3D -1
-
-; Specify client character set.
-; If empty or not set the client charset from freetds.comf is used
-; This is only used when compiled with FreeTDS
-;mssql.charset =3D "ISO-8859-1"
-
-[Assertion]
-; Assert(expr); active by default.
-;assert.active =3D On
-
-; Issue a PHP warning for each failed assertion.
-;assert.warning =3D On
-
-; Don't bail out by default.
-;assert.bail =3D Off
-
-; User-function to be called if an assertion fails.
-;assert.callback =3D 0
-
-; Eval the expression with current error_reporting().  Set to true if you =
want
-; error_reporting(0) around the eval().
-;assert.quiet_eval =3D 0
-
-[COM]
-; path to a file containing GUIDs, IIDs or filenames of files with TypeLibs
-;com.typelib_file =3D
-; allow Distributed-COM calls
-;com.allow_dcom =3D true
-; autoregister constants of a components typlib on com_load()
-;com.autoregister_typelib =3D true
-; register constants casesensitive
-;com.autoregister_casesensitive =3D false
-; show warnings on duplicate constant registrations
-;com.autoregister_verbose =3D true
-
-[mbstring]
-; language for internal character representation.
-;mbstring.language =3D Japanese
-
-; internal/script encoding.
-; Some encoding cannot work as internal encoding.
-; (e.g. SJIS, BIG5, ISO-2022-*)
-;mbstring.internal_encoding =3D EUC-JP
-
-; http input encoding.
-;mbstring.http_input =3D auto
-
-; http output encoding. mb_output_handler must be
-; registered as output buffer to function
-;mbstring.http_output =3D SJIS
-
-; enable automatic encoding translation according to
-; mbstring.internal_encoding setting. Input chars are
-; converted to internal encoding by setting this to On.
-; Note: Do _not_ use automatic encoding translation for
-;       portable libs/applications.
-;mbstring.encoding_translation =3D Off
-
-; automatic encoding detection order.
-; auto means
-;mbstring.detect_order =3D auto
-
-; substitute_character used when character cannot be converted
-; one from another
-;mbstring.substitute_character =3D none;
-
-; overload(replace) single byte functions by mbstring functions.
-; mail(), ereg(), etc are overloaded by mb_send_mail(), mb_ereg(),
-; etc. Possible values are 0,1,2,4 or combination of them.
-; For example, 7 for overload everything.
-; 0: No overload
-; 1: Overload mail() function
-; 2: Overload str*() functions
-; 4: Overload ereg*() functions
-;mbstring.func_overload =3D 0
-
-; enable strict encoding detection.
-;mbstring.strict_detection =3D Off
-
-[FrontBase]
-;fbsql.allow_persistent =3D On
-;fbsql.autocommit =3D On
-;fbsql.show_timestamp_decimals =3D Off
-;fbsql.default_database =3D
-;fbsql.default_database_password =3D
-;fbsql.default_host =3D
-;fbsql.default_password =3D
-;fbsql.default_user =3D "_SYSTEM"
-;fbsql.generate_warnings =3D Off
-;fbsql.max_connections =3D 128
-;fbsql.max_links =3D 128
-;fbsql.max_persistent =3D -1
-;fbsql.max_results =3D 128
-
-[gd]
-; Tell the jpeg decode to libjpeg warnings and try to create
-; a gd image. The warning will then be displayed as notices
-; disabled by default
-;gd.jpeg_ignore_warning =3D 0
-
-[exif]
-; Exif UNICODE user comments are handled as UCS-2BE/UCS-2LE and JIS as JIS.
-; With mbstring support this will automatically be converted into the enco=
ding
-; given by corresponding encode setting. When empty mbstring.internal_enco=
ding
-; is used. For the decode settings you can distinguish between motorola and
-; intel byte order. A decode setting cannot be empty.
-;exif.encode_unicode =3D ISO-8859-15
-;exif.decode_unicode_motorola =3D UCS-2BE
-;exif.decode_unicode_intel    =3D UCS-2LE
-;exif.encode_jis =3D
-;exif.decode_jis_motorola =3D JIS
-;exif.decode_jis_intel    =3D JIS
-
-[Tidy]
-; The path to a default tidy configuration file to use when using tidy
-;tidy.default_config =3D /usr/local/lib/php/default.tcfg
-
-; Should tidy clean and repair output automatically?
-; WARNING: Do not use this option if you are generating non-html content
-; such as dynamic images
-tidy.clean_output =3D Off
-
-zlib.output_compression =3D On
-
-[soap]
-; Enables or disables WSDL caching feature.
-soap.wsdl_cache_enabled=3D1
-; Sets the directory name where SOAP extension will put cache files.
-soap.wsdl_cache_dir=3D"/tmp"
-; (time to live) Sets the number of second while cached file will be used
-; instead of original one.
-soap.wsdl_cache_ttl=3D86400
-
-; Local Variables:
-; tab-width: 4
-; End:
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb b/meta-=
arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
deleted file mode 100644
index fbff1671..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-DESCRIPTION =3D "Matrix GUI Application launcher"
-
-LICENSE =3D "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5=
d"
-
-SECTION =3D "multimedia"
-
-PR =3D "r38"
-
-SYSTEMD_SERVICE:${PN} =3D "matrix-gui-2.0.service"
-
-SYSTEMD_AUTO_ENABLE:am62xx =3D "disable"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit systemd
-
-BRANCH ?=3D "master"
-SRCREV =3D "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
-
-MATRIX_INITSCRIPT =3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'init', 'init.eglfs', d)}"
-
-SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2.git;protocol=
=3Dhttps;branch=3D${BRANCH} \
-           file://${MATRIX_INITSCRIPT} \
-           file://php.ini \
-           file://matrix-gui-2.0.service \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', \
-                'file://0001-execute_command-workaround-for-GUI-apps-with-=
weston.patch', \
-                'file://0001-execute_command-Stop-matrix-when-running-a-GU=
I-demo.patch', d)} \
-"
-
-require matrix-gui-paths.inc
-
-S =3D "${WORKDIR}/git"
-
-MATRIX_FLAGS =3D ""
-SWITCH_FOREGROUND_VT =3D ""
-
-do_install(){
-	install -d ${D}${MATRIX_BASE_DIR}
-	install -d ${D}${MATRIX_WEB_DIR}
-	cp -rfL ${S}/* ${D}${MATRIX_WEB_DIR}
-
-	# Install our php.ini file
-	install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
-
-	# Set the proper path in the init script
-	sed -i -e s=3D__MATRIX_WEB_DIR__=3D${MATRIX_WEB_DIR}=3D ${WORKDIR}/${MATR=
IX_INITSCRIPT}
-	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/${MATRIX_I=
NITSCRIPT}
-	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR=
}/${MATRIX_INITSCRIPT}
-
-	# Install the script
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d=
)}; then
-		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d=
/matrix-gui-2.0
-	fi
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
}; then
-		install -d ${D}${systemd_system_unitdir}
-		install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_u=
nitdir}
-		install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${MATRIX_BASE_DIR}/m=
atrix-gui-2.0
-	fi
-}
-
-GUIDEPS =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl',"matrix-gui-b=
rowser refresh-screen",'',d)}"
-GUIDEPS:omapl138 =3D ""
-
-RDEPENDS:${PN} +=3D "matrix-lighttpd-config lighttpd lighttpd-module-cgi l=
ighttpd-module-deflate php php-cgi php-cli ${GUIDEPS}"
-
-FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb=
 b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
deleted file mode 100644
index c932e67f..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION =3D "Lighttpd config for Matrix"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4dac5c6ab169aa212feb5028853a57=
9"
-
-inherit allarch
-
-PR =3D "r2"
-
-SRC_URI =3D "file://lighttpd.conf.matrix"
-
-# Grabbed COPYING file from lighttpd_1.4.30
-SRC_URI +=3D "file://COPYING"
-
-S =3D "${WORKDIR}"
-
-do_install() {
-	install -d ${D}${sysconfdir}/lighttpd
-	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttp=
d/lighttpd.conf.matrix
-}
-
-FILES:${PN} =3D "${sysconfdir}/lighttpd/lighttpd.conf.matrix"
-RDEPENDS:${PN} =3D "lighttpd"
-
-pkg_postinst_ontarget:${PN} () {
-if [ -f ${sysconfdir}/lighttpd/lighttpd.conf ] ; then
-	cp ${sysconfdir}/lighttpd/lighttpd.conf.matrix ${sysconfdir}/lighttpd/lig=
httpd.conf
-else
-	echo "No lighttpd.conf found, aborting"
-	exit 1
-fi
-}
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config/CO=
PYING b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config/COPYING
deleted file mode 100644
index 1333e459..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config/COPYING
+++ /dev/null
@@ -1,31 +0,0 @@
-
-
-Copyright (c) 2004, Jan Kneschke, incremental
- All rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions are met:
-
-- Redistributions of source code must retain the above copyright notice, t=
his
-  list of conditions and the following disclaimer.
-
-- Redistributions in binary form must reproduce the above copyright notice,
-  this list of conditions and the following disclaimer in the documentation
-  and/or other materials provided with the distribution.
-
-- Neither the name of the 'incremental' nor the names of its contributors =
may
-  be used to endorse or promote products derived from this software without
-  specific prior written permission.
-
-THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
-LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
-THE POSSIBILITY OF SUCH DAMAGE.
-
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config/li=
ghttpd.conf.matrix b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-c=
onfig/lighttpd.conf.matrix
deleted file mode 100755
index 36ed64fd..00000000
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config/lighttpd.=
conf.matrix
+++ /dev/null
@@ -1,344 +0,0 @@
-# lighttpd configuration file
-#
-# use it as a base for lighttpd 1.0.0 and above
-#
-# $Id: lighttpd.conf,v 1.7 2004/11/03 22:26:05 weigon Exp $
-
-############ Options you really have to take care of ####################
-
-## modules to load
-# at least mod_access and mod_accesslog should be loaded
-# all other module should only be loaded if really neccesary
-# - saves some time
-# - saves memory
-server.modules              =3D (
-#                               "mod_rewrite",
-#                               "mod_redirect",
-#                               "mod_alias",
-                                "mod_access",
-#                               "mod_cml",
-#                               "mod_trigger_b4_dl",
-#                               "mod_auth",
-#                               "mod_status",
-                                "mod_setenv",
-                                "mod_expire",
-#                               "mod_fastcgi",
-#                               "mod_proxy",
-#                               "mod_simple_vhost",
-#                               "mod_evhost",
-#                               "mod_userdir",
-                                "mod_cgi",
-                                "mod_compress"
-#                               "mod_ssi",
-#                               "mod_usertrack",
-
-#                               "mod_secdownload",
-#                               "mod_rrdtool",
-#				"mod_webdav",
-#                               "mod_accesslog"
-				 )
-
-## a static document-root, for virtual-hosting take look at the
-## server.virtual-* options
-server.document-root        =3D "/usr/share/matrix-gui-2.0/"
-
-## where to send error-messages to
-#server.errorlog             =3D "/www/logs/lighttpd.error.log"
-
-# files to check for if .../ is requested
-index-file.names            =3D ( "index.php", "index.html",
-                                "index.htm", "default.htm" )
-
-## set the event-handler (read the performance section in the manual)
-# server.event-handler =3D "freebsd-kqueue" # needed on OS X
-
-# mimetype mapping
-mimetype.assign             =3D (
-  ".pdf"          =3D>      "application/pdf",
-  ".sig"          =3D>      "application/pgp-signature",
-  ".spl"          =3D>      "application/futuresplash",
-  ".class"        =3D>      "application/octet-stream",
-  ".ps"           =3D>      "application/postscript",
-  ".torrent"      =3D>      "application/x-bittorrent",
-  ".dvi"          =3D>      "application/x-dvi",
-  ".gz"           =3D>      "application/x-gzip",
-  ".pac"          =3D>      "application/x-ns-proxy-autoconfig",
-  ".swf"          =3D>      "application/x-shockwave-flash",
-  ".tar.gz"       =3D>      "application/x-tgz",
-  ".tgz"          =3D>      "application/x-tgz",
-  ".tar"          =3D>      "application/x-tar",
-  ".zip"          =3D>      "application/zip",
-  ".mp3"          =3D>      "audio/mpeg",
-  ".m3u"          =3D>      "audio/x-mpegurl",
-  ".wma"          =3D>      "audio/x-ms-wma",
-  ".wax"          =3D>      "audio/x-ms-wax",
-  ".ogg"          =3D>      "application/ogg",
-  ".wav"          =3D>      "audio/x-wav",
-  ".gif"          =3D>      "image/gif",
-  ".jpg"          =3D>      "image/jpeg",
-  ".jpeg"         =3D>      "image/jpeg",
-  ".png"          =3D>      "image/png",
-  ".xbm"          =3D>      "image/x-xbitmap",
-  ".xpm"          =3D>      "image/x-xpixmap",
-  ".xwd"          =3D>      "image/x-xwindowdump",
-  ".css"          =3D>      "text/css",
-  ".html"         =3D>      "text/html",
-  ".htm"          =3D>      "text/html",
-  ".js"           =3D>      "text/javascript",
-  ".asc"          =3D>      "text/plain",
-  ".c"            =3D>      "text/plain",
-  ".cpp"          =3D>      "text/plain",
-  ".log"          =3D>      "text/plain",
-  ".conf"         =3D>      "text/plain",
-  ".text"         =3D>      "text/plain",
-  ".txt"          =3D>      "text/plain",
-  ".dtd"          =3D>      "text/xml",
-  ".xml"          =3D>      "text/xml",
-  ".mpeg"         =3D>      "video/mpeg",
-  ".mpg"          =3D>      "video/mpeg",
-  ".mov"          =3D>      "video/quicktime",
-  ".qt"           =3D>      "video/quicktime",
-  ".avi"          =3D>      "video/x-msvideo",
-  ".asf"          =3D>      "video/x-ms-asf",
-  ".asx"          =3D>      "video/x-ms-asf",
-  ".wmv"          =3D>      "video/x-ms-wmv",
-  ".bz2"          =3D>      "application/x-bzip",
-  ".tbz"          =3D>      "application/x-bzip-compressed-tar",
-  ".tar.bz2"      =3D>      "application/x-bzip-compressed-tar"
- )
-
-# Use the "Content-Type" extended attribute to obtain mime type if possible
-#mimetype.use-xattr        =3D "enable"
-
-
-## send a different Server: header
-## be nice and keep it at lighttpd
-# server.tag                 =3D "lighttpd"
-
-#### accesslog module
-#accesslog.filename          =3D "/www/logs/access.log"
-#debug.log-request-handling =3D "enable"
-
-
-
-
-## deny access the file-extensions
-#
-# ~    is for backupfiles from vi, emacs, joe, ...
-# .inc is often used for code includes which should in general not be part
-#      of the document-root
-url.access-deny             =3D ( "~", ".inc" )
-
-$HTTP["url"] =3D~ "\.pdf$" {
-  server.range-requests =3D "disable"
-}
-
-##
-# which extensions should not be handle via static-file transfer
-#
-# .php, .pl, .fcgi are most often handled by mod_fastcgi or mod_cgi
-static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi" )
-
-######### Options that are good to be but not neccesary to be changed ####=
###
-
-## bind to port (default: 80)
-server.port                =3D 80
-
-## bind to localhost (default: all interfaces)
-#server.bind                =3D "grisu.home.kneschke.de"
-
-## error-handler for status 404
-#server.error-handler-404   =3D "/error-handler.html"
-#server.error-handler-404   =3D "/error-handler.php"
-
-## to help the rc.scripts
-#server.pid-file            =3D "/var/run/lighttpd.pid"
-
-
-###### virtual hosts
-##
-##  If you want name-based virtual hosting add the next three settings and=
 load
-##  mod_simple_vhost
-##
-## document-root =3D
-##   virtual-server-root + virtual-server-default-host + virtual-server-do=
croot
-## or
-##   virtual-server-root + http-host + virtual-server-docroot
-##
-#simple-vhost.server-root   =3D "/home/weigon/wwwroot/servers/"
-#simple-vhost.default-host  =3D "grisu.home.kneschke.de"
-#simple-vhost.document-root =3D "/pages/"
-
-
-##
-## Format: <errorfile-prefix><status-code>.html
-## -> ..../status-404.html for 'File not found'
-#server.errorfile-prefix    =3D "/home/weigon/projects/lighttpd/doc/status=
-"
-
-## virtual directory listings
-#dir-listing.activate       =3D "enable"
-
-## enable debugging
-#debug.log-request-header   =3D "enable"
-#debug.log-response-header  =3D "enable"
-#debug.log-request-handling =3D "enable"
-#debug.log-file-not-found   =3D "enable"
-
-### only root can use these options
-#
-# chroot() to directory (default: no chroot() )
-#server.chroot              =3D "/"
-
-## change uid to <uid> (default: don't care)
-#server.username            =3D "wwwrun"
-
-## change uid to <uid> (default: don't care)
-#server.groupname           =3D "wwwrun"
-
-#### compress module
-compress.cache-dir         =3D "/tmp/lighttpd/cache/compress/"
-compress.filetype          =3D ("text/plain", "text/html","text/javascript=
","text/css","image/png","text/php")
-
-#### proxy module
-## read proxy.txt for more info
-#proxy.server               =3D ( ".php" =3D>
-#                               ( "localhost" =3D>
-#                                 (
-#                                   "host" =3D> "192.168.0.101",
-#                                   "port" =3D> 80
-#                                 )
-#                               )
-#                             )
-
-
-
-#### fastcgi module
-## read fastcgi.txt for more info
-## for PHP don't forget to set cgi.fix_pathinfo =3D 1 in the php.ini
-#fastcgi.server             =3D ( ".php" =3D>
-#                               ( "localhost" =3D>
-#                                 (
-#                                   "socket" =3D> "/tmp/php-fastcgi.socket=
",
-#                                   "bin-path" =3D> "/usr/bin/php-cgi -n -=
c /usr/share/matrix-gui-2.0/php.ini"
-#                                 )
-#                               )
-#                            )
-
-#### CGI module
-cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".out" =
=3D> "" )
-#cgi.assign                 =3D ( ".pl"  =3D> "/usr/bin/perl",
-#                               ".cgi" =3D> "/usr/bin/perl" )
-#
-
-#### SSL engine
-#ssl.engine                 =3D "enable"
-#ssl.pemfile                =3D "server.pem"
-
-#### status module
-#status.status-url          =3D "/server-status"
-#status.config-url          =3D "/server-config"
-
-#### auth module
-## read authentication.txt for more info
-#auth.backend               =3D "plain"
-#auth.backend.plain.userfile =3D "lighttpd.user"
-#auth.backend.plain.groupfile =3D "lighttpd.group"
-
-#auth.backend.ldap.hostname =3D "localhost"
-#auth.backend.ldap.base-dn  =3D "dc=3Dmy-domain,dc=3Dcom"
-#auth.backend.ldap.filter   =3D "(uid=3D$)"
-
-#auth.require               =3D ( "/server-status" =3D>
-#                               (
-#                                 "method"  =3D> "digest",
-#                                 "realm"   =3D> "download archiv",
-#                                 "require" =3D> "user=3Djan"
-#                               ),
-#                               "/server-config" =3D>
-#                               (
-#                                 "method"  =3D> "digest",
-#                                 "realm"   =3D> "download archiv",
-#                                 "require" =3D> "valid-user"
-#                               )
-#                             )
-
-#### url handling modules (rewrite, redirect, access)
-#url.rewrite                =3D ( "^/$"             =3D> "/server-status" )
-#url.redirect               =3D ( "^/wishlist/(.+)" =3D> "http://www.123.o=
rg/$1" )
-
-#### both rewrite/redirect support back reference to regex conditional usi=
ng %n
-#$HTTP["host"] =3D~ "^www\.(.*)" {
-#  url.redirect            =3D ( "^/(.*)" =3D> "http://%1/$1" )
-#}
-
-#
-# define a pattern for the host url finding
-# %% =3D> % sign
-# %0 =3D> domain name + tld
-# %1 =3D> tld
-# %2 =3D> domain name without tld
-# %3 =3D> subdomain 1 name
-# %4 =3D> subdomain 2 name
-#
-#evhost.path-pattern        =3D "/home/storage/dev/www/%3/htdocs/"
-
-#### expire module
-#expire.url                 =3D ( "/images/" =3D> "access 2 hours", "/css/=
" =3D> "access plus 1 seconds 2 minutes")
-$HTTP["url"] =3D~ "\.(jpg|gif|png)$" { expire.url =3D ( "" =3D> "access 3 =
years" ) }
-
-#### ssi
-#ssi.extension              =3D ( ".shtml" )
-
-#### rrdtool
-#rrdtool.binary             =3D "/usr/bin/rrdtool"
-#rrdtool.db-name            =3D "/var/www/lighttpd.rrd"
-
-#### setenv
-#setenv.add-request-header  =3D ( "TRAV_ENV" =3D> "mysql://user@host/db" )
-#setenv.add-response-header =3D ( "X-Secret-Message" =3D> "42" )
-setenv.add-environment =3D (
-    "PATH" =3D> "/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/s=
bin:."
-)
-
-## for mod_trigger_b4_dl
-# trigger-before-download.gdbm-filename =3D "/home/weigon/testbase/trigger=
.db"
-# trigger-before-download.memcache-hosts =3D ( "127.0.0.1:11211" )
-# trigger-before-download.trigger-url =3D "^/trigger/"
-# trigger-before-download.download-url =3D "^/download/"
-# trigger-before-download.deny-url =3D "http://127.0.0.1/index.html"
-# trigger-before-download.trigger-timeout =3D 10
-
-## for mod_cml
-## don't forget to add index.cml to server.indexfiles
-# cml.extension               =3D ".cml"
-# cml.memcache-hosts          =3D ( "127.0.0.1:11211" )
-
-#### variable usage:
-## variable name without "." is auto prefixed by "var." and becomes "var.b=
ar"
-#bar =3D 1
-#var.mystring =3D "foo"
-
-## integer add
-#bar +=3D 1
-## string concat, with integer cast as string, result: "www.foo1.com"
-#server.name =3D "www." + mystring + var.bar + ".com"
-## array merge
-#index-file.names =3D (foo + ".php") + index-file.names
-#index-file.names +=3D (foo + ".php")
-
-#### include
-#include /etc/lighttpd/lighttpd-inc.conf
-## same as above if you run: "lighttpd -f /etc/lighttpd/lighttpd.conf"
-#include "lighttpd-inc.conf"
-
-#### include_shell
-#include_shell "echo var.a=3D1"
-## the above is same as:
-#var.a=3D1
-
-
-###Franklin
-etag.use-inode =3D "enable"
-etag.use-mtime =3D "enable"
-etag.use-size =3D "enable"
-static-file.etags =3D "enable"
diff --git a/meta-arago-demos/recipes-core/matrix/refresh-screen_2.0.bb b/m=
eta-arago-demos/recipes-core/matrix/refresh-screen_2.0.bb
deleted file mode 100644
index bd81bca8..00000000
--- a/meta-arago-demos/recipes-core/matrix/refresh-screen_2.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "Simple Application to force a screen refresh"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D75a=
9adc782a6df0d3a5419743e9a9f18"
-SECTION =3D "multimedia"
-
-inherit qt5
-
-PR =3D "r9"
-
-SRCREV =3D "4c8817e28ceed2dd886761e3ec1971b11436ba33"
-BRANCH ?=3D "master"
-
-SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/refresh-screen.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${B}/refresh_screen ${D}/${bindir}
-}
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b=
/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 858a10d4..5156e5e7 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -21,8 +21,6 @@ IMAGE_INSTALL +=3D "\
     ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_features=
(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp',=
 True, False, d)]} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-matrix \
-    packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-matrix.bb
deleted file mode 100644
index 2158e7e2..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-matrix.bb
+++ /dev/null
@@ -1,197 +0,0 @@
-DESCRIPTION =3D "Task to include Matrix v2"
-LICENSE =3D "MIT"
-PR =3D "r81"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-PACKAGES =3D+ "${PN}-extra"
-
-MATRIX_ESSENTIALS =3D "        \
-    matrix-gui               \
-    matrix-lighttpd-config   \
-"
-
-MATRIX_GUI =3D "               \
-    refresh-screen           \
-    matrix-gui-browser       \
-"
-MATRIX_GUI:omapl138 =3D ""
-
-MATRIX_COMMON_APPS =3D "              \
-    matrix-gui-armbenchmarks-demos  \
-    matrix-gui-crypto-demos         \
-    matrix-gui-oprofile-demos       \
-    matrix-gui-settings-demos       \
-    matrix-gui-usb-demos            \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'matrix-gui-weston-=
terminal-demo', '', d)} \
-"
-
-MATRIX_QT_APPS =3D " \
-    matrix-qt5-demo-animated \
-    matrix-qt5-demo-webkit-browser \
-    matrix-qt5-demo-calculator \
-    matrix-qt5-demo-deform \
-    matrix-gui-thermostat-demo \
-"
-
-MATRIX_QT_APPS:append:omap-a15 =3D " \
-    matrix-analytics-pdm-anomaly-detection \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-mmwavegesture   \
-"
-
-MATRIX_QT_APPS:append:am65xx =3D " \
-    matrix-analytics-pdm-anomaly-detection \
-                                    \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-mmwavegesture   \
-"
-
-MATRIX_QT_APPS:append:ti33x =3D " \
-    matrix-analytics-pdm-anomaly-detection \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-protection-relays \
-    matrix-hmi-demo-mmwavegesture   \
-"
-
-MATRIX_QT_APPS:append:ti43x =3D " \
-    matrix-analytics-pdm-anomaly-detection \
-    matrix-gui-apps-image-gallery   \
-                                    \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-mmwavegesture   \
-"
-
-MATRIX_TOUCH_APPS =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES','touchscreen','matrix-gui-touc=
h-demos','',d)} \
-"
-
-MATRIX_GPU_DEMOS =3D " \
-    matrix-3d-demo-kmscube \
-"
-
-MATRIX_GPU_DEMOS:append:omap-a15 =3D " \
-    matrix-3d-demo-kmscubevideo \
-"
-
-MATRIX_GPU_DEMOS:omapl138 =3D ""
-
-MATRIX_OPENCL_APPS =3D " \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-"
-
-MATRIX_OPENCL_APPS:append:dra7xx =3D " \
-    matrix-video-analytics-opencv-opencl-opengl-demo \
-    matrix-machinevision-demo-dlp3dscanner \
-"
-
-MATRIX_OPENCV_ARM_ONLY_APPS =3D " \
-     matrix-machinevision-demo-barcoderoi \
-     matrix-machinevision-demo-simplepeopletracking \
-"
-
-MATRIX_OPENCV_OPENCL_APPS =3D " \
-    matrix-machinevision-demo-barcoderoi-f2f \
-"
-
-MATRIX_OPENCV_OPENCL_APPS:omap-a15 =3D " \
-     matrix-machinevision-demo-barcoderoi \
-     matrix-machinevision-demo-simplepeopletracking \
-"
-
-MATRIX_APPS =3D ""
-
-MATRIX_APPS:append:ti33x =3D "        \
-    matrix-multimedia-demo-aac      \
-    matrix-multimedia-demo-audiocapture \
-    matrix-multimedia-demo-h264dec  \
-    matrix-multimedia-demo-mpeg4aacdec  \
-    matrix-multimedia-demo-mpeg4dec \
-                                    \
-    matrix-gui-generic-pm           \
-    matrix-gui-pm-demos-suspend     \
-    matrix-gui-clocks               \
-    matrix-gui-pm-demos-governor    \
-                                    \
-    matrix-gui-ethernet-demos       \
-                                    \
-    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
-"
-
-MATRIX_APPS:append:ti43x =3D "        \
-    matrix-multimedia-demo-aac      \
-    matrix-multimedia-demo-audiocapture \
-    matrix-multimedia-demo-h264dec  \
-    matrix-multimedia-demo-mpeg4aacdec \
-    matrix-multimedia-demo-mpeg4dec \
-                                    \
-    matrix-gui-generic-pm           \
-    matrix-gui-pm-demos-suspend     \
-    matrix-gui-clocks               \
-    matrix-gui-pm-demos-governor    \
-                                    \
-    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
-"
-
-MATRIX_APPS:append:omap-a15 =3D "     \
-    matrix-multimedia-demo-aac      \
-    matrix-multimedia-demo-audiocapture \
-    matrix-multimedia-demo-h265dec  \
-                                    \
-    ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo=
-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo=
-ivahdh264enc','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo=
-ivahdmjpegenc','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo=
-vip-vpe-ivahdmpeg4encdec','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','mmip','','matrix-multimedia-d=
emo-mpeg4aacdec',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','mmip','','matrix-multimedia-d=
emo-mpeg4dec',d)} \
-                                    \
-    matrix-gui-generic-pm           \
-    matrix-gui-clocks               \
-    matrix-gui-pm-demos-governor    \
-"
-
-#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('DISTRO_FEATURES=
','opengl',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',=
True,False,d)]} \
-#                                \
-#
-
-MATRIX_APPS:append:am65xx =3D "           \
-    matrix-multimedia-demo-aac      \
-    matrix-multimedia-demo-audiocapture \
-    matrix-multimedia-demo-h264dec  \
-    matrix-multimedia-demo-mpeg4aacdec \
-    matrix-multimedia-demo-mpeg4dec \
-                                    \
-    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
-"
-
-MATRIX_APPS:append:dra7xx =3D " \
-    matrix-multimedia-demo-dsp66imgproc \
-    matrix-tidl-demo-staticimg \
-    matrix-tidl-demo-pnexamples \
-    matrix-tidl-demo-livecam \
-    matrix-tidl-demo-livecam-lg2 \
-    matrix-tidl-demo-staticimg-lg2 \
-    matrix-tidl-demo-staticimg-dsponly \
-    matrix-tidl-demo-objdet \
-    matrix-tidl-demo-objdet-livecam \
-    matrix-tidl-demo-segment \
-    matrix-tidl-demo-dogbreeds \
-"
-
-RDEPENDS:${PN} =3D "        \
-    ${MATRIX_ESSENTIALS}  \
-    ${MATRIX_APPS}        \
-    ${MATRIX_COMMON_APPS} \
-    ${@bb.utils.contains('MACHINE_FEATURES','touchscreen',"${MATRIX_TOUCH_=
APPS}",'',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_GUI}",'',d)}=
 \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_QT_APPS}",''=
,d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_GPU_DEMOS}",=
'',d)} \
-    ${@['',"${MATRIX_OPENCL_APPS}"][oe.utils.all_distro_features(d, 'openc=
l', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, Fal=
se, d)]} \
-"
-
-RDEPENDS:${PN}-extra =3D " \
-    ${@['',"${MATRIX_OPENCV_OPENCL_APPS}"][oe.utils.all_distro_features(d,=
 'opencl opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'd=
sp', True, False, d)]} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-tisdk-qte.bb
index a133e7e7..be851944 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-qte.bb
@@ -18,5 +18,4 @@ RDEPENDS:${PN} =3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples=
', '', d)} \
     qtserialport-examples \
     qtcharts-examples \
-    qt-tstat \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/met=
a-arago-distro/recipes-core/packagegroups/ti-world.bb
index 50cf2552..a70701f9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -48,8 +48,6 @@ RDEPENDS:${PN} =3D "\
     ${@oe.utils.all_distro_features(d, "opencl", "${OPENCL}")} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-matrix \
-    packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
diff --git a/meta-arago-distro/recipes-devtools/php/php/0001-php-native-Fix=
-host-contamination-issue.patch b/meta-arago-distro/recipes-devtools/php/ph=
p/0001-php-native-Fix-host-contamination-issue.patch
deleted file mode 100644
index 6ad5b636..00000000
--- a/meta-arago-distro/recipes-devtools/php/php/0001-php-native-Fix-host-c=
ontamination-issue.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 48350388ab4cb8a0965e7a3f8630bc3f3e3c8d7b Mon Sep 17 00:00:00 2001
-From: Franklin S Cooper Jr <fcooper@ti.com>
-Date: Mon, 20 Aug 2012 07:16:18 -0500
-Subject: [PATCH] php-native: Fix host contamination issue
-
-* Within ext/iconv/config.m4 there is a check in place to try to locate
-  particular header files and if the header files aren't found then a
-  default location is used (/usr/). Both the CFLAGS and LDFLAGS have this
-  default location added to it. This leads to a host contamination issue
-  which propagates to the rest of the entire config/build since CFLAGS and
-  LDFLAGS will use the host's include and lib directory as the first place
-  to check.
-
-* This issue was discovered when the configure was failing due to seeing t=
he
-  following error in the config.log:
-  <path to work dir>/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined r=
eference to
-  gzopen64@ZLIB_1.2.3.3. The /usr/lib directory in /sysroots/x86_64-linux
-  contained zlib 1.2.6 while my host (Ubuntu 10.04) /usr/lib directory had
-  zlib 1.2.3.3
-
-* Deleting the two lines solves that alter the CFLAGS and LDFLAGS fixes th=
is
-  issue. This isn't a valid fix for PHP but should work for OE.
-
-* This issue is in the latest 5.3.x version of php and possibly under 5.4.=
x.
-
-* Below contains several bug reports that seem to be based on this same is=
sue:
-    https://bugs.php.net/bug.php?id=3D53443
-    https://bugs.php.net/bug.php?id=3D61130
-    https://bugs.php.net/bug.php?id=3D53442
-  None of the suggested fixes seem valid since /usr/ and /usr/local should=
 never
-  be considered a proper default location. A similar type of check is done=
 in
-  several other ext but for some reason only this issue shows up.
-
-Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
----
- ext/iconv/config.m4 |    3 ---
- 1 files changed, 0 insertions(+), 3 deletions(-)
-
-diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
-index 13e0371..41c2db9 100644
---- a/ext/iconv/config.m4
-+++ b/ext/iconv/config.m4
-@@ -28,9 +28,6 @@ if test "$PHP_ICONV" !=3D "no"; then
-       PHP_ICONV_PREFIX=3D"$ICONV_DIR"
-     fi
-=20
--    CFLAGS=3D"-I$PHP_ICONV_PREFIX/include $CFLAGS"
--    LDFLAGS=3D"-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
--
-     if test -r "$PHP_ICONV_PREFIX/include/giconv.h"; then
-       PHP_ICONV_H_PATH=3D"$PHP_ICONV_PREFIX/include/giconv.h"
-     else
---=20
-1.7.0.4
-
diff --git a/meta-arago-distro/recipes-devtools/php/php_%.bbappend b/meta-a=
rago-distro/recipes-devtools/php/php_%.bbappend
deleted file mode 100644
index c2cca255..00000000
--- a/meta-arago-distro/recipes-devtools/php/php_%.bbappend
+++ /dev/null
@@ -1,29 +0,0 @@
-# look for files in this layer first
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-PR:append =3D ".arago1"
-
-SRC_URI:append:virtclass-native =3D " file://0001-php-native-Fix-host-cont=
amination-issue.patch"
-
-# Work around to address the fact that php-fpm and php-cgi can not coexist
-# php-cgi is used by Matrix and php-fpm is in beta for this version of php.
-# Once this issue is fix in meta-oe the below won't be needed.
-# Issue mentioned here: https://bugs.php.net/bug.php?id=3D60144
-
-EXTRA_OECONF:remove =3D "--enable-fpm"
-EXTRA_OECONF:append =3D " --disable-fpm"
-
-PACKAGES:remove =3D "${PN}-fpm"
-PACKAGES:remove =3D "${PN}-fpm-apache2"
-
-SYSTEMD_PACKAGES:remove =3D "${PN}-fpm"
-INITSCRIPT_PACKAGES:remove =3D "${PN}-fpm"
-
-do_install:prepend:pn-php() {
-    # Add the below file even though we aren't going to use it.
-    # do_install will complain and fail if this file isn't found.
-    mkdir -p ${B}/sapi/fpm/
-    touch ${B}/sapi/fpm/init.d.php-fpm
-}
-
-INSANE_SKIP:${PN} +=3D "installed-vs-shipped"
--=20
2.44.0


