Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4C7A6529E4
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 13:28:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDRp1f086075
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174871;
	bh=eBLMlLCSECQ8bKjzia6c9UAAP9e3Iu9quybD+9sDED8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jfaopiWmoogbxjW2KYx3yW8z2Ok2NzPUZVD/tuC7HLUwo/hHQDM0Q6zI1n7XiX4a2
	W20T8t/arZQU+EY1olQzR27WcK91UAdGljnLix571hELbPGYw6YUkK2v41istsPnEN
	jlwtF7xYGaiGg2qEe2suEP5U78WCqYI4WBwptsqc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDRpQt082189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:51 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:27:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:27:51 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDRl3S009221
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:51 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Mar 2019 09:27:44 -0400
Message-ID: <1553174865-28991-7-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 6/7] spi-lld-rtos:Superseeded by a more recent version
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
X-List-Received-Date: Thu, 21 Mar 2019 13:28:07 -0000
Content-Type: text/plain

---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend b/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
deleted file mode 100644
index cd27420..0000000
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-
-# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.13B"
-SPI_LLD_SRCREV = "07fd0f70b1656fb2ddde44d828592ec0358b0c37"
-
-PV = "01.00.00.13B"
-PR = "r0"
-- 
1.9.1


