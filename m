Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 52C7D5209B
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 23:45:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBENiqRO023964
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 17:44:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513295092;
	bh=HrPHle5p/aZPwhNxyoFn+D1CDPhy4SeW4qNXJ+S+Rlc=;
	h=From:To:Subject:Date;
	b=ZyV6X5iEm4bIKfO4nbF3GAmb3sCBiMegwLjNKS2qM3R4FHbLnj8ewJdKf4ikNf8uM
	vdaeONfMX0ELbz/ijymmIHgRCSRcNsO7P3UlJBzYosplZxmebaH6HR+sqADOdGdVYX
	2bkINo4L6V6c6U5wNKwcXRJBBxQkRZ6CNXODo1VY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBENil5u013945
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 17:44:47 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 17:44:47 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 14 Dec 2017 17:44:47 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBENillk021466
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 17:44:47 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 18:44:46 -0500
Message-ID: <1513295086-1630-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] ti-pdk: Updates for dra7xx & am574x
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
X-List-Received-Date: Thu, 14 Dec 2017 23:45:03 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

One of the updates is for dra7xx. The other one adds the
LIMIT_BOARDS/SOCs for AM574x until they are added to machine/am57xx-
evm.conf

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/ti-pdk.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 76abfe4..c83da00 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -54,9 +54,11 @@ export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
 TI_PDK_XDCMAKE ?= "1"
 
 # By default, only build the cores with available toolchains
-TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1"
+TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1 arp32_1"
 TI_PDK_LIMIT_SOCS ?= ""
+TI_PDK_LIMIT_SOCS_append_am57xx-evm = " am574x"
 TI_PDK_LIMIT_BOARDS ?= ""
+TI_PDK_LIMIT_BOARDS_append_am57xx-evm = " idkAM574x"
 TI_PDK_MAKE_TARGET ?= "release"
 TI_PDK_EXTRA_MAKE ?= ""
 
-- 
1.9.1


