Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D47C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 17:05:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.16217.1654794323806960957
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 10:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KgErSWvE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 259H5L2i037341;
	Thu, 9 Jun 2022 12:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654794321;
	bh=DyQvLoBqknVBRHqD9l8Jdx0HZTU8jRIHzi7kgMbiUBU=;
	h=From:To:CC:Subject:Date;
	b=KgErSWvE0M5+YFjcYFVdYANZnh1e9ieJSbggDkeQ5YYt6S9O67ahSfZBj9VC9cvn9
	 FjLMUN3v0g51oScbVqvVnTrs8XfeTVRlBLeIn4LZAQQ1iEEo3yPI7d4JOhSPpcQNhm
	 iYsUrFOrfjLW+hgmtFnr6suE7xAAYx2lIbS0QBfY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 259H5LAi022327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jun 2022 12:05:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Jun 2022 12:05:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Jun 2022 12:05:21 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 259H5LxS099147;
	Thu, 9 Jun 2022 12:05:21 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt
 for k3
Date: Thu, 9 Jun 2022 12:05:20 -0500
Message-ID: <20220609170520.31162-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Jun 2022 17:05:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13894

This fixup should have been done in u-boot and not in a uEnv.txt
file. It is not correct for all K3 anymore either. Remove it.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes from v1:
 - Subject s/tiusdk-uenv/tisdk-uenv

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


