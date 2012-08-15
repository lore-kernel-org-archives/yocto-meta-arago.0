Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1B85152986
	for <meta-arago@arago-project.org>;
	Wed, 15 Aug 2012 22:10:04 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7FMA2P2017312
	for <meta-arago@arago-project.org>; Wed, 15 Aug 2012 17:10:02 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7FMA24x024651
	for <meta-arago@arago-project.org>; Wed, 15 Aug 2012 17:10:02 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 15 Aug 2012 17:10:01 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7FMA2eR008095;	Wed, 15 Aug 2012 17:10:02 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T1lwB-0005Sq-Fj; Wed, 15 Aug 2012 17:19:39 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Aug 2012 17:19:35 -0500
Message-ID: <1345069175-20491-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] postgresql: Fix compiler error message (Temporary)
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
X-List-Received-Date: Wed, 15 Aug 2012 22:10:06 -0000
Content-Type: text/plain

* Compiling postgresql using our current external Linaro base tool chain
  results in a compiler error message: "Error: selected processor does not
  support Thumb mode"
* Adding the -mimplicity-it=thumb option fixes this issue.
* This should only be a temporary fix until a proper fix is made in the
  toolchain

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../postgresql/postgresql_8.4.7.bbappend           |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend

diff --git a/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend b/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend
new file mode 100644
index 0000000..4c60634
--- /dev/null
+++ b/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+EXTRA_OEMAKE += "-mimplicit-it=thumb"
-- 
1.7.7


