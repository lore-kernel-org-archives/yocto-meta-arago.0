Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 11EB05298C
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 14:39:07 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TEd5wd009171
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 09:39:06 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TEd40x001795
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 20:09:04 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 29 Mar 2013 20:09:04 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TEd0Xi009116;
	Fri, 29 Mar 2013 20:09:03 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Mar 2013 09:38:58 -0500
Message-ID: <1364567938-26710-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364567938-26710-1-git-send-email-Chase.Maupin@ti.com>
References: <1364567938-26710-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-ti-staging: add copy-defconfig functionality
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
X-List-Received-Date: Fri, 29 Mar 2013 14:39:07 -0000
Content-Type: text/plain

* Append the linux-ti-staging recipe to use the copy-defconfig
  functionality used by the TI SDKs

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linux/linux-ti-staging_3.8.bbappend            |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
new file mode 100644
index 0000000..5a08e89
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
@@ -0,0 +1,5 @@
+MACHINE_KERNEL_PR_append = "-arago1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+require copy-defconfig.inc
-- 
1.7.0.4


