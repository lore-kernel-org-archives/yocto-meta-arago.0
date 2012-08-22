Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AFF8E52A4B
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 01:22:42 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7M1MfeX007585
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 20:22:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7M1Mf2A015176
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 20:22:41 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 21 Aug 2012 20:22:41 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7M1MfPo001314;	Tue, 21 Aug 2012 20:22:41 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T3zq9-0002Xz-4q; Tue, 21 Aug 2012 20:34:37 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2012 20:34:35 -0500
Message-ID: <1345599275-9169-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] recipes: correct the previous fix to properly pass options to the compiler
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
X-List-Received-Date: Wed, 22 Aug 2012 01:22:43 -0000
Content-Type: text/plain

* Correctly pass the options to the compiler instead of to make.
* For some reason the incorrect approach allowed the software to be compiled.
  Errors were being ignored which made it seem like everything was compiling
  successfull until you realized files/libraries were missing.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../pulseaudio/libatomics-ops_1.2.bbappend         |    2 +-
 .../postgresql/postgresql_8.4.7.bbappend           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend
index 4c60634..57c9972 100644
--- a/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend
+++ b/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend
@@ -1,3 +1,3 @@
 PR_append = "-arago0"
 
-EXTRA_OEMAKE += "-mimplicit-it=thumb"
+EXTRA_OEMAKE += "CFLAGS+='-Wa, -mimplicit-it=thumb'"
diff --git a/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend b/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend
index 4c60634..57c9972 100644
--- a/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend
+++ b/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend
@@ -1,3 +1,3 @@
 PR_append = "-arago0"
 
-EXTRA_OEMAKE += "-mimplicit-it=thumb"
+EXTRA_OEMAKE += "CFLAGS+='-Wa, -mimplicit-it=thumb'"
-- 
1.7.0.4


