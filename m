Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E7FDE529A5
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 15:58:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GFvH5E014389
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521215837;
	bh=L2obY0darhcdUTe7imAeTbhyRelUEGBcIDlhPTzqsPo=;
	h=From:To:Subject:Date;
	b=BGvuYSIFssGTwJd8zBowPvzSx2L9oOlMbD5tf2YvGoFGBSo3iOlhIEeGyMb0pLE/u
	T4yaGqyFKPKPMErhV04KUDmd3zWGn8gAxpkio0Fqk368d3DHQRdbNldEyHZ63RU8BX
	6Lmw7TJm+CojcCR3LmWLpI5x8EYofSjgdsKDygYs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFvHL0010880
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:57:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 10:57:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 10:57:17 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFvGf2032462
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:57:16 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 11:57:15 -0400
Message-ID: <1521215835-26950-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] fatfs-rtos: Updating to version 01.00.00.09
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
X-List-Received-Date: Fri, 16 Mar 2018 15:58:12 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend

diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend
new file mode 100644
index 0000000..576baec
--- /dev/null
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.09"
+FATFS_SRCREV = "a5652991a9dd9a9b9b9c5c2cf35d1417f8272b00"
+
+PV = "01.00.00.09"
+PR = "r0"
-- 
1.9.1


