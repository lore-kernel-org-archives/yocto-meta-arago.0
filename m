Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9F3E6781F
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 05:41:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.31133.1731562877404266320
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 21:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=luYFKiWe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-shenai@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AE5fGSx029638
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 23:41:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731562876;
	bh=0JGcJDnKhtsM+3+L6JoSOry7SyTwsSqL0N5exzeNjXg=;
	h=From:To:CC:Subject:Date;
	b=luYFKiWee+3gs5mQwKOJ1NufkJAqCAVO+fSxi/nuIEXk81GkRqmW0MHbPb4aO2DsF
	 /DRP5zhn09n9NF7ImbqJCVJtAraYet+lJ1Q33RUxBTZg+TjdxbYpmhOuiPY6nNe6Xw
	 im3IVA1sWEMZfts5IRTQKECXudO6piY2rzng6G/U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AE5fGA3010935
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 23:41:16 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 23:41:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 23:41:16 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AE5fDGM044998;
	Wed, 13 Nov 2024 23:41:14 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <kamlesh@ti.com>
Subject: [oe-layersetup][master][PATCH v1 0/1] Downloading SELinux for TISDK
Date: Thu, 14 Nov 2024 11:10:59 +0530
Message-ID: <20241114054100.2945239-1-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Nov 2024 05:41:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15608

This patch enables the meta-selinux layer to come into the layers of current builds.
SELinux allows for access control needed for runtime security.

Aashvij Shenai (1):
  oe-layersetup: Bringing meta-selinux into Yocto builds

 configs/arago-scarthgap-config.txt      | 1 +
 configs/arago-scarthgap-next-config.txt | 1 +
 configs/arago-scarthgap-wip-config.txt  | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1


