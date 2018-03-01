Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3676E529F2
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:34:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JXshC007670
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:33:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519932834;
	bh=GGVL6fjwmANKsUEcw6U7NETfPeuCCEgYpKkjoWSrtE8=;
	h=From:To:CC:Subject:Date;
	b=kAeLUCQsza1V4abNATlCd8jBPhsyu3tgeGQpv00dRhi8JzkUICPmGX1CDwwjptY6W
	S0/gR3ma0kXg7dqap5eu+wDLLPSgHOzcUPbHW/cvJ882yj5cMvu+UvAbnspuT5pD6F
	BKubnWNRG5PxrmQrOCEiXJqdYQypV/DP9qN3CGxo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JXslU014603
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:33:54 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:33:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:33:54 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JXrkn002396;
	Thu, 1 Mar 2018 13:33:53 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Mar 2018 14:25:27 -0500
Message-ID: <1519932329-26946-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v2 1/2] ti-llvm3.6: add dependency on groff-native
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
X-List-Received-Date: Thu, 01 Mar 2018 19:34:31 -0000
Content-Type: text/plain

* groff is used to generate documentaion during the install task

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
* No change for this patch, but an additional patch is added to the set.

 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 4f36310..91d3cea 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -17,7 +17,7 @@ require recipes-core/llvm/llvm.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
-DEPENDS += "libxml2"
+DEPENDS += "libxml2 groff-native"
 DEPENDS_append_class-target = " valgrind"
 
 LLVM_DIR = "ti-llvm${PV}"
-- 
2.7.4


