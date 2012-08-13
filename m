Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B3D72529EF
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 20:24:20 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DKOJd6025552
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 15:24:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DKOJp6023445
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 15:24:19 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 15:24:19 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DKOJ99018964;	Mon, 13 Aug 2012 15:24:19 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T11K3-00089F-JB; Mon, 13 Aug 2012 15:33:11 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 15:33:07 -0500
Message-ID: <1344889987-31288-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] psplash: Update to latest version of psplash. Tweak LIC_FILES_CHKSUM variable
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
X-List-Received-Date: Mon, 13 Aug 2012 20:24:20 -0000
Content-Type: text/plain

* Add the change to the variable LIC_FILES_CHKSUM to insure that only
  the lines that contains license information are used for the checksum
* Update to the latest version of psplash.
* The above changes are already found in the psplash recipe located in oe-core
  master

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/psplash/psplash_git.bbappend      |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend

diff --git a/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend b/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
new file mode 100644
index 0000000..0ddbd6a
--- /dev/null
+++ b/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
@@ -0,0 +1,4 @@
+LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
+
+SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
+PRINC := "${@int(PRINC) + 1}"
-- 
1.7.0.4


