Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2564BC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 16:03:04 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.166.1654272183169203769
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Jun 2022 09:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JaBfjzuO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 253G31fh058604;
	Fri, 3 Jun 2022 11:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654272181;
	bh=FQ9ScWYy5vW5e/+TcGba6/xxnJBeESO/DfN170gMWi4=;
	h=From:To:CC:Subject:Date;
	b=JaBfjzuO3uTBQWzfVyM6PPZWPLKNxmh53VV0xAqocbBen7sTWpHBqiJbd+wTySUD9
	 KkN/JWdR6igqPZryu8YsWL8ziSneXZxsaQh8MTTt9gw/J8M5IR4a1z/G5CLrgNMHnv
	 xBUp9kwgzV3aIDMoO3OjWrNmBVT2pzeonRqeD3/U=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 253G31In008079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jun 2022 11:03:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 3
 Jun 2022 11:03:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 3 Jun 2022 11:03:00 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 253G301v096910;
	Fri, 3 Jun 2022 11:03:00 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][dunfell/master][PATCH] tiusdk-uenv: remove uEnv.txt for
 k3
Date: Fri, 3 Jun 2022 11:03:00 -0500
Message-ID: <20220603160300.28387-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Jun 2022 16:03:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13885

This fixup should have been done in u-boot and not in a uEnv.txt
file. It is not correct for all K3 anymore either. Remove it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../tisdk-uenv/tisdk-uenv/k3/uEnv.txt         | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
deleted file mode 100644
index 80ea34f5..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-# This uEnv.txt file can contain additional environment settings that you
-# want to set in U-Boot at boot time.  This can be simple variables such
-# as the serverip or custom variables.  The format of this file is:
-#    variable=value
-# NOTE: This file will be evaluated after the bootcmd is run and the
-#       bootcmd must be set to load this file if it exists (this is the
-#       default on all newer U-Boot images.  This also means that some
-#       variables such as bootdelay cannot be changed by this file since
-#       it is not evaluated until the bootcmd is run.
-
-# The specific board is not able to be automatically detected. The below is a
-# workaround to set a sane default incase the user has not manually configured
-# a specific board.
-def_board_name="am65x"
-
-# Check if using default board_name when name_overlays is not set
-check_for_board=if test $name_overlays; then echo "Using board_name = $board_name"; else setenv board_name $def_board_name; fi
-
-uenvcmd=run check_for_board; run findfdt
-- 
2.36.1


