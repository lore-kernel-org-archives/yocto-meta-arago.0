Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4AF19529A5
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:03:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GG2ZcA001417
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521216155;
	bh=CBUERAuam0KG2EpABqp5VRpVzS4nd+iciKeABFRRY68=;
	h=From:To:Subject:Date;
	b=th9mMiAvE9S5r70xGPgzKExXnqCrSi6CGA+l5ym1x5tGQfIrg4cy20nf6RFe2knR6
	MaBSd41LiMKHO+3blfr6RdP63Dan1/m0on3ljIUgCVthbuX1xhbNIybkAIiMMfFXa/
	s8zy2zeIYdlXoq2zepicOmggHXWrb4DdVQ9afEHc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GG2Zfo023855
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:02:35 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:02:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:02:35 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GG2Z2m007078
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:02:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:02:33 -0400
Message-ID: <1521216153-27099-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] gpio-lld-rtos: Updating to version 01.00.00.10
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
X-List-Received-Date: Fri, 16 Mar 2018 16:03:30 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
new file mode 100644
index 0000000..29d311a
--- /dev/null
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.10"
+GPIO_LLD_SRCREV = "2661a410e5bc00b4769db6ef2692f680a7a42feb"
+
+PV = "01.00.00.10"
+PR = "r0"
-- 
1.9.1


