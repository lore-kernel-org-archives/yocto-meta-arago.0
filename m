Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id CC27652968
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:39:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEcKQU026410
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470300;
	bh=BjDM4eT4NEKlxU2KC04LCvST5mnzLozm9nsgy1+dKHg=;
	h=From:To:Subject:Date;
	b=y3gZOzlSrTsgOFY/htkbIzpqC+2KCPfeoUHyshWkvFGOkR88F2mSmU+K9+/GhmjRu
	eUGQ2XvWeLMmYF0MkmljTGxxFpl7+sgOJTjL6u717z4VjGo6Z6JrWptlH8W2E3Trn9
	vSTTXc/fu5+icg1RxYro38Jt90gjz3pLx+onSzhc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEcKmA016209
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:38:20 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:38:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:38:20 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEcJk9023770
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:38:20 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:38:18 -0400
Message-ID: <1521470298-12742-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] sa-lld: Update to version 03.00.00.20
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
X-List-Received-Date: Mon, 19 Mar 2018 14:39:19 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-03.00.00.20.inc   | 5 +++++
 recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend | 1 +
 recipes-bsp/sa-lld/sa-lld-test_git.bbappend | 1 +
 recipes-bsp/sa-lld/sa-lld_git.bbappend      | 1 +
 4 files changed, 8 insertions(+)
 create mode 100644 recipes-bsp/sa-lld/sa-lld-03.00.00.20.inc
 create mode 100644 recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/sa-lld/sa-lld-test_git.bbappend
 create mode 100644 recipes-bsp/sa-lld/sa-lld_git.bbappend

diff --git a/recipes-bsp/sa-lld/sa-lld-03.00.00.20.inc b/recipes-bsp/sa-lld/sa-lld-03.00.00.20.inc
new file mode 100644
index 0000000..e318e20
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-03.00.00.20.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponding to "DEV.SA_LLD.03.00.00.20"
+SA_LLD_SRCREV = "af0e6ad9fcc41085e3dc7e463e093e77741b26ad"
+
+PV = "03.00.00.20"
+INC_PR = "r0"
diff --git a/recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend b/recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend
new file mode 100644
index 0000000..cf62e0c
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/sa-lld/sa-lld-03.00.00.20.inc
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bbappend b/recipes-bsp/sa-lld/sa-lld-test_git.bbappend
new file mode 100644
index 0000000..cf62e0c
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/sa-lld/sa-lld-03.00.00.20.inc
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bbappend b/recipes-bsp/sa-lld/sa-lld_git.bbappend
new file mode 100644
index 0000000..cf62e0c
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/sa-lld/sa-lld-03.00.00.20.inc
-- 
1.9.1


