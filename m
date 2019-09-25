Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id CEB23520E2
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2019 16:56:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PGtBL6044223
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 11:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569430511;
	bh=xZDfUObJZAuApkHc1cnmKT0FtdF3SAp6THIJulskEz4=;
	h=From:To:CC:Subject:Date;
	b=MUKo8TCR9jgXMVBEKV3UMp+bkysnyi+ei2I1P/8FdJyM6lIuZDK3b4ludkDZFP3oL
	V+M2wy6qgc22GncLE1ftUukJYroZWwZWGwcF2zzwrCxIU5Qq5PI8aFR0LxO4KU/5oG
	xlQsskE7U4VEadcKsWQ8S0eBGSA2L3UhIFPtFAuo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PGtBrb123060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 11:55:11 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 25 Sep 2019 11:55:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 25 Sep 2019 11:55:10 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PGtAwO005689;
	Wed, 25 Sep 2019 11:55:10 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Sep 2019 12:36:31 -0400
Message-ID: <1569429391-8232-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] packagegroup: matrix: remove ethernet submenu
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
X-List-Received-Date: Wed, 25 Sep 2019 16:56:21 -0000
Content-Type: text/plain

* The ethernet submenu is the only submenu explicitly added to a
  packagegroup.
* submenus are RDEPENDS on the matrix apps, so adding here is
  unnecessary.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index c2c5975..1b57798 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r80"
+PR = "r81"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,7 +28,6 @@ MATRIX_COMMON_APPS = "              \
     matrix-gui-oprofile-demos       \
     matrix-gui-settings-demos       \
     matrix-gui-usb-demos            \
-    matrix-gui-submenus-ethernet    \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'matrix-gui-weston-terminal-demo', '', d)} \
 "
 
-- 
2.7.4


