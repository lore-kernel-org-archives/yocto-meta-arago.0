Return-Path: <a0875592@swubn01>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id ECF8952AAF
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 11:03:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QB3Pvr022737
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 06:03:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QB3Oe6028452
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 06:03:24 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 06:03:24 -0500
Received: from swubn01 (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QB3OSs008287;
	Wed, 26 Jun 2013 06:03:24 -0500
Received: from a0875592 by swubn01 with local (Exim 4.71)	(envelope-from
	<a0875592@swubn01>)	id 1UrnVT-00031p-M9; Wed, 26 Jun 2013 16:33:23 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 16:33:16 +0530
Message-ID: <1372244597-11600-2-git-send-email-heroor@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372244597-11600-1-git-send-email-heroor@ti.com>
References: <1372244597-11600-1-git-send-email-heroor@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] meta-arago-distro: recipes-kernel - Overlay Arago info
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
X-List-Received-Date: Wed, 26 Jun 2013 11:03:26 -0000
Content-Type: text/plain

* Based of linux-ti-staging_3.8.bbappend

Signed-off-by: Siddharth Heroor <heroor@ti.com>
cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../linux/linux-ti-glsdk_3.8.bbappend              |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend
new file mode 100644
index 0000000..b20c63a
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend
@@ -0,0 +1,17 @@
+MACHINE_KERNEL_PR_append = "-arago6"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+require copy-defconfig.inc
+
+KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
+
+# The below lines are overlayed until the LOCALVERSION change is merged into
+# the oe-core danny branch. Update: not coming to danny, keep until dylan.
+kernel_do_configure_prepend() {
+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+    then
+        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+    fi
+}
-- 
1.7.0.4


