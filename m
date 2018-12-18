Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A02D952AD3
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 22:21:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIML3Ng004350
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545171663;
	bh=gGov8Kb2TdqfD1epEgo8LDiRIwaAkIuKayVKOclFLuY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bE2dOxPjgXAY53bT4S/tHBCq2silm9qRaZ+0nSij2TgeBvm5BlzXSxlENjoNRAmEk
	HYJc8wpjj4wJXzjc3xxG8KkxBqeM4PHxkTY7oYYUDiR04KApu3qZeXfL0/vW19A8VE
	1sXwywgfD7xwdlTZtYEpFnJaCQ1hJ3Is2r9LpvLQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIML2XH070370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 16:21:03 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 16:21:03 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIML1RE018057
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Dec 2018 17:20:58 -0500
Message-ID: <1545171658-17410-7-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 6/6] udma-lld-rtos: SRCREV update to 01.00.00.01A
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
X-List-Received-Date: Tue, 18 Dec 2018 22:21:19 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend

diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend b/recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend
new file mode 100644
index 0000000..973040c
--- /dev/null
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.UDMA_LLD.01.00.00.01A"
+UDMA_LLD_SRCREV = "e03304e15bb7f1a86c77f1a9984361c822ab2b70"
+
+PV = "01.00.00.01A"
+PR = "r0"
-- 
1.9.1


