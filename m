Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7B0C282DE
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 00:36:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.3505.1741653413714826931
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 17:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d9Vw66iY;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52B0aoEb621119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 10 Mar 2025 19:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741653410;
	bh=4rHX2qIzLvt2Xe0hv9j63eagM5swjY9QmWnxi3yWMsQ=;
	h=From:To:CC:Subject:Date;
	b=d9Vw66iYAU2OgQRtqJlqEbNuSHuEPZTlGOtj/DBPZfcEbhGGBbBN1AFLt1PChzAXo
	 ClS8+eAElXsFRhVHONAE9hhqcFtvCv/xd7gZeBk+FexsjrR4TG9GanWtXja5AVILcx
	 llgMRz1XhHClswkDN1dVmLWeEDOGwR6/KbW1VTOc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52B0aopS006827;
	Mon, 10 Mar 2025 19:36:50 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Mar 2025 19:36:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Mar 2025 19:36:50 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52B0aoAd019697;
	Mon, 10 Mar 2025 19:36:50 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH] packagegroup-arago-tisdk-gtk: set PACKAGE_ARCH
Date: Mon, 10 Mar 2025 19:35:57 -0500
Message-ID: <20250311003556.3131699-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 00:36:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15964

From: Randolph Sapp <rs@ti.com>

This packagegroup pulls a package that is automatically renamed with
DEBIAN_NAMES. This is not allowed due to a sanity check that was added
to prevent issues with packagegroups being aggressively cached and
DEBIAN_NAMES potentially breaking this cache. See [YOCTO #7298] or
5bf3e447d2f in openembedded-core [1].

[1] https://git.openembedded.org/openembedded-core/commit/?id=5bf3e447d2f5064495d83a8fad30229bcf1ecc9b

Fixes: 731fd376 (packagegroups: Do not set package arch when unneeded, 2025-03-03)
Signed-off-by: Randolph Sapp <rs@ti.com>
---

Tagged scarthgap/master as the origional patch was, but I don't think the
original patch has made it to master yet.

 .../packagegroups/packagegroup-arago-tisdk-gtk.bb             | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
index cd6dd895..e0a90a31 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
@@ -2,6 +2,10 @@ DESCRIPTION = "Task to add Gtk embedded related packages"
 LICENSE = "MIT"
 PR = "r2"
 
+# Required for packages that are renamed using DEBIAN_NAMES
+# [YOCTO #7298]
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit packagegroup
 
 RDEPENDS:${PN} = "\
-- 
2.48.1


