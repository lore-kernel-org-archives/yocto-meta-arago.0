Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C9D1252A80
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 14:36:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62EaNp6007881
	for <meta-arago@arago-project.org>; Wed, 2 Jul 2014 09:36:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62EaNnf017221
	for <meta-arago@arago-project.org>; Wed, 2 Jul 2014 09:36:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 09:36:22 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s62EaJ5O014185;	Wed, 2 Jul 2014 09:36:21 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 2 Jul 2014 09:36:18 -0500
Message-ID: <1404311778-16048-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] arago-prefs: Use u-boot-ti-staging instead of mainline
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
X-List-Received-Date: Wed, 02 Jul 2014 14:36:24 -0000
Content-Type: text/plain

* The migration to use mainline u-boot which supports all
  platforms was added for the Daisy branch of meta-ti.  For Dora
  the mainline version does not support all platforms and the
  u-boot-ti-staging recipe should be used instead by default.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 63e9e22..a2f42b1 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -59,10 +59,9 @@ PREFERRED_PROVIDER_virtual/libgles2_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
-# Use the mainline u-boot recipe for TI devices unless overridden below
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-PREFERRED_PROVIDER_u-boot = "u-boot"
-PREFERRED_VERSION_u-boot = "2014.04+2014.07-rc3"
+# Use the u-boot staging recipe for TI devices unless overridden below
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 # Use latest TI staging kernel and u-boot trees
 PREFERRED_PROVIDER_virtual/bootloader_keystone = "u-boot-keystone"
-- 
1.7.9.5


