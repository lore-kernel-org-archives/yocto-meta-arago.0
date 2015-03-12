Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 09F1852ABD
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 02:23:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C2NjO8028529
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:23:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C2NiKJ031532
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:23:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 21:23:43 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2C2NcZo013371;	Wed, 11 Mar 2015 21:23:43 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2015 22:23:35 -0400
Message-ID: <1426127016-21527-4-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
References: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] tisdk-recovery-rootfs-image: Recovery root filesystem image
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
X-List-Received-Date: Thu, 12 Mar 2015 02:23:46 -0000
Content-Type: text/plain

- Root filesystem to be used for crash recovery

Signed-off-by: Hao Zhang <hzhang@ti.com>
Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../images/tisdk-recovery-rootfs-image.bb          |   10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb
new file mode 100644
index 0000000..5a1ea0f
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb
@@ -0,0 +1,10 @@
+# TI SDK recovery filesystem image
+COMPATIBLE_MACHINE = "keystone"
+
+require arago-image.inc
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-tisdk-recoveryfs \
+"
+
+export IMAGE_BASENAME = "tisdk-recoveryfs"
-- 
1.7.9.5


