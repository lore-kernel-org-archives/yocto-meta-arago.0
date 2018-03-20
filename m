Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C3BD652998
	for <meta-arago@arago-project.org>;
	Tue, 20 Mar 2018 21:01:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2KL0Zu2002504
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 16:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521579635;
	bh=CUQ6QN35nLl8c4DzIVB+yKC5NDNMg+WGoPME0H++HJ0=;
	h=From:To:Subject:Date;
	b=mDMScxDXR8qa61WLx5eGuwk7Eyd7wbYb5ldaUo6465g1v3OfOUVgwOwjC277wFonM
	TZBZTbYKFBjcyVIkMlQZQ2c5oK1US/H4NZAsC/zzvz+gCUTjiYQWWLT0X4+TdXVifK
	PVIdV91RW5ODHVzz1WNPSl+9PJLe2JSNl5eN/NIg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KL0Zv5014950
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 16:00:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Mar 2018 16:00:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 20 Mar 2018 16:00:35 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KL0Z1X025302
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 16:00:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 20 Mar 2018 17:00:32 -0400
Message-ID: <1521579632-31441-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] posix-smp-demo: Updating to version 01.01.00.00
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
X-List-Received-Date: Tue, 20 Mar 2018 21:01:36 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc   | 5 +++++
 recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend | 1 +
 recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend      | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
 create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend
 create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend

diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc b/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
new file mode 100644
index 0000000..2058ada
--- /dev/null
+++ b/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.00"
+POSIX_SMP_SRCREV = "139fe7ec58939dc2743355e5fede0735f8693ebd"
+
+PV = "01.01.00.00"
+INC_PR = "r0"
diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend b/recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend
new file mode 100644
index 0000000..e7b3dce
--- /dev/null
+++ b/recipes-apps/posix-smp-demo/posix-smp-demo-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
new file mode 100644
index 0000000..e7b3dce
--- /dev/null
+++ b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
@@ -0,0 +1 @@
+require recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
-- 
1.9.1


