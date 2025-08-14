Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E32CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 23:30:26 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.263.1755214222599314175
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Aug 2025 16:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LfuyScOD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57ENUJwM2405010;
	Thu, 14 Aug 2025 18:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755214219;
	bh=zWXF07KiAuIOR1/L+tAo3m6KEuYxzH7IipwgGp48LpU=;
	h=From:To:CC:Subject:Date;
	b=LfuyScODIdnNnNRm7bLWwetCYYsrFHMqa73CJdAxA+Wzn8+vg+idLKZL0TuTk3mNf
	 i3kpAuYazWIsQ5my8Q+AN/+cLYAeA9WoJ3GdqJ3ImpUdSneomyYkCtKVnwqn7iNFvV
	 r71D2ZzCLRbHd6+T9N/tFND49k+3QI50YVPDpTTo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57ENUJgN1182048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 18:30:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 18:30:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 18:30:19 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57ENUInb458115;
	Thu, 14 Aug 2025 18:30:18 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>, <nm@ti.com>
Subject: [oe-layersetup][PATCH 0/2] kas: pull bitbake repository during setup
Date: Thu, 14 Aug 2025 18:29:53 -0500
Message-ID: <20250814232955.1559040-1-rs@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Aug 2025 23:30:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16472

From: Randolph Sapp <rs@ti.com>

Back in April I got some questions regarding kas build issues. At the time I
noticed we weren't incorporating the bitbake repo correctly and explained how to
work around it. That never made it's way upstream. This should address that
issue by actually fetching the specified version of the bitbake repo as part of
the setup.

