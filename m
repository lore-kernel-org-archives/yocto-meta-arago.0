Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 66F0D529BC
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 02:44:51 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBI2hENl035287
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 20:43:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576636994;
	bh=I92hE+PtO5pBhio6sxm7ZB/mifWyKl3+cEXmOWM2CUo=;
	h=From:To:CC:Subject:Date;
	b=HZdicyHkRj0FkGVPmSq2xpydB8K2J0yNk1xladti9DIUM8Z6wOLC7WsNrw8EihrOH
	y8W4sxzew1pM+8+vZlBPMumkUaTEt4mL348tnusZc7onfJOPuLkCdcSnBT7QsfxFVg
	4jsVHxUhwYjPPFdwxTn7HEh4DB+NJlHNv55gdCEA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBI2hEZ6120473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 20:43:14 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 20:43:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 17 Dec 2019 20:43:14 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBI2hB3e047363;
	Tue, 17 Dec 2019 20:43:12 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Dec 2019 02:24:31 +0000
Message-ID: <20191218022431.11153-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] external-arm-toolchain: strip binaries and libraries normally
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
X-List-Received-Date: Wed, 18 Dec 2019 02:44:51 -0000
Content-Type: text/plain

Similar to external-linaro-toolchain before:
b019da9374256b671a2fb77ccfae7e3f1ef3096b

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-arm-toolchain.bbappend          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index a5d63297..b88c337d 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -1,3 +1,6 @@
+INHIBIT_PACKAGE_STRIP = "0"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "0"
+
 ORIG_TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
 
 do_install_append() {
-- 
2.17.1


