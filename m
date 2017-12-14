Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 70D3352093
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 21:42:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBELgI9Z027081
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:42:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513287738;
	bh=Hy5ub6PS6FPBJ/Fn6U6kWLuAameIW9qNhC/LJJlGTeg=;
	h=From:To:Subject:Date;
	b=dwTkZKWjiFW/Dnl7jZ3sQ5Mgrg/rhOq73tHSOCgGy5rBVdbCq4Rsc2dhXKPpoz6T5
	vIeVN1PPZle3EkYXKph0gNL7HpwwkAyYAPi4qhreDoSMT8oTR28V8oAdjKVeBJegms
	5BNzz3/mzOqkjWMfIcIp1Mv0PmyszCGYjOKhZJhs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBELgIML020544
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:42:18 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 15:42:18 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 14 Dec 2017 15:42:18 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBELgING031461
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:42:18 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 16:42:16 -0500
Message-ID: <1513287736-52378-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] transport-rtos: Update to version 1.0.0.9
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
X-List-Received-Date: Thu, 14 Dec 2017 21:42:19 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v2 - Adding rtos dependencies for omap & c66x for nimu-icss-rtos
 v1 - Update the srcrev

 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend  | 1 +
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend | 5 +++++
 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend      | 1 +
 recipes-bsp/transport-rtos/transport-1.0.0.9.inc       | 5 +++++
 4 files changed, 12 insertions(+)
 create mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/transport-1.0.0.9.inc

diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
new file mode 100644
index 0000000..d51f113
--- /dev/null
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/transport-rtos/transport-1.0.0.9.inc
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
new file mode 100644
index 0000000..3f4bd16
--- /dev/null
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
@@ -0,0 +1,5 @@
+require recipes-bsp/transport-rtos/transport-1.0.0.9.inc
+
+DEPENDS_append_c665x-evm = " emac-lld-rtos"
+DEPENDS_append_c667x-evm = " pa-lld-rtos"
+DEPENDS_append_omapl1 = " emac-lld-rtos"
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
new file mode 100644
index 0000000..d51f113
--- /dev/null
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/transport-rtos/transport-1.0.0.9.inc
diff --git a/recipes-bsp/transport-rtos/transport-1.0.0.9.inc b/recipes-bsp/transport-rtos/transport-1.0.0.9.inc
new file mode 100644
index 0000000..f150e41
--- /dev/null
+++ b/recipes-bsp/transport-rtos/transport-1.0.0.9.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.09"
+TRANSPORT_SRCREV = "7b69e1d6d189c579e2a27b955891f9f268fd0e98"
+
+PV = "01.00.00.09"
+INC_PR = "r0"
-- 
1.9.1


