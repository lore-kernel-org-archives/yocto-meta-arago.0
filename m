Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 1C9FE52A6D
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 01:51:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I000N5IHO8660@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 20:51:24 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0F30B205E8; Wed,
	23 Apr 2014 21:51:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 21:51:17 -0400
Message-id: <1398304280-15426-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398304280-15426-1-git-send-email-denis@denix.org>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/8] base-files: remove symlinking of /run vs. /var/run not needed in Dora
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
X-List-Received-Date: Thu, 24 Apr 2014 01:51:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/base-files/base-files_3.0.14.bbappend        | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
index 4d831fd..8c65bd1 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappend
@@ -1,13 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago1"
-
-# Pre-create /run symlink to point to /var/run at build time
-# This normally happens on first boot, but may be too late for automount,
-# which tries to create mount-points in /run
-# NOTE: This step is not required in Dora and up, due to reverse direction
-# of symlinking between /run and /var/run
-do_install_append () {
-	ln -sf /var/run ${D}/run
-}
+PR_append = "-arago2"
-- 
1.9.2


