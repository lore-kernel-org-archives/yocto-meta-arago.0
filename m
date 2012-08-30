Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C6597529D8
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 00:48:49 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7U0mn0I031637
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 19:48:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7U0mn76011936
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 19:48:49 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 19:48:48 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7U0mmGA029994;	Wed, 29 Aug 2012 19:48:48 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6tAd-0005aE-2h; Wed, 29 Aug 2012 20:03:43 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 20:03:39 -0500
Message-ID: <1346288619-21223-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1346288619-21223-1-git-send-email-fcooper@ti.com>
References: <1346288619-21223-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-tisdk-addons: Add additional utilities
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
X-List-Received-Date: Thu, 30 Aug 2012 00:48:50 -0000
Content-Type: text/plain

* Add two additional utilities:
    dropbear - Used for Eclipse RSE plugin
    openssh-sftp-server - Used for Eclipse RSE plugin
* In arago, these utilities were originally brought in via the
  task-arago-tisdk-crypto task. It makes alot more sense to add it
  here instead.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-addons.bb  |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
index 167df12..d2d1676 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r1"
+PR = "r2"
 
 inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -15,6 +15,8 @@ UTILS = " \
     nbench-byte \
     trace-cmd \
     arm-benchmarks \
+    dropbear \
+    openssh-sftp-server \
 "
 
 # Add PRU examples for am180x-evm devices
-- 
1.7.0.4


