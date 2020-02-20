Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7BA0552A18
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG9cZ129866
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226169;
	bh=KShd5IaFIee0f63TdrTX/962TxcHP0ZAsHEYNoliqjY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HJ7o4CWIbpp9IUQlnXZTGAktW73lZaPJTDTJFGxgKESe/SuveV22747OkgHD3Cvkz
	TJ7xX+2QgWAtKQOgoMhtmkfNrHvmPLPr8zXX87aUIBJf33FfGUIUUow1hdQA1J9cAV
	InnS2kbqxr2z/3LmU9xRGBeNKAQg9LuUB3JUW6iY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJG9A7097005
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:09 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:09 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7ph017983;
	Thu, 20 Feb 2020 13:16:09 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:55 +0000
Message-ID: <20200220185458.26926-6-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220185458.26926-1-denys@ti.com>
References: <20200220185458.26926-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 6/9] tisdk-recovery-rootfs-image: drop unused image recipe
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
X-List-Received-Date: Thu, 20 Feb 2020 19:18:10 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/tisdk-recovery-rootfs-image.bb | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb
deleted file mode 100644
index 5a1ea0fd..00000000
--- a/meta-arago-distro/recipes-core/images/tisdk-recovery-rootfs-image.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-# TI SDK recovery filesystem image
-COMPATIBLE_MACHINE = "keystone"
-
-require arago-image.inc
-
-IMAGE_INSTALL += "\
-    packagegroup-arago-tisdk-recoveryfs \
-"
-
-export IMAGE_BASENAME = "tisdk-recoveryfs"
-- 
2.17.1


