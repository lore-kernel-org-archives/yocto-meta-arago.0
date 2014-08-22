Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C122352972
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 14:09:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7ME9N2i025660
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 09:09:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7ME9NqL022426
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 09:09:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 09:09:23 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7ME9LBf031858;	Fri, 22 Aug 2014 09:09:22 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Aug 2014 19:36:13 +0530
Message-ID: <1408716373-25549-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: nikhil.nd@ti.com
Subject: [PATCH] kmscube: Fixed incorrect DEPENDS
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
X-List-Received-Date: Fri, 22 Aug 2014 14:09:24 -0000
Content-Type: text/plain

libgbm-glsdk was renamed to libgbm

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 9f55d4e..f20bd5c 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8f3969dd53b6bf158"
 
-DEPENDS = "libdrm libgbm-glsdk omap5-sgx-ddk-um-linux"
+DEPENDS = "libdrm libgbm omap5-sgx-ddk-um-linux"
 
 COMPATIBLE_MACHINE = "omap-a15"
 
-- 
1.7.9.5


