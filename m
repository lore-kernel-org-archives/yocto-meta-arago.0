Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B74F0529DC
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG8TA056272
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226168;
	bh=+iVo1NMNMy/w991HIYwQ2PgUmyepn2cdbJC9/If+TR8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F1HDUcYIGyb3+MkQSqLz/F5leSt0FZGN/tu0d2rgqkSxs3qkhXIb5YryW6EigDoNV
	ozhOImkwXeyiahE3MA5gDrh4Jsj3NDlwLeQRa/deSNfZvf23HjVX1YT4P8l+QXRjV/
	RfKa2bgyF8mbskjmHqwQ5BHFDpBlh6HU+AMdHjew=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJG8bF070743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:08 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:08 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7pd017983;
	Thu, 20 Feb 2020 13:16:08 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:51 +0000
Message-ID: <20200220185458.26926-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220185458.26926-1-denys@ti.com>
References: <20200220185458.26926-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 2/9] nativesdk-packagegroup-arago-sdk-host: deprecate in favor of upstream nativesdk-packagegroup-sdk-host
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
X-List-Received-Date: Thu, 20 Feb 2020 19:18:08 -0000
Content-Type: text/plain

Upstream nativesdk-packagegroup-sdk-host installs most host tools, but few more
that we require should be added in nativesdk-packagegroup-arago-tisdk-host

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb |  2 +-
 .../nativesdk-packagegroup-arago-sdk-host.bb  | 21 -------------------
 ...nativesdk-packagegroup-arago-tisdk-host.bb |  5 ++++-
 3 files changed, 5 insertions(+), 23 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 5a48d3e0..6f55cca6 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,4 +1,4 @@
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-sdk-host"
+TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host"
 TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
 TOOLCHAIN_HOST_TASK += "packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
deleted file mode 100644
index 4199c2eb..00000000
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r18"
-LICENSE = "MIT"
-
-inherit packagegroup nativesdk
-
-PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
-
-RDEPENDS_${PN} = "\
-    nativesdk-pkgconfig \
-    nativesdk-opkg \
-    nativesdk-libtool \
-    nativesdk-autoconf \
-    nativesdk-automake \
-    nativesdk-shadow \
-    nativesdk-makedevs \
-    nativesdk-python-distutils \
-    nativesdk-git \
-    nativesdk-cmake \
-    nativesdk-mtd-utils-ubifs \
-"
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index ef54253d..c24652b9 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -20,6 +20,9 @@ EXTRA_TI_TOOLS = " \
 "
 
 RDEPENDS_${PN} = "\
-    nativesdk-packagegroup-arago-sdk-host \
+    nativesdk-packagegroup-sdk-host \
+    nativesdk-python-distutils \
+    nativesdk-git \
+    nativesdk-mtd-utils-ubifs \
     ${EXTRA_TI_TOOLS} \
 "
-- 
2.17.1


