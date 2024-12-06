Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34A6E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 14:35:01 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.38097.1733495697058554929
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 06:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pZpRd2bo;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6EYtgv2371195
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 6 Dec 2024 08:34:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733495695;
	bh=eFj+/l6CI7FKkCAWe6QWNIbGHMJ321H+G+QpuRjI3ow=;
	h=From:To:Subject:Date;
	b=pZpRd2boo49HK4cz17EB9FfHKDBbTYWzN7uWjsRVLr0Pob1oWAFmOf2SfYx5cK/nw
	 +nsFbwhGHzlRwh1n8z8IYj/hcCZRa4t2XF3yVZOJ3xm+gMbQgRdeG2jsBm+6wNQLo6
	 z3bauOwCbGqejpLcyhNl/WKUYvBknE9y0m+NtBP8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6EYtsq017947;
	Fri, 6 Dec 2024 08:34:55 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 08:34:55 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 08:34:55 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6EYtwo010486;
	Fri, 6 Dec 2024 08:34:55 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tJZPz-0003mq-77; Fri, 06 Dec 2024 08:34:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] mtd-utils: Adjust to upstream recipe changes
Date: Fri, 6 Dec 2024 08:34:55 -0600
Message-ID: <20241206143455.14514-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Dec 2024 14:35:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15645

The upstream recipe name changed, so use % to better match in the
future. Also, upstream now has the BBCLASSEXTEND += "nativesdk", so we
can drop that.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../mtd/{mtd-utils_git.bbappend => mtd-utils_%.bbappend}        | 2 --
 1 file changed, 2 deletions(-)
 rename meta-arago-test/recipes-devtools/mtd/{mtd-utils_git.bbappend => mtd-utils_%.bbappend} (97%)

diff --git a/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend b/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
similarity index 97%
rename from meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
rename to meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
index 341d0600..1120e87a 100644
--- a/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
+++ b/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
@@ -6,8 +6,6 @@ SRC_URI:remove = "git://git.infradead.org/mtd-utils.git;branch=master \
 SRC_URI:prepend = "git://git.infraroot.at/mtd-utils.git;branch=master;protocol=https \
 "
 
-BBCLASSEXTEND += "nativesdk"
-
 EXTRA_OEMAKE = "'CC=${CC} ${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'RANLIB=${RANLIB}' 'AR=${AR}' 'BUILDDIR=${S}'"
 
 do_compile:append() {
-- 
2.17.1


