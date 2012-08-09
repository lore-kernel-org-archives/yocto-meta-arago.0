Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 70905529FF
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2012 18:03:36 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q79I3ZEW011606
	for <meta-arago@arago-project.org>; Thu, 9 Aug 2012 13:03:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q79I3ZYV028543
	for <meta-arago@arago-project.org>; Thu, 9 Aug 2012 13:03:35 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 9 Aug 2012 13:03:34 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q79I3Y0J010656;	Thu, 9 Aug 2012 13:03:34 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1SzXCB-0002hq-3N; Thu, 09 Aug 2012 13:10:55 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Aug 2012 13:10:13 -0500
Message-ID: <1344535813-10364-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [branches: master][PATCH] base-files: Add in custom Arago prelogin message
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
X-List-Received-Date: Thu, 09 Aug 2012 18:03:37 -0000
Content-Type: text/plain

* Override issues.net to add custom prelogin message when connected via telnet
* Override issues to add custom prelogin message when connected via
  network/serial (not including telnet)

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/base-files/base-files/issue       |    8 ++++++++
 .../recipes-core/base-files/base-files/issue.net   |    8 ++++++++
 .../base-files/base-files_3.0.14.bbappend          |    4 ++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/base-files/base-files/issue
 create mode 100644 meta-arago-extras/recipes-core/base-files/base-files/issue.net
 create mode 100644 meta-arago-extras/recipes-core/base-files/base-files_3.0.14.bbappend

diff --git a/meta-arago-extras/recipes-core/base-files/base-files/issue b/meta-arago-extras/recipes-core/base-files/base-files/issue
new file mode 100644
index 0000000..4f22fd9
--- /dev/null
+++ b/meta-arago-extras/recipes-core/base-files/base-files/issue
@@ -0,0 +1,8 @@
+ _____                    _____           _         _   
+|  _  |___ ___ ___ ___   |  _  |___ ___  |_|___ ___| |_ 
+|     |  _| .'| . | . |  |   __|  _| . | | | -_|  _|  _|
+|__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|  
+              |___|                    |___|            
+
+Arago Project http://arago-project.org \n \l
+
diff --git a/meta-arago-extras/recipes-core/base-files/base-files/issue.net b/meta-arago-extras/recipes-core/base-files/base-files/issue.net
new file mode 100644
index 0000000..8ce7207
--- /dev/null
+++ b/meta-arago-extras/recipes-core/base-files/base-files/issue.net
@@ -0,0 +1,8 @@
+ _____                    _____           _         _   
+|  _  |___ ___ ___ ___   |  _  |___ ___  |_|___ ___| |_ 
+|     |  _| .'| . | . |  |   __|  _| . | | | -_|  _|  _|
+|__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|  
+              |___|                    |___|            
+
+Arago Project http://arago-project.org %h
+
diff --git a/meta-arago-extras/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-arago-extras/recipes-core/base-files/base-files_3.0.14.bbappend
new file mode 100644
index 0000000..c0ab069
--- /dev/null
+++ b/meta-arago-extras/recipes-core/base-files/base-files_3.0.14.bbappend
@@ -0,0 +1,4 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
-- 
1.7.0.4


