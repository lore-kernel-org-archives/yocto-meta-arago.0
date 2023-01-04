Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CE7C4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:12:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12858.1672841513401683133
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 06:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yS/jUziK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304EBqVt041157
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Jan 2023 08:11:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672841512;
	bh=Svabi91i7xH4G52aATWZhkw5c8tiLWOdYkroGyr2ltw=;
	h=From:To:CC:Subject:Date;
	b=yS/jUziKL5ryw/Kj3xDayTRkuigcCvQTBPkLFPGpWIIHziDyz3NK4+hriud1cMmFH
	 cFLJtKZ2BySYKBO/Csra/ZDqJQZoNK2IpJQembvtD2JDwr8GftNTpG7oVYilRExLqO
	 QPsnxhDtHXPBGqrw4EhA5R+0L3hjeXLrijW4dyzI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304EBq8s073602
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Jan 2023 08:11:52 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 08:11:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 08:11:52 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304EBpFb099655;
	Wed, 4 Jan 2023 08:11:51 -0600
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <j-choudhary@ti.com>
Subject: [meta-arago][master/dunfell][PATCH 0/2] Fix module loading udev rules
Date: Wed, 4 Jan 2023 19:41:48 +0530
Message-ID: <20230104141150.186773-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 14:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14147

These 2 patches tries to fix the issue of udev rule failing to load modules
when modules are inbuilt in kernel due to which journalctl logs are filled
with useless log(nearly 100) Instead of usign modprobe, we use the inbuilt 
command kmod which fixes the issue as shown in the logs provided below.

EVM used for testing: j7200-evm

Log: <https://gist.github.com/Jayesh2000/9e85819b4a56e3d23308a7c0d886a7fb>

The first run tries the replicate the issue and after editing the udev
local rules, we reboot the evm and see clean journalctl logs in the second
run.

Jayesh Choudhary (2):
  systemd: fix the local rule to load modules when new hardware is added
  udev: fix the local rule to load modules when new hardware is added

 meta-arago-distro/recipes-core/systemd/systemd/local.rules | 2 +-
 meta-arago-distro/recipes-core/udev/eudev/local.rules      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1


