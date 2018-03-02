Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B1B6252976
	for <meta-arago@arago-project.org>;
	Fri,  2 Mar 2018 23:12:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w22NCJZJ014484
	for <meta-arago@arago-project.org>; Fri, 2 Mar 2018 17:12:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520032339;
	bh=OE6v2Fo3IoyNYqsCFQq4a+KUa8kWNK6sHsmLTRV3j/s=;
	h=From:To:Subject:Date;
	b=AnUoLjjqydFweoB7mcBpfjC3em9pqjlUxYt9V7EVnnbh75MYvOFtmPOezwu5t/Erw
	Sws/x4PYMNghteuXigW8VVYHgHPWd8zJRh8/5WCv8ouCsYjxAKvwqXDCCkF/JFcs1j
	cGRWD8kL8hTdHQ1ro8MJ15kfyZdW0Iu1LOo25d2M=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w22NCJK2006012
	for <meta-arago@arago-project.org>; Fri, 2 Mar 2018 17:12:19 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 2 Mar 2018 17:12:19 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 2 Mar 2018 17:12:19 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w22NCI6H011615
	for <meta-arago@arago-project.org>; Fri, 2 Mar 2018 17:12:18 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 2 Mar 2018 18:12:16 -0500
Message-ID: <1520032336-58939-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] transport-rtos: Updating to version 1.0.0.10
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
X-List-Received-Date: Fri, 02 Mar 2018 23:12:57 -0000
Content-Type: text/plain

---
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend  | 4 ++++
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend | 4 ++++
 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend      | 3 +++
 recipes-bsp/transport-rtos/transport-1.0.0.10.inc      | 7 +++++++
 4 files changed, 18 insertions(+)
 create mode 100644 recipes-bsp/transport-rtos/transport-1.0.0.10.inc

diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
index 053fbac..4ae2d0b 100644
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
@@ -1 +1,5 @@
 require recipes-bsp/transport-rtos/ndk-path.inc
+require recipes-bsp/transport-rtos/transport-1.0.0.10.inc
+
+LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=6d209c698b273aef180b0c1d38469e8e"
+
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
index 053fbac..d9db349 100644
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
@@ -1 +1,5 @@
 require recipes-bsp/transport-rtos/ndk-path.inc
+require recipes-bsp/transport-rtos/transport-1.0.0.10.inc
+
+LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=3ea633a510be24d8a89d9d08b930994c"
+
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
index 053fbac..691364e 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
@@ -1 +1,4 @@
 require recipes-bsp/transport-rtos/ndk-path.inc
+require recipes-bsp/transport-rtos/transport-1.0.0.10.inc
+
+LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=ee9c662c39d4584fb2a8b66413d2866d"
diff --git a/recipes-bsp/transport-rtos/transport-1.0.0.10.inc b/recipes-bsp/transport-rtos/transport-1.0.0.10.inc
new file mode 100644
index 0000000..560e96a
--- /dev/null
+++ b/recipes-bsp/transport-rtos/transport-1.0.0.10.inc
@@ -0,0 +1,7 @@
+require recipes-bsp/transport-rtos/transport.inc
+
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.10"
+TRANSPORT_SRCREV = "d933e59654c1fdfc05b0afa166a4c6670632ae00"
+
+PV = "01.00.00.10"
+INC_PR = "r0"
-- 
1.9.1


