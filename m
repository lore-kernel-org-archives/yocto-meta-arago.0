Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9B99E52A00
	for <meta-arago@arago-project.org>;
	Mon, 10 Sep 2018 15:05:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8AF5Dsw049178
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 10:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536591913;
	bh=nDMuRN+a1hH//1czS8/bO/8a+jPZ0rik9Jt6Pte1Gyo=;
	h=From:To:CC:Subject:Date;
	b=etDVOpGVIoNApThigXwSBrcIhT2e6UjCneilrZhWnsczgxRlaysF/862dsBLrPWs5
	5a4a7u+DXY+Yjtw5kdFu5qpDIirqwTqztSXL5SlI4hL7F9CDRHwrCMohz+l/UWEVLl
	TqjiHEotnZUv+6gMhmi020zEktNiItbyxFR0g5Uk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AF5D8t015694
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 10:05:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 10 Sep 2018 10:05:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 10 Sep 2018 10:05:13 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AF5DnE001701;
	Mon, 10 Sep 2018 10:05:13 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Sep 2018 11:05:09 -0400
Message-ID: <1536591910-29066-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 1/2] [PATCH] packagegroup-arago-tisdk-addons-sdk-host: include pru-adc for am335x-evm
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
X-List-Received-Date: Mon, 10 Sep 2018 15:05:22 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index b490cb7..1d8a1ac 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk11"
+PR_append = ".tisdk12"
 
 EXTRA_LIBS_append_am57xx-evm = " \
     jailhouse-src \
@@ -16,4 +16,4 @@ EXTRA_LIBS_append_dra7xx = " \
     tiovx-app-host-src \
 "
 
-UTILS_append_ti33x = " pru-adc-src"
+UTILS_append_am335x-evm = " pru-adc-src"
-- 
1.9.1


