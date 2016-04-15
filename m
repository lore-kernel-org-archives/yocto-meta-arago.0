Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B7BB5529B3
	for <meta-arago@arago-project.org>;
	Fri, 15 Apr 2016 13:23:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3FDNrVU031655
	for <meta-arago@arago-project.org>; Fri, 15 Apr 2016 08:23:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3FDNrsl027918
	for <meta-arago@arago-project.org>; Fri, 15 Apr 2016 08:23:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 15 Apr 2016 08:23:53 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3FDNpLF002525;	Fri, 15 Apr 2016 08:23:52 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Apr 2016 18:53:50 +0530
Message-ID: <1460726630-23993-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master][PATCH] packagegroup-tisdk-graphics-sdk-target: Remove bltsville
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
X-List-Received-Date: Fri, 15 Apr 2016 13:23:58 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb     | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 2cb4ec2..7c2300c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -27,10 +27,6 @@ GRAPHICS_RDEPENDS_omap-a15 = "\
     omap5-sgx-ddk-um-linux-dev \
     "
 
-GRAPHICS_BLTSVILLE = ""
-GRAPHICS_BLTSVILLE_omap-a15 = " bltsville-dev"
-
 RDEPENDS_${PN} = "\
     ${GRAPHICS_RDEPENDS} \
-    ${GRAPHICS_BLTSVILLE} \
 "
-- 
1.9.1


