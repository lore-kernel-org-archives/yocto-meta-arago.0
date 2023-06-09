Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0E4C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 11:56:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.11413.1686311764482929307
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 04:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=faMkdHIf;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359Bu4Kg027605
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 06:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686311764;
	bh=GEwhT9NxO58dqoMKxd5JHRN6tOSxLtqjrNMxOGPntTI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=faMkdHIfu9QGhBT6gi2D4mTsoWBK1Sr9RpVV74e7qaJXOG5yanJy+DltnUa48cjH/
	 BCpPoovzTDeeINeNjePimuiRFO8H2dDRl5zYOHOiedQNbAmoa9BRxv2W+HvKtfIwfh
	 wORRO3LG4QxqTF9eUv0MX2cPVgR8/USOLwQP7ERM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359Bu3Nw049275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 06:56:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 06:56:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 06:56:02 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359BtvaZ022050;
	Fri, 9 Jun 2023 06:56:01 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <g-gupta@ti.com>, <r-gunasekaran@ti.com>
Subject: [master/kirkstone 2/3] meta-aragos-extras: sysrepo: Add .bbappend for netopeer2
Date: Fri, 9 Jun 2023 17:25:56 +0530
Message-ID: <20230609115557.1685-3-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230609115557.1685-1-r-gunasekaran@ti.com>
References: <20230609115557.1685-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 11:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14567

Add a patch for setup script in netopeer2 to install the needed
YANG models and provide a .bbappend file

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 .../0001-Add-EST-Yang-Models.patch              | 17 +++++++++++++++++
 .../netopeer2-server_git.bbappend               |  6 ++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend

diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
new file mode 100644
index 00000000..10ed685d
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
@@ -0,0 +1,17 @@
+diff --git a/scripts/setup.sh b/scripts/setup.sh
+index 7bba711..4a98e66 100755
+--- a/scripts/setup.sh
++++ b/scripts/setup.sh
+@@ -41,6 +41,12 @@ MODULES=(
+ "ietf-network-instance@2019-01-21.yang"
+ "ietf-subscribed-notifications@2019-09-09.yang -e encode-xml -e replay -e subtree -e xpath"
+ "ietf-yang-push@2019-09-09.yang -e on-change"
++"iana-if-type@2017-01-19.yang"
++"ieee802-types@2022-10-31.yang"
++"ieee802-dot1q-types@2022-10-31.yang"
++"ieee802-dot1q-bridge@2022-10-31.yang"
++"ieee802-dot1q-sched@2022-08-18.yang"
++"ieee802-dot1q-sched-bridge@2022-08-18.yang"
+ )
+
+ CMD_INSTALL=
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
new file mode 100644
index 00000000..5be4bcae
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-Add-EST-Yang-Models.patch"
+
+FILES:${PN} += "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sysrepo-plugind/*"
+
-- 
2.17.1


