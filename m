Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307C0C7EE22
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 17:20:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.27079.1682616049091478428
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 10:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o2sc33hU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RHKjpd022430;
	Thu, 27 Apr 2023 12:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682616045;
	bh=/JYU3BNkT46ZCic7q9YpasGH+keFUhEH0en12OtZFnk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o2sc33hUIlqIvCx8L+xwxssaAZ+V9gmKEWpsEtuEVu7DwvI2PZG201Da/LbkrgeRi
	 fVstZiTl9kBJ6Ao6I5Y10Q6hoDsW/VBY9EuGdzhZlvChWZLd/xSUYb/ugSC6soq32t
	 foQTAqalwsyktexECC0h5lZyyEGv8QJVdiMV0p+w=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RHKjj0053460
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 12:20:45 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 12:20:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 12:20:45 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RHKj8h110570;
	Thu, 27 Apr 2023 12:20:45 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 2/5] qtwayland: override the packageconfig to prefer wayland
Date: Thu, 27 Apr 2023 12:20:33 -0500
Message-ID: <20230427172036.863789-3-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172036.863789-1-rs@ti.com>
References: <20230427172036.863789-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 17:20:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14364

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


