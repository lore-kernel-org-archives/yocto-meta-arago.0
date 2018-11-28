Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 47D3A529C8
	for <meta-arago@arago-project.org>;
	Wed, 28 Nov 2018 20:36:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wASKalbw018995
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 14:36:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543437407;
	bh=qOxt0ll+1Yg8bOVpdUBznm5EXwc6ImK2/Y3W7+d6GXM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lWX3mJI5baEHtHwe5dcc4Dz2B+vUW0CGOvak0HeUUpilBIpcr+JKc9JvsczIra7Cr
	d8A3Ae5nOKsVTU2cDGrWKLAMYqiFsszWhkn0AU+KViKtLQzx83mNqXBgy5MP1u9b2D
	0XwzaDVxmy16Sag9C89DPdTC+x0dKlg6bweFjfww=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wASKalw2040210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 14:36:47 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 28 Nov 2018 14:36:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 28 Nov 2018 14:36:47 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wASKagmr014881;
	Wed, 28 Nov 2018 14:36:45 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Nov 2018 15:24:04 -0500
Message-ID: <1543436645-4503-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543436645-4503-1-git-send-email-j-stiffler@ti.com>
References: <1543436645-4503-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko][PATCH 2/3] packagegroups: addons: add open62541 packages
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
X-List-Received-Date: Wed, 28 Nov 2018 20:36:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb    | 7 +++++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 4 +++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 8106caf..a374cf6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,12 +1,15 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r39"
+PR = "r40"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-UTILS = "libdrm-dev"
+UTILS = "libdrm-dev \
+         open62541-dev \
+         open62541-staticdev \
+         "
 
 UTILS_append_keystone = "\
 	kernel-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f0177ef..b55167d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r70"
+PR = "r71"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -29,6 +29,8 @@ UTILS = " \
     strongswan \
     kexec \
     kdump \
+    open62541-examples \
+    open62541-tests \
 "
 
 UTILS_UBOOT_FW = "u-boot-fw-utils"
-- 
2.7.4


