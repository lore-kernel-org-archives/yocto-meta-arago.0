Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B964C36005
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.60683.1742236646513738411
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sQixJuPG;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPUf2373284
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 13:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236645;
	bh=GyFXv1n+I8YMGklzPPccGJk+col4MI017e3bTAJ1XdM=;
	h=From:To:Subject:Date;
	b=sQixJuPGl90a5lUxXUhNtnVbfaedxRRFunNLHdN2lIkxQN2lCGvQqnvZ0/2g1tbdS
	 Dk7uwo6eYbYmvDK4gTi5KrUCIZ754MKVnVFMbsTSsbEN3VOGwNG8UWqtTj+vbrAtcb
	 bKhfrvzD5WOaYfS8v9npkL4qnmDG+tM4hotL61Hw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPZY020798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbOLa000451;
	Mon, 17 Mar 2025 13:37:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL2-0008E2-G5; Mon, 17 Mar 2025 13:37:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 00/14] Update and cleanup sysrepo packages
Date: Mon, 17 Mar 2025 13:37:09 -0500
Message-ID: <20250317183724.31563-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 18:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16061

Update all of the sysrepo related packages to their latest versions and
clean them up.  The recipes were all moved under recipes-extended
instead of recipes-sysrepo, and various things caught by
yocto-check-layer were fixed.

Denys Dmytriyenko (8):
  sysrepo: move and clean up
  sysrepo-plugins-common: move and clean up
  libyang: move bbappend
  libnetconf2: move and clean up
  libredblack: move and clean up
  nw-configurator: move and clean up
  tsn-yang-models: move and clean up
  netopeer2-server: move and clean up

Ryan Eatmon (6):
  libnetconf2: Wrap libpam dependency
  libyang: Remove recipe in favor of newer upstream version
  libyang: Add BBCLASSEXTEND for native
  libnetconf2: Update to version 3.5.5
  sysrepo: Update to version 3.3.10
  netopeer2-server: Update to version 2.2.35

 .../sysrepo/libnetconf2_git.bb                | 25 +++++++++
 .../sysrepo}/libredblack_git.bb               |  6 +--
 .../sysrepo/libyang_%.bbappend                |  1 +
 .../0001-Add-EST-Yang-Models.patch            |  8 +--
 .../netopeer2-server/netopeer2-server         |  0
 .../netopeer2-serverd.service                 |  0
 .../sysrepo/netopeer2-server_git.bb           | 53 +++++++++++++++++++
 .../sysrepo}/nw-configurator.bb               |  4 +-
 .../nw-configurator}/nw-configurator.c        |  0
 .../0001-so-version.patch                     |  0
 .../sysrepo/sysrepo-plugins-common_git.bb     | 17 ++++++
 ...-Hardcode-correct-path-to-tar-binary.patch |  4 +-
 .../sysrepo/sysrepo/sysrepo                   |  0
 .../sysrepo/sysrepo/sysrepod.service          |  0
 .../sysrepo/sysrepo_git.bb                    | 46 ++++++++--------
 .../sysrepo}/tsn-yang-models_git.bb           |  2 -
 .../libnetconf2/libnetconf2_git.bb            | 24 ---------
 .../recipes-sysrepo/libyang/libyang_git.bb    | 23 --------
 .../netopeer2-server/netopeer2-server_git.bb  | 47 ----------------
 .../netopeer2-server_git.bbappend             |  5 --
 .../sysrepo-plugins-common_git.bb             | 26 ---------
 21 files changed, 129 insertions(+), 162 deletions(-)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
 rename meta-arago-extras/{recipes-sysrepo/libredblack => recipes-extended/sysrepo}/libredblack_git.bb (62%)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/0001-Add-EST-Yang-Models.patch (83%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/netopeer2-server (100%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/netopeer2-serverd.service (100%)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator => recipes-extended/sysrepo}/nw-configurator.bb (84%)
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator/files => recipes-extended/sysrepo/nw-configurator}/nw-configurator.c (100%)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended/sysrepo}/sysrepo-plugins-common/0001-so-version.patch (100%)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended}/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch (88%)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended}/sysrepo/sysrepo/sysrepo (100%)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended}/sysrepo/sysrepo/sysrepod.service (100%)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended}/sysrepo/sysrepo_git.bb (50%)
 rename meta-arago-extras/{recipes-sysrepo/tsn-yang-models => recipes-extended/sysrepo}/tsn-yang-models_git.bb (96%)
 delete mode 100644 meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
 delete mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
 delete mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
 delete mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
 delete mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb

-- 
2.17.1


