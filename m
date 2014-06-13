Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0D80D52AD8
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 22:02:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DM2T2x027418
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DM2ShV005690
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 17:02:28 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s5DM2Dfs009769;	Fri, 13 Jun 2014 17:02:27 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jun 2014 17:02:12 -0500
Message-ID: <1402696932-21888-6-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
References: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] u-boot: set mainline u-boot to AUTOREV
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
X-List-Received-Date: Fri, 13 Jun 2014 22:02:30 -0000
Content-Type: text/plain

* While the 2014.07 u-boot is being developed go ahead and set
  it to AUTOREV so we can keep picking up the latest changes.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-bsp/u-boot/u-boot_2014.07.bbappend     |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot_2014.07.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2014.07.bbappend
new file mode 100644
index 0000000..5b6ab64
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2014.07.bbappend
@@ -0,0 +1,6 @@
+# Append the base 2014.07 u-boot mainline recipe to AUTOREV for now so that
+# we can test the latest mainline
+
+PR_append = "-arago1+gitr${SRCPV}"
+
+SRCREV = "${AUTOREV}"
-- 
1.7.9.5


