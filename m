Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431C2CAC592
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:35:13 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2132.1757608508607963721
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 09:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Vld+HXdq;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BGZ6km787724;
	Thu, 11 Sep 2025 11:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757608506;
	bh=Cx24wOxxq3S01conNx6whZpTy7J3A4fPKytEh2r7/Lo=;
	h=From:To:Subject:Date;
	b=Vld+HXdq5bGg2NTOJLE4CC7HD173OqcQTNpI0ZwsAF16yJ6OpUQdhBmFYe/pScNcr
	 p01XCk8A1MhF7xWz8liCGOiJZ0sogihCWYk00mKkxLUiOUTFN6ot6hLvb4yZE1ePWR
	 dz9uRpANKIfe5oyqep2KcurlfUgS9UeGIEg82QqY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BGZ61K1185775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 11:35:06 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 11:35:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 11:35:06 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BGZ6j72120959;
	Thu, 11 Sep 2025 11:35:06 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uwkGI-0005K2-8A; Thu, 11 Sep 2025 11:35:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 0/5] Update bitbake-setup support
Date: Thu, 11 Sep 2025 11:35:01 -0500
Message-ID: <20250911163506.20414-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 16:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16561

Update all of the bitbake-setup files to match the upcoming
bitbake-setup release.

Ryan Eatmon (5):
  conf: Add support for whinlatter
  src: Rework bitbake-setup support
  src/configs: Update all of the configs
  bitbake-setup: Generate new files
  bitbake-setup: Remove old bitbake-setup files

 .../arago-kirkstone-chromium-config.json      |  49 ++++-
 bitbake-setup/arago-kirkstone-config.json     |  49 ++++-
 .../arago-kirkstone-next-config.json          |  49 ++++-
 bitbake-setup/arago-kirkstone-wip-config.json |  49 ++++-
 .../arago-master-chromium-config.json         |  49 ++++-
 bitbake-setup/arago-master-config.json        |  49 ++++-
 .../arago-master-flutter-config.json          |  49 ++++-
 bitbake-setup/arago-master-next-config.json   |  49 ++++-
 .../arago-master-selinux-config.json          |  49 ++++-
 bitbake-setup/arago-master-wip-config.json    |  49 ++++-
 bitbake-setup/arago-scarthgap-10x-config.json |  49 ++++-
 .../arago-scarthgap-10x-next-config.json      |  49 ++++-
 .../arago-scarthgap-chromium-config.json      |  49 ++++-
 bitbake-setup/arago-scarthgap-config.json     |  49 ++++-
 .../arago-scarthgap-flutter-config.json       |  49 ++++-
 .../arago-scarthgap-next-config.json          |  49 ++++-
 .../arago-scarthgap-selinux-config.json       |  49 ++++-
 bitbake-setup/arago-scarthgap-wip-config.json |  49 ++++-
 .../coresdk-09.00.00.006-config.json}         |  49 ++++-
 .../coresdk-09.00.00.007-config.json}         |  49 ++++-
 .../coresdk-09.00.00.011-config.json}         |  49 ++++-
 .../coresdk/coresdk-09.01.00.001-config.json  | 149 +++++++++++++
 .../coresdk/coresdk-09.01.00.003-config.json  | 149 +++++++++++++
 .../coresdk/coresdk-09.01.00.007-config.json  | 149 +++++++++++++
 .../coresdk/coresdk-09.01.00.008-config.json  | 149 +++++++++++++
 .../coresdk-09.02.00.008-config.json}         |  49 ++++-
 .../coresdk-09.02.00.009-config.json}         |  49 ++++-
 .../coresdk-09.02.00.010-config.json}         |  49 ++++-
 .../coresdk-09.03.05-config.json}             |  49 ++++-
 .../coresdk-10.00.07-config.json}             |  49 ++++-
 .../coresdk-10.01.08-config.json}             |  49 ++++-
 .../coresdk-10.01.10-config.json}             |  49 ++++-
 .../coresdk-10.01.10-selinux-config.json}     |  49 ++++-
 .../coresdk-11.00.09-config.json}             |  49 ++++-
 .../coresdk-11.00.15-config.json}             |  49 ++++-
 .../coresdk-11.01.05-config.json}             |  49 ++++-
 .../coresdk-11.01.08-config.json}             |  49 ++++-
 .../coresdk_coresdk-09.01.00.001-config.json  | 114 ----------
 .../coresdk_coresdk-09.01.00.003-config.json  | 114 ----------
 .../coresdk_coresdk-09.01.00.007-config.json  | 114 ----------
 .../coresdk_coresdk-09.01.00.008-config.json  | 114 ----------
 .../distroless-kirkstone-config.json          |  49 ++++-
 bitbake-setup/distroless-master-config.json   |  49 ++++-
 .../distroless-scarthgap-config.json          |  49 ++++-
 bitbake-setup/poky-kirkstone-config.json      |  49 ++++-
 bitbake-setup/poky-master-config.json         |  49 ++++-
 bitbake-setup/poky-master-wip-config.json     |  49 ++++-
 bitbake-setup/poky-scarthgap-config.json      |  49 ++++-
 bitbake-setup/poky-scarthgap-wip-config.json  |  49 ++++-
 ...cessor-sdk-analytics-09.00.00-config.json} |  49 ++++-
 ...cessor-sdk-analytics-09.00.01-config.json} |  49 ++++-
 ...cessor-sdk-analytics-09.01.00-config.json} |  49 ++++-
 ...cessor-sdk-analytics-09.02.00-config.json} |  49 ++++-
 ...cessor-sdk-analytics-10.00.00-config.json} |  49 ++++-
 ...cessor-sdk-analytics-10.01.00-config.json} |  49 ++++-
 ...cessor-sdk-analytics-11.00.00-config.json} |  49 ++++-
 ...sor-sdk-analytics-11.01.07.05-config.json} |  49 ++++-
 ...analytics-selinux-11.01.07.05-config.json} |  49 ++++-
 .../processor-sdk-gateway-10_00.json}         |  49 ++++-
 .../processor-sdk-linux-09_00_00_06.json}     |  49 ++++-
 .../processor-sdk-linux-09_00_00_07.json}     |  49 ++++-
 .../processor-sdk-linux-09_01_00_06.json}     |  49 ++++-
 .../processor-sdk-linux-09_01_00_07.json}     |  49 ++++-
 .../processor-sdk-linux-09_02_00_04.json}     |  49 ++++-
 .../processor-sdk-linux-09_02_00_05.json}     |  49 ++++-
 .../processor-sdk-linux-09_03_06_05.json}     |  49 ++++-
 .../processor-sdk-linux-10_00_07_06.json}     |  49 ++++-
 .../processor-sdk-linux-10_00_08_06.json}     |  49 ++++-
 .../processor-sdk-linux-10_01_08_01.json}     |  49 ++++-
 .../processor-sdk-linux-11_00_10_01.json}     |  49 ++++-
 ...cessor-sdk-09.00.00-am62xxsip-config.json} |  49 ++++-
 .../processor-sdk-09.00.00-config.json}       |  49 ++++-
 ...processor-sdk-09.01.00-am65xx-config.json} |  49 ++++-
 .../processor-sdk-09.01.00-config.json}       |  49 ++++-
 ...processor-sdk-09.01.00-legacy-config.json} |  49 ++++-
 ...ocessor-sdk-09.02.00.08-am64x-config.json} |  49 ++++-
 ...cessor-sdk-09.03.05.02-legacy-config.json} |  49 ++++-
 ...essor-sdk-11.00.05.02-am62lxx-config.json} |  49 ++++-
 ...essor-sdk-11.00.15.05-am62lxx-config.json} |  49 ++++-
 ...sor-sdk-kirkstone-09.02.01.09-config.json} |  49 ++++-
 ...sor-sdk-kirkstone-09.02.01.10-config.json} |  49 ++++-
 ...irkstone-chromium-09.02.01.09-config.json} |  49 ++++-
 ...irkstone-chromium-09.02.01.10-config.json} |  49 ++++-
 ...sor-sdk-scarthgap-10.00.07.04-config.json} |  49 ++++-
 ...sor-sdk-scarthgap-10.01.10.04-config.json} |  49 ++++-
 ...sor-sdk-scarthgap-11.00.09.04-config.json} |  49 ++++-
 ...sor-sdk-scarthgap-11.01.05.03-config.json} |  49 ++++-
 ...carthgap-chromium-10.00.07.04-config.json} |  49 ++++-
 ...carthgap-chromium-10.01.10.04-config.json} |  49 ++++-
 ...carthgap-chromium-11.00.09.04-config.json} |  49 ++++-
 ...carthgap-chromium-11.01.05.03-config.json} |  49 ++++-
 ...carthgap-chromium-11.01.12.10-config.json} |  49 ++++-
 ...k-scarthgap-nonqt-11.01.05.03-config.json} |  49 ++++-
 ...scarthgap-selinux-11.00.09.04-config.json} |  49 ++++-
 ...scarthgap-selinux-11.01.05.03-config.json} |  49 ++++-
 .../configs/arago-kirkstone-next-config.conf  |   9 +
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
 .../localconf/local-poky-v3.conf}             |   3 +
 .../localconf/local-v2.conf}                  |   3 +
 .../localconf/local-v3.conf}                  |   3 +
 conf/layer.conf                               |   2 +-
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../bblayers.conf.sample                      |  30 ---
 .../arago-kirkstone-config/conf-notes.txt     |  22 --
 .../arago-kirkstone-config/conf-summary.txt   |   1 -
 .../arago-kirkstone-config/local.conf.sample  | 175 ---------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 189 ----------------
 .../bblayers.conf.sample                      |  30 ---
 .../arago-kirkstone-wip-config/conf-notes.txt |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 177 ---------------
 .../arago-master-config/bblayers.conf.sample  |  31 ---
 .../arago-master-config/conf-notes.txt        |  22 --
 .../arago-master-config/conf-summary.txt      |   1 -
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 177 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../arago-master-next-config/conf-notes.txt   |  22 --
 .../arago-master-next-config/conf-summary.txt |   1 -
 .../local.conf.sample                         | 186 ----------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 186 ----------------
 .../bblayers.conf.sample                      |  31 ---
 .../arago-master-wip-config/conf-notes.txt    |  22 --
 .../arago-master-wip-config/conf-summary.txt  |   1 -
 .../arago-master-wip-config/local.conf.sample | 177 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../arago-scarthgap-10x-config/conf-notes.txt |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 188 ----------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../arago-scarthgap-config/conf-notes.txt     |  22 --
 .../arago-scarthgap-config/conf-summary.txt   |   1 -
 .../arago-scarthgap-config/local.conf.sample  | 175 ---------------
 .../bblayers.conf.sample                      |  34 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 205 ------------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 .../bblayers.conf.sample                      |  32 ---
 .../arago-scarthgap-wip-config/conf-notes.txt |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  28 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  28 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  28 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  29 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  29 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  29 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  29 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  18 --
 .../conf-notes.txt                            |  17 --
 .../conf-summary.txt                          |   1 -
 .../bblayers.conf.sample                      |  18 --
 .../distroless-master-config/conf-notes.txt   |  17 --
 .../distroless-master-config/conf-summary.txt |   1 -
 .../bblayers.conf.sample                      |  18 --
 .../conf-notes.txt                            |  17 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 165 --------------
 .../bblayers.conf.sample                      |  22 --
 .../poky-kirkstone-config/conf-notes.txt      |  17 --
 .../poky-kirkstone-config/conf-summary.txt    |   1 -
 .../poky-master-config/bblayers.conf.sample   |  22 --
 .../poky-master-config/conf-notes.txt         |  17 --
 .../poky-master-config/conf-summary.txt       |   1 -
 .../bblayers.conf.sample                      |  22 --
 .../poky-master-wip-config/conf-notes.txt     |  17 --
 .../poky-master-wip-config/conf-summary.txt   |   1 -
 .../poky-master-wip-config/local.conf.sample  | 174 ---------------
 .../bblayers.conf.sample                      |  22 --
 .../poky-scarthgap-config/conf-notes.txt      |  17 --
 .../poky-scarthgap-config/conf-summary.txt    |   1 -
 .../poky-scarthgap-config/local.conf.sample   | 172 ---------------
 .../bblayers.conf.sample                      |  20 --
 .../poky-scarthgap-wip-config/conf-notes.txt  |  17 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 172 ---------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  34 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  35 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 185 ----------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 185 ----------------
 .../bblayers.conf.sample                      |  30 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 185 ----------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 185 ----------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 185 ----------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 185 ----------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 185 ----------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  31 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  32 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  34 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  34 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  34 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  34 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  35 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  35 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  33 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 175 ---------------
 .../bblayers.conf.sample                      |  34 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 .../bblayers.conf.sample                      |  35 ---
 .../conf-notes.txt                            |  22 --
 .../conf-summary.txt                          |   1 -
 .../local.conf.sample                         | 184 ----------------
 src/Makefile                                  | 205 +++---------------
 src/bin/convert.pl                            |   8 +-
 src/common/distro_arago.xml                   |  14 ++
 src/common/distro_poky.xml                    |   9 +
 src/common/machines.xml                       |  39 ++++
 src/common/targets_arago.xml                  |   8 -
 src/common/targets_poky.xml                   |   3 -
 .../arago-kirkstone-chromium-config.xml       |   3 +-
 src/configs/arago-kirkstone-config.xml        |   3 +-
 src/configs/arago-kirkstone-next-config.xml   |   3 +-
 src/configs/arago-kirkstone-wip-config.xml    |   3 +-
 src/configs/arago-master-chromium-config.xml  |   3 +-
 src/configs/arago-master-config.xml           |   3 +-
 src/configs/arago-master-flutter-config.xml   |   3 +-
 src/configs/arago-master-next-config.xml      |   3 +-
 src/configs/arago-master-selinux-config.xml   |   3 +-
 src/configs/arago-master-wip-config.xml       |   3 +-
 src/configs/arago-scarthgap-10x-config.xml    |   3 +-
 .../arago-scarthgap-10x-next-config.xml       |   3 +-
 .../arago-scarthgap-chromium-config.xml       |   3 +-
 src/configs/arago-scarthgap-config.xml        |   3 +-
 .../arago-scarthgap-flutter-config.xml        |   3 +-
 src/configs/arago-scarthgap-next-config.xml   |   3 +-
 .../arago-scarthgap-selinux-config.xml        |   3 +-
 src/configs/arago-scarthgap-wip-config.xml    |   3 +-
 .../coresdk/coresdk-09.00.00.006-config.xml   |   3 +-
 .../coresdk/coresdk-09.00.00.007-config.xml   |   3 +-
 .../coresdk/coresdk-09.00.00.011-config.xml   |   3 +-
 .../coresdk/coresdk-09.01.00.001-config.xml   |   3 +-
 .../coresdk/coresdk-09.01.00.003-config.xml   |   3 +-
 .../coresdk/coresdk-09.01.00.007-config.xml   |   3 +-
 .../coresdk/coresdk-09.01.00.008-config.xml   |   3 +-
 .../coresdk/coresdk-09.02.00.008-config.xml   |   3 +-
 .../coresdk/coresdk-09.02.00.009-config.xml   |   3 +-
 .../coresdk/coresdk-09.02.00.010-config.xml   |   3 +-
 .../coresdk/coresdk-09.03.05-config.xml       |   3 +-
 .../coresdk/coresdk-10.00.07-config.xml       |   3 +-
 .../coresdk/coresdk-10.01.08-config.xml       |   3 +-
 .../coresdk/coresdk-10.01.10-config.xml       |   3 +-
 .../coresdk-10.01.10-selinux-config.xml       |   3 +-
 .../coresdk/coresdk-11.00.09-config.xml       |   3 +-
 .../coresdk/coresdk-11.00.15-config.xml       |   3 +-
 .../coresdk/coresdk-11.01.05-config.xml       |   3 +-
 .../coresdk/coresdk-11.01.08-config.xml       |   3 +-
 src/configs/distroless-kirkstone-config.xml   |   1 +
 src/configs/distroless-master-config.xml      |   1 +
 src/configs/distroless-scarthgap-config.xml   |   1 +
 src/configs/poky-kirkstone-config.xml         |   3 +-
 src/configs/poky-master-config.xml            |   3 +-
 src/configs/poky-master-wip-config.xml        |   3 +-
 src/configs/poky-scarthgap-config.xml         |   3 +-
 src/configs/poky-scarthgap-wip-config.xml     |   3 +-
 ...rocessor-sdk-analytics-09.00.00-config.xml |   3 +-
 ...rocessor-sdk-analytics-09.00.01-config.xml |   3 +-
 ...rocessor-sdk-analytics-09.01.00-config.xml |   3 +-
 ...rocessor-sdk-analytics-09.02.00-config.xml |   3 +-
 ...rocessor-sdk-analytics-10.00.00-config.xml |   3 +-
 ...rocessor-sdk-analytics-10.01.00-config.xml |   3 +-
 ...rocessor-sdk-analytics-11.00.00-config.xml |   3 +-
 ...essor-sdk-analytics-11.01.07.05-config.xml |   3 +-
 ...k-analytics-selinux-11.01.07.05-config.xml |   3 +-
 .../processor-sdk-gateway-10_00.xml           |   3 +-
 .../processor-sdk-linux-09_00_00_06.xml       |   3 +-
 .../processor-sdk-linux-09_00_00_07.xml       |   3 +-
 .../processor-sdk-linux-09_01_00_06.xml       |   3 +-
 .../processor-sdk-linux-09_01_00_07.xml       |   3 +-
 .../processor-sdk-linux-09_02_00_04.xml       |   3 +-
 .../processor-sdk-linux-09_02_00_05.xml       |   3 +-
 .../processor-sdk-linux-09_03_06_05.xml       |   3 +-
 .../processor-sdk-linux-10_00_07_06.xml       |   3 +-
 .../processor-sdk-linux-10_00_08_06.xml       |   3 +-
 .../processor-sdk-linux-10_01_08_01.xml       |   3 +-
 .../processor-sdk-linux-11_00_10_01.xml       |   3 +-
 ...rocessor-sdk-09.00.00-am62xxsip-config.xml |   3 +-
 .../processor-sdk-09.00.00-config.xml         |   3 +-
 .../processor-sdk-09.01.00-am65xx-config.xml  |   3 +-
 .../processor-sdk-09.01.00-config.xml         |   3 +-
 .../processor-sdk-09.01.00-legacy-config.xml  |   3 +-
 ...processor-sdk-09.02.00.08-am64x-config.xml |   3 +-
 ...rocessor-sdk-09.03.05.02-legacy-config.xml |   3 +-
 ...ocessor-sdk-11.00.05.02-am62lxx-config.xml |   3 +-
 ...ocessor-sdk-11.00.15.05-am62lxx-config.xml |   3 +-
 ...essor-sdk-kirkstone-09.02.01.09-config.xml |   3 +-
 ...essor-sdk-kirkstone-09.02.01.10-config.xml |   3 +-
 ...-kirkstone-chromium-09.02.01.09-config.xml |   3 +-
 ...-kirkstone-chromium-09.02.01.10-config.xml |   3 +-
 ...essor-sdk-scarthgap-10.00.07.04-config.xml |   3 +-
 ...essor-sdk-scarthgap-10.01.10.04-config.xml |   3 +-
 ...essor-sdk-scarthgap-11.00.09.04-config.xml |   3 +-
 ...essor-sdk-scarthgap-11.01.05.03-config.xml |   3 +-
 ...-scarthgap-chromium-10.00.07.04-config.xml |   3 +-
 ...-scarthgap-chromium-10.01.10.04-config.xml |   3 +-
 ...-scarthgap-chromium-11.00.09.04-config.xml |   3 +-
 ...-scarthgap-chromium-11.01.05.03-config.xml |   3 +-
 ...-scarthgap-chromium-11.01.12.10-config.xml |   3 +-
 ...sdk-scarthgap-nonqt-11.01.05.03-config.xml |   3 +-
 ...k-scarthgap-selinux-11.00.09.04-config.xml |   3 +-
 ...k-scarthgap-selinux-11.01.05.03-config.xml |   3 +-
 src/templates/local-arago64-v2.conf.xml       |   2 +
 src/templates/local-arago64-v3.conf.xml       |   2 +
 src/templates/local-poky-v2.conf.xml          |   2 +
 src/templates/local-poky-v3.conf.xml          |   2 +
 src/templates/local-v2.conf.xml               |   2 +
 src/templates/local-v3.conf.xml               |   2 +
 src/xslt/bitbake-setup-bblayers-conf.xslt     |  45 ----
 src/xslt/bitbake-setup-conf-notes.xslt        |  32 ---
 src/xslt/bitbake-setup-conf-summary.xslt      |   9 -
 src/xslt/bitbake-setup-config-localconf.xslt  |  20 ++
 src/xslt/bitbake-setup-local-conf.xslt        |  34 ---
 ...=> bitbake-setup-localconf-templates.xslt} |  11 +-
 src/xslt/bitbake-setup.xslt                   |  82 ++++++-
 src/xslt/kas.xslt                             |   4 +-
 593 files changed, 4781 insertions(+), 21411 deletions(-)
 rename bitbake-setup/{coresdk_coresdk-09.00.00.006-config.json => coresdk/coresdk-09.00.00.006-config.json} (50%)
 rename bitbake-setup/{coresdk_coresdk-09.00.00.007-config.json => coresdk/coresdk-09.00.00.007-config.json} (50%)
 rename bitbake-setup/{coresdk_coresdk-09.00.00.011-config.json => coresdk/coresdk-09.00.00.011-config.json} (50%)
 create mode 100644 bitbake-setup/coresdk/coresdk-09.01.00.001-config.json
 create mode 100644 bitbake-setup/coresdk/coresdk-09.01.00.003-config.json
 create mode 100644 bitbake-setup/coresdk/coresdk-09.01.00.007-config.json
 create mode 100644 bitbake-setup/coresdk/coresdk-09.01.00.008-config.json
 rename bitbake-setup/{coresdk_coresdk-09.02.00.008-config.json => coresdk/coresdk-09.02.00.008-config.json} (52%)
 rename bitbake-setup/{coresdk_coresdk-09.02.00.009-config.json => coresdk/coresdk-09.02.00.009-config.json} (52%)
 rename bitbake-setup/{coresdk_coresdk-09.02.00.010-config.json => coresdk/coresdk-09.02.00.010-config.json} (52%)
 rename bitbake-setup/{coresdk_coresdk-09.03.05-config.json => coresdk/coresdk-09.03.05-config.json} (52%)
 rename bitbake-setup/{coresdk_coresdk-10.00.07-config.json => coresdk/coresdk-10.00.07-config.json} (51%)
 rename bitbake-setup/{coresdk_coresdk-10.01.08-config.json => coresdk/coresdk-10.01.08-config.json} (51%)
 rename bitbake-setup/{coresdk_coresdk-10.01.10-config.json => coresdk/coresdk-10.01.10-config.json} (51%)
 rename bitbake-setup/{coresdk_coresdk-10.01.10-selinux-config.json => coresdk/coresdk-10.01.10-selinux-config.json} (53%)
 rename bitbake-setup/{coresdk_coresdk-11.00.09-config.json => coresdk/coresdk-11.00.09-config.json} (51%)
 rename bitbake-setup/{coresdk_coresdk-11.00.15-config.json => coresdk/coresdk-11.00.15-config.json} (51%)
 rename bitbake-setup/{coresdk_coresdk-11.01.05-config.json => coresdk/coresdk-11.01.05-config.json} (54%)
 rename bitbake-setup/{coresdk_coresdk-11.01.08-config.json => coresdk/coresdk-11.01.08-config.json} (54%)
 delete mode 100644 bitbake-setup/coresdk_coresdk-09.01.00.001-config.json
 delete mode 100644 bitbake-setup/coresdk_coresdk-09.01.00.003-config.json
 delete mode 100644 bitbake-setup/coresdk_coresdk-09.01.00.007-config.json
 delete mode 100644 bitbake-setup/coresdk_coresdk-09.01.00.008-config.json
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json => processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json} (54%)
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json => processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json} (54%)
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json => processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json} (54%)
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json => processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json} (54%)
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json => processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json} (54%)
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-10.01.00-config.json => processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json} (56%)
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-11.00.00-config.json => processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json} (56%)
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config.json => processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json} (57%)
 rename bitbake-setup/{processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config.json => processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json} (58%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-gateway-10_00.json => processor-sdk-linux/processor-sdk-gateway-10_00.json} (53%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_00_00_06.json => processor-sdk-linux/processor-sdk-linux-09_00_00_06.json} (53%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_00_00_07.json => processor-sdk-linux/processor-sdk-linux-09_00_00_07.json} (53%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_01_00_06.json => processor-sdk-linux/processor-sdk-linux-09_01_00_06.json} (51%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_01_00_07.json => processor-sdk-linux/processor-sdk-linux-09_01_00_07.json} (51%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_02_00_04.json => processor-sdk-linux/processor-sdk-linux-09_02_00_04.json} (55%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_02_00_05.json => processor-sdk-linux/processor-sdk-linux-09_02_00_05.json} (55%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-09_03_06_05.json => processor-sdk-linux/processor-sdk-linux-09_03_06_05.json} (54%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-10_00_07_06.json => processor-sdk-linux/processor-sdk-linux-10_00_07_06.json} (54%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-10_00_08_06.json => processor-sdk-linux/processor-sdk-linux-10_00_08_06.json} (54%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-10_01_08_01.json => processor-sdk-linux/processor-sdk-linux-10_01_08_01.json} (54%)
 rename bitbake-setup/{processor-sdk-linux_processor-sdk-linux-11_00_10_01.json => processor-sdk-linux/processor-sdk-linux-11_00_10_01.json} (56%)
 rename bitbake-setup/{processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json => processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json} (54%)
 rename bitbake-setup/{processor-sdk_processor-sdk-09.00.00-config.json => processor-sdk/processor-sdk-09.00.00-config.json} (54%)
 rename bitbake-setup/{processor-sdk_processor-sdk-09.01.00-am65xx-config.json => processor-sdk/processor-sdk-09.01.00-am65xx-config.json} (52%)
 rename bitbake-setup/{processor-sdk_processor-sdk-09.01.00-config.json => processor-sdk/processor-sdk-09.01.00-config.json} (54%)
 rename bitbake-setup/{processor-sdk_processor-sdk-09.01.00-legacy-config.json => processor-sdk/processor-sdk-09.01.00-legacy-config.json} (52%)
 rename bitbake-setup/{processor-sdk_processor-sdk-09.02.00.08-am64x-config.json => processor-sdk/processor-sdk-09.02.00.08-am64x-config.json} (54%)
 rename bitbake-setup/{processor-sdk_processor-sdk-09.03.05.02-legacy-config.json => processor-sdk/processor-sdk-09.03.05.02-legacy-config.json} (52%)
 rename bitbake-setup/{processor-sdk_processor-sdk-11.00.05.02-am62lxx-config.json => processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json} (52%)
 rename bitbake-setup/{processor-sdk_processor-sdk-11.00.15.05-am62lxx-config.json => processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json} (51%)
 rename bitbake-setup/{processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json => processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json} (56%)
 rename bitbake-setup/{processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json => processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json} (56%)
 rename bitbake-setup/{processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json => processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json} (58%)
 rename bitbake-setup/{processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json => processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json} (58%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json => processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json} (54%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.json => processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json} (54%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-11.00.09.04-config.json => processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json} (53%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-11.01.05.03-config.json => processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json} (55%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json => processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json} (57%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config.json => processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json} (57%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config.json => processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json} (55%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config.json => processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json} (57%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config.json => processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json} (57%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config.json => processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json} (53%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config.json => processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json} (54%)
 rename bitbake-setup/{processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config.json => processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json} (56%)
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
 rename conf/{templates/arago-kirkstone-chromium-config/local.conf.sample => fragments/localconf/local-arago64-v2.conf} (97%)
 rename conf/{templates/arago-master-config/local.conf.sample => fragments/localconf/local-arago64-v3.conf} (97%)
 rename conf/{templates/poky-kirkstone-config/local.conf.sample => fragments/localconf/local-poky-v2.conf} (97%)
 rename conf/{templates/poky-master-config/local.conf.sample => fragments/localconf/local-poky-v3.conf} (97%)
 rename conf/{templates/distroless-kirkstone-config/local.conf.sample => fragments/localconf/local-v2.conf} (97%)
 rename conf/{templates/distroless-master-config/local.conf.sample => fragments/localconf/local-v3.conf} (97%)
 delete mode 100644 conf/templates/arago-kirkstone-chromium-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-kirkstone-chromium-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-kirkstone-chromium-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-kirkstone-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-kirkstone-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-kirkstone-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-kirkstone-config/local.conf.sample
 delete mode 100644 conf/templates/arago-kirkstone-next-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-kirkstone-next-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-kirkstone-next-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-kirkstone-next-config/local.conf.sample
 delete mode 100644 conf/templates/arago-kirkstone-wip-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-kirkstone-wip-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-kirkstone-wip-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-kirkstone-wip-config/local.conf.sample
 delete mode 100644 conf/templates/arago-master-chromium-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-master-chromium-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-master-chromium-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-master-chromium-config/local.conf.sample
 delete mode 100644 conf/templates/arago-master-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-master-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-master-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-master-flutter-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-master-flutter-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-master-flutter-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-master-flutter-config/local.conf.sample
 delete mode 100644 conf/templates/arago-master-next-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-master-next-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-master-next-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-master-next-config/local.conf.sample
 delete mode 100644 conf/templates/arago-master-selinux-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-master-selinux-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-master-selinux-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-master-selinux-config/local.conf.sample
 delete mode 100644 conf/templates/arago-master-wip-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-master-wip-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-master-wip-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-master-wip-config/local.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-10x-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-scarthgap-10x-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-scarthgap-10x-config/local.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-10x-next-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-scarthgap-10x-next-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-scarthgap-10x-next-config/local.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-chromium-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-scarthgap-chromium-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-scarthgap-chromium-config/local.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-scarthgap-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-scarthgap-config/local.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-flutter-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-flutter-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-scarthgap-flutter-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-scarthgap-flutter-config/local.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-next-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-scarthgap-next-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-scarthgap-next-config/local.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-selinux-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-scarthgap-selinux-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-scarthgap-selinux-config/local.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-wip-config/bblayers.conf.sample
 delete mode 100644 conf/templates/arago-scarthgap-wip-config/conf-notes.txt
 delete mode 100644 conf/templates/arago-scarthgap-wip-config/conf-summary.txt
 delete mode 100644 conf/templates/arago-scarthgap-wip-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.006-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.006-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.006-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.006-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.007-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.007-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.007-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.007-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.011-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.011-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.011-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.00.00.011-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.001-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.001-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.001-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.001-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.003-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.003-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.003-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.003-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.007-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.007-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.007-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.007-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.008-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.008-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.008-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.01.00.008-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.008-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.008-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.008-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.008-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.009-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.009-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.009-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.009-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.010-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.010-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.010-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.02.00.010-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.03.05-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-09.03.05-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.03.05-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-09.03.05-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-10.00.07-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-10.00.07-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-10.00.07-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-10.00.07-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.08-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.08-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.08-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.08-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.10-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.10-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.10-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.10-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.10-selinux-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.10-selinux-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.10-selinux-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-10.01.10-selinux-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-11.00.09-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-11.00.09-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-11.00.09-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-11.00.09-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-11.00.15-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-11.00.15-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-11.00.15-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-11.00.15-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-11.01.05-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-11.01.05-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-11.01.05-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-11.01.05-config/local.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-11.01.08-config/bblayers.conf.sample
 delete mode 100644 conf/templates/coresdk_coresdk-11.01.08-config/conf-notes.txt
 delete mode 100644 conf/templates/coresdk_coresdk-11.01.08-config/conf-summary.txt
 delete mode 100644 conf/templates/coresdk_coresdk-11.01.08-config/local.conf.sample
 delete mode 100644 conf/templates/distroless-kirkstone-config/bblayers.conf.sample
 delete mode 100644 conf/templates/distroless-kirkstone-config/conf-notes.txt
 delete mode 100644 conf/templates/distroless-kirkstone-config/conf-summary.txt
 delete mode 100644 conf/templates/distroless-master-config/bblayers.conf.sample
 delete mode 100644 conf/templates/distroless-master-config/conf-notes.txt
 delete mode 100644 conf/templates/distroless-master-config/conf-summary.txt
 delete mode 100644 conf/templates/distroless-scarthgap-config/bblayers.conf.sample
 delete mode 100644 conf/templates/distroless-scarthgap-config/conf-notes.txt
 delete mode 100644 conf/templates/distroless-scarthgap-config/conf-summary.txt
 delete mode 100644 conf/templates/distroless-scarthgap-config/local.conf.sample
 delete mode 100644 conf/templates/poky-kirkstone-config/bblayers.conf.sample
 delete mode 100644 conf/templates/poky-kirkstone-config/conf-notes.txt
 delete mode 100644 conf/templates/poky-kirkstone-config/conf-summary.txt
 delete mode 100644 conf/templates/poky-master-config/bblayers.conf.sample
 delete mode 100644 conf/templates/poky-master-config/conf-notes.txt
 delete mode 100644 conf/templates/poky-master-config/conf-summary.txt
 delete mode 100644 conf/templates/poky-master-wip-config/bblayers.conf.sample
 delete mode 100644 conf/templates/poky-master-wip-config/conf-notes.txt
 delete mode 100644 conf/templates/poky-master-wip-config/conf-summary.txt
 delete mode 100644 conf/templates/poky-master-wip-config/local.conf.sample
 delete mode 100644 conf/templates/poky-scarthgap-config/bblayers.conf.sample
 delete mode 100644 conf/templates/poky-scarthgap-config/conf-notes.txt
 delete mode 100644 conf/templates/poky-scarthgap-config/conf-summary.txt
 delete mode 100644 conf/templates/poky-scarthgap-config/local.conf.sample
 delete mode 100644 conf/templates/poky-scarthgap-wip-config/bblayers.conf.sample
 delete mode 100644 conf/templates/poky-scarthgap-wip-config/conf-notes.txt
 delete mode 100644 conf/templates/poky-scarthgap-wip-config/conf-summary.txt
 delete mode 100644 conf/templates/poky-scarthgap-wip-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-10.01.00-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-11.00.00-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-11.00.00-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-11.00.00-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-11.00.00-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-11.01.07.05-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-analytics_processor-sdk-analytics-selinux-11.01.07.05-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-gateway-10_00/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_06/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_00_00_07/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_06/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_01_00_07/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_04/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_02_00_05/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_03_06_05/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_03_06_05/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_03_06_05/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-09_03_06_05/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_07_06/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_00_08_06/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-10_01_08_01/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-11_00_10_01/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-11_00_10_01/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-11_00_10_01/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk-linux_processor-sdk-linux-11_00_10_01/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.00.00-am62xxsip-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.00.00-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.00.00-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.00.00-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.00.00-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-am65xx-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.01.00-legacy-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.02.00.08-am64x-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-09.03.05.02-legacy-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-11.00.05.02-am62lxx-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-11.00.05.02-am62lxx-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-11.00.05.02-am62lxx-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-11.00.05.02-am62lxx-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-11.00.15.05-am62lxx-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-11.00.15.05-am62lxx-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-11.00.15.05-am62lxx-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-11.00.15.05-am62lxx-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-11.00.09.04-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-11.00.09.04-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-11.00.09.04-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-11.00.09.04-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-11.01.05.03-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-11.01.05.03-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-11.01.05.03-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-11.01.05.03-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.00.09.04-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.05.03-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-11.01.12.10-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-nonqt-11.01.05.03-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-selinux-11.00.09.04-config/local.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config/bblayers.conf.sample
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config/conf-notes.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config/conf-summary.txt
 delete mode 100644 conf/templates/processor-sdk_processor-sdk-scarthgap-selinux-11.01.05.03-config/local.conf.sample
 create mode 100644 src/common/distro_arago.xml
 create mode 100644 src/common/distro_poky.xml
 create mode 100644 src/common/machines.xml
 delete mode 100644 src/common/targets_arago.xml
 delete mode 100644 src/common/targets_poky.xml
 delete mode 100644 src/xslt/bitbake-setup-bblayers-conf.xslt
 delete mode 100644 src/xslt/bitbake-setup-conf-notes.xslt
 delete mode 100644 src/xslt/bitbake-setup-conf-summary.xslt
 create mode 100644 src/xslt/bitbake-setup-config-localconf.xslt
 delete mode 100644 src/xslt/bitbake-setup-local-conf.xslt
 copy src/xslt/{oe-layersetup-templates.xslt => bitbake-setup-localconf-templates.xslt} (64%)

-- 
2.17.1


