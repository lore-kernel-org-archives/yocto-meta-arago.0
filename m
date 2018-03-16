Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 18A9A52986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:19:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGIJ9V007016
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521217099;
	bh=dnZ8PPDpY94DmF6fKSaByJvtTFO5yb2N7aZlTMJNdeg=;
	h=From:To:Subject:Date;
	b=TKmdXys8bFm7kIG/842yjeGbSQNQgpOe3k4s/DsTtdzQ9AwRzUCdGHERV7lsJJX/2
	x6kFv8SnG6sdBKTf/EYuD3Q7OSPIwIC2zwAzP8ecXnQMmOZMADoEpyVGxRQqmg6KXj
	NNyIHrkstDWMuUkw0biKxEB+AJhpXRAFjXtNoFGk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGIJkI012568
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:18:19 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:18:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:18:19 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGIJFV031050
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:18:19 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:18:18 -0400
Message-ID: <1521217098-27484-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] icss-emac-lld: Updating to version 01.00.00.11B
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
X-List-Received-Date: Fri, 16 Mar 2018 16:19:14 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.11B.inc  | 5 +++++
 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend | 2 ++
 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbappend | 2 ++
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend      | 2 ++
 4 files changed, 11 insertions(+)
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.11B.inc
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbappend
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.11B.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.11B.inc
new file mode 100644
index 0000000..f2b4006
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.11B.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.11B"
+ICSS_EMAC_LLD_SRCREV = "bd643d75a0322b6ca769d8ecbee310d859c0f761"
+
+PV = "01.00.00.11B"
+INC_PR = "r0"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend
new file mode 100644
index 0000000..818c04e
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.11B.inc
+
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbappend b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbappend
new file mode 100644
index 0000000..818c04e
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.11B.inc
+
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
new file mode 100644
index 0000000..818c04e
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.11B.inc
+
-- 
1.9.1


