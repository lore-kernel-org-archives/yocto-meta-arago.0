Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D68EEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 10:34:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.8136.1687430093054620141
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 03:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vMb629sy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MAYmHt117911;
	Thu, 22 Jun 2023 05:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687430088;
	bh=L4S9GTCGHWp5OUAv01/lsCWtjvi3DtKQws9Uz51N4ws=;
	h=From:To:CC:Subject:Date;
	b=vMb629sybeo9jWgNbpwWPUTv8VqH+toeB9OBm56qdleHbUn/akJSjN1fBlTgeKkJz
	 5RJ1HJgWGD+ue8ei1W3gTXHUCg49FL10qRsG750tCTA9buUJMHT51be2EgnQqbFLiP
	 zjwFschte89brDDvt20zk6TddXqoKrRkU3o6gDo4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MAYmfl020306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 05:34:48 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 05:34:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 05:34:48 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MAYjlL061303;
	Thu, 22 Jun 2023 05:34:46 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v2 0/3] Add meta-sysrepo recipes
Date: Thu, 22 Jun 2023 16:04:42 +0530
Message-ID: <20230622103445.31114-1-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jun 2023 10:34:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14674

This series adds the meta-sysrepo recipes to meta-arago-extras
layer and a new package group to support sysrepo.

Changes since v1:
----------------
Added a new package group packagegroup-arago-tisdk-sysrepo instead of
using ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL.

Ravi Gunasekaran (3):
  meta-arago-extras: sysrepo: Update checksum for nw-configurator
  meta-arago-extras: sysrepo: Add meta-sysrepo recipes
  tisdk-default-image: Add package group for netopeer/sysrepo

 .../images/tisdk-default-image.bb             |  1 +
 .../packagegroup-arago-tisdk-sysrepo.bb       | 17 ++++
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
 14 files changed, 401 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
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


