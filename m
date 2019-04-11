Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 81E67529C8
	for <meta-arago@arago-project.org>;
	Thu, 11 Apr 2019 18:44:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3BIiVHN041470
	for <meta-arago@arago-project.org>; Thu, 11 Apr 2019 13:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555008271;
	bh=TlT9jqCdZu8qMZzG58oxr+Z2qbKXFbFfPazF8FAajf0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pn7D2G0A29IJiW7dRFxHZiUknMWFxobZUOnlE4oiedILBsX6iibRAuu1fKF2U1C5W
	kzrafdF7jvop/X4w0QVajm2bp1gk/KXBh37fO+JkdWa/fYL1yKOakHdaRu9F1QwwYO
	9w3v5OBH6GPhNB5H2sgKvxLmLF5L6iiK6pzUDnNk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3BIiVRE037304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 11 Apr 2019 13:44:31 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 11 Apr 2019 13:44:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 11 Apr 2019 13:44:31 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3BIiTSW124135;
	Thu, 11 Apr 2019 13:44:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 11 Apr 2019 14:32:21 -0400
Message-ID: <1555007541-19889-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555007541-19889-1-git-send-email-j-stiffler@ti.com>
References: <1555007541-19889-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][RFC 2/2] arago-source-ipk: u-boot-ti-staging: disable package strip and debug
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
X-List-Received-Date: Thu, 11 Apr 2019 18:44:52 -0000
Content-Type: text/plain

* This is causing problems with the new change to the sourceipk class

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index d958268..a709ad7 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -39,6 +39,9 @@ INHERIT += "sourceipk"
 # Disable including README and recipe files in sourceipks for SDK builds.
 SRCIPK_INCLUDE_EXTRAFILES = "0"
 
+# PVExtra is used here, but may not be defined in the recipe
+PVExtra ?= ""
+
 # Set source ipk packages and install directories
 CREATE_SRCIPK_pn-ti-tisdk-licenses = "1"
 SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses = "docs/licenses"
@@ -131,6 +134,8 @@ SRCIPK_INSTALL_DIR_pn-x-load_beagleboard = "board-support/${P}"
 CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}${UBOOT_LOCALVERSION}"
 SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging = "true"
+INHIBIT_PACKAGE_DEBUG_SPLIT_pn-u-boot-ti-staging = "1"
+INHIBIT_PACKAGE_STRIP_pn-u-boot-ti-staging = "1"
 
 CREATE_SRCIPK_pn-u-boot-keystone = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-keystone = "board-support/u-boot-${PV}"
-- 
2.7.4


