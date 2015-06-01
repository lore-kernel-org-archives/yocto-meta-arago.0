Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4924952A8E
	for <meta-arago@arago-project.org>;
	Mon,  1 Jun 2015 18:55:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51IttPg001026
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:55 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51IttAf002941
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:55 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 13:55:54 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t51ItsVM018439;	Mon, 1 Jun 2015 13:55:54 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YzUsM-0005cd-E5;
	Mon, 01 Jun 2015 14:55:54 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Jun 2015 14:55:47 -0400
Message-ID: <1433184950-16151-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
References: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] packagegroup-arago-tisdk-addons-sdk-target_dra7xx: Add gdbserver-c6x
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
X-List-Received-Date: Mon, 01 Jun 2015 18:55:57 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 2ccbdd4..9037ea1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -15,7 +15,10 @@ UTILS_append_dra7xx = " canutils-dev"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem-dev"
-EXTRA_LIBS_append_dra7xx = " libulm-dev libulm-staticdev"
+EXTRA_LIBS_append_dra7xx = " libulm-dev \
+                             libulm-staticdev \
+                             gdbserver-c6x-dev \
+"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
-- 
1.7.9.5


