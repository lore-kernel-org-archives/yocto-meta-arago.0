Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47782C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 20:45:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4487.1722026721245162699
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 13:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mHjkmEui;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjJli039349;
	Fri, 26 Jul 2024 15:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722026719;
	bh=op2mWCaA1jLP4eTjYn7LzOmdKxvEHKJPccdHPg/os9A=;
	h=From:To:Subject:Date;
	b=mHjkmEuinztuOjoIVwuHi+0+OQo3KDRB83MRvtnRa2WKctAuJQ3GSBdZ1W7+3QkUY
	 Srpwzz1U3ugnN51L6XmKCpk+GGFBKWrRVGJIrRCvKY2cHXlf00umBN4kjLJy89ylCz
	 VMyIDqH6wzxWLg5zBbZAepkpL+0IPTBk6ysZv56o=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46QKjJ7J015083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 15:45:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 15:45:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 15:45:19 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjJPq009835;
	Fri, 26 Jul 2024 15:45:19 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sXRoU-0002Kl-SD; Fri, 26 Jul 2024 15:45:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 0/2] Disable buildpaths check
Date: Fri, 26 Jul 2024 15:45:16 -0500
Message-ID: <20240726204518.8929-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 26 Jul 2024 20:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15471

We have a few problematic packages that will need more time to address
the buildpaths check.  In the meantime, disable the check for these
packages so that we can continue to make software releases and keep the
rest of the recipes up to date.

Ryan Eatmon (2):
  clocl: Disable buildpaths check
  gcc-cross-canadian: Disable buildpaths check

 .../recipes-devtools/gcc/gcc-cross-canadian_%.bbappend    | 4 ++++
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb             | 8 ++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend

-- 
2.17.1


