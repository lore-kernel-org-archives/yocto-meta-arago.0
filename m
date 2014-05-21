Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AB25752A3E
	for <meta-arago@arago-project.org>;
	Wed, 21 May 2014 21:22:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LLMOBJ009942
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 16:22:24 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LLMOOp016229
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 16:22:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 May 2014 16:22:24 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4LLMLlI007109;	Wed, 21 May 2014 16:22:22 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 May 2014 16:22:19 -0500
Message-ID: <1400707339-20920-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] arago-prefs: Use mesa for keystone devices
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
X-List-Received-Date: Wed, 21 May 2014 21:22:32 -0000
Content-Type: text/plain

* Use mesa for keystone devices instead of mesa-gl since these
  devices don't have SGX capabilities.
* This is important when building images like tisdk-rootfs-image
  which includes packages like Qt5 which pull through these
  dependencies.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index b2e91ef..a9bbac5 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -51,6 +51,14 @@ PREFERRED_PROVIDER_virtual/libgles2_omap-a15 = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
 PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
 
+# This is required when using keystone devices with graphical support
+# such as Qt5
+PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
+PREFERRED_PROVIDER_virtual/libgles1_keystone = "mesa"
+PREFERRED_PROVIDER_virtual/libgles2_keystone = "mesa"
+PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
+PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
+
 # Use latest TI staging kernel and u-boot trees
 PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
-- 
1.7.9.5


