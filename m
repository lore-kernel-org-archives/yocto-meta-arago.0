Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 57F0752A38
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 22:17:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16MHpMT003964
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 16:17:51 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16MHptU014616
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 16:17:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 16:17:51 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16MHmVh031086;
	Thu, 6 Feb 2014 16:17:49 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 16:17:46 -0600
Message-ID: <1391725066-27947-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] cryptodev: Autoload cryptodev module
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
X-List-Received-Date: Thu, 06 Feb 2014 22:17:52 -0000
Content-Type: text/plain

* Create append that will create /etc/modules-load.d/ config file which will
  autoload the cryptodev module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../cryptodev/cryptodev_1.6.bbappend               |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
new file mode 100644
index 0000000..96fb74d
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
@@ -0,0 +1,9 @@
+PR_append = "-arago0"
+
+do_install_append() {
+
+    # Create conf file to autoload kernel module
+    install -d ${D}/etc/modules-load.d/
+    touch ${D}/etc/modules-load.d/cryptodev.conf
+    echo "cryptodev" > ${D}/etc//modules-load.d/cryptodev.conf
+}
-- 
1.7.0.4


