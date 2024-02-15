Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7CBC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 01:01:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3979.1707958886358015110
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 17:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G9MCdOU2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41F11OOb067487;
	Wed, 14 Feb 2024 19:01:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707958884;
	bh=Lyr0/Flf/rL7lgrq1tKp6Ido3uf2oi4anEDobgyqGgM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=G9MCdOU2Cr1izm5fkpwP9H+puffFGzl5GZ7FshBrm5mVkY+a5tvhcP8Jq9He676VT
	 8CnwMCFJLHkj0s3zR69IsNgZYxJj8OpBduUqwWTarIIxOKU5qdqj/W5Kyz8QjxaGkG
	 L8zbni0FNTn59txcbCy1K6378iMhBpCi8eJV1FsA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41F11OZO083755
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 19:01:24 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 19:01:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 19:01:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41F11NcD014547;
	Wed, 14 Feb 2024 19:01:23 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <j-choudhary@ti.com>
Subject: [meta-arago][kirkstone][PATCH 2/2] weston: include backported patches in bbappend
Date: Wed, 14 Feb 2024 19:01:23 -0600
Message-ID: <20240215010123.3432540-3-rs@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215010123.3432540-1-rs@ti.com>
References: <20240215010123.3432540-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 01:01:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15190

From: Randolph Sapp <rs@ti.com>

Backport some sanity patches related to plane ordering and positioning.
These are all mandatory for display subsystems that allow primary and
overlay mutable zpos.

They have all already been accepted upstream already and are only
necessary for Kirkstone's version of Weston.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/wayland/weston_10.0.2.bbappend           | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
index 698ff03e..3c577c6d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
@@ -9,6 +9,10 @@ PR:append = ".arago1"
 SRC_URI += " \
         file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
+        file://0001-backend-drm-Pre-sort-plane-list-by-zpos.patch \
+        file://0002-backend-drm-fix-plane-sorting.patch \
+        file://0003-drm-backend-Remember-to-set-the-zpos-for-the-scanout.patch \
+        file://0004-backend-drm-Assign-plane_idx-by-plane-list-order.patch \
 "
 
 # required for weston user to interact with the render devices
-- 
2.43.0


