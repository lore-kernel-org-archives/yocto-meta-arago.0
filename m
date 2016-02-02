Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9051652A98
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 14:37:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u12EbYRI012275
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 08:37:34 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12EbYcc016173
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 08:37:34 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Feb 2016 08:37:34 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12EbYMs019316;
	Tue, 2 Feb 2016 08:37:34 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aQc5G-0007Qd-Bo; Tue, 02 Feb 2016 09:37:34 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Feb 2016 09:37:30 -0500
Message-ID: <1454423850-28516-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454423850-28516-1-git-send-email-j-stiffler@ti.com>
References: <1454423850-28516-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] weston-conf: ti43x: Limit resolution to prevent HDMI display underrun
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
X-List-Received-Date: Tue, 02 Feb 2016 14:37:36 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-graphics/wayland/weston-conf/ti43x/weston.ini   | 13 +++++++++++++
 .../recipes-graphics/wayland/weston-conf_1.9.0.bb           |  4 ++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
new file mode 100644
index 0000000..b2b7927
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
@@ -0,0 +1,13 @@
+[shell]
+locking=false
+animation=zoom
+panel-location=top
+startup-animation=fade
+
+[screensaver]
+# Uncomment path to disable screensaver
+#path=@libexecdir@/weston-screensaver
+
+[output]
+name=HDMI1
+mode=1024x768
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
index 7c22282..27c4727 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+PR = "r1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRC_URI = "file://wayland_env.sh \
            file://weston.ini \
 "
-- 
1.9.1


