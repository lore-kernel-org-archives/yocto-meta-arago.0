Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 0DBB952986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:58:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGvsui025909
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521219474;
	bh=Q+E9J1wBOrKJstUfpNnHXu9GQZN3qQqqSsZSat9mlXc=;
	h=From:To:Subject:Date;
	b=JiMj5Fz9hUtbLYQfw5tAUD16OrSQCD66DxdxwRsgL6A+IRCYXodk9IXW4fkPRron2
	fGoNlCTAIntjgmFWiN06abJ02kLitLu6bsn61ZvTg+5Z0Kfy1aR4ZzN4Eb4W/vvJgY
	N8Xej01vaHYzgRYVoGMKHvgGS4ApIvmju+dfjj28=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGvssd012714
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:57:54 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:57:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:57:54 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGvrER016508
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:57:54 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:57:53 -0400
Message-ID: <1521219473-29252-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] pcie-lld-rtos: Update to version 02.02.00.12
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
X-List-Received-Date: Fri, 16 Mar 2018 16:58:49 -0000
Content-Type: text/plain

---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend
new file mode 100644
index 0000000..925e659
--- /dev/null
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.PCIE_LLD.02.02.00.12"
+PCIE_LLD_SRCREV = "90c85b801cc8524deb57d897d204597b11fa26c4"
+
+PV = "02.02.00.12"
+PR = "r0"
-- 
1.9.1


