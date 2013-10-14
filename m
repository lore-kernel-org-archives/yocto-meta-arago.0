Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9E7695299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:40:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJeExU018402
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:40:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJeEFx020887
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:40:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 14 Oct 2013 14:40:13 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJe33m012256;
	Mon, 14 Oct 2013 14:40:12 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Oct 2013 15:29:24 -0500
Message-ID: <1381782564-11190-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1381782564-11190-1-git-send-email-Chase.Maupin@ti.com>
References: <1381782564-11190-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] packagegroup crypto: Add AM437x support
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
X-List-Received-Date: Mon, 14 Oct 2013 19:40:14 -0000
Content-Type: text/plain

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |    3 ++-
 .../packagegroup-arago-tisdk-crypto.bb             |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 90a4dd9..f86accf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -9,6 +9,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 CRYPTO_RDEPENDS = ""
 
 CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
+CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
 
 CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index c1e7054..d781ddd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -15,6 +15,7 @@ CRYPTO_SUPPORT = "\
     "
 
 CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples"
+CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples"
 
 # Add crypto hardware support for am37x-evm
 # NOTE: this package depends on a kernel patch which also has a TSU
-- 
1.7.0.4


