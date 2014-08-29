Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B26C252A3B
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 21:57:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7TLvaQh025682
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 16:57:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7TLva3G022544
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 16:57:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 16:57:36 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7TLvZnf020694;	Fri, 29 Aug 2014 16:57:36 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7TLvXE5031426;	Sat, 30 Aug 2014 03:27:34 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Aug 2014 16:57:18 -0500
Message-ID: <1409349440-20871-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] arago.conf: Disable TSLIB in Qt 5
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
X-List-Received-Date: Fri, 29 Aug 2014 21:57:37 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* When using Qt 5 w/Wayland Weston should be providing the touch input.
* Disable tslib.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 57e6646..50c8c6b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -31,7 +31,7 @@ PACKAGECONFIG_pn-weston = "fbdev launch"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples tslib"
+PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples ${@bb.utils.contains('DISTRO_FEATURES','weston','','tslib',d)}"
 
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
-- 
1.7.9.5


