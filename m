Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9999F529EF
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 18:11:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DIBkkB008848
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 13:11:46 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DIBk1U029243
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 13:11:46 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 13:11:46 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DIBkRe009061;	Mon, 13 Aug 2012 13:11:46 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T0zFk-00069e-9o; Mon, 13 Aug 2012 13:20:36 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 13:20:31 -0500
Message-ID: <1344882031-23626-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] tremor: Fix compiler error message (Temporary)
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
X-List-Received-Date: Mon, 13 Aug 2012 18:11:48 -0000
Content-Type: text/plain

* Compiling tremor using our current external Linaro base toolchain results in a
  compiler error message: "Error: thumb conditional instructions should be in IT
  block"
* Adding the -mimplicity-it=thumb option fixes this issue.
* This should only be a temporary fix until a proper fix is made in the
  toolchain.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../tremor/tremor_20120314.bbappend                |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/tremor/tremor_20120314.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/tremor/tremor_20120314.bbappend b/meta-arago-distro/recipes-multimedia/tremor/tremor_20120314.bbappend
new file mode 100644
index 0000000..4c60634
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/tremor/tremor_20120314.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+EXTRA_OEMAKE += "-mimplicit-it=thumb"
-- 
1.7.7


