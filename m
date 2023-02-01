Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C93C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:43:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.25196.1675262583626542474
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Feb 2023 06:43:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y/Ys3xQV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 311Eh0Pi043157;
	Wed, 1 Feb 2023 08:43:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675262580;
	bh=fD4WZx4A0kaLp29CjRC6vc7W9+KCo/Lak5G+3R0O4fc=;
	h=From:To:Subject:Date;
	b=Y/Ys3xQVp4q/xXMZfAXi2Rful4AviJBZi5zI9lU+EDDrz9X8TMsEIXPEfMFsmdor9
	 99tYg35FJ5bPY1bUKbiVfL1xZMh5ieCn1OSGS3wz7iKlhIP+RN6tmAPL56+gNCF7O8
	 MtPOo/Zi281AQc42rooViXTL+oL15dLPU4pOwhdo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 311Eh0KC113773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Feb 2023 08:43:00 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 1
 Feb 2023 08:43:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 1 Feb 2023 08:43:00 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 311Eh0Lt120407;
	Wed, 1 Feb 2023 08:43:00 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pNEKC-0006GS-At; Wed, 01 Feb 2023 08:43:00 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] arago-prefs: Change how variants interact with the kernel choice
Date: Wed, 1 Feb 2023 08:43:00 -0600
Message-ID: <20230201144300.24040-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Feb 2023 14:43:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14196

Rather than just explicitly locking the PREFERRED_PROVIDER_virtual/kernel
to linux-ti-staging and the suffix, use the :append to add the suffix to
whatever value PREFERRED_PROVIDER_virtual/kernel is.  This allows a
machine in a BSP layer to control which kernel to use as the bsse.

In the event that the kernel/variant choice is not valid the error
report from bitbake is very vague, but it does fail so you will not get
an incorrect build.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 2dc4f212..34c3c539 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -6,7 +6,7 @@ PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
+PREFERRED_PROVIDER_virtual/kernel:append = "${ARAGO_KERNEL_SUFFIX}"
 
 PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 
-- 
2.17.1


