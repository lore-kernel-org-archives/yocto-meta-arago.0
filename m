Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2C64C52ABC
	for <meta-arago@arago-project.org>;
	Thu, 28 May 2015 11:05:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4SB56MA020318
	for <meta-arago@arago-project.org>; Thu, 28 May 2015 06:05:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4SB56EN016652
	for <meta-arago@arago-project.org>; Thu, 28 May 2015 06:05:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 06:05:06 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4SB56gw019546;	Thu, 28 May 2015 06:05:06 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YxvcY-0000za-3a;
	Thu, 28 May 2015 07:05:06 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 May 2015 07:04:54 -0400
Message-ID: <1432811095-3754-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1432811095-3754-1-git-send-email-j-stiffler@ti.com>
References: <1432811095-3754-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] packagegroup-arago-tisdk-addons-sdk-host_dra7xx: Add debugss-module-drv-src.
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
X-List-Received-Date: Thu, 28 May 2015 11:05:08 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index a955a3a..f821059 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -27,6 +27,7 @@ UTILS_append_ti33x = " \
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem-mod-src"
+EXTRA_LIBS_append_dra7xx = " debugss-module-drv-src"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
-- 
1.7.9.5


