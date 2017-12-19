Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 347345299D
	for <meta-arago@arago-project.org>;
	Tue, 19 Dec 2017 06:00:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBJ60VkU027802
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 00:00:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513663231;
	bh=Dksz+iXlC1A+WIyuQyAgxVu82lIXSvKjfD8SnAQWPxo=;
	h=From:To:Subject:Date;
	b=u28YVI2DRlaEsyFnz3TrGvobxVMpsO2G19BMGZjZrLGlcldu78PjRwZT5bEsmvUrm
	3IPfiZotT1cJaT4LDtRq/N+gE6KBJ/ze5ai+5M9YhSRXXD2zuZTn0VjHYatREQykhI
	ye4+kBczPZdEjeV5MeEpyBWbwFzCi0d3MNOsF+RI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJ60VxZ003057
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 00:00:31 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 19 Dec 2017 00:00:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 19 Dec 2017 00:00:31 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJ60UCE014531
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 00:00:30 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Dec 2017 01:00:25 -0500
Message-ID: <1513663225-38783-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] edma3-lld-rtos: Adding support for omapl1 & c66x
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
X-List-Received-Date: Tue, 19 Dec 2017 06:00:33 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
index 9803d15..efeb4c9 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bbappend
@@ -1,5 +1,7 @@
 require recipes-bsp/edma3-lld/edma3-lld-2.12.05.30B.inc
 
+COMPATIBLE_MACHINE_append = "|c66x|omapl1"
+
 PLATFORMLIST_append_dra7xx-evm = " \
         tda3xx-evm \
 "
-- 
1.9.1


