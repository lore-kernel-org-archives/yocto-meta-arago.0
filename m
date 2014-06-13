Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5C55652AD8
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 22:02:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DM2L1L016637
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DM2L0Y022833
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 17:02:21 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s5DM2Dfp009769;	Fri, 13 Jun 2014 17:02:19 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jun 2014 17:02:09 -0500
Message-ID: <1402696932-21888-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
References: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] branding-glsdk: set u-boot preferred provider
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
X-List-Received-Date: Fri, 13 Jun 2014 22:02:23 -0000
Content-Type: text/plain

* Set the u-boot PREFERRED_PROVIDER to u-boot-ti-staging since
  this is the current default of arago, but that default is
  going to change to the u-boot mainline.  The GLSDK will
  generally release from the u-boot-ti-staging tree so keep the
  default for this SDK pointed there.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/include/branding-glsdk.inc         |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
index b33b21d..9a49103 100644
--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
@@ -3,6 +3,9 @@
 # Use the SDK supported kernel and kernel version
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
 
+PREFERRED_PROVIDER_virtual/bootloader_omap-a15 = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_omap-a15 = "u-boot-ti-staging"
+
 # Set the PREFERRED_VERSION of libdrm to the glsdk version for the 
 # glsdk branded builds
 PREFERRED_VERSION_libdrm = "2.4.41"
-- 
1.7.9.5


