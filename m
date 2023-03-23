Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809AAC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 13:50:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.72699.1679579428972262308
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Mar 2023 06:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=B03vtBJ1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32NDoRMi094060;
	Thu, 23 Mar 2023 08:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679579427;
	bh=H3SdPGNXPIEvCXyBX6/NjfAVsac63NQrsN7/5ekCemE=;
	h=From:To:CC:Subject:Date;
	b=B03vtBJ1kU1JAdrwRZ2BYFyg0tUQH9eKZXwp5W5vtZknmS3jx4Ayydnafe4ymYC8K
	 USk8PtQMsK5bi7VwsL4LdQ/gdblAkXMcXlfzQieeIqIYibrCX9zv9QpCkP0Jej5Mqa
	 5AH4jH07mfvbfZ/2EbeuObNGgvpRfHgNDQKclkNQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32NDoR76089834
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Mar 2023 08:50:27 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Mar 2023 08:50:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Mar 2023 08:50:26 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32NDoQ8X093298;
	Thu, 23 Mar 2023 08:50:26 -0500
From: Nishanth Menon <nm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>,
        Nishanth
 Menon <nm@ti.com>
Subject: [oe-layersetup][master][PATCH V2 0/2] Stop using git:// urls
Date: Thu, 23 Mar 2023 08:50:24 -0500
Message-ID: <20230323135026.1842186-1-nm@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Mar 2023 13:50:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14276

Hi,

We did this in meta-ti and meta-arago but didn't propagate back into
oe-layersetup yet so I'll give it a go. git:// is no longer functional
proxies over on latest git versions (example: poky crops container for
ubuntu 22.04[1]), also git:// is highly susceptible to man-in-the-middle
attacks[2]. Dump git:// in favor of https.

So, things are broken atm, and yes, https:// implies certificates being
correct etc, but that is entirely the point.

[1] https://hub.docker.com/r/crops/poky/tags 22.04
[2] https://github.blog/2021-09-01-improving-git-protocol-security-github/

Changes since v1:
* Update with a new patch to fixup the gitconfig
* Update commit message in patch 2 to answer review comments of v1

V1: https://lore.kernel.org/yocto-meta-arago/20230309190858.395668-1-rs@ti.com/
Nishanth Menon (1):
  sample-files: gitconfig.sample: Stop using git:// urls

Randolph Sapp (1):
  configs: Stop using git:// urls

 configs/arago-dunfell-config.txt        | 16 ++++++++--------
 configs/arago-dunfell-next-config.txt   | 16 ++++++++--------
 configs/arago-dunfell-wip-config.txt    | 16 ++++++++--------
 configs/arago-kirkstone-config.txt      | 14 +++++++-------
 configs/arago-kirkstone-next-config.txt | 14 +++++++-------
 configs/arago-kirkstone-wip-config.txt  | 14 +++++++-------
 configs/arago-master-config.txt         | 14 +++++++-------
 configs/arago-master-wip-config.txt     | 14 +++++++-------
 configs/distroless-dunfell-config.txt   |  8 ++++----
 configs/distroless-kirkstone-config.txt |  8 ++++----
 configs/distroless-master-config.txt    |  8 ++++----
 configs/poky-dunfell-config.txt         |  8 ++++----
 configs/poky-kirkstone-config.txt       | 12 ++++++------
 configs/poky-master-config.txt          | 12 ++++++------
 configs/poky-master-wip-config.txt      | 12 ++++++------
 sample-files/gitconfig.sample           |  9 ++++++---
 16 files changed, 99 insertions(+), 96 deletions(-)

-- 
2.40.0


