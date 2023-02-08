Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFECBC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:35:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1112.1675899350646257640
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A1ny+jTc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NZnVw087029;
	Wed, 8 Feb 2023 17:35:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899349;
	bh=F7vswcaQkcRlz1mgbJoA4G92mzX4EYOTePDoKYVAARU=;
	h=From:To:CC:Subject:Date;
	b=A1ny+jTcCzT8VGLGJQI1ZbTmGtL/yGM7YkWDHWEhMQ6PGnM7cm+avCARxay04xF7h
	 CY44gpNmf32OBTtLqx8qjuv+oUas5BJkNn7ZZUvbaE7rJ/hwMy76i3JZn2zy7XaehM
	 mFmY0v/f09NZoOCC+TM5m+RH9Vod0ovvf3czVe9M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NZnTf042981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:35:49 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:35:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:35:49 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NZmcd003598;
	Wed, 8 Feb 2023 17:35:48 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] glsdk-example-apps: Fix build when x11 is not available
Date: Wed, 8 Feb 2023 17:35:48 -0600
Message-ID: <20230208233548.19880-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14212

When the graphics driver is not built with x11 support the pkg-config
file will include a cflag that causes the correct non-x11 headers to
be included. This package does not correctly check pkg-config and
so misses this cflag. Add it manually.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 6827ed31..7b0bc3c4 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -16,7 +16,9 @@ SRC_URI = "git://git.ti.com/git/glsdk/example-applications.git;protocol=https;br
 
 SRCREV="52466430609c402a9f1c0667ccf727d096336d0d"
 
-PR = "r52"
+PR = "r53"
+
+CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11',d)}"
 
 do_install:append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
-- 
2.39.1


