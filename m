Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id C1575529C6
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 19:10:16 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI005I458O2RS0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 08 Apr 2015 14:10:01 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=QtXpBu2Y c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8	a=UkxQb1ymIDVSXvOaBkoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 43432200DD;	Wed,
	8 Apr 2015 15:10:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 08 Apr 2015 15:10:00 -0400
Message-id: <1428520200-12372-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] lmbench: fix QA issue warning due to not passing full LDFLAGS
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
X-List-Received-Date: Wed, 08 Apr 2015 19:10:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

No PR bump needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend
index 3fa38f6..8cd59ff 100644
--- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend
+++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend
@@ -1,5 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+INSANE_SKIP_${PN} += "ldflags"
+
 PR_append = "-arago0"
 
 SRC_URI += "file://0001-Makefile-Add-TI-SDK-Modifications.patch"
-- 
2.2.0


