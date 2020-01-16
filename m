Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 60D2A529EA
	for <meta-arago@arago-project.org>;
	Thu, 16 Jan 2020 19:04:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GJ2PDZ050087
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2020 13:02:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579201345;
	bh=bB71owgvp6s2mzfSO3XW9DeEBXZzYtzjXOrXMOvVNZU=;
	h=From:To:CC:Subject:Date;
	b=mdhrOFkvuBxb9QBzZlXPc6iDZcf8auA86Ca4HS3bjGJGCrY8VZ0Sf1XNzdVD5sbxi
	EmDYDeGZtH16uoh7RRIhI3+PpMuz6qdaaSkwFcaQMyBFIpYlDn/PjpvCeUnG+BeUr8
	mgK/ttv+QxJYEPe/h0bXA/qAPEUsdmkxIxgGje+U=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GJ2PqC048756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2020 13:02:25 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 16 Jan 2020 13:02:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 16 Jan 2020 13:02:25 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GJ2Oqe077031;
	Thu, 16 Jan 2020 13:02:24 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Jan 2020 13:43:22 -0500
Message-ID: <1579200203-15059-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 1/2] packagegroups: use neo-ai-tvm from meta-aws
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
X-List-Received-Date: Thu, 16 Jan 2020 19:04:12 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend   | 4 ++--
 recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend  | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
index b6fd894..a3c1a8b 100644
--- a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
+++ b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
@@ -1,3 +1,3 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
-EXTRA_TI_TOOLS_append = " nativesdk-tvm"
+EXTRA_TI_TOOLS_append = " nativesdk-neo-ai-tvm"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index eea73e4..a2b975c 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk59"
+PR_append = "-tisdk60"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -18,6 +18,8 @@ EXTRA_PACKAGES_append_k3 = " watchdog"
 EXTRA_PACKAGES_append_omapl138 = " ccief-basic"
 
 NEO_AI_PACKAGES = " \
+    neo-ai-tvm \
+    neo-ai-tvm-tests \
     neo-ai-dlr \
     neo-ai-dlr-tests \
     neo-ai-dlr-dev \
@@ -26,7 +28,6 @@ NEO_AI_PACKAGES = " \
 NEO_AI_PACKAGES_armv5 = ""
 
 EXTRA_PACKAGES_append = " hidapi \
-                          tvm \
 "
 
 EXTRA_PACKAGES_append_armv5 = " zbar"
-- 
2.7.4


