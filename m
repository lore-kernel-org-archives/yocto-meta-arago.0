Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 714B352A00
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 19:10:58 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MJAsB6019208
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 14:10:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MJAsJU019034
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 14:10:54 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 14:10:54 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7MJAsv6012905;	Wed, 22 Aug 2012 14:10:54 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T4GWA-0004bl-R0; Wed, 22 Aug 2012 14:23:06 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Aug 2012 14:23:05 -0500
Message-ID: <1345663385-17680-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] psplash_git: Update to latest psplash version. LIC_CHKSUM Tweak
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
X-List-Received-Date: Wed, 22 Aug 2012 19:11:04 -0000
Content-Type: text/plain

* The changes made here have already been done in the version of the psplash
  recipe in oe-core master.

* These changes correspond to the follow commits in oe-core:
  psplash - Update to latest psplash version. LIC_CHKSUM Tweak
  https://github.com/openembedded/oe-core/commit/e15dd9dede74c8906e118647ab93941c1fcb35b1

  psplash: Update to latest psplash version
  https://github.com/openembedded/oe-core/commit/662637decc23888c9b0da93807257943bab14583

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/psplash/psplash_git.bbappend      |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/psplash/psplash_git.bbappend

diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
new file mode 100644
index 0000000..b452cb1
--- /dev/null
+++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
@@ -0,0 +1,11 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
+
+# Update which portion of the psplash.h file to use as a checksum. This tweak
+# has already been done in oe-core master
+LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
+
+# Updating to latest version of psplash. This is the version used in oe-core master
+SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
-- 
1.7.0.4


