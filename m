Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119FDCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:46:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2006.1758037578550382885
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 08:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GFenOSci;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58GFkG2T045179;
	Tue, 16 Sep 2025 10:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758037576;
	bh=6w4VY+na4cvEuorUIJmpcY7mU5LbCHp5MKItmS52q1g=;
	h=From:To:Subject:Date;
	b=GFenOSciuHZA2qMfWgzjVSqRpGiq2W8o+SmQcQll3p6RH6Ajk4O8yOW5cNl2QEBSy
	 RQWU6SirYBmS3Reum8F76V+BOYWHzxCwJ6ukd3BE20pcSDszQkWMA5vhbt56LVnrGR
	 2DIyNt3HyR1KnBGO/mZCt9vU4FQzIIMBlZev+0K0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58GFkGCl832676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 16 Sep 2025 10:46:16 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 16
 Sep 2025 10:46:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Sep 2025 10:46:15 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58GFkF1Q1545958;
	Tue, 16 Sep 2025 10:46:15 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uyXsl-0001bq-CN; Tue, 16 Sep 2025 10:46:15 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] bitbake-setup: Rename json files
Date: Tue, 16 Sep 2025 10:46:15 -0500
Message-ID: <20250916154615.6145-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Sep 2025 15:46:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16583

There is a requirement that the name of the config json file ends with
.conf.json.  Update the Makefile and rename all of the files.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...son => arago-kirkstone-chromium-config.conf.json} |  0
 ...-config.json => arago-kirkstone-config.conf.json} |  0
 ...ig.json => arago-kirkstone-next-config.conf.json} |  0
 ...fig.json => arago-kirkstone-wip-config.conf.json} |  0
 ...g.json => arago-master-chromium-config.conf.json} |  0
 ...ter-config.json => arago-master-config.conf.json} |  0
 ...ig.json => arago-master-flutter-config.conf.json} |  0
 ...onfig.json => arago-master-next-config.conf.json} |  0
 ...ig.json => arago-master-selinux-config.conf.json} |  0
 ...config.json => arago-master-wip-config.conf.json} |  0
 ...fig.json => arago-scarthgap-10x-config.conf.json} |  0
 ...son => arago-scarthgap-10x-next-config.conf.json} |  0
 ...son => arago-scarthgap-chromium-config.conf.json} |  0
 ...-config.json => arago-scarthgap-config.conf.json} |  0
 ...json => arago-scarthgap-flutter-config.conf.json} |  0
 ...ig.json => arago-scarthgap-next-config.conf.json} |  0
 ...json => arago-scarthgap-selinux-config.conf.json} |  0
 ...fig.json => arago-scarthgap-wip-config.conf.json} |  0
 ...ig.json => coresdk-09.00.00.006-config.conf.json} |  0
 ...ig.json => coresdk-09.00.00.007-config.conf.json} |  0
 ...ig.json => coresdk-09.00.00.011-config.conf.json} |  0
 ...ig.json => coresdk-09.01.00.001-config.conf.json} |  0
 ...ig.json => coresdk-09.01.00.003-config.conf.json} |  0
 ...ig.json => coresdk-09.01.00.007-config.conf.json} |  0
 ...ig.json => coresdk-09.01.00.008-config.conf.json} |  0
 ...ig.json => coresdk-09.02.00.008-config.conf.json} |  0
 ...ig.json => coresdk-09.02.00.009-config.conf.json} |  0
 ...ig.json => coresdk-09.02.00.010-config.conf.json} |  0
 ...config.json => coresdk-09.03.05-config.conf.json} |  0
 ...config.json => coresdk-10.00.07-config.conf.json} |  0
 ...config.json => coresdk-10.01.08-config.conf.json} |  0
 ...config.json => coresdk-10.01.10-config.conf.json} |  0
 ...son => coresdk-10.01.10-selinux-config.conf.json} |  0
 ...config.json => coresdk-11.00.09-config.conf.json} |  0
 ...config.json => coresdk-11.00.15-config.conf.json} |  0
 ...config.json => coresdk-11.01.05-config.conf.json} |  0
 ...config.json => coresdk-11.01.08-config.conf.json} |  0
 ...ig.json => distroless-kirkstone-config.conf.json} |  0
 ...onfig.json => distroless-master-config.conf.json} |  0
 ...ig.json => distroless-scarthgap-config.conf.json} |  0
 ...e-config.json => poky-kirkstone-config.conf.json} |  0
 ...ster-config.json => poky-master-config.conf.json} |  0
 ...-config.json => poky-master-wip-config.conf.json} |  0
 ...p-config.json => poky-scarthgap-config.conf.json} |  0
 ...nfig.json => poky-scarthgap-wip-config.conf.json} |  0
 ...rocessor-sdk-analytics-09.00.00-config.conf.json} |  0
 ...rocessor-sdk-analytics-09.00.01-config.conf.json} |  0
 ...rocessor-sdk-analytics-09.01.00-config.conf.json} |  0
 ...rocessor-sdk-analytics-09.02.00-config.conf.json} |  0
 ...rocessor-sdk-analytics-10.00.00-config.conf.json} |  0
 ...rocessor-sdk-analytics-10.01.00-config.conf.json} |  0
 ...rocessor-sdk-analytics-11.00.00-config.conf.json} |  0
 ...essor-sdk-analytics-11.01.07.05-config.conf.json} |  0
 ...k-analytics-selinux-11.01.07.05-config.conf.json} |  0
 ...00.json => processor-sdk-gateway-10_00.conf.json} |  0
 ...son => processor-sdk-linux-09_00_00_06.conf.json} |  0
 ...son => processor-sdk-linux-09_00_00_07.conf.json} |  0
 ...son => processor-sdk-linux-09_01_00_06.conf.json} |  0
 ...son => processor-sdk-linux-09_01_00_07.conf.json} |  0
 ...son => processor-sdk-linux-09_02_00_04.conf.json} |  0
 ...son => processor-sdk-linux-09_02_00_05.conf.json} |  0
 ...son => processor-sdk-linux-09_03_06_05.conf.json} |  0
 ...son => processor-sdk-linux-10_00_07_06.conf.json} |  0
 ...son => processor-sdk-linux-10_00_08_06.conf.json} |  0
 ...son => processor-sdk-linux-10_01_08_01.conf.json} |  0
 ...son => processor-sdk-linux-11_00_10_01.conf.json} |  0
 ...rocessor-sdk-09.00.00-am62xxsip-config.conf.json} |  0
 ....json => processor-sdk-09.00.00-config.conf.json} |  0
 ...> processor-sdk-09.01.00-am65xx-config.conf.json} |  0
 ....json => processor-sdk-09.01.00-config.conf.json} |  0
 ...> processor-sdk-09.01.00-legacy-config.conf.json} |  0
 ...processor-sdk-09.02.00.08-am64x-config.conf.json} |  0
 ...rocessor-sdk-09.03.05.02-legacy-config.conf.json} |  0
 ...ocessor-sdk-11.00.05.02-am62lxx-config.conf.json} |  0
 ...ocessor-sdk-11.00.15.05-am62lxx-config.conf.json} |  0
 ...essor-sdk-kirkstone-09.02.01.09-config.conf.json} |  0
 ...essor-sdk-kirkstone-09.02.01.10-config.conf.json} |  0
 ...-kirkstone-chromium-09.02.01.09-config.conf.json} |  0
 ...-kirkstone-chromium-09.02.01.10-config.conf.json} |  0
 ...essor-sdk-scarthgap-10.00.07.04-config.conf.json} |  0
 ...essor-sdk-scarthgap-10.01.10.04-config.conf.json} |  0
 ...essor-sdk-scarthgap-11.00.09.04-config.conf.json} |  0
 ...essor-sdk-scarthgap-11.01.05.03-config.conf.json} |  0
 ...-scarthgap-chromium-10.00.07.04-config.conf.json} |  0
 ...-scarthgap-chromium-10.01.10.04-config.conf.json} |  0
 ...-scarthgap-chromium-11.00.09.04-config.conf.json} |  0
 ...-scarthgap-chromium-11.01.05.03-config.conf.json} |  0
 ...-scarthgap-chromium-11.01.12.10-config.conf.json} |  0
 ...sdk-scarthgap-nonqt-11.01.05.03-config.conf.json} |  0
 ...k-scarthgap-selinux-11.00.09.04-config.conf.json} |  0
 ...k-scarthgap-selinux-11.01.05.03-config.conf.json} |  0
 src/Makefile                                         | 12 ++++++------
 92 files changed, 6 insertions(+), 6 deletions(-)
 rename bitbake-setup/{arago-kirkstone-chromium-config.json => arago-kirkstone-chromium-config.conf.json} (100%)
 rename bitbake-setup/{arago-kirkstone-config.json => arago-kirkstone-config.conf.json} (100%)
 rename bitbake-setup/{arago-kirkstone-next-config.json => arago-kirkstone-next-config.conf.json} (100%)
 rename bitbake-setup/{arago-kirkstone-wip-config.json => arago-kirkstone-wip-config.conf.json} (100%)
 rename bitbake-setup/{arago-master-chromium-config.json => arago-master-chromium-config.conf.json} (100%)
 rename bitbake-setup/{arago-master-config.json => arago-master-config.conf.json} (100%)
 rename bitbake-setup/{arago-master-flutter-config.json => arago-master-flutter-config.conf.json} (100%)
 rename bitbake-setup/{arago-master-next-config.json => arago-master-next-config.conf.json} (100%)
 rename bitbake-setup/{arago-master-selinux-config.json => arago-master-selinux-config.conf.json} (100%)
 rename bitbake-setup/{arago-master-wip-config.json => arago-master-wip-config.conf.json} (100%)
 rename bitbake-setup/{arago-scarthgap-10x-config.json => arago-scarthgap-10x-config.conf.json} (100%)
 rename bitbake-setup/{arago-scarthgap-10x-next-config.json => arago-scarthgap-10x-next-config.conf.json} (100%)
 rename bitbake-setup/{arago-scarthgap-chromium-config.json => arago-scarthgap-chromium-config.conf.json} (100%)
 rename bitbake-setup/{arago-scarthgap-config.json => arago-scarthgap-config.conf.json} (100%)
 rename bitbake-setup/{arago-scarthgap-flutter-config.json => arago-scarthgap-flutter-config.conf.json} (100%)
 rename bitbake-setup/{arago-scarthgap-next-config.json => arago-scarthgap-next-config.conf.json} (100%)
 rename bitbake-setup/{arago-scarthgap-selinux-config.json => arago-scarthgap-selinux-config.conf.json} (100%)
 rename bitbake-setup/{arago-scarthgap-wip-config.json => arago-scarthgap-wip-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.00.00.006-config.json => coresdk-09.00.00.006-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.00.00.007-config.json => coresdk-09.00.00.007-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.00.00.011-config.json => coresdk-09.00.00.011-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.01.00.001-config.json => coresdk-09.01.00.001-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.01.00.003-config.json => coresdk-09.01.00.003-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.01.00.007-config.json => coresdk-09.01.00.007-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.01.00.008-config.json => coresdk-09.01.00.008-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.02.00.008-config.json => coresdk-09.02.00.008-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.02.00.009-config.json => coresdk-09.02.00.009-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.02.00.010-config.json => coresdk-09.02.00.010-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-09.03.05-config.json => coresdk-09.03.05-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-10.00.07-config.json => coresdk-10.00.07-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-10.01.08-config.json => coresdk-10.01.08-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-10.01.10-config.json => coresdk-10.01.10-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-10.01.10-selinux-config.json => coresdk-10.01.10-selinux-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-11.00.09-config.json => coresdk-11.00.09-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-11.00.15-config.json => coresdk-11.00.15-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-11.01.05-config.json => coresdk-11.01.05-config.conf.json} (100%)
 rename bitbake-setup/coresdk/{coresdk-11.01.08-config.json => coresdk-11.01.08-config.conf.json} (100%)
 rename bitbake-setup/{distroless-kirkstone-config.json => distroless-kirkstone-config.conf.json} (100%)
 rename bitbake-setup/{distroless-master-config.json => distroless-master-config.conf.json} (100%)
 rename bitbake-setup/{distroless-scarthgap-config.json => distroless-scarthgap-config.conf.json} (100%)
 rename bitbake-setup/{poky-kirkstone-config.json => poky-kirkstone-config.conf.json} (100%)
 rename bitbake-setup/{poky-master-config.json => poky-master-config.conf.json} (100%)
 rename bitbake-setup/{poky-master-wip-config.json => poky-master-wip-config.conf.json} (100%)
 rename bitbake-setup/{poky-scarthgap-config.json => poky-scarthgap-config.conf.json} (100%)
 rename bitbake-setup/{poky-scarthgap-wip-config.json => poky-scarthgap-wip-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-09.00.00-config.json => processor-sdk-analytics-09.00.00-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-09.00.01-config.json => processor-sdk-analytics-09.00.01-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-09.01.00-config.json => processor-sdk-analytics-09.01.00-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-09.02.00-config.json => processor-sdk-analytics-09.02.00-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-10.00.00-config.json => processor-sdk-analytics-10.00.00-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-10.01.00-config.json => processor-sdk-analytics-10.01.00-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-11.00.00-config.json => processor-sdk-analytics-11.00.00-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-11.01.07.05-config.json => processor-sdk-analytics-11.01.07.05-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-analytics/{processor-sdk-analytics-selinux-11.01.07.05-config.json => processor-sdk-analytics-selinux-11.01.07.05-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-gateway-10_00.json => processor-sdk-gateway-10_00.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-09_00_00_06.json => processor-sdk-linux-09_00_00_06.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-09_00_00_07.json => processor-sdk-linux-09_00_00_07.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-09_01_00_06.json => processor-sdk-linux-09_01_00_06.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-09_01_00_07.json => processor-sdk-linux-09_01_00_07.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-09_02_00_04.json => processor-sdk-linux-09_02_00_04.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-09_02_00_05.json => processor-sdk-linux-09_02_00_05.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-09_03_06_05.json => processor-sdk-linux-09_03_06_05.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-10_00_07_06.json => processor-sdk-linux-10_00_07_06.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-10_00_08_06.json => processor-sdk-linux-10_00_08_06.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-10_01_08_01.json => processor-sdk-linux-10_01_08_01.conf.json} (100%)
 rename bitbake-setup/processor-sdk-linux/{processor-sdk-linux-11_00_10_01.json => processor-sdk-linux-11_00_10_01.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-09.00.00-am62xxsip-config.json => processor-sdk-09.00.00-am62xxsip-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-09.00.00-config.json => processor-sdk-09.00.00-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-09.01.00-am65xx-config.json => processor-sdk-09.01.00-am65xx-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-09.01.00-config.json => processor-sdk-09.01.00-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-09.01.00-legacy-config.json => processor-sdk-09.01.00-legacy-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-09.02.00.08-am64x-config.json => processor-sdk-09.02.00.08-am64x-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-09.03.05.02-legacy-config.json => processor-sdk-09.03.05.02-legacy-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-11.00.05.02-am62lxx-config.json => processor-sdk-11.00.05.02-am62lxx-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-11.00.15.05-am62lxx-config.json => processor-sdk-11.00.15.05-am62lxx-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-kirkstone-09.02.01.09-config.json => processor-sdk-kirkstone-09.02.01.09-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-kirkstone-09.02.01.10-config.json => processor-sdk-kirkstone-09.02.01.10-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-kirkstone-chromium-09.02.01.09-config.json => processor-sdk-kirkstone-chromium-09.02.01.09-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-kirkstone-chromium-09.02.01.10-config.json => processor-sdk-kirkstone-chromium-09.02.01.10-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-10.00.07.04-config.json => processor-sdk-scarthgap-10.00.07.04-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-10.01.10.04-config.json => processor-sdk-scarthgap-10.01.10.04-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-11.00.09.04-config.json => processor-sdk-scarthgap-11.00.09.04-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-11.01.05.03-config.json => processor-sdk-scarthgap-11.01.05.03-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-chromium-10.00.07.04-config.json => processor-sdk-scarthgap-chromium-10.00.07.04-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-chromium-10.01.10.04-config.json => processor-sdk-scarthgap-chromium-10.01.10.04-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-chromium-11.00.09.04-config.json => processor-sdk-scarthgap-chromium-11.00.09.04-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-chromium-11.01.05.03-config.json => processor-sdk-scarthgap-chromium-11.01.05.03-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-chromium-11.01.12.10-config.json => processor-sdk-scarthgap-chromium-11.01.12.10-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-nonqt-11.01.05.03-config.json => processor-sdk-scarthgap-nonqt-11.01.05.03-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-selinux-11.00.09.04-config.json => processor-sdk-scarthgap-selinux-11.00.09.04-config.conf.json} (100%)
 rename bitbake-setup/processor-sdk/{processor-sdk-scarthgap-selinux-11.01.05.03-config.json => processor-sdk-scarthgap-selinux-11.01.05.03-config.conf.json} (100%)

diff --git a/bitbake-setup/arago-kirkstone-chromium-config.json b/bitbake-setup/arago-kirkstone-chromium-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-kirkstone-chromium-config.json
rename to bitbake-setup/arago-kirkstone-chromium-config.conf.json
diff --git a/bitbake-setup/arago-kirkstone-config.json b/bitbake-setup/arago-kirkstone-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-kirkstone-config.json
rename to bitbake-setup/arago-kirkstone-config.conf.json
diff --git a/bitbake-setup/arago-kirkstone-next-config.json b/bitbake-setup/arago-kirkstone-next-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-kirkstone-next-config.json
rename to bitbake-setup/arago-kirkstone-next-config.conf.json
diff --git a/bitbake-setup/arago-kirkstone-wip-config.json b/bitbake-setup/arago-kirkstone-wip-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-kirkstone-wip-config.json
rename to bitbake-setup/arago-kirkstone-wip-config.conf.json
diff --git a/bitbake-setup/arago-master-chromium-config.json b/bitbake-setup/arago-master-chromium-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-master-chromium-config.json
rename to bitbake-setup/arago-master-chromium-config.conf.json
diff --git a/bitbake-setup/arago-master-config.json b/bitbake-setup/arago-master-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-master-config.json
rename to bitbake-setup/arago-master-config.conf.json
diff --git a/bitbake-setup/arago-master-flutter-config.json b/bitbake-setup/arago-master-flutter-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-master-flutter-config.json
rename to bitbake-setup/arago-master-flutter-config.conf.json
diff --git a/bitbake-setup/arago-master-next-config.json b/bitbake-setup/arago-master-next-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-master-next-config.json
rename to bitbake-setup/arago-master-next-config.conf.json
diff --git a/bitbake-setup/arago-master-selinux-config.json b/bitbake-setup/arago-master-selinux-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-master-selinux-config.json
rename to bitbake-setup/arago-master-selinux-config.conf.json
diff --git a/bitbake-setup/arago-master-wip-config.json b/bitbake-setup/arago-master-wip-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-master-wip-config.json
rename to bitbake-setup/arago-master-wip-config.conf.json
diff --git a/bitbake-setup/arago-scarthgap-10x-config.json b/bitbake-setup/arago-scarthgap-10x-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-scarthgap-10x-config.json
rename to bitbake-setup/arago-scarthgap-10x-config.conf.json
diff --git a/bitbake-setup/arago-scarthgap-10x-next-config.json b/bitbake-setup/arago-scarthgap-10x-next-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-scarthgap-10x-next-config.json
rename to bitbake-setup/arago-scarthgap-10x-next-config.conf.json
diff --git a/bitbake-setup/arago-scarthgap-chromium-config.json b/bitbake-setup/arago-scarthgap-chromium-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-scarthgap-chromium-config.json
rename to bitbake-setup/arago-scarthgap-chromium-config.conf.json
diff --git a/bitbake-setup/arago-scarthgap-config.json b/bitbake-setup/arago-scarthgap-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-scarthgap-config.json
rename to bitbake-setup/arago-scarthgap-config.conf.json
diff --git a/bitbake-setup/arago-scarthgap-flutter-config.json b/bitbake-setup/arago-scarthgap-flutter-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-scarthgap-flutter-config.json
rename to bitbake-setup/arago-scarthgap-flutter-config.conf.json
diff --git a/bitbake-setup/arago-scarthgap-next-config.json b/bitbake-setup/arago-scarthgap-next-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-scarthgap-next-config.json
rename to bitbake-setup/arago-scarthgap-next-config.conf.json
diff --git a/bitbake-setup/arago-scarthgap-selinux-config.json b/bitbake-setup/arago-scarthgap-selinux-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-scarthgap-selinux-config.json
rename to bitbake-setup/arago-scarthgap-selinux-config.conf.json
diff --git a/bitbake-setup/arago-scarthgap-wip-config.json b/bitbake-setup/arago-scarthgap-wip-config.conf.json
similarity index 100%
rename from bitbake-setup/arago-scarthgap-wip-config.json
rename to bitbake-setup/arago-scarthgap-wip-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.00.00.006-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.006-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.00.00.006-config.json
rename to bitbake-setup/coresdk/coresdk-09.00.00.006-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.00.00.007-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.007-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.00.00.007-config.json
rename to bitbake-setup/coresdk/coresdk-09.00.00.007-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.00.00.011-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.011-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.00.00.011-config.json
rename to bitbake-setup/coresdk/coresdk-09.00.00.011-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.001-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.001-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.01.00.001-config.json
rename to bitbake-setup/coresdk/coresdk-09.01.00.001-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.003-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.003-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.01.00.003-config.json
rename to bitbake-setup/coresdk/coresdk-09.01.00.003-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.007-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.007-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.01.00.007-config.json
rename to bitbake-setup/coresdk/coresdk-09.01.00.007-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.008-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.008-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.01.00.008-config.json
rename to bitbake-setup/coresdk/coresdk-09.01.00.008-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.02.00.008-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.008-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.02.00.008-config.json
rename to bitbake-setup/coresdk/coresdk-09.02.00.008-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.02.00.009-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.009-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.02.00.009-config.json
rename to bitbake-setup/coresdk/coresdk-09.02.00.009-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.02.00.010-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.010-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.02.00.010-config.json
rename to bitbake-setup/coresdk/coresdk-09.02.00.010-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-09.03.05-config.json b/bitbake-setup/coresdk/coresdk-09.03.05-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-09.03.05-config.json
rename to bitbake-setup/coresdk/coresdk-09.03.05-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-10.00.07-config.json b/bitbake-setup/coresdk/coresdk-10.00.07-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-10.00.07-config.json
rename to bitbake-setup/coresdk/coresdk-10.00.07-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-10.01.08-config.json b/bitbake-setup/coresdk/coresdk-10.01.08-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-10.01.08-config.json
rename to bitbake-setup/coresdk/coresdk-10.01.08-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-10.01.10-config.json b/bitbake-setup/coresdk/coresdk-10.01.10-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-10.01.10-config.json
rename to bitbake-setup/coresdk/coresdk-10.01.10-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json b/bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json
rename to bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-11.00.09-config.json b/bitbake-setup/coresdk/coresdk-11.00.09-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-11.00.09-config.json
rename to bitbake-setup/coresdk/coresdk-11.00.09-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-11.00.15-config.json b/bitbake-setup/coresdk/coresdk-11.00.15-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-11.00.15-config.json
rename to bitbake-setup/coresdk/coresdk-11.00.15-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-11.01.05-config.json b/bitbake-setup/coresdk/coresdk-11.01.05-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-11.01.05-config.json
rename to bitbake-setup/coresdk/coresdk-11.01.05-config.conf.json
diff --git a/bitbake-setup/coresdk/coresdk-11.01.08-config.json b/bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json
similarity index 100%
rename from bitbake-setup/coresdk/coresdk-11.01.08-config.json
rename to bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json
diff --git a/bitbake-setup/distroless-kirkstone-config.json b/bitbake-setup/distroless-kirkstone-config.conf.json
similarity index 100%
rename from bitbake-setup/distroless-kirkstone-config.json
rename to bitbake-setup/distroless-kirkstone-config.conf.json
diff --git a/bitbake-setup/distroless-master-config.json b/bitbake-setup/distroless-master-config.conf.json
similarity index 100%
rename from bitbake-setup/distroless-master-config.json
rename to bitbake-setup/distroless-master-config.conf.json
diff --git a/bitbake-setup/distroless-scarthgap-config.json b/bitbake-setup/distroless-scarthgap-config.conf.json
similarity index 100%
rename from bitbake-setup/distroless-scarthgap-config.json
rename to bitbake-setup/distroless-scarthgap-config.conf.json
diff --git a/bitbake-setup/poky-kirkstone-config.json b/bitbake-setup/poky-kirkstone-config.conf.json
similarity index 100%
rename from bitbake-setup/poky-kirkstone-config.json
rename to bitbake-setup/poky-kirkstone-config.conf.json
diff --git a/bitbake-setup/poky-master-config.json b/bitbake-setup/poky-master-config.conf.json
similarity index 100%
rename from bitbake-setup/poky-master-config.json
rename to bitbake-setup/poky-master-config.conf.json
diff --git a/bitbake-setup/poky-master-wip-config.json b/bitbake-setup/poky-master-wip-config.conf.json
similarity index 100%
rename from bitbake-setup/poky-master-wip-config.json
rename to bitbake-setup/poky-master-wip-config.conf.json
diff --git a/bitbake-setup/poky-scarthgap-config.json b/bitbake-setup/poky-scarthgap-config.conf.json
similarity index 100%
rename from bitbake-setup/poky-scarthgap-config.json
rename to bitbake-setup/poky-scarthgap-config.conf.json
diff --git a/bitbake-setup/poky-scarthgap-wip-config.json b/bitbake-setup/poky-scarthgap-wip-config.conf.json
similarity index 100%
rename from bitbake-setup/poky-scarthgap-wip-config.json
rename to bitbake-setup/poky-scarthgap-wip-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.conf.json
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json
rename to bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json b/bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.conf.json
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json
rename to bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json b/bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json b/bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.conf.json
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.conf.json
similarity index 100%
rename from bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json
rename to bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.conf.json
diff --git a/src/Makefile b/src/Makefile
index e63bd12..069ef03 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -10,7 +10,7 @@ TGT_KAS_TEMPLATES = $(patsubst templates/%,../kas/templates/%,$(patsubst %.xml,%
 
 TMP_BITBAKE_SETUP_FLATTENED_CONFIGS = $(subst /,_,$(patsubst configs/%,%,$(SRC_CONFIGS)))
 
-TGT_BITBAKE_SETUP_CONFIGS = $(patsubst %,../bitbake-setup/%,$(patsubst %.xml,%.json,$(patsubst configs/%,%,$(SRC_CONFIGS))))
+TGT_BITBAKE_SETUP_CONFIGS = $(patsubst %,../bitbake-setup/%,$(patsubst %.xml,%.conf.json,$(patsubst configs/%,%,$(SRC_CONFIGS))))
 TGT_BITBAKE_SETUP_CONFIGS_LOCALCONF = $(patsubst %,../conf/fragments/localconf/configs/%,$(patsubst configs/%.xml,%.conf,$(SRC_CONFIGS)))
 TGT_BITBAKE_SETUP_LOCALCONF_TEMPLATES = $(patsubst %,../conf/fragments/localconf/%,$(patsubst templates/%.xml,%,$(filter-out templates/bblayers%,$(SRC_TEMPLATES))))
 TARGETS = $(TGT_OE_LAYERSETUP_CONFIGS) \
@@ -99,7 +99,7 @@ endef
 	@$(xslt_kas_templates)
 
 #------------------------------------------------------------------------------
-# Bitbake-setup config.json
+# Bitbake-setup config.conf.json
 #------------------------------------------------------------------------------
 define xslt_bitbake_setup =
 	mkdir -p $(@D); \
@@ -114,12 +114,12 @@ define xslt_bitbake_setup =
 	fi
 endef
 
-../bitbake-setup/%.json: xslt/bitbake-setup.xslt configs/%.xml
-	loConfigName="$*"; \
+../bitbake-setup/%.conf.json: xslt/bitbake-setup.xslt configs/%.xml
+	@loConfigName="$*"; \
 	$(xslt_bitbake_setup)
 
-../bitbake-setup/*.json: xslt/bitbake-setup-config-localconf.xslt
-../bitbake-setup/*/*.json: xslt/bitbake-setup-config-localconf.xslt
+../bitbake-setup/*.conf.json: xslt/bitbake-setup-config-localconf.xslt
+../bitbake-setup/*/*.conf.json: xslt/bitbake-setup-config-localconf.xslt
 
 #------------------------------------------------------------------------------
 # Bitbake-setup config local-conf
-- 
2.17.1


