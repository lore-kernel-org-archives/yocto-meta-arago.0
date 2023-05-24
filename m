Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD7CC7EE31
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1269.1684951891951777795
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 11:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qNdGTa7A;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBO7D020824;
	Wed, 24 May 2023 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684951884;
	bh=04FfX5G+nkaRgtadJU19GyxvZuVucKVFl/Ic/7NUDpo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qNdGTa7AhgmkdEkKNdNgMh9Z7/WI1VgKlbsfwwUJ8nRYWruhKgZLg4mzer6ujqEWf
	 5rnRdQX8M/J+3Pf26oLQEPOSjwJlVR3fBcASJcQkI0LY7JAKuL6p+p0ND3U4AtEvrj
	 wTuW0ipc5OOhhGTv55hvW8e/A+YdjQgqSRS9nQU0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OIBOUR067934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 13:11:24 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 13:11:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 13:11:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOq4005029;
	Wed, 24 May 2023 13:11:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [arago][kirkstone][PATCH 5/7] weston: add weston user to the render group
Date: Wed, 24 May 2023 13:11:20 -0500
Message-ID: <20230524181122.35202-6-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14465

From: Randolph Sapp <rs@ti.com>

The weston user must be added to the render group to use dri render
devices.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/wayland/weston_10.0.2.bbappend          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
index 989bc28c..edc1bebd 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
@@ -12,3 +12,8 @@ SRC_URI += " \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
 "
 
+# required for weston user to interact with the render devices
+inherit extrausers
+EXTRA_USERS_PARAMS = " \
+	usermod -aG render weston; \
+"
-- 
2.40.1


