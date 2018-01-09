Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5A17C529D2
	for <meta-arago@arago-project.org>;
	Tue,  9 Jan 2018 21:48:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w09LmmIU018457
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515534528;
	bh=Heoy5zqaoOhEcl4otxcUzXDAlxI4oHLSpEf3TdGjxu4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hMPdIQr7UZHMoFztSifnXJtAGPErOUt9QEn0S+ThYZ1p+AClvibYzVkCJdosGMstd
	grRNvl5+wbjxyrSYDl2tPx+nIUiVS0pYBaWUhf+GmSPsdZ4zpjCRUDV4PbgXD2s0KX
	Z1M027bk03gppsSUvTq7dKZ/M0fKa7WR0rAoOL1w=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09Lmm1V022452
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:48 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 9 Jan 2018 15:48:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 9 Jan 2018 15:48:47 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09LmkRa011305;
	Tue, 9 Jan 2018 15:48:47 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jan 2018 16:48:43 -0500
Message-ID: <1515534524-21325-5-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515534524-21325-1-git-send-email-a0271529@ti.com>
References: <1515534524-21325-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 4/5] packagegroup-arago-test-addons: remove cmem-test for AM4
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
X-List-Received-Date: Tue, 09 Jan 2018 21:48:56 -0000
Content-Type: text/plain

* This has been upstreamed to meta-arago

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
index 038d122..7b390e9 100644
--- a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk7"
+PR_append = ".tisdk8"
 
 TEST_ADDONS_TI_append_keystone = " \
     mmap-lld-test \
@@ -23,10 +23,6 @@ TEST_ADDONS_TI_append_am57xx-evm = " \
     icss-emac-lld-test \
 "
 
-TEST_ADDONS_TI_append_ti43x  = " \
-    cmem-test \
-"
-
 TEST_ADDONS_TI_append_am335x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_am437x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_k2g-evm  = " icss-emac-lld-test"
-- 
1.9.1


