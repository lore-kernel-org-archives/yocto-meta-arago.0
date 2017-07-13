Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5F31A52978
	for <meta-arago@arago-project.org>;
	Thu, 13 Jul 2017 21:12:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6DLCLm9023630
	for <meta-arago@arago-project.org>; Thu, 13 Jul 2017 16:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499980341;
	bh=nWPaeexfPRocfptHFIcqTyZtiUtVHwHt2jPmranL+Lw=;
	h=From:To:CC:Subject:Date;
	b=kjSUemyN5A/QnPtzE3tunUTAytGfNArezHvJxksKxIGVRfqe2cccp12+rnKinsiHm
	QJlqJDo5tyJ610YqzlAA/5V7dPiWfeWhRRTjOhbsBh7XfOQP4Xwxj9dGqh5MeKAnWA
	sCrya0lJDq03HTcAk5vWfjpcf2uQURFLSS6zGHKU=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6DLCG1V010086
	for <meta-arago@arago-project.org>; Thu, 13 Jul 2017 16:12:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Jul 2017 16:12:15 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6DLCFrx014660;	Thu, 13 Jul 2017 16:12:15 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Jul 2017 17:12:13 -0400
Message-ID: <1499980333-37403-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] arago-tisdk-addons-sdk-addons-sdk-host: Add big-data-ipc-demo-linux-src
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
X-List-Received-Date: Thu, 13 Jul 2017 21:12:31 -0000
Content-Type: text/plain

Adding for omap-a15 platforms only

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 7c8b000..5fb877b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r30"
+PR = "r31"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -38,6 +38,7 @@ EXTRA_LIBS_append_omap-a15 = " \
     cmem-mod-src \
     pru-icss-src \
     uio-module-drv-src \
+    big-data-ipc-demo-linux-src \
 "
 
 EXTRA_LIBS_append_dra7xx = " \
-- 
1.9.1


