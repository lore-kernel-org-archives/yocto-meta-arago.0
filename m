Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3B44F529C7
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:17:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JGPN3026227
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:16:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519931785;
	bh=8FT/rj1yJAu6tj2l+RCCMpx4PS9FsgfkE1r0dxKPtUE=;
	h=From:To:CC:Subject:Date;
	b=kgLt4xgu0R4rZpO/FOpWQ6f3a0LAYQAyrzAht154ccUAs/+V/7Nj2tQlywBiziO3i
	UF0bRy7wbPQCEf5lQqR9DIf2XLlszFZITOMKbil5z9s0voW+tE1rt9kxwV0kocWlrU
	tjmk2IWc4rWzk9FyUPzvSLHk5nEo7CkBx84eWEx8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JGPjq022765
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:16:25 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:16:25 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:16:25 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JGO6w015469;
	Thu, 1 Mar 2018 13:16:25 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Mar 2018 14:08:01 -0500
Message-ID: <1519931281-26332-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] ti-llvm3.6: add dependency on groff-native
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
X-List-Received-Date: Thu, 01 Mar 2018 19:17:01 -0000
Content-Type: text/plain

* groff is used to generate documentaion during the install task

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
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


