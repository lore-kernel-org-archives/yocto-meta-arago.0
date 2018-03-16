Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7BAA852986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:31:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGUJum021632
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521217819;
	bh=Dm6sUSxA7fywlMBKXkpv8et2N50jOQpISPHOXDE0Xgs=;
	h=From:To:Subject:Date;
	b=ZgSkLLA13cZtEXLPFauAH2BjzY+U3jwLU8PXzx7bfzuKA8mi3ZgXu9fAUv4Y/uahs
	YQPte63UCfn+NCpjaT7+60c+IVh0ktWI5zPShLd/OjZ86nQPpezWudiaCk9fqpp4O4
	lekO1jSLUj0WTPtmkgdwLoFZB9gAQvG8e07UGvvA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGUJGo001463
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:30:19 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:30:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:30:19 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGUJtf015131
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:30:19 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:30:18 -0400
Message-ID: <1521217818-27761-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] mcasp-lld-rtos: Update to version 01.01.00.09
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
X-List-Received-Date: Fri, 16 Mar 2018 16:31:15 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend
new file mode 100644
index 0000000..93a6e03
--- /dev/null
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.09"
+MCASP_LLD_SRCREV = "6459379818712cac10c439a46936bd6bfcd762d7"
+
+PV = "01.01.00.09"
+PR = "r0"
-- 
1.9.1


