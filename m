Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A7B7D52A8C
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 13:11:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16DBCQ0014758
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 07:11:12 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16DBC3k018852
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 07:11:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 07:11:12 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16DB6DE032285;
	Thu, 6 Feb 2014 07:11:10 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 08:40:00 -0600
Message-ID: <1391697602-1599-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1391697602-1599-1-git-send-email-Chase.Maupin@ti.com>
References: <1391697602-1599-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/4] arago-core-tisdk-image: add support for keystone devices
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 13:11:13 -0000
Content-Type: text/plain

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Use arago-server-tisdk-image for keystone devices
---
 .../recipes-core/images/arago-core-tisdk-image.bb  |    1 +
 .../recipes-core/images/arago-core-tisdk-image.inc |    6 +++++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index 33bfc11..ccddbc1 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -1,5 +1,6 @@
 require arago-core-tisdk-image.inc
 
 DEPLOY_SPL_NAME_omapl138 = ""
+DEPLOY_SPL_NAME_keystone = ""
 
 export IMAGE_BASENAME = "arago-core-tisdk-image"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 74c2b87..f25db51 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -7,7 +7,7 @@ IMAGE_FSTYPES = "tar.gz"
 
 inherit tisdk-image
 
-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap-a15"
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap-a15|keystone"
 
 # List of packages to remove from the host package.  This is usually due to
 # licensing issues and unneeded dependencies.
@@ -21,10 +21,14 @@ DTB_FILTER_ti33x = "am335x"
 DTB_FILTER_omap5-evm = "omap5"
 DTB_FILTER_dra7xx-evm = "dra7"
 DTB_FILTER_ti43x = "am43"
+DTB_FILTER_keystone = "k2hk"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 
+# Some devices do not support display and use a server image instead
+TARGET_IMAGES_keystone-evm = "arago-base-tisdk-image tisdk-server-rootfs-image"
+
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 
 IMAGE_INSTALL = "\
-- 
1.7.0.4


