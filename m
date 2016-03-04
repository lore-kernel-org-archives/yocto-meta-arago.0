Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C5E4252ACF
	for <meta-arago@arago-project.org>;
	Fri,  4 Mar 2016 15:22:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24FMS6b015951
	for <meta-arago@arago-project.org>; Fri, 4 Mar 2016 09:22:29 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24FMSCk019084
	for <meta-arago@arago-project.org>; Fri, 4 Mar 2016 09:22:28 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Mar 2016 09:22:28 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u24FMSxe011278	for <meta-arago@arago-project.org>;
	Fri, 4 Mar 2016 09:22:28 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Mar 2016 10:22:25 -0500
Message-ID: <1457104945-43604-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston-conf: Update output name at weston.ini for ti43x per weston 1.9
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
X-List-Received-Date: Fri, 04 Mar 2016 15:22:30 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
index b2b7927..b863ba8 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
@@ -9,5 +9,5 @@ startup-animation=fade
 #path=@libexecdir@/weston-screensaver
 
 [output]
-name=HDMI1
+name=HDMI-A-1
 mode=1024x768
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
index 27c4727..16cac2b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r1"
+PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
1.9.1


