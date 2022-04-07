Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A8FC47089
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.6312.1649337072330265226
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 06:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qakaM5rt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 237DB9jb121534;
	Thu, 7 Apr 2022 08:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649337069;
	bh=vkB4pvi+wwjI1LYAJpnprWXZisInQUt0GJJp8cOJjT0=;
	h=From:To:Subject:Date;
	b=qakaM5rtqeuZpJQaxfKJEveDMw+p/WVS/oKggQPSmC34qwdeG2vpm3QjjX2NC/03J
	 YumUH955GH+rPcnM5okJUPKo5mFm5F5AxBNoYi7uXjCh6ODV3cQriYbbvdWetdRapd
	 x80r0Q6cATuJTguJwu1/eJVCM6a2a5ICoH8C0VBo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 237DB9io023192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Apr 2022 08:11:09 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Apr 2022 08:11:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Apr 2022 08:11:09 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 237DB9bW009949;
	Thu, 7 Apr 2022 08:11:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ncRun-0001xW-9G; Thu, 07 Apr 2022 08:11:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH v4 0/2] add initial support for am62xx
Date: Thu, 7 Apr 2022 08:11:07 -0500
Message-ID: <20220407131109.7488-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13774

These patches add initial recipe support for am62xx.

Krunal Bhargav (1):
  packagegroup-*-graphics: add virtual provider for AM62x GPU driver v2

Nishanth Menon (1):
  meta-arago-distro: add initial support for am62xx

--
v4 - Further cleanup from testing in prep for initial support.
v3 - Cleaned up commit messages to be more descriptive.
v2 - Changes based on feedback from mailing list:
    - Made additional changes for am62xx in the packagegroups and
      ti-tisdk-makefile files.
    - Changed the variable settings for the graphics to explicitly
      call out the am62xx.

 meta-arago-distro/conf/distro/include/arago-prefs.inc      | 7 +++++++
 .../packagegroups/packagegroup-arago-tisdk-addons.bb       | 1 +
 .../ti-tisdk-makefile/Makefile_sysfw-image                 | 1 +
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb             | 1 +
 4 files changed, 10 insertions(+)

-- 
2.17.1


