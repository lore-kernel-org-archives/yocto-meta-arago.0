Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79466CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:08:03 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15139.1777478881278428183
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SwkB2B4f;
 spf=pass (domain: ti.com, ip: 40.107.209.26, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTtRZgoFM/Qeh2cD+98pO7j9TEw9BALge6imuGpQ/e+H6+8eayZQYO6YbAPqItXrWCAxErk7FrmjlTx+7uQXwn5ICPkNvK+FmazRJNM3IiDEtj1OVw5YYK+5xLpMclUKHes2/Zgf9jvmbgIraCf/Bh3mfRTAxmeh5pE2wcn/9Tj2UtROKftaslS5FsxYtFx5np+P3vUgD+GsAlGQ73X+qDZW4EydjK3QAtLzFRdN+Ru1vW95eq6xeuvNyTO+fy8sxmNhlPbo3ht1QPNse0FT3c15Xl/fDGEwu3YRAPSJFZz3wmNM/MeACSvFVdV56c0Kl4nv4iAqd7mJTxGbGjqs/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/ndTa1JetSX1uOUnNfupfRS1gl/nB7fcjSy1Kn57RI=;
 b=inI4rPwSP3wgjYzFpuna8gTD7ALSa5Ea81SiC5kb6H1JNNENO6fuCpIqf8bWIOcWkN3srC+CrZshwzWtkd+JKLWKtKz56TmCp5M4dqFiz0Ospi+Kc0pktYCBZzNtNTits4SZqYB8Fzs4BtAmpEBuTwzeHlJGmyzKEGpWJN51nwqYCUPO7SGo+SZp+YbZBGX2yPFluU5jSAEiJ4G7gbo5J1PGPp5eiTEqaCxH4PV4u3fvuV5kfvEqWvRtpXGvYzV+vkaHVcmJeiuKNRWoJNP+VihNjbjRTWpYRv3+QEkbsWoFCShuPh9twPDZOibpLIVtCkaPu6gyASsnckTiTkqiYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/ndTa1JetSX1uOUnNfupfRS1gl/nB7fcjSy1Kn57RI=;
 b=SwkB2B4fgOECcqtd6inva/eVgZbqYxTlkdlAUeLpodm7IzFed66u47V1K5ILrg5Lwz9fUZ8l9Br0yCYexHOUqX2+UdYaFqRs56I/1bRNoHEiRg/YKJpkz53r16zXvcqCieKL6VXYnbQEtOxsT2+ovnZxi5Phddhyghuw2pZ6aQA=
Received: from DS7PR03CA0224.namprd03.prod.outlook.com (2603:10b6:5:3ba::19)
 by CH0PR10MB4924.namprd10.prod.outlook.com (2603:10b6:610:ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 16:07:58 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::75) by DS7PR03CA0224.outlook.office365.com
 (2603:10b6:5:3ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 16:07:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:07:57 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:07:57 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:07:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:07:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TG7vAt3657093;
	Wed, 29 Apr 2026 11:07:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI7S9-00000006nuP-17lG;
	Wed, 29 Apr 2026 11:07:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] arago-master-*: Complete moving meta-arago-test to meta-ti-test
Date: Wed, 29 Apr 2026 11:07:57 -0500
Message-ID: <20260429160757.1621810-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CH0PR10MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9a7a52-5147-44cb-a0ff-08dea6097ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	jn4DxoFMWONXEjRNd8WqiBRmILGhvRjK4a8Eg7YtSUdHpY66+ZKYBfYhpvxoqgb7f+1qvrVl+a5ugntL1OM53mqvSN6ncZ+MYCh0oGZxSeqYwUIIIi7BqC3zRCbXo6pMaHOql1ZR67Co23WxXjAJtrI920BxXrckjz+F7D1q9ei9R7AlVCkKDv3GCrl23vR6Qn+EsiwNUypuCZjEAkQ9/D1jp3tvdX7obbWQUycUZ9xfPCJY/Cxf9Q2oIWtCETDTBkQ7UJlVZTnDB9Cqir9lQslQJLye2fNNiGPdLxOExkqUk1kHBxExAecZzjps4YLDbvrmlk0PDfGS3lVK05kthK7HvK/KnTZKYVpbY9cAxqGd6HQUFVQfPnsOgHw1Pwc2WLpLGoFCeE8dNk8ZXguF1w/R6TBjVN4Fzzn+4hFXJ3VbbM0kVDLu3XG0K0TMl4GAyvelaouWVM92ygnwjxgVWI55F7191/SDMN8wXXNLZDMo6Mf8OkctLVrs9uMntiR+zk9sQfoU+FqTnKZPao9pEqCSGsCKR2YwgH1yfPWt8Z5UiONFIma7IsWO66teggBJgGk2AFMif2atsiVDum64atoE/2uKtZ3xt18jFiiyUUOb5gBW0SkmK38kLbo7u5eSYwi7syGTSOqAo2GSOBj2FFaRwwQhA/WvX3T/jF/WSSc3PI4PHbJFKZgQgwvaIgThTZQtrC2+CHk9nrUIPigoMrKxX4jOZx1EKZP/0WpUFxU=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bz1mg7iFC9zvXOMb47X32yj6s3L4IvBJHl0wSRF2dljT+wF/iNUN6tzoUWQ+LDvl1lp6Kixsh6zPb7v8EJ9iimcBnhOO5CaOGu0rAXrndJKeJk6+jTETTKO+VPmCBgTPgT0JWQ3HwzL/WFGharMqUicxYN8vw8QpUaTd6f3ckWj9f1VcEd4VN1CSx7MTKHG1sgdtRWv42RCbfzJA/zft2p9HJSRbvi9G2mZUxamKeWbB7LnFGXU/Aq+Nc52+dYKubcb8GbEmuMnLa/fYNuOl9TtI5O2jijM9/6/ampgaXGTDDXT33TJQzEoOxJVCnw2UlIYbvERCzCUxq7ddwmq6IbAG2NXCooMZNa99dZUis/PmHWSMym99ym05seDnnVj8pvrbGasPff3Y5fkSp+cfb7xXolf1RfmjFF/74ghHvPs63NJXmZSSWWgSJ5X4GBGS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:07:57.8521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9a7a52-5147-44cb-a0ff-08dea6097ade
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4924
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17511

Our testing of moving meta-arago-test to meta-ti-test is complete.  We
need to update all of the remaining arago-master-* configs so that we
can pass a CICD and promote the change.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/arago-master-chromium-config.conf.json | 2 +-
 bitbake-setup/arago-master-config.conf.json          | 2 +-
 bitbake-setup/arago-master-flutter-config.conf.json  | 2 +-
 bitbake-setup/arago-master-luks-config.conf.json     | 2 +-
 bitbake-setup/arago-master-next-config.conf.json     | 2 +-
 bitbake-setup/arago-master-selinux-config.conf.json  | 2 +-
 configs/arago-master-chromium-config.txt             | 4 ++--
 configs/arago-master-config.txt                      | 4 ++--
 configs/arago-master-flutter-config.txt              | 4 ++--
 configs/arago-master-luks-config.txt                 | 4 ++--
 configs/arago-master-next-config.txt                 | 4 ++--
 configs/arago-master-selinux-config.txt              | 4 ++--
 kas/arago-master-chromium-config.yml                 | 2 +-
 kas/arago-master-config.yml                          | 2 +-
 kas/arago-master-flutter-config.yml                  | 2 +-
 kas/arago-master-luks-config.yml                     | 2 +-
 kas/arago-master-next-config.yml                     | 2 +-
 kas/arago-master-selinux-config.yml                  | 2 +-
 src/configs/arago-master-chromium-config.xml         | 2 +-
 src/configs/arago-master-config.xml                  | 2 +-
 src/configs/arago-master-flutter-config.xml          | 2 +-
 src/configs/arago-master-luks-config.xml             | 2 +-
 src/configs/arago-master-next-config.xml             | 2 +-
 src/configs/arago-master-selinux-config.xml          | 2 +-
 24 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/bitbake-setup/arago-master-chromium-config.conf.json b/bitbake=
-setup/arago-master-chromium-config.conf.json
index 4a4af13..5bb8ec9 100644
--- a/bitbake-setup/arago-master-chromium-config.conf.json
+++ b/bitbake-setup/arago-master-chromium-config.conf.json
@@ -118,7 +118,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-=
qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openem=
bedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gno=
me","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia=
","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","met=
a-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup=
" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-browser/meta-chromium","meta-qt6","meta-virtualization","m=
eta-openembedded/meta-networking","meta-openembedded/meta-python","meta-ope=
nembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-f=
ilesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-test","met=
a-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/=
meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-config.conf.json b/bitbake-setup/ar=
ago-master-config.conf.json
index 2b815ad..a196ffd 100644
--- a/bitbake-setup/arago-master-config.conf.json
+++ b/bitbake-setup/arago-master-config.conf.json
@@ -107,7 +107,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","m=
eta-openembedded/meta-networking","meta-openembedded/meta-python","meta-ope=
nembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-f=
ilesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","m=
eta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/met=
a-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-qt6","meta-virtualization","meta-openembedded/meta-network=
ing","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-open=
embedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedde=
d/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti=
/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-=
toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-flutter-config.conf.json b/bitbake-=
setup/arago-master-flutter-config.conf.json
index 95f4cf9..bfc3141 100644
--- a/bitbake-setup/arago-master-flutter-config.conf.json
+++ b/bitbake-setup/arago-master-flutter-config.conf.json
@@ -118,7 +118,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-flutter/.","meta-flutter/meta=
-flutter-apps","meta-qt6","meta-virtualization","meta-openembedded/meta-net=
working","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-=
openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openemb=
edded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta=
-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core=
/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-flutter/.","meta-flutter/meta-flutter-apps","meta-qt6","me=
ta-virtualization","meta-openembedded/meta-networking","meta-openembedded/m=
eta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","met=
a-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-=
ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/me=
ta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta"=
,"oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-luks-config.conf.json b/bitbake-set=
up/arago-master-luks-config.conf.json
index df33a0e..c42e44e 100644
--- a/bitbake-setup/arago-master-luks-config.conf.json
+++ b/bitbake-setup/arago-master-luks-config.conf.json
@@ -118,7 +118,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-security/meta-tpm","meta-qt6"=
,"meta-virtualization","meta-openembedded/meta-networking","meta-openembedd=
ed/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome",=
"meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","m=
eta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-ar=
m/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-security/meta-tpm","meta-qt6","meta-virtualization","meta-=
openembedded/meta-networking","meta-openembedded/meta-python","meta-openemb=
edded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-files=
ystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti=
/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta=
-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-master-luks-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-next-config.conf.json b/bitbake-set=
up/arago-master-next-config.conf.json
index f073334..891da26 100644
--- a/bitbake-setup/arago-master-next-config.conf.json
+++ b/bitbake-setup/arago-master-next-config.conf.json
@@ -107,7 +107,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","m=
eta-openembedded/meta-networking","meta-openembedded/meta-python","meta-ope=
nembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-f=
ilesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","m=
eta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/met=
a-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-qt6","meta-virtualization","meta-openembedded/meta-network=
ing","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-open=
embedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedde=
d/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti=
/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-=
toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-master-next-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-selinux-config.conf.json b/bitbake-=
setup/arago-master-selinux-config.conf.json
index 29e7a19..09fb1a9 100644
--- a/bitbake-setup/arago-master-selinux-config.conf.json
+++ b/bitbake-setup/arago-master-selinux-config.conf.json
@@ -118,7 +118,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-vir=
tualization","meta-openembedded/meta-networking","meta-openembedded/meta-py=
thon","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-open=
embedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/met=
a-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm=
","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-selinux","meta-qt6","meta-virtualization","meta-openembedd=
ed/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta=
-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","m=
eta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-e=
xtras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","met=
a-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-master-selinux-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-maste=
r-chromium-config.txt
index 1a2a0f1..f5caacc 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -2,14 +2,14 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51f=
d261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 132a505..5a15a7a 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -2,14 +2,14 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master=
-flutter-config.txt
index 37be2a0..a66bf9c 100644
--- a/configs/arago-master-flutter-config.txt
+++ b/configs/arago-master-flutter-config.txt
@@ -2,13 +2,13 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,=
layers=3D.:meta-flutter-apps
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
diff --git a/configs/arago-master-luks-config.txt b/configs/arago-master-lu=
ks-config.txt
index c68d49e..3c6301a 100644
--- a/configs/arago-master-luks-config.txt
+++ b/configs/arago-master-luks-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
@@ -10,7 +10,7 @@ meta-security,https://git.yoctoproject.org/meta-security,=
master,HEAD,layers=3Dmeta
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index 1744c2f..907686b 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -10,14 +10,14 @@ MOTD: NOTE: to point the recipe to the appropriate cicd=
/next branch for that rec
 MOTD: NOTE:
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=3Dmet=
a-ti-extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=3Dmet=
a-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index 96c8dd5..9f41014 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -2,14 +2,14 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index 3c83535..45aef4c 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -22,7 +22,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-test:
=20
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
@@ -59,6 +58,7 @@ repos:
     branch: "master"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
       meta-beagle:
       meta-ti-bsp:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 6b3be87..c8a64d0 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -22,7 +22,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-test:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
@@ -51,6 +50,7 @@ repos:
     branch: "master"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
       meta-beagle:
       meta-ti-bsp:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter=
-config.yml
index 4607b49..4b35225 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -22,7 +22,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-test:
=20
   meta-flutter:
     url: "https://github.com/meta-flutter/meta-flutter.git"
@@ -59,6 +58,7 @@ repos:
     branch: "master"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
       meta-beagle:
       meta-ti-bsp:
diff --git a/kas/arago-master-luks-config.yml b/kas/arago-master-luks-confi=
g.yml
index 8446a16..6aa8d96 100644
--- a/kas/arago-master-luks-config.yml
+++ b/kas/arago-master-luks-config.yml
@@ -22,7 +22,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-test:
=20
   meta-security:
     url: "https://git.yoctoproject.org/meta-security"
@@ -58,6 +57,7 @@ repos:
     branch: "master"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
       meta-beagle:
       meta-ti-bsp:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-confi=
g.yml
index 34ca419..027df14 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -22,7 +22,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-test:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
@@ -51,6 +50,7 @@ repos:
     branch: "master-next"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
       meta-beagle:
       meta-ti-bsp:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux=
-config.yml
index 65a1925..1a4ad25 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -22,7 +22,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-test:
=20
   meta-selinux:
     url: "https://git.yoctoproject.org/meta-selinux"
@@ -56,6 +55,7 @@ repos:
     branch: "master"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
       meta-beagle:
       meta-ti-bsp:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index ba8ff60..9091595 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -14,7 +14,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
             </layers>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
@@ -49,6 +48,7 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index c058317..3718323 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -14,7 +14,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
             </layers>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
@@ -49,6 +48,7 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arag=
o-master-flutter-config.xml
index 26e9335..ad3cda6 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -14,7 +14,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
             </layers>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'HEAD'>
@@ -44,6 +43,7 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
diff --git a/src/configs/arago-master-luks-config.xml b/src/configs/arago-m=
aster-luks-config.xml
index 8152482..7e3b3ea 100644
--- a/src/configs/arago-master-luks-config.xml
+++ b/src/configs/arago-master-luks-config.xml
@@ -14,7 +14,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
             </layers>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
@@ -54,6 +53,7 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index 14b0e88..7c0d71c 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -15,7 +15,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
             </layers>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
@@ -50,6 +49,7 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master-next' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index 0ac2929..c41e735 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -14,7 +14,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
             </layers>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
@@ -49,6 +48,7 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
--=20
2.43.0


