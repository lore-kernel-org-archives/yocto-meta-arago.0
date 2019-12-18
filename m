Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 32B02529BC
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 17:52:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoPST032145
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576691425;
	bh=g+OwvQbl6S9BbltQ1+kMIxfPbjNcBD7ZqUJTW2vxTdA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wPWLEfR7llmLPkzz9K6FM9XxXCNLOIbPVdpwaymHvLua0Z4qXgA8RWGUOXzFsz2Mv
	1ZvmMLO0gq9uZsXbcQtciyBZlUYpvT95Kt27b9+YlvFJ5ShptnjBK7sV2vs87AZVaQ
	v/zeMzgw592qCAmY6Y09cdRqLNiFuMKOAZTvOfZ4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIHoOTe035818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:25 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 11:50:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 11:50:24 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoNfn112296;
	Wed, 18 Dec 2019 11:50:24 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Dec 2019 12:31:12 -0500
Message-ID: <1576690275-13499-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
References: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: [meta-processor-sdk][PATCH 2/5] neo-ai-dlr: install library to libdir
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
X-List-Received-Date: Wed, 18 Dec 2019 17:52:03 -0000
Content-Type: text/plain

* add additional headers to dev package

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
index cfa79c0..c49f2ba 100644
--- a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
 
 SRC_DISTRIBUTE_LICENSES += "Unlicense"
 
-PV = "1.01"
+PV = "1.0.1"
 
 DEPENDS += " opencv "
 
@@ -56,13 +56,19 @@ do_compile_append() {
    ninja democv
 }
 
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
 
 do_install_append() {
-
     # Now install additional python test scripts, bash scripts and precomputed models
     install -d ${D}${datadir}/dlr/demos
     cp -Prf --preserve=mode,timestamps ${S}/examples/tidl/* ${D}${datadir}/dlr/demos
     install -m 0755 ${B}/bin/* ${D}${datadir}/dlr/demos/.
+    install -d ${D}${libdir}
+    install -m 0755  ${B}/lib/libdlr.so ${D}${libdir}
+    cp -Prf --preserve=mode,timestamps  ${S}/3rdparty/tvm/3rdparty/dmlc-core/include/dmlc ${D}${includedir}
+
 }
 
 FILES_${PN}-tests += "${datadir}/dlr/demos"
+FILES_${PN} += "${libdir}/libdlr.so* "
-- 
2.7.4


