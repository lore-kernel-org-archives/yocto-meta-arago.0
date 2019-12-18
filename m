Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id DEA91529ED
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 17:52:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoPRj068300
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576691425;
	bh=vDxtsRawNYeqN9QHufJPUhgQbFca+4j/KnsF25ZdVO8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hFh8nnI0DbzcoqmzTlhgMc/R2dRAZxHz++Xvn8JSPayaA7xlH+u2GBjD+M2uoj6bi
	XKuolNHcrjwZnm3mSrTblkPS0G3sTDoT5z6totb0PuqtVxs4YjG1MRm06CmZKDgPse
	2JhsVhwVYQ9Oso7/TzNe8pzFGAyCiztvUTyMtASA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIHoPsC110777
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:25 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 11:50:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 11:50:25 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoNfq112296;
	Wed, 18 Dec 2019 11:50:25 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Dec 2019 12:31:15 -0500
Message-ID: <1576690275-13499-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
References: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: [meta-processor-sdk][PATCH 5/5] packagegroups: integrate neo-ai-dlr-demo
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
X-List-Received-Date: Wed, 18 Dec 2019 17:52:05 -0000
Content-Type: text/plain

* Add neo-ai-dlr-demo to rootfs of machines with mmip feature.
* Install dev package in devkit.
* Provide neo-ai-dlr-demo sources in SDK bundle.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bbappend       |  7 ++++++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend     |  6 +++++-
 .../packagegroups/packagegroup-arago-tisdk-addons.bbappend  | 13 ++++++++++---
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index 647fe67..c98d464 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk19"
+PR_append = ".tisdk20"
 
 EXTRA_LIBS_append_am57xx-evm = " \
     jailhouse-src \
@@ -18,3 +18,8 @@ EXTRA_LIBS_append_dra7xx = " \
 
 UTILS_append_am335x-evm = " pru-adc-src"
 
+NEO_AI_PACKAGES = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','mmip','neo-ai-dlr-demo-src','',d)} \
+"
+
+RDEPENDS_${PN}_append = " ${NEO_AI_PACKAGES}"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 6cd7f4d..83125c5 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk33"
+PR_append = "-tisdk34"
 
 UTILS_append_ti33x = " \
     opencv-dev \
@@ -76,3 +76,7 @@ EXTRA_LIBS_append_dra7xx = " \
     tiovx-lib-host-staticdev \
     tiovx-sys-iface \
 "
+
+NEO_AI_PACKAGES = "neo-ai-dlr-dev"
+
+RDEPENDS_${PN}_append = " ${NEO_AI_PACKAGES}"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index aa0a182..eea73e4 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk58"
+PR_append = "-tisdk59"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -17,12 +17,17 @@ EXTRA_PACKAGES_append_k3 = " watchdog"
 
 EXTRA_PACKAGES_append_omapl138 = " ccief-basic"
 
-NEO_AI_PACKAGES = "neo-ai-dlr neo-ai-dlr-tests"
+NEO_AI_PACKAGES = " \
+    neo-ai-dlr \
+    neo-ai-dlr-tests \
+    neo-ai-dlr-dev \
+    ${@bb.utils.contains('MACHINE_FEATURES','mmip','neo-ai-dlr-demo','',d)} \
+"
 NEO_AI_PACKAGES_armv5 = ""
 
 EXTRA_PACKAGES_append = " hidapi \
                           tvm \
-                          ${NEO_AI_PACKAGES}"
+"
 
 EXTRA_PACKAGES_append_armv5 = " zbar"
 EXTRA_PACKAGES_append_armv7a = " zbar"
@@ -30,3 +35,5 @@ EXTRA_PACKAGES_append_armv7a = " zbar"
 UTILS_append = " net-snmp net-snmp-server-snmpd"
 
 EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host tiovx-app-host-examples"
+
+RDEPENDS_${PN}-extra_append = " ${NEO_AI_PACKAGES}"
-- 
2.7.4


