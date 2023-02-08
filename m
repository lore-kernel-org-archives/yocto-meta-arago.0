Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE929C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:33:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1078.1675899184656197079
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RcAf3vZc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NX36C059330;
	Wed, 8 Feb 2023 17:33:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899183;
	bh=u0alPcgVifiqL6ZfLocVa+TPjOJwykz9zf23kITOpKM=;
	h=From:To:CC:Subject:Date;
	b=RcAf3vZclIi8PIEAOArMyfyn2Wf6tUFmsgzcyAbsc0zljpNaLJP2PtLStZAD7+WOR
	 k5S8CcfNkA4qkeuAQ2Mrpp2ezEN/7fZpMG4+GGSmxrgnDn0sb4h+NBNexdrk89a41H
	 zlQOsbKAFufAHhRwx6WEPqpr+cn/1KTZm2cZID9g=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NX3Oa041625
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:33:03 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:33:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:33:03 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NX21h001530;
	Wed, 8 Feb 2023 17:33:02 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] arago-image: Remove unneeded make_bootfiles_symlinks_relative
Date: Wed, 8 Feb 2023 17:33:02 -0600
Message-ID: <20230208233302.19587-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14207

This post process step is not currently used and will not be needed
as non-relative symlinks are no longer created in the boot files.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/images/arago-image.inc       | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 0bb3634b..923bc84f 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -22,25 +22,6 @@ IMAGE_LINGUAS = ""
 TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
 SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
 
-# FIXME: remove bashisms from this function (currently disabled)
-make_bootfiles_symlinks_relative() {
-    for f in "${IMAGE_ROOTFS}/boot"/*
-    do
-        [ -L "$f" ] || continue
-
-        l=$(readlink "$f")
-        if [ "${l:0:6}" == "/boot/" ]
-        then
-            ln -sf "${l##/boot/}" "$f"
-        elif ["${l:0:1}" == "/" ]
-        then
-            ln -sf "..$l" "$f"
-        fi
-    done
-}
-
-#ROOTFS_POSTPROCESS_COMMAND += "make_bootfiles_symlinks_relative;"
-
 BAD_RECOMMENDATIONS += " \
     ti-llvm3.6-dev \
     opencl-monitor-dev \
-- 
2.39.1


