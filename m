Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 797235298F
	for <meta-arago@arago-project.org>;
	Fri, 24 Feb 2012 16:06:40 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1OG6crE015752
	for <meta-arago@arago-project.org>; Fri, 24 Feb 2012 10:06:39 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1OG6b66023814
	for <meta-arago@arago-project.org>;
	Fri, 24 Feb 2012 21:36:37 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 24 Feb 2012 21:36:36 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1OG6XNj006855;
	Fri, 24 Feb 2012 21:36:35 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Feb 2012 10:06:31 -0600
Message-ID: <1330099591-16515-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] arago-gpl-notice: make sure output is flushed
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
X-List-Received-Date: Fri, 24 Feb 2012 16:06:41 -0000
Content-Type: text/plain

* Simplified the writes to use cat
* Redirector to STDERR so that the output would flush before
  something else would print
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../arago-gpl-notice/arago-gpl-notice.bb           |    2 +-
 .../arago-gpl-notice/print-gplv3-packages.sh       |   38 +++++++++++--------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index f319462..e9757c5 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Script to warn users of GPLv3 content on the target file system a
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
 
-PR = "r0"
+PR = "r1"
 
 S = "${WORKDIR}"
 
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
index 026c0e9..090735b 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
@@ -31,20 +31,26 @@ done
 
 if [ "$gplv3_packages" != "" ]
 then
-    echo "***************************************************************"
-    echo "***************************************************************"
-    echo "NOTICE: This file system contains the followin GPLv3 packages:"
-    echo -e $gplv3_packages
-    echo "If you do not wish to distribute GPLv3 components please remove"
-    echo "the above packages prior to distribution.  This can be done using"
-    echo "the opkg remove command.  i.e.:"
-    echo "    opkg remove <package>"
-    echo "Where <package> is the name printed in the list above"
-    echo ""
-    echo "NOTE: If the package is a dependency of another package you"
-    echo "      will be notified of the dependent packages.  You should"
-    echo "      use the --force-removal-of-dependent-packages option to"
-    echo "      also remove the dependent packages as well"
-    echo "***************************************************************"
-    echo "***************************************************************"
+# NOTE: Redirecting to STDERR to make sure the output is flushed before
+#       anything else prints
+cat << EOM 2>&1
+***************************************************************
+***************************************************************
+NOTICE: This file system contains the followin GPLv3 packages:
+EOM
+    echo -e $gplv3_packages 2>&1
+cat << EOM 2>&1
+If you do not wish to distribute GPLv3 components please remove
+the above packages prior to distribution.  This can be done using
+the opkg remove command.  i.e.:
+    opkg remove <package>
+Where <package> is the name printed in the list above
+
+NOTE: If the package is a dependency of another package you
+      will be notified of the dependent packages.  You should
+      use the --force-removal-of-dependent-packages option to
+      also remove the dependent packages as well
+***************************************************************
+***************************************************************
+EOM
 fi
-- 
1.7.0.4


