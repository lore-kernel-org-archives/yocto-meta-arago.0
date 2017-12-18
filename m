Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B06745299D
	for <meta-arago@arago-project.org>;
	Mon, 18 Dec 2017 18:59:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBIIxPdj022192
	for <meta-arago@arago-project.org>; Mon, 18 Dec 2017 12:59:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513623565;
	bh=ddwSemL/Fn4NWMbbEllqbd94rtGf0Rj09/wkMJcSE64=;
	h=From:To:Subject:Date;
	b=zCEDXndeEMfoW6t2zmvoP92oa6/xQcV4aGiRiXApZvONfjMBoGojmrT/a+ua1rgR0
	i5K9qhKv2J5DBwIfzFlT7d6cTu+IP5+Zl7jM3RjswpUHG8gDwgAPMS5Jh6bfsNyflx
	A56dzcawE/97JQBU8UpL9MmBaAo5/vWFiBi9T7fo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIIxPSf026625
	for <meta-arago@arago-project.org>; Mon, 18 Dec 2017 12:59:25 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 18 Dec 2017 12:59:25 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 18 Dec 2017 12:59:25 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIIxPne024987
	for <meta-arago@arago-project.org>; Mon, 18 Dec 2017 12:59:25 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Dec 2017 13:59:14 -0500
Message-ID: <1513623554-35272-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] profiling-rtos: Update the version to 1.0.0.5
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
X-List-Received-Date: Mon, 18 Dec 2017 18:59:27 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/utils-rtos/profiling-rtos_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-bsp/utils-rtos/profiling-rtos_git.bbappend

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bbappend b/recipes-bsp/utils-rtos/profiling-rtos_git.bbappend
new file mode 100644
index 0000000..7d8dfa6
--- /dev/null
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bbappend
@@ -0,0 +1,6 @@
+# Below commit ID corresponds to "DEV.UTILS.01.00.00.05"
+PROFILING_SRCREV = "a9ceef7bb6b75b590e1a13573179c7d8dfb9049c"
+
+PV = "01.00.00.05"
+PR = "r0"
+
-- 
1.9.1


