Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 60356529ED
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 21:00:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFL0LhD021461
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 15:00:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513371621;
	bh=A4dxIYjgVM/cguOdbTNJzDADu9gKcA5FMe3qQJP1J1Q=;
	h=From:To:Subject:Date;
	b=CrQ/rFXsfl4j7EKUr+vQuhBLDUFzXBBbAEzsbF8GO9zWBkPw7l6idl3SdbtygkkfS
	kDrmkrcmFQ67zwSUXLsgR16gI0aLcdEofh2S8xper5/EFUz8N+K+kzfevxIaeyKQRe
	WYTca4aayz7MIgqdKDhlRZ4k7Bcu9l8hPoO92BNU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFL0LQa021794
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 15:00:21 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 15:00:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 15:00:21 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFL0LvJ011652
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 15:00:21 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Dec 2017 16:00:20 -0500
Message-ID: <1513371620-18779-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] branding-processor-sdk: Adding am574x to TI_PDK_LIMIT_SOCS/BOARDS
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
X-List-Received-Date: Fri, 15 Dec 2017 21:00:22 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 conf/distro/include/branding-processor-sdk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index f53d746..955606f 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -102,3 +102,6 @@ SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging-rt = "400"
 
 SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-local"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
+
+TI_PDK_LIMIT_SOCS_append_am57xx-evm = " am574x"
+TI_PDK_LIMIT_BOARDS_append_am57xx-evm = " idkAM574x"
-- 
1.9.1