Randolph Sapp (2):
  kas: fetch bitbake as part of the setup
  kas: regenerate all configs to include bitbake

 kas/arago-kirkstone-chromium-config.yml       |  6 +++++
 kas/arago-kirkstone-config.yml                |  6 +++++
 kas/arago-kirkstone-next-config.yml           |  6 +++++
 kas/arago-kirkstone-wip-config.yml            |  6 +++++
 kas/arago-master-chromium-config.yml          |  6 +++++
 kas/arago-master-config.yml                   |  6 +++++
 kas/arago-master-next-config.yml              |  6 +++++
 kas/arago-master-selinux-config.yml           |  6 +++++
 kas/arago-master-wip-config.yml               |  6 +++++
 kas/arago-scarthgap-10x-config.yml            |  6 +++++
 kas/arago-scarthgap-10x-next-config.yml       |  6 +++++
 kas/arago-scarthgap-chromium-config.yml       |  6 +++++
 kas/arago-scarthgap-config.yml                |  6 +++++
 kas/arago-scarthgap-next-config.yml           |  6 +++++
 kas/arago-scarthgap-selinux-config.yml        |  6 +++++
 kas/arago-scarthgap-wip-config.yml            |  6 +++++
 kas/coresdk/coresdk-09.00.00.006-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.00.00.007-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.00.00.011-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.01.00.001-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.01.00.003-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.01.00.007-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.01.00.008-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.02.00.008-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.02.00.009-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.02.00.010-config.yml   |  7 +++++
 kas/coresdk/coresdk-09.03.05-config.yml       |  7 +++++
 kas/coresdk/coresdk-10.00.07-config.yml       |  7 +++++
 kas/coresdk/coresdk-10.01.08-config.yml       |  7 +++++
 kas/coresdk/coresdk-10.01.10-config.yml       |  7 +++++
 .../coresdk-10.01.10-selinux-config.yml       |  7 +++++
 kas/coresdk/coresdk-11.00.09-config.yml       |  7 +++++
 kas/coresdk/coresdk-11.00.15-config.yml       |  7 +++++
 kas/coresdk/coresdk-11.01.05-config.yml       |  7 +++++
 kas/distroless-kirkstone-config.yml           |  6 +++++
 kas/distroless-master-config.yml              |  6 +++++
 kas/distroless-scarthgap-config.yml           |  6 +++++
 kas/poky-kirkstone-config.yml                 |  6 +++++
 kas/poky-master-config.yml                    |  6 +++++
 kas/poky-master-wip-config.yml                |  6 +++++
 kas/poky-scarthgap-config.yml                 |  6 +++++
 kas/poky-scarthgap-wip-config.yml             |  6 +++++
 ...rocessor-sdk-analytics-09.00.00-config.yml |  7 +++++
 ...rocessor-sdk-analytics-09.00.01-config.yml |  7 +++++
 ...rocessor-sdk-analytics-09.01.00-config.yml |  7 +++++
 ...rocessor-sdk-analytics-09.02.00-config.yml |  7 +++++
 ...rocessor-sdk-analytics-10.00.00-config.yml |  7 +++++
 ...rocessor-sdk-analytics-10.01.00-config.yml |  7 +++++
 ...rocessor-sdk-analytics-11.00.00-config.yml |  7 +++++
 ...essor-sdk-analytics-11.01.07.05-config.yml |  7 +++++
 ...k-analytics-selinux-11.01.07.05-config.yml |  7 +++++
 .../processor-sdk-gateway-10_00.yml           |  7 +++++
 .../processor-sdk-linux-09_00_00_06.yml       |  7 +++++
 .../processor-sdk-linux-09_00_00_07.yml       |  7 +++++
 .../processor-sdk-linux-09_01_00_06.yml       |  7 +++++
 .../processor-sdk-linux-09_01_00_07.yml       |  7 +++++
 .../processor-sdk-linux-09_02_00_04.yml       |  7 +++++
 .../processor-sdk-linux-09_02_00_05.yml       |  7 +++++
 .../processor-sdk-linux-09_03_06_05.yml       |  7 +++++
 .../processor-sdk-linux-10_00_07_06.yml       |  7 +++++
 .../processor-sdk-linux-10_00_08_06.yml       |  7 +++++
 .../processor-sdk-linux-10_01_08_01.yml       |  7 +++++
 ...rocessor-sdk-09.00.00-am62xxsip-config.yml |  7 +++++
 .../processor-sdk-09.00.00-config.yml         |  7 +++++
 .../processor-sdk-09.01.00-am65xx-config.yml  |  7 +++++
 .../processor-sdk-09.01.00-config.yml         |  7 +++++
 .../processor-sdk-09.01.00-legacy-config.yml  |  7 +++++
 ...processor-sdk-09.02.00.08-am64x-config.yml |  7 +++++
 ...rocessor-sdk-09.03.05.02-legacy-config.yml |  7 +++++
 ...ocessor-sdk-11.00.05.02-am62lxx-config.yml |  7 +++++
 ...ocessor-sdk-11.00.15.05-am62lxx-config.yml |  7 +++++
 ...essor-sdk-kirkstone-09.02.01.09-config.yml |  7 +++++
 ...essor-sdk-kirkstone-09.02.01.10-config.yml |  7 +++++
 ...-kirkstone-chromium-09.02.01.09-config.yml |  7 +++++
 ...-kirkstone-chromium-09.02.01.10-config.yml |  7 +++++
 ...essor-sdk-scarthgap-10.00.07.04-config.yml |  7 +++++
 ...essor-sdk-scarthgap-10.01.10.04-config.yml |  7 +++++
 ...essor-sdk-scarthgap-11.00.09.04-config.yml |  7 +++++
 ...essor-sdk-scarthgap-11.01.05.03-config.yml |  7 +++++
 ...-scarthgap-chromium-10.00.07.04-config.yml |  7 +++++
 ...-scarthgap-chromium-10.01.10.04-config.yml |  7 +++++
 ...-scarthgap-chromium-11.00.09.04-config.yml |  7 +++++
 ...-scarthgap-chromium-11.01.05.03-config.yml |  7 +++++
 ...sdk-scarthgap-nonqt-11.01.05.03-config.yml |  7 +++++
 ...k-scarthgap-selinux-11.00.09.04-config.yml |  7 +++++
 ...k-scarthgap-selinux-11.01.05.03-config.yml |  7 +++++
 src/xslt/kas.xslt                             | 26 ++++++++++++++++---
 87 files changed, 601 insertions(+), 3 deletions(-)

-- 
2.50.1


