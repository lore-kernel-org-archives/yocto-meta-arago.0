Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F854CA0EE6
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 00:36:49 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.25576.1755304603501235931
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 17:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f5Etcd5r;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57G0aegt2260725;
	Fri, 15 Aug 2025 19:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755304600;
	bh=z+t7v9+uwq5De0+sPjJ+A2I4+AO4Y0oP8660bOXaxB8=;
	h=From:To:CC:Subject:Date;
	b=f5Etcd5ra2t3L3ZyhcQQNuoBEYPeQLzZyt6/kUESliSsaRmOiIe9dO3ELz8mj176Q
	 HzdTcGABouKkWmWm26Zzolhly3z6T7956RapMA57SAp7aDK72LBsZQIXHXc3l/L90G
	 v+XPJnXV8LaL9vniijA7YN05ksDLrXqSfX7PVQOQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57G0aeBS1986707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 19:36:40 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 19:36:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 19:36:39 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57G0aduq1743917;
	Fri, 15 Aug 2025 19:36:39 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <jcormier@criticallink.com>
Subject: [oe-layersetup][PATCH 0/5] kas: yamllint cleanup effort
Date: Fri, 15 Aug 2025 19:36:15 -0500
Message-ID: <20250816003620.2112669-1-rs@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 16 Aug 2025 00:36:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16484

From: Randolph Sapp <rs@ti.com>

An attempt to satisfy yamllint with our templates. Actually caught a bug when
running it over the current output.

There is one check I am currently ignoring. That's line-length. By default they
prefer files do not exceed a line-length of 80. Ordinarily that's fine, but here
there are large template files with their own formatting that cannot be
word-wrapped easily.

