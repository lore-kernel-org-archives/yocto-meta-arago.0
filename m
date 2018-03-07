Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 63E1052975
	for <meta-arago@arago-project.org>;
	Wed,  7 Mar 2018 22:17:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w27MGYGT004775
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 16:16:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520460994;
	bh=q1Eh3Vs7ZWNnSSqxEAJDXp0hdyrATgvz9noh1DaGz7I=;
	h=From:To:Subject:Date;
	b=mtL+bqjlLXjST4Vi4YTewQPBJL7yvsp3UpXgcJgLPD4p84hdVzCsyjNvpd0t91tpk
	hkD5SCBO7r1J0pqtCAoz/jDPKtD0aOWHRH0GjiM/Zue5MQgLSiU5qikgDB04MmEWaf
	z3laJ0iDLx/tHfGprN1CNBgPTOjc5X/+p553qPTc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w27MGYHe023982
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 16:16:34 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 7 Mar 2018 16:16:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 7 Mar 2018 16:16:34 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w27MGYDY015810
	for <meta-arago@arago-project.org>; Wed, 7 Mar 2018 16:16:34 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 7 Mar 2018 17:16:33 -0500
Message-ID: <1520460993-28842-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] starterware-rtos: Adding dependency to ti-pdk-build & env variables
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
X-List-Received-Date: Wed, 07 Mar 2018 22:17:19 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/starterware/starterware-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bbappend

diff --git a/recipes-bsp/starterware/starterware-rtos_git.bbappend b/recipes-bsp/starterware/starterware-rtos_git.bbappend
new file mode 100644
index 0000000..07fd9b4
--- /dev/null
+++ b/recipes-bsp/starterware/starterware-rtos_git.bbappend
@@ -0,0 +1,5 @@
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+
+DEPENDS_append=" ti-pdk-build-rtos"
+
-- 
1.9.1


