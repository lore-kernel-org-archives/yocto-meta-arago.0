Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6FE7252A52
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 22:26:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16MQpIn021479
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 16:26:51 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16MQpT5020555
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 16:26:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 16:26:50 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16MQlYe006285;
	Thu, 6 Feb 2014 16:26:49 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 16:26:46 -0600
Message-ID: <1391725606-22383-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCHv2] cryptodev: Autoload cryptodev module
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
X-List-Received-Date: Thu, 06 Feb 2014 22:26:53 -0000
Content-Type: text/plain

* Use module_autoload_<name> feature from kernel-modules-split.bbclass to
* autoload kernel module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Use module_autoload instead of manually creating files in /etc/modules-load.d/

 .../cryptodev/cryptodev_1.6.bbappend               |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
new file mode 100644
index 0000000..0c6a087
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+module_autoload_cryptodev = "cryptodev"
-- 
1.7.0.4


