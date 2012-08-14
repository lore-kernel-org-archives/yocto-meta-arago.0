Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D7E2352986
	for <meta-arago@arago-project.org>;
	Tue, 14 Aug 2012 21:12:48 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7ELCm8T031893
	for <meta-arago@arago-project.org>; Tue, 14 Aug 2012 16:12:48 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7ELCmdd001327
	for <meta-arago@arago-project.org>; Tue, 14 Aug 2012 16:12:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 14 Aug 2012 16:12:47 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7ELCm6n001311;	Tue, 14 Aug 2012 16:12:48 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T1OYt-0001Ns-4J; Tue, 14 Aug 2012 16:22:03 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Aug 2012 16:21:58 -0500
Message-ID: <1344979318-5283-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1344979318-5283-1-git-send-email-fcooper@ti.com>
References: <1344979318-5283-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] libatomics-ops: Fix compiler error message (Temporary)
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
X-List-Received-Date: Tue, 14 Aug 2012 21:12:49 -0000
Content-Type: text/plain

* Compiling libatomics-ops using our current external Linaro base toolchain
  results in a compiler error message: "Error: selected processor does not
  support Thumb mode"
* Adding the -mimplicity-it=thumb option fixes this issue.
* This should only be a temporary fix until a proper fix is made in the
  toolchain.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../pulseaudio/libatomics-ops_1.2.bbappend         |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend
new file mode 100644
index 0000000..4c60634
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+EXTRA_OEMAKE += "-mimplicit-it=thumb"
-- 
1.7.0.4


