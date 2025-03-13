Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CC0C36001
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 19:05:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.23277.1741892719111573459
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 12:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vBNVMbvG;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5HMC1432103
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 14:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741892717;
	bh=bMFzNr6V4N7ljPD/MsQUZe6DrbDK6zWf0ki9TTjy4lE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=vBNVMbvGUV1duM6TUE74SLFWd5OfxQXvRDKNm6ba23f0vtmgZ6XYJ8vJyh857zkHb
	 pdxGBbCSp4Ewh3mrz01lKplbWTHXoWfGZzgJhhXEkfZyAuHYTbafTBe1cJIW7vab69
	 iPz41IgA6TzNsnOGqUtOH4cUszBFe+loZlw+1Y5Q=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5H6Y055951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 14:05:17 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 14:05:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 14:05:17 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DJ5HJ6090113;
	Thu, 13 Mar 2025 14:05:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsnrp-0005sh-6z; Thu, 13 Mar 2025 14:05:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 06/14] netopeer2-server: Update to version 2.2.35
Date: Thu, 13 Mar 2025 14:05:08 -0500
Message-ID: <20250313190516.22522-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313190516.22522-1-reatmon@ti.com>
References: <20250313190516.22522-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 19:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16040

With the update to a newer libyang, we need to move to a newer version
of netopeer2-server.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../netopeer2-server/0001-Add-EST-Yang-Models.patch    | 10 +++++-----
 .../netopeer2-server/netopeer2-server_git.bb           |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
index 983f594b..d0b24d8b 100644
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
@@ -3,9 +3,9 @@ Upstream-Status: Inappropriate [arago specific]
 
 diff --git a/scripts/setup.sh b/scripts/setup.sh
 index 7bba711..4a98e66 100755
---- a/scripts/setup.sh
-+++ b/scripts/setup.sh
-@@ -41,6 +41,12 @@ MODULES=(
+--- a/scripts/common.sh
++++ b/scripts/common.sh
+@@ -12,6 +12,12 @@ NP2_MODULES=(
  "ietf-network-instance@2019-01-21.yang"
  "ietf-subscribed-notifications@2019-09-09.yang -e encode-xml -e replay -e subtree -e xpath"
  "ietf-yang-push@2019-09-09.yang -e on-change"
@@ -16,5 +16,5 @@ index 7bba711..4a98e66 100755
 +"ieee802-dot1q-sched@2022-08-18.yang"
 +"ieee802-dot1q-sched-bridge@2022-08-18.yang"
  )
-
- CMD_INSTALL=
+ 
+ LN2_MODULES=(
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
index 7905aa00..89a05b2b 100644
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
@@ -3,19 +3,19 @@ DESCRIPTION = "Netopeer2 is based on the new generation of the NETCONF and YANG
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41daedff0b24958b2eba4f9086d782e1"
 
-SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=devel \
+SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=master \
           ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
 	        'file://netopeer2-server', '', d)} \
           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
 	        'file://netopeer2-serverd.service', '', d)} \
           "
 
-PV = "2.1.59+git"
-SRCREV = "b81788d9a81770313a0eb7f88d4224726b3d6e15"
+PV = "2.2.35+git"
+SRCREV = "6d1cb61ef3ce2274a91dc9cbc51318bcd0b54697"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libyang libnetconf2 sysrepo curl"
+DEPENDS = "libyang libnetconf2 sysrepo systemd"
 RDEPENDS:${PN} += "bash curl"
 
 FILES:${PN} += "${datadir}/yang* ${datadir}/netopeer2/* ${libdir}/sysrepo-plugind/*"
-- 
2.17.1


