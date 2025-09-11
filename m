Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71664CAC597
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:35:13 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.2133.1757608509313830573
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 09:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AzZh5RMA;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BGZ7Vo333916;
	Thu, 11 Sep 2025 11:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757608507;
	bh=HHsiQYze2EcU5xGHM6zjW8xPUhp0hbzn405v7vLYmW8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AzZh5RMAWen9nJeahcuvTyXDuBmEPySzA6v1lTEBwus2oy35/9GKAX74I2IjwvCbf
	 N8vu+wOY1LwKKQ6XLQe6pCd+1s/ZILXE/BrNwiGf5qkUvk3m52TxOhrjj8vMs4sBDi
	 +1bAEc5iwMZee/+Wxr7JQ8+gvAse/j7zCM3IUDjE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BGZ7VN2073423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 11:35:07 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 11:35:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 11:35:06 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BGZ6kY2120971;
	Thu, 11 Sep 2025 11:35:06 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uwkGI-0005KN-OD; Thu, 11 Sep 2025 11:35:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 4/5] bitbake-setup: Generate new files
Date: Thu, 11 Sep 2025 11:35:05 -0500
Message-ID: <20250911163506.20414-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250911163506.20414-1-reatmon@ti.com>
References: <20250911163506.20414-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 16:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16563

