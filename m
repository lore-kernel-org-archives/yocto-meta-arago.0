Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0CFDD529B7
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2019 18:19:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TIJB2f085111
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 13:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556561951;
	bh=jOTbXKZQZXoTTLuWR5Uz6no8ZJhhtI2NMcyLJVY3T6w=;
	h=From:To:CC:Subject:Date;
	b=x3ifGXAW5cW5WW6BhWIuRnpnUQUXFLCEJIMjPC6VVtNAgQQqlovxLBYoTvC+EB2gi
	cdTBbyL9c1XOl8U/3hmnOJYFvcmaq9h1XkOqSfaHx1a8HC/wAr98m5xs0Cx4X4MDmp
	lWMX8soq3uKSfNtrnWG5qhgtteu/H4r6snZqS6Og=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TIJBpR091642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 13:19:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 13:19:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 13:19:10 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TIJAS8010383;
	Mon, 29 Apr 2019 13:19:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Apr 2019 18:08:24 +0000
Message-ID: <20190429180824.9736-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] optee-client, optee-test: update to 3.5.0
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
X-List-Received-Date: Mon, 29 Apr 2019 18:19:37 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-client.bbappend            | 6 +++---
 .../recipes-security/optee/optee-test_git.bbappend          | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index 0641bde6..5ea0efee 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -1,11 +1,11 @@
-PR_append = ".arago2"
+PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
 
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV = "3.2.0+git${SRCPV}"
+PV = "3.5.0+git${SRCPV}"
 
 BRANCH = "ti_optee_client"
-SRCREV = "08428734c67fb559e420d87fa52fd74a955ea1bd"
+SRCREV = "1f8f9abe4a31abd7b7490a7ddd9bbe812c92d5af"
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index d0a1ac57..99f4acbc 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -1,12 +1,12 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago2"
+PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
 SRC_URI += "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch"
 
-PV = "3.2.0+git${SRCPV}"
+PV = "3.5.0+git${SRCPV}"
 
 BRANCH = "ti_optee_test"
-SRCREV = "274d3c55dfa2f4726109dc9773c82fe8d5a44dae"
+SRCREV = "ee71a3120a9850ec0d5648c095ab1c449f3ba9d4"
-- 
2.17.1