Randolph Sapp (5):
  kas: yamllint: documents should have an explicit start
  kas: yamllint: trailing whitespace
  kas: yamllint: too many blank lines
  kas: do not add a default target if one is not given
  kas: regenerate all configs to include yamllint fixes

 kas/arago-kirkstone-chromium-config.yml       |  2 +-
 kas/arago-kirkstone-config.yml                |  2 +-
 kas/arago-kirkstone-next-config.yml           |  1 +
 kas/arago-kirkstone-wip-config.yml            |  2 +-
 kas/arago-master-chromium-config.yml          |  2 +-
 kas/arago-master-config.yml                   |  2 +-
 kas/arago-master-next-config.yml              |  1 +
 kas/arago-master-selinux-config.yml           |  1 +
 kas/arago-master-wip-config.yml               |  2 +-
 kas/arago-scarthgap-10x-config.yml            |  1 +
 kas/arago-scarthgap-10x-next-config.yml       |  1 +
 kas/arago-scarthgap-chromium-config.yml       |  2 +-
 kas/arago-scarthgap-config.yml                |  2 +-
 kas/arago-scarthgap-flutter-config.yml        |  1 +
 kas/arago-scarthgap-next-config.yml           |  1 +
 kas/arago-scarthgap-selinux-config.yml        |  1 +
 kas/arago-scarthgap-wip-config.yml            |  2 +-
 kas/coresdk/coresdk-09.00.00.006-config.yml   |  2 +-
 kas/coresdk/coresdk-09.00.00.007-config.yml   |  2 +-
 kas/coresdk/coresdk-09.00.00.011-config.yml   |  2 +-
 kas/coresdk/coresdk-09.01.00.001-config.yml   |  2 +-
 kas/coresdk/coresdk-09.01.00.003-config.yml   |  2 +-
 kas/coresdk/coresdk-09.01.00.007-config.yml   |  2 +-
 kas/coresdk/coresdk-09.01.00.008-config.yml   |  2 +-
 kas/coresdk/coresdk-09.02.00.008-config.yml   |  2 +-
 kas/coresdk/coresdk-09.02.00.009-config.yml   |  2 +-
 kas/coresdk/coresdk-09.02.00.010-config.yml   |  2 +-
 kas/coresdk/coresdk-09.03.05-config.yml       |  2 +-
 kas/coresdk/coresdk-10.00.07-config.yml       |  2 +-
 kas/coresdk/coresdk-10.01.08-config.yml       |  2 +-
 kas/coresdk/coresdk-10.01.10-config.yml       |  2 +-
 .../coresdk-10.01.10-selinux-config.yml       |  1 +
 kas/coresdk/coresdk-11.00.09-config.yml       |  2 +-
 kas/coresdk/coresdk-11.00.15-config.yml       |  2 +-
 kas/coresdk/coresdk-11.01.05-config.yml       |  2 +-
 kas/distroless-kirkstone-config.yml           |  4 +-
 kas/distroless-master-config.yml              |  4 +-
 kas/distroless-scarthgap-config.yml           |  4 +-
 kas/poky-kirkstone-config.yml                 |  2 +-
 kas/poky-master-config.yml                    |  2 +-
 kas/poky-master-wip-config.yml                |  2 +-
 kas/poky-scarthgap-config.yml                 |  2 +-
 kas/poky-scarthgap-wip-config.yml             |  2 +-
 ...rocessor-sdk-analytics-09.00.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-09.00.01-config.yml |  2 +-
 ...rocessor-sdk-analytics-09.01.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-09.02.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-10.00.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-10.01.00-config.yml |  2 +-
 ...rocessor-sdk-analytics-11.00.00-config.yml |  2 +-
 ...essor-sdk-analytics-11.01.07.05-config.yml |  2 +-
 ...k-analytics-selinux-11.01.07.05-config.yml |  1 +
 .../processor-sdk-gateway-10_00.yml           |  1 +
 .../processor-sdk-linux-09_00_00_06.yml       |  1 +
 .../processor-sdk-linux-09_00_00_07.yml       |  1 +
 .../processor-sdk-linux-09_01_00_06.yml       |  1 +
 .../processor-sdk-linux-09_01_00_07.yml       |  1 +
 .../processor-sdk-linux-09_02_00_04.yml       |  1 +
 .../processor-sdk-linux-09_02_00_05.yml       |  1 +
 .../processor-sdk-linux-09_03_06_05.yml       |  2 +-
 .../processor-sdk-linux-10_00_07_06.yml       |  1 +
 .../processor-sdk-linux-10_00_08_06.yml       |  1 +
 .../processor-sdk-linux-10_01_08_01.yml       |  1 +
 ...rocessor-sdk-09.00.00-am62xxsip-config.yml |  2 +-
 .../processor-sdk-09.00.00-config.yml         |  2 +-
 .../processor-sdk-09.01.00-am65xx-config.yml  |  2 +-
 .../processor-sdk-09.01.00-config.yml         |  2 +-
 .../processor-sdk-09.01.00-legacy-config.yml  |  2 +-
 ...processor-sdk-09.02.00.08-am64x-config.yml |  2 +-
 ...rocessor-sdk-09.03.05.02-legacy-config.yml |  2 +-
 ...ocessor-sdk-11.00.05.02-am62lxx-config.yml |  2 +-
 ...ocessor-sdk-11.00.15.05-am62lxx-config.yml |  2 +-
 ...essor-sdk-kirkstone-09.02.01.09-config.yml |  2 +-
 ...essor-sdk-kirkstone-09.02.01.10-config.yml |  2 +-
 ...-kirkstone-chromium-09.02.01.09-config.yml |  2 +-
 ...-kirkstone-chromium-09.02.01.10-config.yml |  2 +-
 ...essor-sdk-scarthgap-10.00.07.04-config.yml |  2 +-
 ...essor-sdk-scarthgap-10.01.10.04-config.yml |  2 +-
 ...essor-sdk-scarthgap-11.00.09.04-config.yml |  2 +-
 ...essor-sdk-scarthgap-11.01.05.03-config.yml |  2 +-
 ...-scarthgap-chromium-10.00.07.04-config.yml |  2 +-
 ...-scarthgap-chromium-10.01.10.04-config.yml |  2 +-
 ...-scarthgap-chromium-11.00.09.04-config.yml |  2 +-
 ...-scarthgap-chromium-11.01.05.03-config.yml |  2 +-
 ...sdk-scarthgap-nonqt-11.01.05.03-config.yml |  2 +-
 ...k-scarthgap-selinux-11.00.09.04-config.yml |  1 +
 ...k-scarthgap-selinux-11.01.05.03-config.yml |  1 +
 kas/templates/bblayers.conf.yml               |  6 +--
 kas/templates/local-arago64-v2.conf.yml       | 44 +++++++++----------
 kas/templates/local-arago64-v3.conf.yml       | 44 +++++++++----------
 kas/templates/local-poky-v2.conf.yml          | 42 +++++++++---------
 kas/templates/local-poky-v3.conf.yml          | 42 +++++++++---------
 kas/templates/local-v2.conf.yml               | 36 +++++++--------
 kas/templates/local-v3.conf.yml               | 36 +++++++--------
 src/xslt/kas-templates.xslt                   | 21 ++++++---
 src/xslt/kas.xslt                             | 25 ++++++-----
 96 files changed, 240 insertions(+), 214 deletions(-)

-- 
2.50.1


