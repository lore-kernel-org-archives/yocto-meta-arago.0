Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id B8DEF52968
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:44:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEhMUs023441
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470602;
	bh=zJToWapXfURnWWIdRQ8K0ywA1TSXuL/tu5NLXqsl2VU=;
	h=From:To:Subject:Date;
	b=lNFNEyLJWo3ToU8zjGUFGebuvzhrbxrDTv6rZb2vw+rcYUXy8BQyo2NM2GMX154pr
	FMu7jOZgBx4ZBzxrppaPdCLnX+aVusZ5r6xdBVBsr0nQUHVzNPvYqcRY4qEpF2/JbM
	ndE6Z20XP4bdEWQb3GxliKSFzwbyL4kPVIWq/NcM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEhMT2029847
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:43:22 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:43:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:43:22 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEhMFS025713
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:43:22 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:43:15 -0400
Message-ID: <1521470595-18380-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] transport-rtos: Udpate to version 1.0.0.11
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
X-List-Received-Date: Mon, 19 Mar 2018 14:44:21 -0000
Content-Type: text/plain

Updating to version 1.0.0.11 and update the license checksum of the sub
component recipes
---
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend  | 3 +++
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend | 3 +++
 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend      | 3 +++
 recipes-bsp/transport-rtos/transport-01.00.00.11.inc   | 5 +++++
 4 files changed, 14 insertions(+)
 create mode 100644 recipes-bsp/transport-rtos/transport-01.00.00.11.inc

diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
index 053fbac..c7b6209 100644
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
@@ -1 +1,4 @@
 require recipes-bsp/transport-rtos/ndk-path.inc
+require recipes-bsp/transport-rtos/transport-01.00.00.11.inc
+
+LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=6d209c698b273aef180b0c1d38469e8e"
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
index 053fbac..077f331 100644
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
@@ -1 +1,4 @@
 require recipes-bsp/transport-rtos/ndk-path.inc
+require recipes-bsp/transport-rtos/transport-01.00.00.11.inc
+
+LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=3ea633a510be24d8a89d9d08b930994c"
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
index 053fbac..ac38e76 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
@@ -1 +1,4 @@
 require recipes-bsp/transport-rtos/ndk-path.inc
+require recipes-bsp/transport-rtos/transport-01.00.00.11.inc
+
+LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=ee9c662c39d4584fb2a8b66413d2866d"
diff --git a/recipes-bsp/transport-rtos/transport-01.00.00.11.inc b/recipes-bsp/transport-rtos/transport-01.00.00.11.inc
new file mode 100644
index 0000000..512a815
--- /dev/null
+++ b/recipes-bsp/transport-rtos/transport-01.00.00.11.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.11"
+TRANSPORT_SRCREV = "7bd5f7ffb38a6021762f29d0652fe63c6114a86f"
+
+PV = "01.00.00.11"
+INC_PR = "r0"
-- 
1.9.1


