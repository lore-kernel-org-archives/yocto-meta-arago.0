Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7EEF25299F
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2012 23:52:31 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6JNqUHb016173
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2012 18:52:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6JNqUml021789
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2012 18:52:30 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 19 Jul 2012 18:52:30 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q6JNqUVv023415;	Thu, 19 Jul 2012 18:52:30 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1Ss0Vq-00012i-C3; Thu, 19 Jul 2012 18:52:06 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Jul 2012 18:52:05 -0500
Message-ID: <1342741925-3980-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 1/2] qt4-embedded: Update version to 4.8.1
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
X-List-Received-Date: Thu, 19 Jul 2012 23:52:31 -0000
Content-Type: text/plain

* Updating qt4-embedded version from 4.8.0 to 4.8.1

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt4/qt4-embedded_4.8.0.bbappend     |    5 -----
 .../recipes-qt/qt4/qt4-embedded_4.8.1.bbappend     |    5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
 create mode 100644 meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
deleted file mode 100644
index 462a746..0000000
--- a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
-# For our distribution purposes we only use LGPLv2.1
-LICENSE = "LGPLv2.1"
-
-PR_append = "-arago1"
diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
new file mode 100644
index 0000000..a2dc984
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
@@ -0,0 +1,5 @@
+# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
+# For our distribution purposes we only use LGPLv2.1
+LICENSE = "LGPLv2.1"
+
+PR_append = "-arago0"
-- 
1.7.0.4


