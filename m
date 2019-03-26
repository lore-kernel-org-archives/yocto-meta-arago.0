Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8D8C252A2B
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:29:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT2RT109626
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639342;
	bh=qzIEhqGJBv9wkDLoUSzM55tyT62SFMmOJvUIVeCxPok=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YDTZeLzdC4hDkdhizzxGO1t9entJEQ4Wg82J0nseelAoa3hiX+pgT2M4kuSkgSprb
	FRhd93pAz71W6/jWxTWqtfqGayrVKQi0LLTqs5Ib5DThbEAMXAcjDGyAQEI4p3bOIO
	7x3IdxBNMrD7VP+OItt/06TQMwa0OQSBUpx9mqmM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMT2Kx091542
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:02 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:29:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:29:01 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT0tI116656
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:28:54 -0400
Message-ID: <1553639337-36226-5-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 4/7] transport-rtos: SRCREV bump to version 01.00.00.15A
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
X-List-Received-Date: Tue, 26 Mar 2019 22:29:18 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend  | 1 +
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend | 1 +
 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend      | 1 +
 recipes-bsp/transport-rtos/transport-01_00_00_15A.inc  | 5 +++++
 4 files changed, 8 insertions(+)
 create mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/transport-01_00_00_15A.inc

diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
new file mode 100644
index 0000000..dbfa07e
--- /dev/null
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
@@ -0,0 +1 @@
+require transport-01_00_00_15A.inc
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
new file mode 100644
index 0000000..dbfa07e
--- /dev/null
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
@@ -0,0 +1 @@
+require transport-01_00_00_15A.inc
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
new file mode 100644
index 0000000..dbfa07e
--- /dev/null
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
@@ -0,0 +1 @@
+require transport-01_00_00_15A.inc
diff --git a/recipes-bsp/transport-rtos/transport-01_00_00_15A.inc b/recipes-bsp/transport-rtos/transport-01_00_00_15A.inc
new file mode 100644
index 0000000..50e6c67
--- /dev/null
+++ b/recipes-bsp/transport-rtos/transport-01_00_00_15A.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.15A"
+TRANSPORT_SRCREV = "808affb9c2ba050902fb04f5bda2e5af491941d5"
+
+PV = "01.00.00.15A"
+INC_PR = "r0"
-- 
1.9.1


