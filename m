Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B01F65297F
	for <meta-arago@arago-project.org>;
	Mon, 20 Apr 2015 12:46:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3KCk41b002661
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 07:46:04 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3KCk3aD031851
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 07:46:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 07:46:02 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3KCk2SI017213;
	Mon, 20 Apr 2015 07:46:02 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YkB5O-0007iH-Eh;
	Mon, 20 Apr 2015 08:46:02 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 Apr 2015 08:45:58 -0400
Message-ID: <1429533958-29619-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] powertop: Fix build for !uclibc
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
X-List-Received-Date: Mon, 20 Apr 2015 12:46:05 -0000
Content-Type: text/plain

Recent bitbake 1.24 commits have broken powertop recipe on daisy.

* EXTRA_LDFLAGS isn't defined for !uclibc and configure fails

- Fix was obtained from the upstream oe-core patch at:
https://github.com/openembedded/openembedded-core/commit/a3e9b391e1024d6d2e256b75c214d34e6693e332

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-kernel/powertop/powertop_2.5.bbappend  |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/powertop/powertop_2.5.bbappend

diff --git a/meta-arago-distro/recipes-kernel/powertop/powertop_2.5.bbappend b/meta-arago-distro/recipes-kernel/powertop/powertop_2.5.bbappend
new file mode 100644
index 0000000..1a46b13
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/powertop/powertop_2.5.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+EXTRA_LDFLAGS ?= ""
-- 
1.7.9.5


