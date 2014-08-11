Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AF15552972
	for <meta-arago@arago-project.org>;
	Mon, 11 Aug 2014 22:39:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7BMd7Im031687
	for <meta-arago@arago-project.org>; Mon, 11 Aug 2014 17:39:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7BMd6Yn003537
	for <meta-arago@arago-project.org>; Mon, 11 Aug 2014 17:39:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 11 Aug 2014 17:39:06 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7BMd5xq007326;	Mon, 11 Aug 2014 17:39:06 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7BMd33j002359;	Tue, 12 Aug 2014 04:09:04 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Aug 2014 17:39:01 -0500
Message-ID: <1407796741-15786-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] qtwayland - Fix fetch breakage
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
X-List-Received-Date: Mon, 11 Aug 2014 22:39:13 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* By default qt5-git.inc by default points to the "stable" branch for the
  qtwayland git repository.
* However, this branch no longer exist and results in a fetch error.
* This SRCREVs that qtwayland/qtwayland-native point to are found within the 5.3
  branch.
* So set QT_MODULE_BRANCH to "5.3".
This patch will be submitted to upstream meta-qt5 and when accepted the appends
can be removed.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt5/qtwayland-native_git.bbappend   |    3 +++
 .../recipes-qt/qt5/qtwayland_git.bbappend          |    3 +++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
 create mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend

diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
new file mode 100644
index 0000000..53c1454
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+QT_MODULE_BRANCH = "5.3"
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
new file mode 100644
index 0000000..53c1454
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+QT_MODULE_BRANCH = "5.3"
-- 
1.7.9.5


