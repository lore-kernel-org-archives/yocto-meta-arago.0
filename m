Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0FAC3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:37:42 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.495.1721072252844428052
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 12:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LDAxgtLA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46FJbT5q016407;
	Mon, 15 Jul 2024 14:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721072249;
	bh=RZ1IUJAX3YnsvrUjsnAmPdMxV/tim4R9Jxza9yFKnzo=;
	h=From:To:Subject:Date;
	b=LDAxgtLAGdAI/p77hy6xt6XLuLLykvRYBhSTf4ez5bsKDKx6Dvs7NrFWb3vP9oWzy
	 WZr2nEAnP3TtSVderyDukOuJqO0puU50hmpmLK2zKsUY4MAUuG28LgoTeG/8bUDZIh
	 xI7b1fNZjE6TmOF+xLOPpc0QqumHGThp5LdPdU24=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46FJbTmn031206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jul 2024 14:37:29 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Jul 2024 14:37:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Jul 2024 14:37:29 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46FJbTim119644;
	Mon, 15 Jul 2024 14:37:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sTRVp-0007XZ-2b; Mon, 15 Jul 2024 14:37:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] gnutls: Add INSANE_SKIP for incompatible-license
Date: Mon, 15 Jul 2024 14:37:29 -0500
Message-ID: <20240715193729.28404-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Jul 2024 19:37:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15441

A recent change in master has promoted a lot more warnings into errors.
Set the INSANE_SKIP variable since we are using INCOMPATIBLE_LICENSE.

This patch is dependent on a patch in oe-core:

https://lists.openembedded.org/g/openembedded-core/message/201943

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added the oe-core patch reference.

 meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
index 4ad4f70a..44d1e3fa 100644
--- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
+++ b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
@@ -3,3 +3,5 @@ PR:append = ".arago0"
 # Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
 # version of gettext.
 INCOMPATIBLE_LICENSE = "GPL-3.0*"
+
+INSANE_SKIP:${PN} += "incompatible-license"
-- 
2.17.1


