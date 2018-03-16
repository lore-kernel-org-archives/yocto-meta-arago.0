Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id DEB0152986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 17:23:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GHMOgC028249
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 12:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521220944;
	bh=7AZfujKp5dQlwONWIUCqEXf4SYH6PSYVieNPF/Vjxtw=;
	h=From:To:Subject:Date;
	b=V33ZFSLmA7V1LtnVNCelkEjc2OOShtHsFubqzm4g6sLB6lNATiFyjbBVt0BIIlSu6
	vz4j7ciEccUwXMgI59k9KedQUujWqRIhpqNkeMHQ3M6h2NGEuit7SM7HMqnP9L2wGH
	OnQmJHKbM4e6veEhyYxxpxIWsck1jtig09wL0cC8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GHMOeC014605
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 12:22:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 12:22:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 12:22:23 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GHMNVd014692
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 12:22:23 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 13:22:23 -0400
Message-ID: <1521220943-30210-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] pruss-lld: Updating to version 01.00.00.09A
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
X-List-Received-Date: Fri, 16 Mar 2018 17:23:29 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld-01.00.00.09A.inc  | 5 +++++
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend | 1 +
 recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend | 1 +
 recipes-bsp/pruss-lld/pruss-lld_git.bbappend      | 1 +
 4 files changed, 8 insertions(+)
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-01.00.00.09A.inc
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld_git.bbappend

diff --git a/recipes-bsp/pruss-lld/pruss-lld-01.00.00.09A.inc b/recipes-bsp/pruss-lld/pruss-lld-01.00.00.09A.inc
new file mode 100644
index 0000000..7a61b47
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-01.00.00.09A.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.09A"
+PRUSS_LLD_SRCREV = "e56c0950d30f59db3186f354ea4416eac556a331"
+
+PV = "01.00.00.09A"
+INC_PR = "r0"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
new file mode 100644
index 0000000..212c7f0
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/pruss-lld/pruss-lld-01.00.00.09A.inc
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
new file mode 100644
index 0000000..212c7f0
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/pruss-lld/pruss-lld-01.00.00.09A.inc
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld_git.bbappend
new file mode 100644
index 0000000..212c7f0
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/pruss-lld/pruss-lld-01.00.00.09A.inc
-- 
1.9.1


