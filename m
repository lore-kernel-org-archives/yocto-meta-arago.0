Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4E0EB64DC
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 09:18:15 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6747.1687339088642992840
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 02:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HD631G6J;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35L9I4vF039161;
	Wed, 21 Jun 2023 04:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687339084;
	bh=3caWfvbzCdwME5N9SR4eBmDpyDx7wH+/lEqPfDNsR5g=;
	h=From:To:CC:Subject:Date;
	b=HD631G6JRsq2BEk4NP4+a0oqX3SvNG4eFmxXg9I7RSIGSLFye+TMCRJdydzYiRk4R
	 WOH2l6N9KZ0DkS1xwTSfOs1ja9NZSDnDjTn8sqnCb2mDnKXT170aT1uEcLl5gFATlO
	 KKTxOOmbX/KIxqD3R1MmUnWIGLoju4Ai1Ij3qDPs=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35L9I4cY020944
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 04:18:04 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 04:18:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 04:18:04 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35L9I2AK058227;
	Wed, 21 Jun 2023 04:18:02 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>
Subject: [master/kirkstone 0/3] Add meta-sysrepo recipes
Date: Wed, 21 Jun 2023 14:47:58 +0530
Message-ID: <20230621091801.14944-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jun 2023 09:18:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14666

This series adds the meta-sysrepo recipes to meta-arago-extras
layer and adds the associated netopeer2/sysrepo packages.

Ravi Gunasekaran (3):
  meta-arago-extras: sysrepo: Update checksum for nw-configurator
  meta-arago-extras: sysrepo: Add meta-sysrepo recipes
  tisdk-default-image: Add packages to support NETCONF/YANG

 .../images/tisdk-default-image.bb             |  7 +-
 meta-arago-extras/recipes-sysrepo/README.md   | 85 +++++++++++++++++++
 .../libnetconf2/libnetconf2_git.bb            | 24 ++++++
 .../libredblack/libredblack_git.bb            | 21 +++++
 .../recipes-sysrepo/libssh/libssh_0.9.5.bb    | 35 ++++++++
 .../recipes-sysrepo/libyang/libyang_git.bb    | 23 +++++
 .../netopeer2-server/netopeer2-server         | 36 ++++++++
 .../netopeer2-server/netopeer2-server_git.bb  | 32 +++++++
 .../nw-configurator/nw-configurator.bb        |  2 +-
 .../0001-so-version.patch                     | 12 +++
 .../sysrepo-plugins-common_git.bb             | 27 ++++++
 .../recipes-sysrepo/sysrepo/sysrepo/sysrepo   | 52 ++++++++++++
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 35 ++++++++
 13 files changed, 389 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-sysrepo/README.md
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


