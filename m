Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 817A452968
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:48:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JElYL2016801
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470854;
	bh=jTIbTKRr3uLTxXFQxUJDRT4q5iUIMqSXiCxb+v+jlrQ=;
	h=From:To:Subject:Date;
	b=KYtKq1gW3TgLbAyopoXLJijDUiVDUEnvbXk86WZKlCKFiDPseI0HXy1ddGW0s5x6O
	TfbpLbILriadErFV+HqCm1BEcU8Xzz9GLUmmRZi060e6tZlB6WnbVuTNU/qDyyJgn9
	D7QwaY+Lbw7lYSqQVvCJJgCKPr6tUqhfEjxnGuGU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JElYDf002881
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:47:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:47:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:47:33 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JElX7C015994
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:47:33 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:47:33 -0400
Message-ID: <1521470853-21540-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] uart-lld-rtos: Updating to version 01.00.00.10A
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
X-List-Received-Date: Mon, 19 Mar 2018 14:48:32 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend b/recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend
new file mode 100644
index 0000000..3182971
--- /dev/null
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.10A"
+UART_LLD_SRCREV = "4774991ce80627b9f3eb844712e256abaf7462f0"
+
+PV = "01.00.00.10A"
+PR = "r0"
-- 
1.9.1


