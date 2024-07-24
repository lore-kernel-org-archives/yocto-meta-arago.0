Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859B4C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 14:48:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12541.1721832527737226688
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Jul 2024 07:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ld6qXPk0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46OEmkpV011445;
	Wed, 24 Jul 2024 09:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721832526;
	bh=lIDQbcibvX8HlkMrfRn/OqNrAuDyg58pp+mjogFW9B4=;
	h=From:To:Subject:Date;
	b=ld6qXPk0nSFxijFl0lYtVcFlh8KIUqToBDZyr8OnMd9OQz5FmQLqsiiLsgWs0aIwA
	 MXCLHyhqLX4LMRv7bfUqHg8fKfHWstxnVwSbevQeis0hytYeT6pX1L3j1HGNPJN+xt
	 q2M2GKIUNd165sP0c0WaqEjeIZd5PV2SlOhKWFks=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46OEmkYu056686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jul 2024 09:48:46 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Jul 2024 09:48:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Jul 2024 09:48:45 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46OEmjM2027640;
	Wed, 24 Jul 2024 09:48:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sWdIL-0006XD-JC; Wed, 24 Jul 2024 09:48:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] tisdk-bundle: Remove do_image() and do_image_complete()
Date: Wed, 24 Jul 2024 09:48:45 -0500
Message-ID: <20240724144845.25079-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Jul 2024 14:48:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15468

These functions are no longer different than the image base class we
inherit from, and in fact have been updated in recent patches upstream
that are causing build errors due to the missing code.  Simple fix is
just remove our no longer needed versions of these functions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index c2abc056..83fe31a0 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -121,22 +121,6 @@ fakeroot python do_rootfs () {
     create_rootfs(d)
 }
 
-fakeroot python do_image () {
-    from oe.utils import execute_pre_post_process
-
-    pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND")
-
-    execute_pre_post_process(d, pre_process_cmds)
-}
-
-fakeroot python do_image_complete () {
-    from oe.utils import execute_pre_post_process
-
-    post_process_cmds = d.getVar("IMAGE_POSTPROCESS_COMMAND")
-
-    execute_pre_post_process(d, post_process_cmds)
-}
-
 tisdk_image_setup () {
     set -x
     rm -rf ${IMAGE_ROOTFS}
-- 
2.17.1


