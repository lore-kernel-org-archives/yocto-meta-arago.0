Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F178CD37B1
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 21:44:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.35686.1725399859088258378
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 14:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E1YME0mY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 483LiIuP061884;
	Tue, 3 Sep 2024 16:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725399858;
	bh=VVu06hZUrxU3pormcq+tUpWWCJpT+Mw/NFcBX4LmoD0=;
	h=From:To:Subject:Date;
	b=E1YME0mYYL4uhpep7JuOhkgzuUi8I5QvSDN7TSdY4J2nYSs9l/bIoOGOPdd8ZCe/v
	 +zyZJe/yL8qVX+OoAlXf/I+Ltu2qgXiH6uwZFC8eSTvYqqFy5gLtqvX+7GRB/AYo+K
	 m3kDPMoGuNpQioiDegELd/3ByKruqxz/+WG055mI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 483LiIU6018319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Sep 2024 16:44:18 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 16:44:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 16:44:17 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 483LiH6U051286;
	Tue, 3 Sep 2024 16:44:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1slbJx-0008Gf-Jz; Tue, 03 Sep 2024 16:44:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] libnl: Move bbappend to match all version
Date: Tue, 3 Sep 2024 16:44:17 -0500
Message-ID: <20240903214417.31742-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Sep 2024 21:44:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15552

To avoid needing to rename this file every time lbnl changes, rename it
to use the % for the version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../libnl/{libnl_3.9.0.bbappend => libnl_%.bbappend}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-support/libnl/{libnl_3.9.0.bbappend => libnl_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.9.0.bbappend b/meta-arago-distro/recipes-support/libnl/libnl_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-support/libnl/libnl_3.9.0.bbappend
rename to meta-arago-distro/recipes-support/libnl/libnl_%.bbappend
-- 
2.17.1


