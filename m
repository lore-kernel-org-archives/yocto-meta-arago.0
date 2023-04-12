Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1C9C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 18:34:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.218.1681324496038217352
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 11:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yroXIljb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CIYrRp097271;
	Wed, 12 Apr 2023 13:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681324493;
	bh=5gsOtJ3iltFW7tTVrX6Qg5NRMxlmJeJxmuHiXqgbEeg=;
	h=From:To:CC:Subject:Date;
	b=yroXIljb0Rdgr5GNWQLJVnZ0kXgebhTX2jiUARSbg/Jsvj3VaJg9BNNfRlcfGOmzN
	 ThAvWSmhGOlw8eUwPwBK/wRkeY1Q+/xi1nC3voQSWGJsMuI1o8OsruIKg7+tS3yIYv
	 IWWkYeNUS8apQ6D5uwiLDNmuf7Q9Fr5Xd1rJwVnc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CIYr5n027063
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 13:34:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 13:34:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 13:34:53 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CIYqGH118088;
	Wed, 12 Apr 2023 13:34:52 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] omapdrmtest: Remove dependency on ti-sgx-ddk-um
Date: Wed, 12 Apr 2023 13:34:52 -0500
Message-ID: <20230412183452.29278-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Apr 2023 18:34:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14313

The dependency should be on the libraries it needs, such as EGL/GLESv2,
not a single provider of those libraries. Fix this here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 11251ee0..20b9bf0d 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "Test applications for OMAP DRM interface"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a29096285e3121923041df"
 
-DEPENDS = "ffmpeg libdce libdrm virtual/libgbm ti-sgx-ddk-um wayland"
+DEPENDS = "ffmpeg libdce libdrm virtual/libgbm virtual/libgles2 virtual/egl wayland"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x"
 
-- 
2.39.2


