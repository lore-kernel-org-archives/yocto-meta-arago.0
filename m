Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C68C48BC1
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:57:20 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.13210.1707760632633798515
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 09:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q9ecJxpY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CHvA9V091448;
	Mon, 12 Feb 2024 11:57:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707760630;
	bh=dNP9g92H0fPZsA6uo7MWXjklJ6n/HEDkIieNVFula2Q=;
	h=From:To:CC:Subject:Date;
	b=q9ecJxpYDEJnojULgr/sTjgPZoKrY1hupXSEn4f3/fnGUIc7tClnm25+IZIGjnPrk
	 EsGw2bYTJf6Wi92J4XYA02U9aKAcW6Avdqk4sQGl+ELeex5cGmV/N7p97MU3+zV6K6
	 TF4p2+VvOKZSTp/CKguuCko6qWJiMouHGB437I5g=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CHvAJs020889
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 11:57:10 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 11:57:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 11:57:10 -0600
Received: from uda0500640.dal.design.ti.com (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CHv7cX116944;
	Mon, 12 Feb 2024 11:57:07 -0600
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <r-gunasekaran@ti.com>, <srk@ti.com>, <c-shilwant@ti.com>
Subject: [master/kirkstone][PATCH v3 0/2] Add systemd service for sysrepo and netopeer
Date: Mon, 12 Feb 2024 23:27:04 +0530
Message-ID: <20240212175706.27950-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 17:57:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15168

This series introduces unit files needed to start sysrepo and netopeer under
systemd. While adding this change, I have also updated the recipes in
recipes-sysrepo to use yocto variables

Changes since v2:
----------------
* Introduced new patch [1/2] to fix the yocto variables

Changes since v1:
----------------
* Use Yocto installation variables for /etc/ and /usr/lib

v2: https://lore.kernel.org/yocto-meta-arago/20240212075433.24446-1-r-gunasekaran@ti.com/
v1: https://lore.kernel.org/yocto-meta-arago/20240209103337.25332-1-r-gunasekaran@ti.com/

Ravi Gunasekaran (2):
  meta-arago-extras: sysrepo: Adopt Yocto variable names
  meta-arago-extras: sysrepo: Update netopeer and sysrepo to start under
    systemd

 .../libnetconf2/libnetconf2_git.bb            |  2 +-
 .../recipes-sysrepo/libyang/libyang_git.bb    |  2 +-
 .../netopeer2-serverd.service                 | 29 +++++++++++++++
 .../netopeer2-server/netopeer2-server_git.bb  | 34 ++++++++++++-----
 .../sysrepo/sysrepo/sysrepod.service          | 37 +++++++++++++++++++
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 37 ++++++++++++++-----
 .../tsn-yang-models/tsn-yang-models_git.bb    | 16 ++++----
 7 files changed, 128 insertions(+), 29 deletions(-)
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-serverd.service
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.service


base-commit: db4752d19a46406683f4a4adf8187de8075b70b6
-- 
2.17.1


