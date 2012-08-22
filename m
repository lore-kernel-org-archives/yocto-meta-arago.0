Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 815C9529FF
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 15:43:30 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MFhTjq025063
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 10:43:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MFhTwW010453
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 10:43:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 10:43:29 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7MFhTAP014246;	Wed, 22 Aug 2012 10:43:29 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T4DHO-0000oA-JV; Wed, 22 Aug 2012 10:55:38 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Aug 2012 10:55:37 -0500
Message-ID: <1345650937-3064-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-extras][PATCH] matrix-gui-generic-pm: Adding power management helper scripts
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
X-List-Received-Date: Wed, 22 Aug 2012 15:43:30 -0000
Content-Type: text/plain

* Adding power management helper scripts which are used by the other
  power management Matrix v2 demos.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../matrix/matrix-gui-generic-pm_2.0.bb            |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
new file mode 100644
index 0000000..ccc1619
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Power management helper scripts"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+LIC_FILES_CHKSUM := "file://../../${LICENSE_CHECKSUM}"
+PR = "${INC_PR}.0"
+
+PACKAGE_ARCH = "all"
+
+S = "${WORKDIR}/git/power_apps/pm_generic_power"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/setclockspeed.sh ${D}${bindir}    
+    install -m 0755 ${S}/warnonpm.sh ${D}${bindir}    
+}
-- 
1.7.0.4


