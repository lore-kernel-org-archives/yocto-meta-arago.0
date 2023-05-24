Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9504EC7EE2E
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1295.1684951889376582183
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 11:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pkr/A0/a;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOCH099634;
	Wed, 24 May 2023 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684951884;
	bh=xSVD0ImIr65o5Fhvd9jIA6lrlIoOsWgbS+vjMEqaYeg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Pkr/A0/aLVHPN+yNgOOsq0ZjhpiJh7wJsWPauPENCLG1O7IYU4IHRDEzfga5bc3XJ
	 cUsuFoeM2jy3L1VraMArxcHIazN7NcLf+gwjAw+FGmkG3eCz3gmGh/kTTUGL6NlSEi
	 cvHP9QeOB1Vk9UJEoz1I11MbhU8ofr2CylNeRXsg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OIBOhW124223
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 13:11:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 13:11:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 13:11:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOq3005029;
	Wed, 24 May 2023 13:11:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [arago][kirkstone][PATCH 4/7] weston: add notice about select-plane patch
Date: Wed, 24 May 2023 13:11:19 -0500
Message-ID: <20230524181122.35202-5-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524181122.35202-1-rs@ti.com>
References: <20230524181122.35202-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 18:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14464

From: Randolph Sapp <rs@ti.com>

The select-plane patch has been accepted upstream as commit
94afcbcdc3f1b1cfc050da242c9c70009b007fc6. Add a notice to remind users
to remove that patch when we get there.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/wayland/weston_10.0.2.bbappend          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
index dd67eec1..989bc28c 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
@@ -2,8 +2,13 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 PR:append = ".arago1"
 
+# Drop 0001-backend-drm-Select-plane-based-on-current-attached-C.patch once we
+# get past version 11.0.1 or commit 94afcbcdc3f1b1cfc050da242c9c70009b007fc6
+# upstream
+
 SRC_URI += " \
         file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
 "
+
-- 
2.40.1


