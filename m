Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D100B5203A
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:14:11 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFEAgj020720
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:14:10 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE9ZM005769
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 20:44:09 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 20:44:10 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE4lP023952;
	Tue, 19 Mar 2013 20:44:08 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 10:13:58 -0500
Message-ID: <1363706042-10182-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
References: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] images: Add omap5 support to target images
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
X-List-Received-Date: Tue, 19 Mar 2013 15:14:12 -0000
Content-Type: text/plain

* Add support for the omap-a15 devices to the base and full
  SDK target rootfs images.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/arago-base-tisdk-image.bb  |    2 +-
 .../recipes-core/images/tisdk-rootfs-image.bb      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index c84a4c7..172b990 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -4,7 +4,7 @@
 require arago-image.inc
 inherit remove-net-rules
 
-COMPATIBLE_MACHINE = "omap3|ti816x|dm365|omapl138|ti814x|omap4|ti33x"
+COMPATIBLE_MACHINE = "omap3|ti816x|dm365|omapl138|ti814x|omap4|ti33x|omap-a15"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index d6924d1..caef233 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -1,5 +1,5 @@
 # Arago TI SDK filesystem image
-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|omap-a15"
 
 require arago-base-tisdk-image.bb
 
-- 
1.7.0.4


