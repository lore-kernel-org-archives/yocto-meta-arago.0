Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 758C452AD0
	for <meta-arago@arago-project.org>;
	Tue, 30 Jan 2018 18:00:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0UHxh5J004999
	for <meta-arago@arago-project.org>; Tue, 30 Jan 2018 11:59:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517335183;
	bh=sPlVaB+HBjVIjMTQkqh2ZT1fPrWTa8Stq8cIw4p0BQ4=;
	h=From:To:CC:Subject:Date;
	b=JA64SDxtdirApxUaF3u00V/4qoMOcaVW8V32gueCHV4leMxrVeTF7v3uT3gwS+Udu
	3N3+9Qlcrh1spBaE9zmpzHfRJVf5GW55e5BKjO5FKlJDOTvw/H9xpXog4B468+f2qa
	T4o1GnxySjOC66Ptp20MPAOwLYwSo++lTstDkC5Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0UHxhnD025628
	for <meta-arago@arago-project.org>; Tue, 30 Jan 2018 11:59:43 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 30 Jan 2018 11:59:42 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 30 Jan 2018 11:59:42 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0UHxgQe012433;
	Tue, 30 Jan 2018 11:59:42 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 30 Jan 2018 12:59:39 -0500
Message-ID: <1517335179-10353-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] ti-tisdk-makefile: add am574x-idk-jailhouse.dtb to KERNEL_DEVICETREE
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
X-List-Received-Date: Tue, 30 Jan 2018 18:00:14 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 37aa6a6..51e5b6e 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk49"
+PR_append = ".tisdk50"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -61,6 +61,7 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am572x-idk-jailhouse.dtb \
     am572x-idk-lcd-osd101t2045-jh.dtb \
     am572x-idk-lcd-osd101t2587-jh.dtb \
+    am574x-idk-jailhouse.dtb \
 "
 
 
-- 
1.9.1


