Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 13FA152A8E
	for <meta-arago@arago-project.org>;
	Mon,  1 Jun 2015 18:55:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51ItuSO021704
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51ItuZU002961
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 13:55:55 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t51IttXc004748;	Mon, 1 Jun 2015 13:55:56 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YzUsN-0005dm-Ny;
	Mon, 01 Jun 2015 14:55:55 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Jun 2015 14:55:49 -0400
Message-ID: <1433184950-16151-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
References: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] packagegroup-arago-tisdk-addons-sdk-host_dra7xx: Add gdbserverproxy-module-drv-src
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
X-List-Received-Date: Mon, 01 Jun 2015 18:55:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index f821059..c60bb7b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -27,7 +27,7 @@ UTILS_append_ti33x = " \
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem-mod-src"
-EXTRA_LIBS_append_dra7xx = " debugss-module-drv-src"
+EXTRA_LIBS_append_dra7xx = " debugss-module-drv-src gdbserverproxy-module-drv-src"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
-- 
1.7.9.5


