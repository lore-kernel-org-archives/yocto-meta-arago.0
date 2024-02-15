Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCD5C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:56:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.25175.1708019799416570793
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 09:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zAxiPuF8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FHucJT081149;
	Thu, 15 Feb 2024 11:56:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708019798;
	bh=Lyr0/Flf/rL7lgrq1tKp6Ido3uf2oi4anEDobgyqGgM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zAxiPuF8m1oSaAZDbx/izZQW5PCPCkGeVbUdHH3e+vV/rosNGAbzzx1EkGCZDtUkO
	 6WjvRTsg88X0EXnq1MCDEqMO/oHhvZI+XQy8gbwZJ41gKIEq610+DoYW9/3t435A3N
	 xig2vRLHZ9gKLhC+SlnrTYjJPw+RFb77oA9pG+r8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FHucOd077693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 11:56:38 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 11:56:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 11:56:37 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FHubAl020892;
	Thu, 15 Feb 2024 11:56:37 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <j-choudhary@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 2/2] weston: include backported patches in bbappend
Date: Thu, 15 Feb 2024 11:56:37 -0600
Message-ID: <20240215175637.3438470-3-rs@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215175637.3438470-1-rs@ti.com>
References: <20240215175637.3438470-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 17:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15198

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


