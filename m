Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EB7C7EE24
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:30:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4603.1682631012523287760
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Q+JfJZ1H;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RLU9Z2035979;
	Thu, 27 Apr 2023 16:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682631009;
	bh=/JYU3BNkT46ZCic7q9YpasGH+keFUhEH0en12OtZFnk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q+JfJZ1H4NJe+mKVbftqu2idTPQsokqPgYDR00wE+qprmNMB86jvEhcAKy07BXekn
	 1OtVmh86gEgJa80ZfaBWOTjzV43drzc5yMW4kQEj+i+vSFwUGLlXnOX/uwmU+nbMyx
	 ukTs8lkRTHgV4UhhBV5LwD/P6S/Mv9PQCd62yrM4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RLU9Ka069916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 16:30:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 16:30:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 16:30:08 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RLU805128870;
	Thu, 27 Apr 2023 16:30:08 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCHv3 2/5] qtwayland: override the packageconfig to prefer wayland
Date: Thu, 27 Apr 2023 16:29:57 -0500
Message-ID: <20230427213000.1923507-3-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427213000.1923507-1-rs@ti.com>
References: <20230427213000.1923507-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 21:30:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14375

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


