Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFC7C7EE43
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 11:56:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.11405.1686311760759481113
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 04:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YVq10tj4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359Bu0LF027583
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 06:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686311760;
	bh=zF2FQGzUlXtyzuVkOc7B7BGV8Y3o/b2HYGT9C79vMDM=;
	h=From:To:CC:Subject:Date;
	b=YVq10tj4HKZ2q++TauVw30koawqUgtIHwFH4lqzW6RWRTN31Y88VjZT/BvtMWdtzF
	 sdYmlxsi8rBD5fg7tEOQm54Gc/j7eXtXq/r+WD5vRfTZ0t7UQqQ8zYOuYlO1ip5Gr1
	 L3v7gI4+x+nQgGu4O1gJmzPVYIfmv14NkVPqZb9I=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359Bu03v017079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 06:56:00 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 06:55:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 06:55:59 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359BtvaX022050;
	Fri, 9 Jun 2023 06:55:58 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <g-gupta@ti.com>, <r-gunasekaran@ti.com>
Subject: [master/kirkstone 0/3] Introduce sysrepo based parser app
Date: Fri, 9 Jun 2023 17:25:54 +0530
Message-ID: <20230609115557.1685-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 11:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14565

NETCONF protocol defines a mechanism for device management,
retrieving configuration information and modifying device with
new configuration data.

YANG is a data modelling language used to model configuration
and state data manipulated by the NETCONF.

NETCONF/YANG is realized through netopeer and sysrepo. A yocto project
for the same exists [0].

[0] is a fork of [1] with support added for Kirstone. I have sent a
pull request for it and it is yet to be acknowledged.

NETCONF/YANG support was added in SDK 8.6 and the changeset were added
in meta-processor-sdk. But since it was concluded that it is generic
networking feature, moving this to meta-arago.

I plan to send two more patches once this series is accepted
1) A URL for the meta-sysrepo [0] in oe-layersetup/configs/arago-kirkstone-next-config.txt
2) Add the required package name in tisdk-default-image.bb in meta-arago

[0] - https://github.com/ravig07/meta-sysrepo/tree/kirkstone
[1] - https://github.com/sartura/meta-sysrepo

Ravi Gunasekaran (3):
  meta-aragos-extras: sysrepo: Add TSN Yang models
  meta-aragos-extras: sysrepo: Add .bbappend for netopeer2
  meta-aragos-extras: sysrepo: Introduce nw-configurator app

 .../0001-Add-EST-Yang-Models.patch            |  17 +
 .../netopeer2-server_git.bbappend             |   6 +
 .../nw-configurator/files/nw-configurator.c   | 409 ++++++++++++++++++
 .../nw-configurator/nw-configurator.bb        |  25 ++
 .../tsn-yang-models/tsn-yang-models_git.bb    |  25 ++
 5 files changed, 482 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
 create mode 100644 meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-configurator.c
 create mode 100644 meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
 create mode 100644 meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb


base-commit: d36947b9f99c4428f125e7b9b8612256e9fd87df
-- 
2.17.1


