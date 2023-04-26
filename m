Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860E1C77B7C
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:32:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5181.1682544740625513214
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SCsNICmg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWHkv024819;
	Wed, 26 Apr 2023 16:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682544737;
	bh=/JYU3BNkT46ZCic7q9YpasGH+keFUhEH0en12OtZFnk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SCsNICmgp7UHTzoOUFHzxo/gjL7i6/RObFN8bxOAgQMt3FOQlCIdTkyvhCDgXLIHb
	 f0hql5U6wsgr3sJwqYcsUprYeL4hy8Uho9xnPHGVirCf5h/SmnVbZ17ctgNFf2Ee2J
	 SPdYrPh1LKO7uuWvPlui3KMY+7D+kSLgkkP9JOTg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLWHx4126617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:32:17 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 16:32:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 16:32:16 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWGvi067242;
	Wed, 26 Apr 2023 16:32:16 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 2/6] qtwayland: override the packageconfig to prefer wayland
Date: Wed, 26 Apr 2023 16:32:09 -0500
Message-ID: <20230426213214.3501230-3-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426213214.3501230-1-rs@ti.com>
References: <20230426213214.3501230-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14354

From: Randolph Sapp <rs@ti.com>

While we're allowing X to exist now, we are by no means prefering it.
Set the PACKAGECONFIG to remove the X specific components.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
index 23a2f907..25b5fc42 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -5,3 +5,5 @@ SRC_URI += " \
     file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
     file://0001-examples-fix-wayland-texture-sharing-custom-composit.patch \
 "
+
+PACKAGECONFIG:remove = "xcomposite-egl xcomposite-glx"
-- 
2.40.0


