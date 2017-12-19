Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 18BB6529D5
	for <meta-arago@arago-project.org>;
	Tue, 19 Dec 2017 19:38:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBJJcQ2H031071
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 13:38:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513712306;
	bh=BDD22PxRBy0zOd0pXlTX12b2mHp9h7s68hGUE7xUdiE=;
	h=From:To:Subject:Date;
	b=Ew1OytCECimw8gz0DuYN++2mHfXXdpHEMGaO2Qlz4JiOGCcViav577TBMM6MFauIu
	tV8mcMfQJ79y20TtutvYiDzUngm0ybBMl5BiN0akbn2HZE88/+I5hadxFr7Ggq0vXC
	5G2mRvLlGcmzE6+pG1w1d85YC53vk+AforP2lWdk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJJcQ96006169
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 13:38:26 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 19 Dec 2017 13:38:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 19 Dec 2017 13:38:25 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJJcPeF014639
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 13:38:25 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Dec 2017 14:38:23 -0500
Message-ID: <1513712303-43339-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] osal-rtos: Adding support for c66x
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
X-List-Received-Date: Tue, 19 Dec 2017 19:38:27 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal-rtos_git.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-bsp/osal/osal-rtos_git.bbappend
index dadb121..a4316c3 100644
--- a/recipes-bsp/osal/osal-rtos_git.bbappend
+++ b/recipes-bsp/osal/osal-rtos_git.bbappend
@@ -1,2 +1,3 @@
 require recipes-bsp/osal/osal-1.0.0.9.inc
 
+COMPATIBLE_MACHINE_append = "|c66x"
-- 
1.9.1


