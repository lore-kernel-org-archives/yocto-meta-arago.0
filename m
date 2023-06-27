Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A302AC0015E
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:03:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9350.1687860232701093012
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 03:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Wldtitpi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3nMr093101;
	Tue, 27 Jun 2023 05:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687860229;
	bh=dYvtPPJyrN799hkyUjYnytMlkaSVLUB9PPqFSlatLio=;
	h=From:To:CC:Subject:Date;
	b=WldtitpiJipJuvS+5QEobfor4/ITqAavQefy2Pzb5rjdL+vZnibVbTFzN00a69Sc4
	 jUlIEZMCrpMzoXyuarM0bFC/BRgoLX8VIEHzE5I3N1poSj0ZWCEq8cDcPzflkEi5Yx
	 s1XnOIxAOknDVTOfssKP6zbn8/fy2Dlx2XzcC6qg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RA3nkE019304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 05:03:49 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:03:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:03:48 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3klZ115122;
	Tue, 27 Jun 2023 05:03:46 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v3 0/8] Add meta-sysrepo recipes
Date: Tue, 27 Jun 2023 15:33:37 +0530
Message-ID: <20230627100345.24340-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 10:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14695

This series adds the meta-sysrepo recipes to meta-arago-extras
layer and a new package group to support sysrepo.

Changes since v2:
----------------
1) Updated nw-configurator.bb by limiting check sum to only
the license part of the source code

2) Added the recipes from [1] as separate patch.
Patches [2/8] to [7/8] introduced in this series

3) Removed "PACKAGE_ARCH" from the packagegroup-arago-tisdk-sysrepo.bb

[1] - https://github.com/sartura/meta-sysrepo

Changes since v1:
----------------
Added a new package group packagegroup-arago-tisdk-sysrepo instead of
using ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL.

Ravi Gunasekaran (8):
  meta-arago-extras: sysrepo: Update checksum for nw-configurator
  meta-arago-extras: sysrepo: Add libssh recipe needed for sysrepo
  meta-arago-extras: sysrepo: Add libyang recipe needed for sysrepo
  meta-arago-extras: sysrepo: Add libnetconf recipe neede for sysrepo
  meta-arago-extras: sysrepo: Add libredblack needed for sysrepo
  meta-arago-extras: sysrepo: Add sysrepo and sysrepo plugins
  meta-arago-extras: sysrepo: Add netopeer2 recipe
  tisdk-default-image: Add package group for netopeer/sysrepo

 .../images/tisdk-default-image.bb             |  1 +
 .../packagegroup-arago-tisdk-sysrepo.bb       | 15 ++++++
 .../libnetconf2/libnetconf2_git.bb            | 24 +++++++++
 .../libredblack/libredblack_git.bb            | 21 ++++++++
 .../recipes-sysrepo/libssh/libssh_0.9.5.bb    | 35 +++++++++++++
 .../recipes-sysrepo/libyang/libyang_git.bb    | 23 +++++++++
 .../netopeer2-server/netopeer2-server         | 35 +++++++++++++
 .../netopeer2-server/netopeer2-server_git.bb  | 31 +++++++++++
 .../nw-configurator/nw-configurator.bb        |  5 +-
 .../0001-so-version.patch                     | 12 +++++
 .../sysrepo-plugins-common_git.bb             | 26 ++++++++++
 .../recipes-sysrepo/sysrepo/sysrepo/sysrepo   | 51 +++++++++++++++++++
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 34 +++++++++++++
 13 files changed, 311 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-server
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb

-- 
2.17.1


