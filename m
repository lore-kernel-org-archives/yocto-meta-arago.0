Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025A3C2BA1B
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:40:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.11384.1741862431282840767
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lbn7HIlv;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUCC1850172
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 05:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741862430;
	bh=ljdUxor+w+P+Ziz4YVeeYHx6GVe43kGwAEom++/vMGI=;
	h=From:To:Subject:Date;
	b=lbn7HIlvlD3Oxb33nfz5yRI+PMxihRgPLsZMkOY1220CFr1iOhntbUUBWz+kvMipz
	 iXeSr4bv07Fdx2EUlBX4RqAhKNBBAbZ6nS/nSo/delhtJwq2/2cWyr2Ybfle+YDEt9
	 fyMkeNn7sdYxRu/U3U1XkNbizQH4Hf0L/t5+uCZ8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUti023141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 05:40:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 05:40:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeTt4083606;
	Thu, 13 Mar 2025 05:40:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsfzJ-0003uT-IO; Thu, 13 Mar 2025 05:40:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 00/13] Update and cleanup sysrepo packages
Date: Thu, 13 Mar 2025 05:40:16 -0500
Message-ID: <20250313104029.14977-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16017

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

Ryan Eatmon (5):
  libnetconf2: Wrap libpam dependency
  libyang: Remove recipe in favor of newer upstream version
  libyang: Add BBCLASSEXTEND for native
  sysrepo: Update to version 3.3.10
  netopeer2-server: Update to version 2.2.35

 .../sysrepo/libnetconf2_git.bb                | 25 +++++++++
 .../sysrepo}/libredblack_git.bb               |  6 +--
 .../sysrepo/libyang_%.bbappend                |  1 +
 .../0001-Add-EST-Yang-Models.patch            | 10 ++--
 .../netopeer2-server/netopeer2-server         |  0
 .../netopeer2-serverd.service                 |  0
 .../sysrepo/netopeer2-server_git.bb           | 53 +++++++++++++++++++
 .../sysrepo}/nw-configurator.bb               |  6 +--
 .../nw-configurator}/nw-configurator.c        |  0
 .../0001-so-version.patch                     | 23 ++++++++
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
 .../0001-so-version.patch                     | 15 ------
 .../sysrepo-plugins-common_git.bb             | 26 ---------
 22 files changed, 154 insertions(+), 179 deletions(-)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
 rename meta-arago-extras/{recipes-sysrepo/libredblack => recipes-extended/sysrepo}/libredblack_git.bb (62%)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/0001-Add-EST-Yang-Models.patch (84%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/netopeer2-server (100%)
 rename meta-arago-extras/{recipes-sysrepo/netopeer2-server => recipes-extended/sysrepo}/netopeer2-server/netopeer2-serverd.service (100%)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator => recipes-extended/sysrepo}/nw-configurator.bb (74%)
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator/files => recipes-extended/sysrepo/nw-configurator}/nw-configurator.c (100%)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
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
 delete mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
 delete mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb

-- 
2.17.1


