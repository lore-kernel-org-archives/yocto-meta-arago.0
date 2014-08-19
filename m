Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1E98152AB6
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 16:46:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JGk4Y1016426
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:04 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JGk4Cl029982
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 11:46:03 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JGk2DO029858;	Tue, 19 Aug 2014 11:46:03 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7JGjsqL017239;	Tue, 19 Aug 2014 22:16:01 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 11:45:50 -0500
Message-ID: <1408466752-4458-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408466752-4458-1-git-send-email-fcooper@ti.com>
References: <1408466752-4458-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/8] weston: Move distro specific changes to meta-arago-distro
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
X-List-Received-Date: Tue, 19 Aug 2014 16:46:05 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wayland/weston}/wayland_env.sh                 |    1 +
 .../recipes-graphics/wayland/weston_1.4.0.bbappend |    6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename {meta-arago-extras/recipes-graphics/wayland/files => meta-arago-distro/recipes-graphics/wayland/weston}/wayland_env.sh (80%)
 rename {meta-arago-extras => meta-arago-distro}/recipes-graphics/wayland/weston_1.4.0.bbappend (88%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/files/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
similarity index 80%
rename from meta-arago-extras/recipes-graphics/wayland/files/wayland_env.sh
rename to meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
index 201e264..788024f 100644
--- a/meta-arago-extras/recipes-graphics/wayland/files/wayland_env.sh
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
@@ -2,5 +2,6 @@
 
 ### Wayland Environment Variables ###
 
+export XDG_CONFIG_HOME=/etc/
 export XDG_RUNTIME_DIR=/run/user/root
 export WAYLAND_DISPLAY=wayland-0
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend
similarity index 88%
rename from meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend
index 5b499ba..e62cfa3 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend
@@ -1,9 +1,9 @@
+PR_append = "-arago2"
+
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 
-PR_append = "-arago1"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://wayland_env.sh"
 
-- 
1.7.9.5