Regenerate all of the bitbake-setup files to the new standard.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arago-kirkstone-chromium-config.json      |  49 +++++-
 bitbake-setup/arago-kirkstone-config.json     |  49 +++++-
 .../arago-kirkstone-next-config.json          |  49 +++++-
 bitbake-setup/arago-kirkstone-wip-config.json |  49 +++++-
 .../arago-master-chromium-config.json         |  49 +++++-
 bitbake-setup/arago-master-config.json        |  49 +++++-
 .../arago-master-flutter-config.json          |  49 +++++-
 bitbake-setup/arago-master-next-config.json   |  49 +++++-
 .../arago-master-selinux-config.json          |  49 +++++-
 bitbake-setup/arago-master-wip-config.json    |  49 +++++-
 bitbake-setup/arago-scarthgap-10x-config.json |  49 +++++-
 .../arago-scarthgap-10x-next-config.json      |  49 +++++-
 .../arago-scarthgap-chromium-config.json      |  49 +++++-
 bitbake-setup/arago-scarthgap-config.json     |  49 +++++-
 .../arago-scarthgap-flutter-config.json       |  49 +++++-
 .../arago-scarthgap-next-config.json          |  49 +++++-
 .../arago-scarthgap-selinux-config.json       |  49 +++++-
 bitbake-setup/arago-scarthgap-wip-config.json |  49 +++++-
 .../coresdk-09.00.00.006-config.json}         |  49 +++++-
 .../coresdk-09.00.00.007-config.json}         |  49 +++++-
 .../coresdk-09.00.00.011-config.json}         |  49 +++++-
 .../coresdk/coresdk-09.01.00.001-config.json  | 149 ++++++++++++++++++
 .../coresdk/coresdk-09.01.00.003-config.json  | 149 ++++++++++++++++++
 .../coresdk/coresdk-09.01.00.007-config.json  | 149 ++++++++++++++++++
 .../coresdk/coresdk-09.01.00.008-config.json  | 149 ++++++++++++++++++
 .../coresdk-09.02.00.008-config.json}         |  49 +++++-
 .../coresdk-09.02.00.009-config.json}         |  49 +++++-
 .../coresdk-09.02.00.010-config.json}         |  49 +++++-
 .../coresdk-09.03.05-config.json}             |  49 +++++-
 .../coresdk-10.00.07-config.json}             |  49 +++++-
 .../coresdk-10.01.08-config.json}             |  49 +++++-
 .../coresdk-10.01.10-config.json}             |  49 +++++-
 .../coresdk-10.01.10-selinux-config.json}     |  49 +++++-
 .../coresdk-11.00.09-config.json}             |  49 +++++-
 .../coresdk-11.00.15-config.json}             |  49 +++++-
 .../coresdk-11.01.05-config.json}             |  49 +++++-
 .../coresdk-11.01.08-config.json}             |  49 +++++-
 .../distroless-kirkstone-config.json          |  49 +++++-
 bitbake-setup/distroless-master-config.json   |  49 +++++-
 .../distroless-scarthgap-config.json          |  49 +++++-
 bitbake-setup/poky-kirkstone-config.json      |  49 +++++-
 bitbake-setup/poky-master-config.json         |  49 +++++-
 bitbake-setup/poky-master-wip-config.json     |  49 +++++-
 bitbake-setup/poky-scarthgap-config.json      |  49 +++++-
 bitbake-setup/poky-scarthgap-wip-config.json  |  49 +++++-
 ...cessor-sdk-analytics-09.00.00-config.json} |  49 +++++-
 ...cessor-sdk-analytics-09.00.01-config.json} |  49 +++++-
 ...cessor-sdk-analytics-09.01.00-config.json} |  49 +++++-
 ...cessor-sdk-analytics-09.02.00-config.json} |  49 +++++-
 ...cessor-sdk-analytics-10.00.00-config.json} |  49 +++++-
 ...cessor-sdk-analytics-10.01.00-config.json} |  49 +++++-
 ...cessor-sdk-analytics-11.00.00-config.json} |  49 +++++-
 ...sor-sdk-analytics-11.01.07.05-config.json} |  49 +++++-
 ...analytics-selinux-11.01.07.05-config.json} |  49 +++++-
 .../processor-sdk-gateway-10_00.json}         |  49 +++++-
 .../processor-sdk-linux-09_00_00_06.json}     |  49 +++++-
 .../processor-sdk-linux-09_00_00_07.json}     |  49 +++++-
 .../processor-sdk-linux-09_01_00_06.json}     |  49 +++++-
 .../processor-sdk-linux-09_01_00_07.json}     |  49 +++++-
 .../processor-sdk-linux-09_02_00_04.json}     |  49 +++++-
 .../processor-sdk-linux-09_02_00_05.json}     |  49 +++++-
 .../processor-sdk-linux-09_03_06_05.json}     |  49 +++++-
 .../processor-sdk-linux-10_00_07_06.json}     |  49 +++++-
 .../processor-sdk-linux-10_00_08_06.json}     |  49 +++++-
 .../processor-sdk-linux-10_01_08_01.json}     |  49 +++++-
 .../processor-sdk-linux-11_00_10_01.json}     |  49 +++++-
 ...cessor-sdk-09.00.00-am62xxsip-config.json} |  49 +++++-
 .../processor-sdk-09.00.00-config.json}       |  49 +++++-
 ...processor-sdk-09.01.00-am65xx-config.json} |  49 +++++-
 .../processor-sdk-09.01.00-config.json}       |  49 +++++-
 ...processor-sdk-09.01.00-legacy-config.json} |  49 +++++-
 ...ocessor-sdk-09.02.00.08-am64x-config.json} |  49 +++++-
 ...cessor-sdk-09.03.05.02-legacy-config.json} |  49 +++++-
 ...essor-sdk-11.00.05.02-am62lxx-config.json} |  49 +++++-
 ...essor-sdk-11.00.15.05-am62lxx-config.json} |  49 +++++-
 ...sor-sdk-kirkstone-09.02.01.09-config.json} |  49 +++++-
 ...sor-sdk-kirkstone-09.02.01.10-config.json} |  49 +++++-
 ...irkstone-chromium-09.02.01.09-config.json} |  49 +++++-
 ...irkstone-chromium-09.02.01.10-config.json} |  49 +++++-
 ...sor-sdk-scarthgap-10.00.07.04-config.json} |  49 +++++-
 ...sor-sdk-scarthgap-10.01.10.04-config.json} |  49 +++++-
 ...sor-sdk-scarthgap-11.00.09.04-config.json} |  49 +++++-
 ...sor-sdk-scarthgap-11.01.05.03-config.json} |  49 +++++-
 ...carthgap-chromium-10.00.07.04-config.json} |  49 +++++-
 ...carthgap-chromium-10.01.10.04-config.json} |  49 +++++-
 ...carthgap-chromium-11.00.09.04-config.json} |  49 +++++-
 ...carthgap-chromium-11.01.05.03-config.json} |  49 +++++-
 ...carthgap-chromium-11.01.12.10-config.json} |  49 +++++-
 ...k-scarthgap-nonqt-11.01.05.03-config.json} |  49 +++++-
 ...scarthgap-selinux-11.00.09.04-config.json} |  49 +++++-
 ...scarthgap-selinux-11.01.05.03-config.json} |  49 +++++-
 .../configs/arago-kirkstone-next-config.conf  |   9 ++
 .../configs/arago-master-next-config.conf     |   4 +
 .../configs/arago-master-selinux-config.conf  |   4 +
 .../configs/arago-scarthgap-10x-config.conf   |   4 +
 .../arago-scarthgap-10x-next-config.conf      |   8 +
 .../configs/arago-scarthgap-next-config.conf  |  25 +++
 .../arago-scarthgap-selinux-config.conf       |   4 +
 .../coresdk-10.01.10-selinux-config.conf      |   4 +
 ...-analytics-selinux-11.01.07.05-config.conf |   4 +
 .../processor-sdk-gateway-10_00.conf          |   4 +
 .../processor-sdk-linux-09_00_00_06.conf      |   5 +
 .../processor-sdk-linux-09_00_00_07.conf      |   4 +
 .../processor-sdk-linux-09_01_00_06.conf      |   5 +
 .../processor-sdk-linux-09_01_00_07.conf      |   4 +
 .../processor-sdk-linux-09_02_00_04.conf      |   5 +
 .../processor-sdk-linux-09_02_00_05.conf      |   5 +
 .../processor-sdk-linux-10_00_07_06.conf      |   5 +
 .../processor-sdk-linux-10_00_08_06.conf      |   5 +
 .../processor-sdk-linux-10_01_08_01.conf      |   5 +
 ...-scarthgap-selinux-11.00.09.04-config.conf |   4 +
 ...-scarthgap-selinux-11.01.05.03-config.conf |   4 +
 .../localconf/local-arago64-v2.conf}          |   3 +
 .../localconf/local-arago64-v3.conf}          |   3 +
 .../localconf/local-poky-v2.conf}             |   3 +
 .../fragments/localconf/local-poky-v3.conf    |   3 +
 .../localconf/local-v2.conf}                  |   3 +
 .../fragments/localconf/local-v3.conf         |   3 +
 118 files changed, 4389 insertions(+), 609 deletions(-)
 copy bitbake-setup/{coresdk_coresdk-09.00.00.006-config.json => coresdk/coresdk-09.00.00.006-config.json} (50%)
 copy bitbake-setup/{coresdk_coresdk-09.00.00.007-config.json => coresdk/coresdk-09.00.00.007-config.json} (50%)
 copy bitbake-setup/{coresdk_coresdk-09.00.00.011-config.json => coresdk/coresdk-09.00.00.011-config.json} (50%)
 create mode 100644 bitbake-setup/coresdk/coresdk-09.01.00.001-config.json
 create mode 100644 bitbake-setup/coresdk/coresdk-09.01.00.003-config.json
 create mode 100644 bitbake-setup/coresdk/coresdk-09.01.00.007-config.json
 create mode 100644 bitbake-setup/coresdk/coresdk-09.01.00.008-config.json
 copy bitbake-setup/{coresdk_coresdk-09.02.00.008-config.json => coresdk/coresdk-09.02.00.008-config.json} (52%)
 copy bitbake-setup/{coresdk_coresdk-09.02.00.009-config.json => coresdk/coresdk-09.02.00.009-config.json} (52%)
 copy bitbake-setup/{coresdk_coresdk-09.02.00.010-config.json => coresdk/coresdk-09.02.00.010-config.json} (52%)
 copy bitbake-setup/{coresdk_coresdk-09.03.05-config.json => coresdk/coresdk-09.03.05-config.json} (52%)
 copy bitbake-setup/{coresdk_coresdk-10.00.07-config.json => coresdk/coresdk-10.00.07-config.json} (51%)
 copy bitbake-setup/{coresdk_coresdk-10.01.08-config.json => coresdk/coresdk-10.01.08-config.json} (51%)
 copy bitbake-setup/{coresdk_coresdk-10.01.10-config.json => coresdk/coresdk-10.01.10-config.json} (51%)
 copy bitbake-setup/{coresdk_coresdk-10.01.10-selinux-config.json => coresdk/coresdk-10.01.10-selinux-config.json} (53%)
 copy bitbake-setup/{coresdk_coresdk-11.00.09-config.json => coresdk/coresdk-11.00.09-config.json} (51%)
 copy bitbake-setup/{coresdk_coresdk-11.00.15-config.json => coresdk/coresdk-11.00.15-config.json} (51%)
 copy bitbake-setup/{coresdk_coresdk-11.01.05-config.json => coresdk/coresdk-11.01.05-config.json} (54%)
 copy bitbake-setup/{coresdk_coresdk-11.01.08-config.json => coresdk/coresdk-11.01.08-config.json} (54%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json => processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json} (54%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json => processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json} (54%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json => processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json} (54%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json => processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json} (54%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json => processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json} (54%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json => processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json} (56%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-11.00.00-config.json => processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json} (56%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config.json => processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json} (57%)
 copy bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config.json => processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json} (58%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-gateway-10_00.json => processor-sdk-linux/processor-sdk-gateway-10_00.json} (53%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_00_00_06.json => processor-sdk-linux/processor-sdk-linux-09_00_00_06.json} (53%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_00_00_07.json => processor-sdk-linux/processor-sdk-linux-09_00_00_07.json} (53%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_01_00_06.json => processor-sdk-linux/processor-sdk-linux-09_01_00_06.json} (51%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_01_00_07.json => processor-sdk-linux/processor-sdk-linux-09_01_00_07.json} (51%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_02_00_04.json => processor-sdk-linux/processor-sdk-linux-09_02_00_04.json} (55%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_02_00_05.json => processor-sdk-linux/processor-sdk-linux-09_02_00_05.json} (55%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_03_06_05.json => processor-sdk-linux/processor-sdk-linux-09_03_06_05.json} (54%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-10_00_07_06.json => processor-sdk-linux/processor-sdk-linux-10_00_07_06.json} (54%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-10_00_08_06.json => processor-sdk-linux/processor-sdk-linux-10_00_08_06.json} (54%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-10_01_08_01.json => processor-sdk-linux/processor-sdk-linux-10_01_08_01.json} (54%)
 copy bitbake-setup/{processor-sdk-linux_processor-sdk-linux-11_00_10_01.json => processor-sdk-linux/processor-sdk-linux-11_00_10_01.json} (56%)
 copy bitbake-setup/{processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json => processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json} (54%)
 copy bitbake-setup/{processor-sdk_processor-sdk-09.00.00-config.json => processor-sdk/processor-sdk-09.00.00-config.json} (54%)
 copy bitbake-setup/{processor-sdk_processor-sdk-09.01.00-am65xx-config.json => processor-sdk/processor-sdk-09.01.00-am65xx-config.json} (52%)
 copy bitbake-setup/{processor-sdk_processor-sdk-09.01.00-config.json => processor-sdk/processor-sdk-09.01.00-config.json} (54%)
 copy bitbake-setup/{processor-sdk_processor-sdk-09.01.00-legacy-config.json => processor-sdk/processor-sdk-09.01.00-legacy-config.json} (52%)
 copy bitbake-setup/{processor-sdk_processor-sdk-09.02.00.08-am64x-config.json => processor-sdk/processor-sdk-09.02.00.08-am64x-config.json} (54%)
 copy bitbake-setup/{processor-sdk_processor-sdk-09.03.05.02-legacy-config.json => processor-sdk/processor-sdk-09.03.05.02-legacy-config.json} (52%)
 copy bitbake-setup/{processor-sdk_processor-sdk-11.00.05.02-am62lxx-config.json => processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json} (52%)
 copy bitbake-setup/{processor-sdk_processor-sdk-11.00.15.05-am62lxx-config.json => processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json} (51%)
 copy bitbake-setup/{processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json => processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json} (56%)
 copy bitbake-setup/{processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json => processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json} (56%)
 copy bitbake-setup/{processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json => processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json} (58%)
 copy bitbake-setup/{processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json => processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json} (58%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json => processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json} (54%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.json => processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json} (54%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-11.00.09.04-config.json => processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json} (53%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-11.01.05.03-config.json => processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json} (55%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json => processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json} (57%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config.json => processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json} (57%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config.json => processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json} (55%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config.json => processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json} (57%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config.json => processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json} (57%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config.json => processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json} (53%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config.json => processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json} (54%)
 copy bitbake-setup/{processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config.json => processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json} (56%)
 create mode 100644 conf/fragments/localconf/configs/arago-kirkstone-next-config.conf
 create mode 100644 conf/fragments/localconf/configs/arago-master-next-config.conf
 create mode 100644 conf/fragments/localconf/configs/arago-master-selinux-config.conf
 create mode 100644 conf/fragments/localconf/configs/arago-scarthgap-10x-config.conf
 create mode 100644 conf/fragments/localconf/configs/arago-scarthgap-10x-next-config.conf
 create mode 100644 conf/fragments/localconf/configs/arago-scarthgap-next-config.conf
 create mode 100644 conf/fragments/localconf/configs/arago-scarthgap-selinux-config.conf
 create mode 100644 conf/fragments/localconf/configs/coresdk/coresdk-10.01.10-selinux-config.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-gateway-10_00.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.conf
 create mode 100644 conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.conf
 copy conf/{templates/arago-kirkstone-chromium-config/local.conf.sample => fragments/localconf/local-arago64-v2.conf} (97%)
 copy conf/{templates/arago-master-config/local.conf.sample => fragments/localconf/local-arago64-v3.conf} (97%)
 copy conf/{templates/poky-kirkstone-config/local.conf.sample => fragments/localconf/local-poky-v2.conf} (97%)
 copy sample-files/local-poky-v3.conf.sample => conf/fragments/localconf/local-poky-v3.conf (97%)
 copy conf/{templates/distroless-kirkstone-config/local.conf.sample => fragments/localconf/local-v2.conf} (97%)
 copy sample-files/local-v3.conf.sample => conf/fragments/localconf/local-v3.conf (97%)

