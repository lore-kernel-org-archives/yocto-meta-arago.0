Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E880652998
	for <meta-arago@arago-project.org>;
	Mon,  1 Oct 2018 16:00:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w91FxwId095851
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 10:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538409598;
	bh=PWZdljzWz0bJhm71u04nIcRk9i7Zzmvw1E1fEwo68KY=;
	h=From:To:CC:Subject:Date;
	b=LdCCWniUygxngQ3xl8hBlmvnGUnQgn/0PPMgR5APG35p3Z9jGFF5RqCQ1O9iDflPw
	AnRAxGwwIC1gTNN8lOF3KsV+gb8/Xi81ND19mNp6n55U40FbeB+HlH4UsxPChN5IbB
	UAlwf/3Cn9bCXhanva8K0c0mqVALIOEIko7uANHg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w91FxwZW013821
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 10:59:58 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 1 Oct 2018 10:59:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 1 Oct 2018 10:59:57 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w91Fxvr0027992;
	Mon, 1 Oct 2018 10:59:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Oct 2018 15:55:44 +0000
Message-ID: <20181001155544.3658-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] packagegroup-*-addons*: add CAN utils to K3
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
X-List-Received-Date: Mon, 01 Oct 2018 16:00:07 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb              | 3 ++-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 4ff30cd4..8106cafa 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r38"
+PR = "r39"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -128,6 +128,7 @@ UTILS_append_dra7xx = " can-utils-dev \
                         elfutils-staticdev \
 "
 UTILS_append_k2g = " can-utils-dev"
+UTILS_append_k3 = " can-utils-dev"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_ti43x = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5c77d8b8..f0177ef7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r69"
+PR = "r70"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -64,6 +64,7 @@ UTILS_append_omap-a15 = " mmc-utils \
 "
 
 UTILS_append_k3 = " mmc-utils \
+                    can-utils \
                     parted \
                     switch-config \
                     pru-icss \
-- 
2.17.1


