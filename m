Return-Path: <e-ruei1@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0FC0352004
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 14:32:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1QEWsjX013177
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 08:32:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QEWsJi026957
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 08:32:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 08:32:53 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1QEWmdM026291	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 08:32:53 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 26 Feb 2016 09:32:37 -0500
Message-ID: <1456497158-46802-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456497158-46802-1-git-send-email-e-ruei1@ti.com>
References: <1456497158-46802-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/2] conf: enable wayland/drm support for AM3
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
X-List-Received-Date: Fri, 26 Feb 2016 14:32:55 -0000
Content-Type: text/plain

- Retain "wayland" within DISTRO_FEATURES of AM3
- Replace "fbdev" with "egl" in weston plugin list

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                         | 5 ++++-
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 3 ---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f4f499e..98efdfe 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -43,7 +43,10 @@ PACKAGECONFIG_pn-weston = "fbdev kms launch libinput"
 PACKAGECONFIG_append_pn-weston_omap-a15 = " egl"
 PACKAGECONFIG_remove_pn-weston_omap-a15 = "fbdev"
 PACKAGECONFIG_append_pn-weston_ti43x    = " egl"
-PACKAGECONFIG_remove_pn-weston_ti43x    = "fbdev"
+PACKAGECONFIG_remove_pn-weston_ti43x    = "fbdev"
+PACKAGECONFIG_append_pn-weston_ti33x    = " egl"
+PACKAGECONFIG_remove_pn-weston_ti33x    = "fbdev"
+
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 0c5e41c..bd51f76 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -1,8 +1,5 @@
 ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
 
-# Remove wayland from ti33x DISTRO_FEATURES.
-DISTRO_FEATURES_remove_ti33x = "wayland"
-
 # Set CMEM reserved memory region
 CMEM_BASE_omap-a15 ?= "a0000000"
 CMEM_SIZE_omap-a15 ?= "08000000"
-- 
1.9.1


