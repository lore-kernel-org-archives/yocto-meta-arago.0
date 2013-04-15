Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4617F52A85
	for <meta-arago@arago-project.org>;
	Mon, 15 Apr 2013 20:03:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3FK3Lr1006218
	for <meta-arago@arago-project.org>; Mon, 15 Apr 2013 15:03:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3FK3L0g032397
	for <meta-arago@arago-project.org>; Mon, 15 Apr 2013 15:03:21 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 15 Apr 2013 15:03:21 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3FK3FGa010527;
	Mon, 15 Apr 2013 15:03:19 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Apr 2013 15:03:12 -0500
Message-ID: <1366056193-22892-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366056193-22892-1-git-send-email-Chase.Maupin@ti.com>
References: <1366056193-22892-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] linux-ti-staging: overlay LOCALVERSION fix
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
X-List-Received-Date: Mon, 15 Apr 2013 20:03:22 -0000
Content-Type: text/plain

* Overlay the LOCALVERSION fix until it can be picked up in the
  oe-core danny branch

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linux/linux-ti-staging_3.8.bbappend            |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
index 39f0d75..11f0d73 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = "-arago4"
+MACHINE_KERNEL_PR_append = "-arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
@@ -29,3 +29,13 @@ pkg_postrm_kernel-devicetree () {
         update-alternatives --remove ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
     done
 }
+
+# The below lines are overlayed until the LOCALVERSION change is merged into
+# the oe-core danny branch.
+kernel_do_configure_prepend() {
+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+    then
+        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+    fi
+}
-- 
1.7.0.4


