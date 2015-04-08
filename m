Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 47986529E0
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 19:31:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38JVr2T032538
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:31:53 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38JVqMm022423
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:31:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Apr 2015 14:31:52 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38JVq1b028791;
	Wed, 8 Apr 2015 14:31:52 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YfvhY-0000TS-2b;
	Wed, 08 Apr 2015 15:31:52 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Apr 2015 15:31:50 -0400
Message-ID: <1428521510-1792-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] tisdk-readme: Specify that uEnv.txt is optional.
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
X-List-Received-Date: Wed, 08 Apr 2015 19:31:54 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/tisdk-readme/tisdk-readme.bb     |    2 +-
 .../recipes-tisdk/tisdk-readme/tisdk-readme/README |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
index 6fdcaff..4ee3ec4 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
@@ -6,7 +6,7 @@ SRC_URI = "\
     file://README \
 "
 
-PR = "r0"
+PR = "r1"
 PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
index 873d1e8..b9aeefe 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
@@ -11,7 +11,7 @@ By default these locations are:
 ================================================================================
 |    MLO           | boot partition
 |    u-boot.img    | boot partition
-|    uEnv.txt      | boot partition
+|    uEnv.txt      | boot partition (optional)
 |    uImage        | /boot directory of the rootfs partition
 |    *.dtb         | /boot directory of the rootfs partition
 ================================================================================
-- 
1.7.9.5


