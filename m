Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 802D852093
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 21:36:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBELatu4023951
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:36:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513287415;
	bh=vzkGLD7sSxYIkzD1UEqPDyJZKYtzIxmGkxIeHoAV5OA=;
	h=From:To:Subject:Date;
	b=t2NBrWI9rlt5qOXWp71QbEyyEx+xF+41gVphB7N2CXzyi5JC3yFnpZ3UVsJKaILqg
	c4XZKvjlTdO4Of3uMFXglBgA9H7mjw5FrMFrMJQKzOLDTC8lIXXYybTQRYUz1URr8a
	DEsOxiLBqX+dt3agzrGmUraK3ZNeBqj6ZE0RKTXU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBELatTC031189
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:36:55 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 14 Dec 2017 15:36:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 15:36:55 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBELatOY024612
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 15:36:55 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 16:36:54 -0500
Message-ID: <1513287414-51537-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] transport-rtos: Update to version 1.0.0.9
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
X-List-Received-Date: Thu, 14 Dec 2017 21:36:56 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend  | 1 +
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend | 1 +
 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend      | 1 +
 recipes-bsp/transport-rtos/transport-1.0.0.9.inc       | 5 +++++
 4 files changed, 8 insertions(+)
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
index 0000000..d51f113
--- /dev/null
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/transport-rtos/transport-1.0.0.9.inc
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


