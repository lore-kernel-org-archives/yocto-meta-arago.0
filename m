Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 1806852093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 20:58:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDKwSa9012473
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:58:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513198708;
	bh=BS/5BvoWzsY4Nm3gM7To+hnz+pYoj0gAwU+D/EwgSMw=;
	h=From:To:Subject:Date;
	b=ajWTMgnfww58aYl9frIMwlrkc5ZOC4dasa8NENUwIGIoyRp1DYhOBX/3eYwLO+wzy
	Fjz5tAyP3zkXT+JxRr+rIJFC0FoG4HBS4YRC+YVUnEQYLoDmH4yA7BoPvj05gNYVmb
	qIgUVvaxd0+2HS9i/9S0op9jx7j4I0GSkevBuk0M=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKwSNo032653
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:58:28 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 14:58:28 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 14:58:28 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKwRk1011948
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:58:28 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 15:58:26 -0500
Message-ID: <1513198706-18762-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] pruss-lld: Updating to version 1.0.0.8
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
X-List-Received-Date: Wed, 13 Dec 2017 20:58:29 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

---
 recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc       | 6 ++++++
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend | 2 ++
 recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend | 2 ++
 recipes-bsp/pruss-lld/pruss-lld_git.bbappend      | 2 ++
 4 files changed, 12 insertions(+)
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld_git.bbappend

diff --git a/recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc b/recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
new file mode 100644
index 0000000..0ae5553
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
@@ -0,0 +1,6 @@
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.08"
+PRUSS_LLD_SRCREV = "40d886b30f9b34bd86a76c6d7c04c37a9db7365b"
+
+PV = "01.00.00.08"
+INC_PR = "r0"
+
diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
new file mode 100644
index 0000000..e22c531
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
+
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
new file mode 100644
index 0000000..e22c531
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
+
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld_git.bbappend
new file mode 100644
index 0000000..e22c531
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
+
-- 
1.9.1


