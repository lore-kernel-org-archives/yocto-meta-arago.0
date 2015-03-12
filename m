Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8721152A29
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 02:23:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C2NhkH021888
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:23:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C2Ng4k030057
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:23:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 21:23:42 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2C2NcZn013371;	Wed, 11 Mar 2015 21:23:42 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2015 22:23:34 -0400
Message-ID: <1426127016-21527-3-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
References: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] packagegroup-arago-tisdk-recoveryfs: Packagegroup for recovery root filesystem
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
X-List-Received-Date: Thu, 12 Mar 2015 02:23:44 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

- The recovery root filesystem includes makedumpfile tool and the script
to call makedumpfile to create dump file from kdump.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../packagegroup-arago-tisdk-recoveryfs.bb         |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-recoveryfs.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-recoveryfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-recoveryfs.bb
new file mode 100644
index 0000000..41842ad
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-recoveryfs.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Packagegroup for basic recovery rootfs"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+ARAGO_BASE = "\
+    module-init-tools \
+    mtd-utils \
+    initscript-telnetd \
+    "
+
+# these require meta-openembedded/meta-oe layer
+ARAGO_EXTRA = "\
+    makedumpfile \
+    crash-recovery \
+    "
+
+# minimal set of packages - needed to boot
+RDEPENDS_${PN} = "\
+    ${ARAGO_BASE} \
+    ${ARAGO_EXTRA} \
+    "
-- 
1.7.9.5


