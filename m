Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B31EC282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 15:08:16 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.55407.1741014490244379392
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 07:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=i0Fk4FLb;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 523F883w2708197
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 09:08:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741014488;
	bh=XiWeDodsJZ9VOoYIj0qS5/a12J/ysjBRxDN5DkYO+AE=;
	h=From:To:CC:Subject:Date;
	b=i0Fk4FLbCHxf3zIkaw2abnKlVAOA4J2BeHKrKuae2WJjzf3fPi4uOf94Zr2B4Xu0z
	 QBH/qEgYPZaWMSDGUwlsrUZl0hbxB1c17qv8apWttf891PfR3MdkgK5zzpgOPzLSOP
	 qXDYbotsAnEb8TOGsrM8aIv3bFdwuomjjzPfXgsM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 523F88Mc051474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Mar 2025 09:08:08 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 09:08:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 09:08:08 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523F87cV054560;
	Mon, 3 Mar 2025 09:08:07 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] packagegroups: Do not set package arch when unneeded
Date: Mon, 3 Mar 2025 09:08:07 -0600
Message-ID: <20250303150807.495886-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Mar 2025 15:08:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15935

These package groups do not change based on the machine,
do not set PACKAGE_ARCH as that forces these to be built
for every machine anyway.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb | 2 --
 .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb | 2 --
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb            | 2 --
 .../packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb    | 2 --
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb  | 2 --
 5 files changed, 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 891449b7..f203ff20 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -3,8 +3,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r17"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit packagegroup
 
 ARAGO_LIBNL = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index ff72c007..74cbe90f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "Task to install crypto dev packages in SDK"
 LICENSE = "MIT"
 PR = "r8"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit packagegroup
 
 CRYPTO_API = "cryptodev-module-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index ec30942b..249ee9a3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
 PR = "r13"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit packagegroup
 
 CRYPTO_SUPPORT = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
index 030583e3..f9fca526 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "Task to install Gtk dev packages in SDK"
 LICENSE = "MIT"
 PR = "r2"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit packagegroup
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
index c2208380..cd6dd895 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "Task to add Gtk embedded related packages"
 LICENSE = "MIT"
 PR = "r2"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit packagegroup
 
 RDEPENDS:${PN} = "\
-- 
2.39.2