diff --git a/bitbake-setup/arago-kirkstone-chromium-config.json b/bitbake-setup/arago-kirkstone-chromium-config.json
index 977b95d..3852de9 100644
--- a/bitbake-setup/arago-kirkstone-chromium-config.json
+++ b/bitbake-setup/arago-kirkstone-chromium-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-kirkstone-chromium-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-kirkstone-config.json b/bitbake-setup/arago-kirkstone-config.json
index 4921baf..4eaee6f 100644
--- a/bitbake-setup/arago-kirkstone-config.json
+++ b/bitbake-setup/arago-kirkstone-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-kirkstone-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-kirkstone-next-config.json b/bitbake-setup/arago-kirkstone-next-config.json
index 0865573..159e16d 100644
--- a/bitbake-setup/arago-kirkstone-next-config.json
+++ b/bitbake-setup/arago-kirkstone-next-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-kirkstone-next-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/arago-kirkstone-next-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-kirkstone-wip-config.json b/bitbake-setup/arago-kirkstone-wip-config.json
index 99cca73..a3d73e8 100644
--- a/bitbake-setup/arago-kirkstone-wip-config.json
+++ b/bitbake-setup/arago-kirkstone-wip-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-kirkstone-wip-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-master-chromium-config.json b/bitbake-setup/arago-master-chromium-config.json
index 82d7f1d..8dce603 100644
--- a/bitbake-setup/arago-master-chromium-config.json
+++ b/bitbake-setup/arago-master-chromium-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-master-chromium-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-master-config.json b/bitbake-setup/arago-master-config.json
index 38dc3e6..d804526 100644
--- a/bitbake-setup/arago-master-config.json
+++ b/bitbake-setup/arago-master-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-master-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-master-flutter-config.json b/bitbake-setup/arago-master-flutter-config.json
index 98b9810..624d8b4 100644
--- a/bitbake-setup/arago-master-flutter-config.json
+++ b/bitbake-setup/arago-master-flutter-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-master-flutter-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-flutter/.","meta-flutter/meta-flutter-apps","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-master-next-config.json b/bitbake-setup/arago-master-next-config.json
index d0065e1..9ddca65 100644
--- a/bitbake-setup/arago-master-next-config.json
+++ b/bitbake-setup/arago-master-next-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-master-next-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-layersetup/localconf/configs/arago-master-next-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-master-selinux-config.json b/bitbake-setup/arago-master-selinux-config.json
index 8d5d8b8..7ae5258 100644
--- a/bitbake-setup/arago-master-selinux-config.json
+++ b/bitbake-setup/arago-master-selinux-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-master-selinux-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-layersetup/localconf/configs/arago-master-selinux-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-master-wip-config.json b/bitbake-setup/arago-master-wip-config.json
index cea3704..24140f5 100644
--- a/bitbake-setup/arago-master-wip-config.json
+++ b/bitbake-setup/arago-master-wip-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-master-wip-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-scarthgap-10x-config.json b/bitbake-setup/arago-scarthgap-10x-config.json
index fc9279b..30b355d 100644
--- a/bitbake-setup/arago-scarthgap-10x-config.json
+++ b/bitbake-setup/arago-scarthgap-10x-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-scarthgap-10x-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/arago-scarthgap-10x-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-scarthgap-10x-next-config.json b/bitbake-setup/arago-scarthgap-10x-next-config.json
index f4fe3d8..1415016 100644
--- a/bitbake-setup/arago-scarthgap-10x-next-config.json
+++ b/bitbake-setup/arago-scarthgap-10x-next-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-scarthgap-10x-next-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/arago-scarthgap-10x-next-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-scarthgap-chromium-config.json b/bitbake-setup/arago-scarthgap-chromium-config.json
index 9ba4585..6ef006b 100644
--- a/bitbake-setup/arago-scarthgap-chromium-config.json
+++ b/bitbake-setup/arago-scarthgap-chromium-config.json
@@ -135,13 +135,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-scarthgap-chromium-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-scarthgap-config.json b/bitbake-setup/arago-scarthgap-config.json
index 9e8067b..ec9e116 100644
--- a/bitbake-setup/arago-scarthgap-config.json
+++ b/bitbake-setup/arago-scarthgap-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-scarthgap-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-scarthgap-flutter-config.json b/bitbake-setup/arago-scarthgap-flutter-config.json
index fd31ad6..d79adfc 100644
--- a/bitbake-setup/arago-scarthgap-flutter-config.json
+++ b/bitbake-setup/arago-scarthgap-flutter-config.json
@@ -135,13 +135,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-scarthgap-flutter-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","meta-flutter/.","meta-flutter/meta-flutter-apps","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-scarthgap-next-config.json b/bitbake-setup/arago-scarthgap-next-config.json
index fbee1d2..80a5d54 100644
--- a/bitbake-setup/arago-scarthgap-next-config.json
+++ b/bitbake-setup/arago-scarthgap-next-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-scarthgap-next-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/arago-scarthgap-next-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-scarthgap-selinux-config.json b/bitbake-setup/arago-scarthgap-selinux-config.json
index ac5b4c4..fc37999 100644
--- a/bitbake-setup/arago-scarthgap-selinux-config.json
+++ b/bitbake-setup/arago-scarthgap-selinux-config.json
@@ -135,13 +135,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-scarthgap-selinux-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/arago-scarthgap-selinux-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/arago-scarthgap-wip-config.json b/bitbake-setup/arago-scarthgap-wip-config.json
index 51bb3f1..8c75113 100644
--- a/bitbake-setup/arago-scarthgap-wip-config.json
+++ b/bitbake-setup/arago-scarthgap-wip-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-arago-scarthgap-wip-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-09.00.00.006-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.006-config.json
similarity index 50%
copy from bitbake-setup/coresdk_coresdk-09.00.00.006-config.json
copy to bitbake-setup/coresdk/coresdk-09.00.00.006-config.json
index 4a577ff..042ae70 100644
--- a/bitbake-setup/coresdk_coresdk-09.00.00.006-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.00.00.006-config.json
@@ -102,13 +102,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-09.00.00.006-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-09.00.00.007-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.007-config.json
similarity index 50%
copy from bitbake-setup/coresdk_coresdk-09.00.00.007-config.json
copy to bitbake-setup/coresdk/coresdk-09.00.00.007-config.json
index 4e0637c..44c8e68 100644
--- a/bitbake-setup/coresdk_coresdk-09.00.00.007-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.00.00.007-config.json
@@ -102,13 +102,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-09.00.00.007-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-09.00.00.011-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.011-config.json
similarity index 50%
copy from bitbake-setup/coresdk_coresdk-09.00.00.011-config.json
copy to bitbake-setup/coresdk/coresdk-09.00.00.011-config.json
index ebe82de..6402a9e 100644
--- a/bitbake-setup/coresdk_coresdk-09.00.00.011-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.00.00.011-config.json
@@ -102,13 +102,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-09.00.00.011-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.001-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.001-config.json
new file mode 100644
index 0000000..8e78032
--- /dev/null
+++ b/bitbake-setup/coresdk/coresdk-09.01.00.001-config.json
@@ -0,0 +1,149 @@
+{
+  "version": "1.0",
+  "description": "TI CoreSDK v09.01.00.001",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.0"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt5": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/meta-qt5/meta-qt5.git"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-qt5"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.003-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.003-config.json
new file mode 100644
index 0000000..064138b
--- /dev/null
+++ b/bitbake-setup/coresdk/coresdk-09.01.00.003-config.json
@@ -0,0 +1,149 @@
+{
+  "version": "1.0",
+  "description": "TI CoreSDK v09.01.00.003",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.0"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt5": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/meta-qt5/meta-qt5.git"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-qt5"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.007-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.007-config.json
new file mode 100644
index 0000000..345356c
--- /dev/null
+++ b/bitbake-setup/coresdk/coresdk-09.01.00.007-config.json
@@ -0,0 +1,149 @@
+{
+  "version": "1.0",
+  "description": "TI CoreSDK v09.01.00.007",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.0"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt5": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/meta-qt5/meta-qt5.git"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-qt5"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.008-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.008-config.json
new file mode 100644
index 0000000..4c0410b
--- /dev/null
+++ b/bitbake-setup/coresdk/coresdk-09.01.00.008-config.json
@@ -0,0 +1,149 @@
+{
+  "version": "1.0",
+  "description": "TI CoreSDK v09.01.00.008",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.0"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt5": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/meta-qt5/meta-qt5.git"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-qt5"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "kirkstone"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/coresdk_coresdk-09.02.00.008-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.008-config.json
similarity index 52%
copy from bitbake-setup/coresdk_coresdk-09.02.00.008-config.json
copy to bitbake-setup/coresdk/coresdk-09.02.00.008-config.json
index e0ef11c..7d387dd 100644
--- a/bitbake-setup/coresdk_coresdk-09.02.00.008-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.02.00.008-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-09.02.00.008-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-09.02.00.009-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.009-config.json
similarity index 52%
copy from bitbake-setup/coresdk_coresdk-09.02.00.009-config.json
copy to bitbake-setup/coresdk/coresdk-09.02.00.009-config.json
index 529c2df..244eb4e 100644
--- a/bitbake-setup/coresdk_coresdk-09.02.00.009-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.02.00.009-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-09.02.00.009-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-09.02.00.010-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.010-config.json
similarity index 52%
copy from bitbake-setup/coresdk_coresdk-09.02.00.010-config.json
copy to bitbake-setup/coresdk/coresdk-09.02.00.010-config.json
index 99d9ae1..9731e2f 100644
--- a/bitbake-setup/coresdk_coresdk-09.02.00.010-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.02.00.010-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-09.02.00.010-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-09.03.05-config.json b/bitbake-setup/coresdk/coresdk-09.03.05-config.json
similarity index 52%
copy from bitbake-setup/coresdk_coresdk-09.03.05-config.json
copy to bitbake-setup/coresdk/coresdk-09.03.05-config.json
index 45df6f7..8c85125 100644
--- a/bitbake-setup/coresdk_coresdk-09.03.05-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.03.05-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-09.03.05-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-10.00.07-config.json b/bitbake-setup/coresdk/coresdk-10.00.07-config.json
similarity index 51%
copy from bitbake-setup/coresdk_coresdk-10.00.07-config.json
copy to bitbake-setup/coresdk/coresdk-10.00.07-config.json
index 2564285..9676947 100644
--- a/bitbake-setup/coresdk_coresdk-10.00.07-config.json
+++ b/bitbake-setup/coresdk/coresdk-10.00.07-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-10.00.07-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-10.01.08-config.json b/bitbake-setup/coresdk/coresdk-10.01.08-config.json
similarity index 51%
copy from bitbake-setup/coresdk_coresdk-10.01.08-config.json
copy to bitbake-setup/coresdk/coresdk-10.01.08-config.json
index 7fb45d7..f729913 100644
--- a/bitbake-setup/coresdk_coresdk-10.01.08-config.json
+++ b/bitbake-setup/coresdk/coresdk-10.01.08-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-10.01.08-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-10.01.10-config.json b/bitbake-setup/coresdk/coresdk-10.01.10-config.json
similarity index 51%
copy from bitbake-setup/coresdk_coresdk-10.01.10-config.json
copy to bitbake-setup/coresdk/coresdk-10.01.10-config.json
index 6a1a840..62a140b 100644
--- a/bitbake-setup/coresdk_coresdk-10.01.10-config.json
+++ b/bitbake-setup/coresdk/coresdk-10.01.10-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-10.01.10-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json b/bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json
similarity index 53%
copy from bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
copy to bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json
index 8acd24a..b9f2db7 100644
--- a/bitbake-setup/coresdk_coresdk-10.01.10-selinux-config.json
+++ b/bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-10.01.10-selinux-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-selinux","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/coresdk/coresdk-10.01.10-selinux-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-11.00.09-config.json b/bitbake-setup/coresdk/coresdk-11.00.09-config.json
similarity index 51%
copy from bitbake-setup/coresdk_coresdk-11.00.09-config.json
copy to bitbake-setup/coresdk/coresdk-11.00.09-config.json
index 1113730..86d5241 100644
--- a/bitbake-setup/coresdk_coresdk-11.00.09-config.json
+++ b/bitbake-setup/coresdk/coresdk-11.00.09-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-11.00.09-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-11.00.15-config.json b/bitbake-setup/coresdk/coresdk-11.00.15-config.json
similarity index 51%
copy from bitbake-setup/coresdk_coresdk-11.00.15-config.json
copy to bitbake-setup/coresdk/coresdk-11.00.15-config.json
index 55bb1e3..f28d86c 100644
--- a/bitbake-setup/coresdk_coresdk-11.00.15-config.json
+++ b/bitbake-setup/coresdk/coresdk-11.00.15-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-11.00.15-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-11.01.05-config.json b/bitbake-setup/coresdk/coresdk-11.01.05-config.json
similarity index 54%
copy from bitbake-setup/coresdk_coresdk-11.01.05-config.json
copy to bitbake-setup/coresdk/coresdk-11.01.05-config.json
index 140a55f..8ca09b1 100644
--- a/bitbake-setup/coresdk_coresdk-11.01.05-config.json
+++ b/bitbake-setup/coresdk/coresdk-11.01.05-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-11.01.05-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/coresdk_coresdk-11.01.08-config.json b/bitbake-setup/coresdk/coresdk-11.01.08-config.json
similarity index 54%
copy from bitbake-setup/coresdk_coresdk-11.01.08-config.json
copy to bitbake-setup/coresdk/coresdk-11.01.08-config.json
index 7ec7ec8..0efc55e 100644
--- a/bitbake-setup/coresdk_coresdk-11.01.08-config.json
+++ b/bitbake-setup/coresdk/coresdk-11.01.08-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-coresdk_coresdk-11.01.08-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/distroless-kirkstone-config.json b/bitbake-setup/distroless-kirkstone-config.json
index b0ca7e7..405acf1 100644
--- a/bitbake-setup/distroless-kirkstone-config.json
+++ b/bitbake-setup/distroless-kirkstone-config.json
@@ -58,13 +58,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-distroless-kirkstone-config",
-         "targets": [ "bitbake -k " ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [ "meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/distroless-master-config.json b/bitbake-setup/distroless-master-config.json
index 1479e27..c338794 100644
--- a/bitbake-setup/distroless-master-config.json
+++ b/bitbake-setup/distroless-master-config.json
@@ -58,13 +58,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-distroless-master-config",
-         "targets": [ "bitbake -k " ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [ "meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/distroless-scarthgap-config.json b/bitbake-setup/distroless-scarthgap-config.json
index bc34f7f..ee905cf 100644
--- a/bitbake-setup/distroless-scarthgap-config.json
+++ b/bitbake-setup/distroless-scarthgap-config.json
@@ -58,13 +58,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-distroless-scarthgap-config",
-         "targets": [ "bitbake -k " ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [ "meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/poky-kirkstone-config.json b/bitbake-setup/poky-kirkstone-config.json
index f577d85..e80f519 100644
--- a/bitbake-setup/poky-kirkstone-config.json
+++ b/bitbake-setup/poky-kirkstone-config.json
@@ -80,13 +80,48 @@
       "path": "meta-arago"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-poky-kirkstone-config",
-         "targets": [ "bitbake -k core_image_minimal" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "poky",
+        "description": "Yocto Project Poky reference distro build",
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-poky-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/poky" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/poky-master-config.json b/bitbake-setup/poky-master-config.json
index 7e99bd4..aa63dbf 100644
--- a/bitbake-setup/poky-master-config.json
+++ b/bitbake-setup/poky-master-config.json
@@ -80,13 +80,48 @@
       "path": "meta-arago"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-poky-master-config",
-         "targets": [ "bitbake -k core_image_minimal" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "poky",
+        "description": "Yocto Project Poky reference distro build",
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/poky" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/poky-master-wip-config.json b/bitbake-setup/poky-master-wip-config.json
index 063df20..119a7dc 100644
--- a/bitbake-setup/poky-master-wip-config.json
+++ b/bitbake-setup/poky-master-wip-config.json
@@ -80,13 +80,48 @@
       "path": "meta-arago"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-poky-master-wip-config",
-         "targets": [ "bitbake -k core_image_minimal" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "poky",
+        "description": "Yocto Project Poky reference distro build",
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/poky" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/poky-scarthgap-config.json b/bitbake-setup/poky-scarthgap-config.json
index 7d4cb50..1012df5 100644
--- a/bitbake-setup/poky-scarthgap-config.json
+++ b/bitbake-setup/poky-scarthgap-config.json
@@ -80,13 +80,48 @@
       "path": "meta-arago"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-poky-scarthgap-config",
-         "targets": [ "bitbake -k core_image_minimal" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "poky",
+        "description": "Yocto Project Poky reference distro build",
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-poky-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/poky" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/poky-scarthgap-wip-config.json b/bitbake-setup/poky-scarthgap-wip-config.json
index a4aeed0..727a4cf 100644
--- a/bitbake-setup/poky-scarthgap-wip-config.json
+++ b/bitbake-setup/poky-scarthgap-wip-config.json
@@ -69,13 +69,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-poky-scarthgap-wip-config",
-         "targets": [ "bitbake -k core_image_minimal" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "poky",
+        "description": "Yocto Project Poky reference distro build",
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-poky-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/poky" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json
index a371d64..50da6c5 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json
@@ -124,13 +124,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-09.00.00-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-psdkla","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json
index f6a90fc..80b6654 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json
@@ -124,13 +124,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-09.00.01-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-psdkla","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json
index 880511e..1841a1e 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json
@@ -124,13 +124,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-09.01.00-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-tisdk","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json
index edf3114..533c64b 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json
@@ -124,13 +124,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-09.02.00-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-tisdk","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json
index c8979db..f9c374f 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json
@@ -124,13 +124,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-10.00.00-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-tisdk","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json
similarity index 56%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json
index 0eb3867..239789b 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json
@@ -135,13 +135,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-10.01.00-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-11.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json
similarity index 56%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-11.00.00-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json
index d4ca6ae..9921885 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-11.00.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json
@@ -135,13 +135,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-11.00.00-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/meta-ti-foundational","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json
similarity index 57%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json
index d856fda..4c49df6 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json
@@ -146,13 +146,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json
similarity index 58%
copy from bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config.json
copy to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json
index 9523f46..aad35e1 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json
@@ -157,13 +157,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-gateway-10_00.json b/bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json
similarity index 53%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-gateway-10_00.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json
index 0496660..8d733ee 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-gateway-10_00.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json
@@ -124,13 +124,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-gateway-10_00",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-gateway-10_00.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json
similarity index 53%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_06.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json
index 27b1c73..16db478 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_06.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json
@@ -124,13 +124,48 @@
       "path": "meta-psdkla"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-09_00_00_06",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-aws","meta-psdkla","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_07.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json
similarity index 53%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_07.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json
index 1b65b00..1788918 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_07.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json
@@ -124,13 +124,48 @@
       "path": "meta-psdkla"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-09_00_00_07",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-aws","meta-psdkla","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json
similarity index 51%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_06.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json
index df3bf13..90c8857 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_06.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json
@@ -113,13 +113,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-09_01_00_06",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_07.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json
similarity index 51%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_07.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json
index b349a19..4dc31e5 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_07.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json
@@ -113,13 +113,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-09_01_00_07",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_04.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json
similarity index 55%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_04.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json
index f90a776..edbb9f7 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_04.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json
@@ -135,13 +135,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-09_02_00_04",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_05.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json
similarity index 55%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_05.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json
index ae0d18a..030c1a4 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_05.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json
@@ -135,13 +135,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-09_02_00_05",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_03_06_05.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json
similarity index 54%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_03_06_05.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json
index 785408f..744c963 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_03_06_05.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json
@@ -124,13 +124,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-09_03_06_05",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_07_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json
similarity index 54%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_07_06.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json
index 0f49f93..fb638fd 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_07_06.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json
@@ -135,13 +135,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-10_00_07_06",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_08_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json
similarity index 54%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_08_06.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json
index 213b129..e9d7ab6 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_08_06.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json
@@ -135,13 +135,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-10_00_08_06",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_01_08_01.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json
similarity index 54%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_01_08_01.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json
index 952b366..a1de7e5 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_01_08_01.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json
@@ -135,13 +135,48 @@
       "path": "meta-tisdk"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-10_01_08_01",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-11_00_10_01.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json
similarity index 56%
copy from bitbake-setup/processor-sdk-linux_processor-sdk-linux-11_00_10_01.json
copy to bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json
index dfc3980..e12fb5d 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-11_00_10_01.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json
@@ -135,13 +135,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk-linux_processor-sdk-linux-11_00_10_01",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/meta-ti-foundational","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json
index 55ba7a4..287835e 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-09.00.00-am62xxsip-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-edgeai","meta-processor-sdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.00.00-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk_processor-sdk-09.00.00-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json
index 95fd87e..9ce9de5 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.00.00-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-09.00.00-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-edgeai","meta-processor-sdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-am65xx-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json
similarity index 52%
copy from bitbake-setup/processor-sdk_processor-sdk-09.01.00-am65xx-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json
index bbc816a..8511942 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-am65xx-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-09.01.00-am65xx-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-processor-sdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk_processor-sdk-09.01.00-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json
index daec1ba..bb4b1d4 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json
@@ -124,13 +124,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-09.01.00-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-legacy-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json
similarity index 52%
copy from bitbake-setup/processor-sdk_processor-sdk-09.01.00-legacy-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json
index 0ea7a01..f92a67b 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-legacy-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-09.01.00-legacy-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-processor-sdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.02.00.08-am64x-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk_processor-sdk-09.02.00.08-am64x-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json
index 3ab024e..d6c1a9a 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.02.00.08-am64x-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json
@@ -124,13 +124,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-09.02.00.08-am64x-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.03.05.02-legacy-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json
similarity index 52%
copy from bitbake-setup/processor-sdk_processor-sdk-09.03.05.02-legacy-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json
index 8424253..3510a78 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.03.05.02-legacy-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-09.03.05.02-legacy-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-11.00.05.02-am62lxx-config.json b/bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json
similarity index 52%
copy from bitbake-setup/processor-sdk_processor-sdk-11.00.05.02-am62lxx-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json
index aa05aa1..2d595f5 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-11.00.05.02-am62lxx-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-11.00.05.02-am62lxx-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-11.00.15.05-am62lxx-config.json b/bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json
similarity index 51%
copy from bitbake-setup/processor-sdk_processor-sdk-11.00.15.05-am62lxx-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json
index f49a25b..1b98f59 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-11.00.15.05-am62lxx-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json
@@ -113,13 +113,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-11.00.15.05-am62lxx-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json
similarity index 56%
copy from bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json
index ce27119..e66c382 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json
@@ -135,13 +135,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-kirkstone-09.02.01.09-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json
similarity index 56%
copy from bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json
index 24d8391..135b209 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json
@@ -135,13 +135,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-kirkstone-09.02.01.10-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json
similarity index 58%
copy from bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json
index f408a5c..5e6ea36 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json
@@ -146,13 +146,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json
similarity index 58%
copy from bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json
index 808b637..f7a73f8 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json
@@ -146,13 +146,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json
index dfed0b4..7fddac3 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-10.00.07.04-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json
index f70e760..74ae454 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-10.01.10.04-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json
similarity index 53%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-11.00.09.04-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json
index d58d987..c9f0c7f 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-11.00.09.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-11.00.09.04-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json
similarity index 55%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-11.01.05.03-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json
index b0d63f8..cdcb8d1 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-11.01.05.03-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json
@@ -135,13 +135,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-11.01.05.03-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json
similarity index 57%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json
index 0b4a703..22f0e9c 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json
@@ -146,13 +146,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json
similarity index 57%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json
index fa0a0bd..3610606 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json
@@ -146,13 +146,48 @@
       "path": "meta-edgeai"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-demos","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt5","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json
similarity index 55%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json
index dd2ac11..cd7b89e 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json
@@ -135,13 +135,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json
similarity index 57%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json
index fb06679..33cf0ea 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json
@@ -146,13 +146,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json
similarity index 57%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json
index 1036166..64e1d35 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json
@@ -146,13 +146,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
similarity index 53%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
index e003bc8..587343c 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
@@ -124,13 +124,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json
similarity index 54%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json
index a6733a9..dfd404c 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json
@@ -135,13 +135,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json
similarity index 56%
copy from bitbake-setup/processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config.json
copy to bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json
index 8e6c080..60c031e 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json
@@ -146,13 +146,48 @@
       "path": "oe-core"
     }
   },
-  "configuration": {
-    "bitbake-setup": {
-      "default": {
-        "description": "Default build configuration",
-         "template": "oe-layersetup-processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config",
-         "targets": [ "bitbake -k tisdk-default-image" ]
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-layersetup/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
       }
-    }
+    ]
+  }
+}
+{
+  "version": "1.0",
+  "description": "",
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "",
+        "description": "",
+        "bb-layers": [  ],
+        "oe-fragments": [ "oe-layersetup/localconf/" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [  ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [  ]
+          }
+        }
+      }
+    ]
   }
 }
diff --git a/conf/fragments/localconf/configs/arago-kirkstone-next-config.conf b/conf/fragments/localconf/configs/arago-kirkstone-next-config.conf
new file mode 100644
index 0000000..7fab4ff
--- /dev/null
+++ b/conf/fragments/localconf/configs/arago-kirkstone-next-config.conf
@@ -0,0 +1,9 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for arago-kirkstone-next-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for arago-kirkstone-next-config"
+
+OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"
+BRANCH:recipe-linux-ti-staging_6.1.bb = "ti-linux-6.1.y-cicd"
+BRANCH:recipe-linux-ti-staging-rt_6.1.bb = "ti-rt-linux-6.1.y-cicd"
+BRANCH:recipe-linux-ti-staging-systest_6.1.bb = "ti-linux-6.1.y-cicd"
+GIT_BRANCH:recipe-ti-k3-secdev_git.bb = "master-next"
+BRANCH:recipe-u-boot-ti-staging_2023.04.bb = "ti-u-boot-2023.04-next"
diff --git a/conf/fragments/localconf/configs/arago-master-next-config.conf b/conf/fragments/localconf/configs/arago-master-next-config.conf
new file mode 100644
index 0000000..b85b6a7
--- /dev/null
+++ b/conf/fragments/localconf/configs/arago-master-next-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for arago-master-next-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for arago-master-next-config"
+
+OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"
diff --git a/conf/fragments/localconf/configs/arago-master-selinux-config.conf b/conf/fragments/localconf/configs/arago-master-selinux-config.conf
new file mode 100644
index 0000000..022576a
--- /dev/null
+++ b/conf/fragments/localconf/configs/arago-master-selinux-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for arago-master-selinux-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for arago-master-selinux-config"
+
+DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/conf/fragments/localconf/configs/arago-scarthgap-10x-config.conf b/conf/fragments/localconf/configs/arago-scarthgap-10x-config.conf
new file mode 100644
index 0000000..6f4bf47
--- /dev/null
+++ b/conf/fragments/localconf/configs/arago-scarthgap-10x-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for arago-scarthgap-10x-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for arago-scarthgap-10x-config"
+
+TI_PREFERRED_BSP = "ti-6_6"
diff --git a/conf/fragments/localconf/configs/arago-scarthgap-10x-next-config.conf b/conf/fragments/localconf/configs/arago-scarthgap-10x-next-config.conf
new file mode 100644
index 0000000..d663446
--- /dev/null
+++ b/conf/fragments/localconf/configs/arago-scarthgap-10x-next-config.conf
@@ -0,0 +1,8 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for arago-scarthgap-10x-next-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for arago-scarthgap-10x-next-config"
+
+TI_PREFERRED_BSP = "ti-6_6"
+OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"
+BRANCH:recipe-linux-ti-staging_6.6.bb = "ti-linux-6.6.y-cicd"
+BRANCH:recipe-linux-ti-staging-rt_6.6.bb = "ti-rt-linux-6.6.y-cicd"
+BRANCH:recipe-u-boot-ti-staging_2024.04.bb = "ti-u-boot-2024.04-next"
diff --git a/conf/fragments/localconf/configs/arago-scarthgap-next-config.conf b/conf/fragments/localconf/configs/arago-scarthgap-next-config.conf
new file mode 100644
index 0000000..9c33ebe
--- /dev/null
+++ b/conf/fragments/localconf/configs/arago-scarthgap-next-config.conf
@@ -0,0 +1,25 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for arago-scarthgap-next-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for arago-scarthgap-next-config"
+
+OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"
+BRANCH:recipe-ltp-ddt_20250130.bb = "cicd"
+BRANCH:recipe-cadence-mhdp-fw_git.bb = "ti-linux-firmware-next"
+BRANCH:recipe-cnm-wave-fw_git.bb = "ti-linux-firmware-next"
+BRANCH:recipe-goodix-fw_git.bb = "ti-linux-firmware-next"
+BRANCH:recipe-linux-ti-staging_6.12.bb = "ti-linux-6.12.y-cicd"
+BRANCH_ARM64:recipe-linux-ti-staging-rt_6.12.bb = "ti-linux-6.12.y-cicd"
+BRANCH_ARM32:recipe-linux-ti-staging-rt_6.12.bb = "ti-rt-linux-6.12.y-arm32-cicd"
+BRANCH:recipe-prueth-fw_5.6.15.bb = "ti-linux-firmware-next"
+BRANCH:recipe-pruhsr-fw_2.17.25.bb = "ti-linux-firmware-next"
+BRANCH:recipe-pruprp-fw_2.17.25.bb = "ti-linux-firmware-next"
+BRANCH:recipe-prusw-fw_3.2.9.bb = "ti-linux-firmware-next"
+BRANCH:recipe-ti-dac-fw.bb = "ti-linux-firmware-next"
+BRANCH:recipe-ti-dm-fw.bb = "ti-linux-firmware-next"
+BRANCH:recipe-ti-eth-fw.bb = "ti-linux-firmware-next"
+BRANCH:recipe-ti-hsm-demo-fw_git.bb = "ti-linux-firmware-next"
+BRANCH:recipe-ti-pka-fw_git.bb = "ti-linux-firmware-next"
+BRANCH:recipe-ti-rtos-echo-test-fw.bb = "ti-linux-firmware-next"
+BRANCH:recipe-ti-rtos-messageq-test-fw_git.bb = "ti-linux-firmware-next"
+BRANCH:recipe-ti-sci-fw_git.bb = "ti-linux-firmware-next"
+BRANCH:recipe-u-boot-ti-staging_2025.01.bb = "ti-u-boot-2025.01-next"
+BRANCH:recipe-vxd-dec-fw_git.bb = "ti-linux-firmware-next"
diff --git a/conf/fragments/localconf/configs/arago-scarthgap-selinux-config.conf b/conf/fragments/localconf/configs/arago-scarthgap-selinux-config.conf
new file mode 100644
index 0000000..df8ae7d
--- /dev/null
+++ b/conf/fragments/localconf/configs/arago-scarthgap-selinux-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for arago-scarthgap-selinux-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for arago-scarthgap-selinux-config"
+
+DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/conf/fragments/localconf/configs/coresdk/coresdk-10.01.10-selinux-config.conf b/conf/fragments/localconf/configs/coresdk/coresdk-10.01.10-selinux-config.conf
new file mode 100644
index 0000000..f69ad44
--- /dev/null
+++ b/conf/fragments/localconf/configs/coresdk/coresdk-10.01.10-selinux-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for coresdk/coresdk-10.01.10-selinux-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for coresdk/coresdk-10.01.10-selinux-config"
+
+DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/conf/fragments/localconf/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.conf b/conf/fragments/localconf/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.conf
new file mode 100644
index 0000000..6724665
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config"
+
+DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-gateway-10_00.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-gateway-10_00.conf
new file mode 100644
index 0000000..155f9aa
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-gateway-10_00.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-gateway-10_00"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-gateway-10_00"
+
+DISTRO_FEATURES:append = " virtualization"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.conf
new file mode 100644
index 0000000..31abf7b
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_06.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_00_00_06"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_00_00_06"
+
+DISTRO_FEATURES:append = " virtualization"
+ARAGO_BRAND = "foundational_sdk"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.conf
new file mode 100644
index 0000000..f17155b
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_00_00_07"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_00_00_07"
+
+DISTRO_FEATURES:append = " virtualization"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.conf
new file mode 100644
index 0000000..126e2d8
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_01_00_06"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_01_00_06"
+
+DISTRO_FEATURES:append = " virtualization"
+ARAGO_BRAND = "foundational_sdk"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.conf
new file mode 100644
index 0000000..bd7050d
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_01_00_07"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_01_00_07"
+
+DISTRO_FEATURES:append = " virtualization"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.conf
new file mode 100644
index 0000000..9dc1d44
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_02_00_04"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_02_00_04"
+
+DISTRO_FEATURES:append = " virtualization"
+ARAGO_BRAND = "foundational_sdk"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.conf
new file mode 100644
index 0000000..9ddeb33
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_02_00_05"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-09_02_00_05"
+
+DISTRO_FEATURES:append = " virtualization"
+ARAGO_BRAND = "foundational_sdk"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.conf
new file mode 100644
index 0000000..2ffbc77
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_07_06.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-10_00_07_06"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-10_00_07_06"
+
+DISTRO_FEATURES:append = " virtualization"
+DISTROOVERRIDES:append = ":foundational"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.conf
new file mode 100644
index 0000000..3c156b5
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_00_08_06.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-10_00_08_06"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-10_00_08_06"
+
+DISTRO_FEATURES:append = " virtualization"
+DISTROOVERRIDES:append = ":foundational"
diff --git a/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.conf b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.conf
new file mode 100644
index 0000000..9104ae3
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk-linux/processor-sdk-linux-10_01_08_01.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-10_01_08_01"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk-linux/processor-sdk-linux-10_01_08_01"
+
+DISTRO_FEATURES:append = " virtualization"
+DISTROOVERRIDES:append = ":foundational"
diff --git a/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.conf b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.conf
new file mode 100644
index 0000000..2771845
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config"
+
+DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.conf b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.conf
new file mode 100644
index 0000000..13e4230
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config"
+
+DISTRO_FEATURES:append = " acl xattr pam selinux"
diff --git a/conf/templates/arago-kirkstone-chromium-config/local.conf.sample b/conf/fragments/localconf/local-arago64-v2.conf
similarity index 97%
copy from conf/templates/arago-kirkstone-chromium-config/local.conf.sample
copy to conf/fragments/localconf/local-arago64-v2.conf
index 8ad6f26..1e102fc 100644
--- a/conf/templates/arago-kirkstone-chromium-config/local.conf.sample
+++ b/conf/fragments/localconf/local-arago64-v2.conf
@@ -1,3 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "TI oe-layersetup build defaults for Arago 64bit builds v2"
+BB_CONF_FRAGMENT_DESCRIPTION = "TI oe-layersetup build defaults for Arago 64bit builds v2"
+
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
 CONF_VERSION = "2"
 
diff --git a/conf/templates/arago-master-config/local.conf.sample b/conf/fragments/localconf/local-arago64-v3.conf
similarity index 97%
copy from conf/templates/arago-master-config/local.conf.sample
copy to conf/fragments/localconf/local-arago64-v3.conf
index 720ce11..be1b9aa 100644
--- a/conf/templates/arago-master-config/local.conf.sample
+++ b/conf/fragments/localconf/local-arago64-v3.conf
@@ -1,3 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "TI oe-layersetup build defaults for Arago 64bit builds v3"
+BB_CONF_FRAGMENT_DESCRIPTION = "TI oe-layersetup build defaults for Arago 64bit builds v3"
+
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
 CONF_VERSION = "2"
 
diff --git a/conf/templates/poky-kirkstone-config/local.conf.sample b/conf/fragments/localconf/local-poky-v2.conf
similarity index 97%
copy from conf/templates/poky-kirkstone-config/local.conf.sample
copy to conf/fragments/localconf/local-poky-v2.conf
index 12eacfc..63f1040 100644
--- a/conf/templates/poky-kirkstone-config/local.conf.sample
+++ b/conf/fragments/localconf/local-poky-v2.conf
@@ -1,3 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "TI oe-layersetup build defaults for Poky builds v2"
+BB_CONF_FRAGMENT_DESCRIPTION = "TI oe-layersetup build defaults for Poky builds v2"
+
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
 CONF_VERSION = "2"
 
diff --git a/sample-files/local-poky-v3.conf.sample b/conf/fragments/localconf/local-poky-v3.conf
similarity index 97%
copy from sample-files/local-poky-v3.conf.sample
copy to conf/fragments/localconf/local-poky-v3.conf
index e0112c7..c224d6b 100644
--- a/sample-files/local-poky-v3.conf.sample
+++ b/conf/fragments/localconf/local-poky-v3.conf
@@ -1,3 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "TI oe-layersetup build defaults for Poky builds v3"
+BB_CONF_FRAGMENT_DESCRIPTION = "TI oe-layersetup build defaults for Poky builds v3"
+
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
 CONF_VERSION = "2"
 
diff --git a/conf/templates/distroless-kirkstone-config/local.conf.sample b/conf/fragments/localconf/local-v2.conf
similarity index 97%
copy from conf/templates/distroless-kirkstone-config/local.conf.sample
copy to conf/fragments/localconf/local-v2.conf
index b499977..a072036 100644
--- a/conf/templates/distroless-kirkstone-config/local.conf.sample
+++ b/conf/fragments/localconf/local-v2.conf
@@ -1,3 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "TI oe-layersetup build defaults for builds v2"
+BB_CONF_FRAGMENT_DESCRIPTION = "TI oe-layersetup build defaults for builds v2"
+
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
 CONF_VERSION = "2"
 
diff --git a/sample-files/local-v3.conf.sample b/conf/fragments/localconf/local-v3.conf
similarity index 97%
copy from sample-files/local-v3.conf.sample
copy to conf/fragments/localconf/local-v3.conf
index 7d218e8..d4ed078 100644
--- a/sample-files/local-v3.conf.sample
+++ b/conf/fragments/localconf/local-v3.conf
@@ -1,3 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "TI oe-layersetup build defaults for builds v3"
+BB_CONF_FRAGMENT_DESCRIPTION = "TI oe-layersetup build defaults for builds v3"
+
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
 CONF_VERSION = "2"
 
-- 
2.17.1


