Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1DC9F52A9D
	for <meta-arago@arago-project.org>;
	Thu, 10 Sep 2015 16:02:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8AG2Uvu001413
	for <meta-arago@arago-project.org>; Thu, 10 Sep 2015 11:02:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8AG2Ute028580
	for <meta-arago@arago-project.org>; Thu, 10 Sep 2015 11:02:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 10 Sep 2015 11:02:20 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8AG2TQ1010986;
	Thu, 10 Sep 2015 11:02:30 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Za4Iu-0001eW-Od; Thu, 10 Sep 2015 12:02:28 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Sep 2015 12:02:26 -0400
Message-ID: <1441900947-6318-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] packagegroup-arago-tisdk-graphics-sdk-host: Add omapdrm-pvr-src for omap-a15
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
X-List-Received-Date: Thu, 10 Sep 2015 16:02:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index b601495..2dae8ba 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics sources in SDK"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,6 +10,7 @@ GRAPHICS_RDEPENDS = ""
 
 GRAPHICS_RDEPENDS_append_ti33x = " omapdrm-pvr-src"
 GRAPHICS_RDEPENDS_append_ti43x = " omapdrm-pvr-src"
+GRAPHICS_RDEPENDS_append_omap-a15 = " omapdrm-pvr-src"
 
 RDEPENDS_${PN} = "\
     ${GRAPHICS_RDEPENDS} \
-- 
1.9.1


