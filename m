Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B591052AB6
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 16:46:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JGk24n029759
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:02 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JGk2Ji029958
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 11:46:02 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JGk1W7029827;	Tue, 19 Aug 2014 11:46:02 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7JGjsqK017239;	Tue, 19 Aug 2014 22:16:00 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 11:45:49 -0500
Message-ID: <1408466752-4458-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408466752-4458-1-git-send-email-fcooper@ti.com>
References: <1408466752-4458-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/8] wayland/weston: Switch from tarball to git
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
X-List-Received-Date: Tue, 19 Aug 2014 16:46:04 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Allows picking up newer commits between releases alot easier
* The current commit matches the 1.5.0 release
---
 .../recipes-graphics/wayland/wayland_1.5.0.bb      |   11 ++++++++---
 .../recipes-graphics/wayland/weston_1.5.0.bb       |    9 ++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb
index b1ae59e..800ba7a 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb
@@ -10,12 +10,17 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "1d882776b27329b91d2d500b6d66dd1d"
-SRC_URI[sha256sum] = "0069e1e9af888b3e05384380ad8cc6c976ea3e81d08ba19b7675ce1d693a41b5"
+BRANCH = "master"
+SRCREV = "3ac62cd6b6012f40e37b1bd7fc1e8178585905ca"
+
+SRC_URI = "git://anongit.freedesktop.org/wayland/wayland;protocol=git;branch=${BRANCH}"
+
 SRC_URI_append_class-native = " \
     file://disable-macro-checks-not-used-for-scanner.patch \
     "
+
+S = "${WORKDIR}/git"
+
 EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
 
 inherit autotools pkgconfig
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb
index 4a8584f..e1ff61b 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb
@@ -5,15 +5,18 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
                     file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+BRANCH = "master"
+SRCREV = "880193622024d7dc2b36421251d97b08da324570"
+
+SRC_URI = "git://anongit.freedesktop.org/wayland/weston;protocol=git;branch=${BRANCH} \
            file://weston.png \
            file://weston.desktop \
            file://disable-wayland-scanner-pkg-check.patch \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
 "
-SRC_URI[md5sum] = "8eb40d230efc2411f083c20656534780"
-SRC_URI[sha256sum] = "06388ba04ac79aa72d685cc1a8e646ddb2b8cfe11fcc742294f9addac48b7684"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig useradd
 
-- 
1.7.9.5


