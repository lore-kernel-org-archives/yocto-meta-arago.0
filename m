Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6381E52A19
	for <meta-arago@arago-project.org>;
	Mon, 15 Jan 2018 23:23:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FNMpro011202
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 17:22:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516058571;
	bh=LcMbxCsltrwrdIyoNS81MzWRgOgVK8WF9HnsscqV7vo=;
	h=From:To:CC:Subject:Date;
	b=YuKxnA8S7TsNRFxN476riWw6dxbwnlcdtSc8e4bYtH3QenZS2Nmq4UuuHTqTuMvcK
	5HiCiZq1VTCUX5v+yFJtOUdxq8i64ldWCkPU9VmLjGFVSc5yKnKGPGjZpaiC5N/uVv
	7KtzDoVmKV1Xelw43T5iVNly3gUiFeLC/AghAgjI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FNMpAn028279
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 17:22:51 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 17:22:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 15 Jan 2018 17:22:51 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FNMpU2029128;
	Mon, 15 Jan 2018 17:22:51 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Jan 2018 18:22:49 -0500
Message-ID: <1516058569-7239-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] branding-processor-sdk: bump max_leb_cnt for k2hk
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
X-List-Received-Date: Mon, 15 Jan 2018 23:23:11 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 conf/distro/include/branding-processor-sdk.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index 955606f..2fbcb04 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -43,7 +43,7 @@ MKUBIFS_ARGS_am57xx-evm     = "-F -m 2048 -e 126976 -c 15000"
 MKUBIFS_ARGS_am57xx-hs-evm  = "-F -m 2048 -e 126976 -c 15000"
 MKUBIFS_ARGS_dra7xx-evm     = "-F -m 2048 -e 126976 -c 15000"
 MKUBIFS_ARGS_dra7xx-hs-evm  = "-F -m 2048 -e 126976 -c 15000"
-MKUBIFS_ARGS_k2hk           = "-F -m 2048 -e 126976 -c 4100"
+MKUBIFS_ARGS_k2hk           = "-F -m 2048 -e 126976 -c 4200"
 
 # By default, do not include OPTEE for any HS platform
 # Comment the OPTEEMACHINE and OPTEEFLAVOR line for a
-- 
1.9.1


