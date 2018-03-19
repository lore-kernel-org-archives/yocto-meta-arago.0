Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 713B952968
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:42:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEfwYL022937
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470518;
	bh=bnerI674QCH1k0ggtADK/F1/N3W5c2qqHU5wC6aQF7U=;
	h=From:To:Subject:Date;
	b=rmMPCOlmFaQm7NgEoKb2V/z5w5xRPB9MmBzzDlyGoNlPPwFDTNErDSN9epx9wcsnC
	Nhel3hMsC5CECafLNsrx1Ak1rmclf2ippwmDFUqR3w64tynWDvn3HfMX9P1fdViXGS
	+2JmMDGkGFOZJ6qWIi63NpsWlF+3k5PSDiYaO74A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEfwuV020972
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:41:58 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:41:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:41:57 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEfvkA028422
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:41:57 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:41:56 -0400
Message-ID: <1521470516-17085-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] starterware: starterware-rtos: Update to version 02.01.01.06 and rtos udpates
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
X-List-Received-Date: Mon, 19 Mar 2018 14:42:56 -0000
Content-Type: text/plain

This patch also includes updates to the rtos recipe due to the migration
to 02.01.01.06
---
 recipes-bsp/starterware/starterware-02.01.01.06.inc   | 5 +++++
 recipes-bsp/starterware/starterware-rtos_git.bbappend | 8 ++++++++
 recipes-bsp/starterware/starterware_git.bbappend      | 1 +
 3 files changed, 14 insertions(+)
 create mode 100644 recipes-bsp/starterware/starterware-02.01.01.06.inc
 create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bbappend
 create mode 100644 recipes-bsp/starterware/starterware_git.bbappend

diff --git a/recipes-bsp/starterware/starterware-02.01.01.06.inc b/recipes-bsp/starterware/starterware-02.01.01.06.inc
new file mode 100644
index 0000000..fac8920
--- /dev/null
+++ b/recipes-bsp/starterware/starterware-02.01.01.06.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.06"
+STARTERWARE_SRCREV = "2e3662586b03e29228c55090f324b60a9c2ecc81"
+
+PV = "02.01.01.06"
+INC_PR = "r0"
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bbappend b/recipes-bsp/starterware/starterware-rtos_git.bbappend
new file mode 100644
index 0000000..b6b1c5c
--- /dev/null
+++ b/recipes-bsp/starterware/starterware-rtos_git.bbappend
@@ -0,0 +1,8 @@
+require recipes-bsp/starterware/starterware-02.01.01.06.inc
+
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+
+DEPENDS_append=" ti-pdk-build-rtos"
+
+INSANE_SKIP_${PN} += "file-rdeps"
diff --git a/recipes-bsp/starterware/starterware_git.bbappend b/recipes-bsp/starterware/starterware_git.bbappend
new file mode 100644
index 0000000..fa32d42
--- /dev/null
+++ b/recipes-bsp/starterware/starterware_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/starterware/starterware-02.01.01.06.inc
-- 
1.9.1


