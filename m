Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id B69F052998
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 13:49:02 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N2M0087HX0XFE20@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 18 Mar 2014 08:48:44 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B998A20092; Tue,
	18 Mar 2014 09:48:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 18 Mar 2014 09:48:31 -0400
Message-id: <1395150511-7298-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] libjpeg-turbo: remove unneeded bbappend, SRC_URI overwrite won't fetch
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
X-List-Received-Date: Tue, 18 Mar 2014 13:49:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend

diff --git a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
deleted file mode 100644
index 02d8830..0000000
--- a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-PRINC := "${@int(PRINC) + 4}"
-
-SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=http;module=trunk"
-
-# Patch to incorporate the below changes will be sent to meta-oe master and
-# maintenance branch. When this fix is in the maintenance branch then the
-# below changes can be removed.
-RPROVIDES_jpeg-tools  += "libjpeg-tools"
-RREPLACES_jpeg-tools  += "libjpeg-tools"
-RCONFLICTS_jpeg-tools += "libjpeg-tools"
-- 
1.8.3.2


