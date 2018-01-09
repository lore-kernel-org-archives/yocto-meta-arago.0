Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 423D9529C2
	for <meta-arago@arago-project.org>;
	Tue,  9 Jan 2018 21:48:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w09Lmmc4012257
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515534528;
	bh=sQEukXbI/6azxtKMCXAMiAZf7NH4rtnYSEPXDxnQDZg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eM1KdEESucIwnwuODRbW6rbxE216c2O/HLAWCN1DUCoxW9tEyEmW8Knem1aFwOL6C
	uqiVwUTaq3x1vZmB17yWmEJ1W8v4frpH+keomt8rdjE1+OJs3vmQ/cK5erSiK/TViD
	7gqk7AgFVrdQukt0fAWRMETlbARIMI7ycl9SqFdA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09LmmuE027163
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:48 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 9 Jan 2018 15:48:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 9 Jan 2018 15:48:47 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09LmkRZ011305;
	Tue, 9 Jan 2018 15:48:47 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jan 2018 16:48:42 -0500
Message-ID: <1515534524-21325-4-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515534524-21325-1-git-send-email-a0271529@ti.com>
References: <1515534524-21325-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 3/5] packagegroup-arago-tisdk-addons*: remove cmem and cmem-mod for AM4
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
X-List-Received-Date: Tue, 09 Jan 2018 21:48:55 -0000
Content-Type: text/plain

* This has been upstreamed to meta-arago

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bbappend              | 6 +-----
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend            | 7 +------
 .../packagegroups/packagegroup-arago-tisdk-addons.bbappend         | 6 +-----
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index 4265822..b8d7bca 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -1,8 +1,4 @@
-PR_append = ".tisdk7"
-
-EXTRA_LIBS_append_ti43x = " \
-    cmem-mod-src \
-"
+PR_append = ".tisdk8"
 
 EXTRA_LIBS_append_am57xx-evm = " \
     jailhouse-src \
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index f45ad19..891d34e 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk27"
+PR_append = "-tisdk28"
 
 UTILS_append_ti33x = " \
     opencv-dev \
@@ -69,11 +69,6 @@ EXTRA_LIBS_append_am437x-evm = " \
     icss-emac-lld-staticdev \
 "
 
-EXTRA_LIBS_append_ti43x = "\
-    cmem-dev \
-    cmem-staticdev \
-"
-
 EXTRA_LIBS_append_dra7xx = " \
     tiovx-lib-host-dev \
     tiovx-lib-host-staticdev \
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 3cbaa07..ba57e02 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk43"
+PR_append = "-tisdk44"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -14,8 +14,4 @@ EXTRA_PACKAGES_append = " zbar hidapi"
 
 UTILS_append = " net-snmp net-snmp-server-snmpd"
 
-EXTRA_LIBS_append_ti43x = " \
-    cmem \
-"
-
 EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host kaldi"
-- 
1.9.1


