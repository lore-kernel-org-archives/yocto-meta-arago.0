Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 790CB52A9A
	for <meta-arago@arago-project.org>;
	Fri, 17 Aug 2012 16:26:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7HGQjSj023840
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2012 11:26:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7HGQjBj021908
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2012 11:26:45 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 17 Aug 2012 11:26:45 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7HGQjPP030326;	Fri, 17 Aug 2012 11:26:45 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T2PXj-0004bV-Cr; Fri, 17 Aug 2012 11:37:03 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Aug 2012 11:37:02 -0500
Message-ID: <1345221422-17662-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-base-tisdk: Change the psplash recipe used and add LICENSE information
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
X-List-Received-Date: Fri, 17 Aug 2012 16:26:49 -0000
Content-Type: text/plain

* As of now we are no longer using psplash-ti. Will be using the base psplash
  recipe with overrides from within this layer.
* Task was missing LICENSE information. Copied the LICENSE information that was
  used in other tasks in this layer.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-base-tisdk.bb    |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/tasks/task-arago-base-tisdk.bb
index ce16835..c884352 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-base-tisdk.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
-PR = "r8"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r9"
 
 inherit task
 
@@ -19,7 +20,7 @@ RDEPENDS_${PN} = "\
     libpcre \
     iptables \
     iperf \
-    psplash-ti \
+    psplash \
     u-boot \
     arago-gpl-notice \
     nfs-utils-client \
-- 
1.7.7


