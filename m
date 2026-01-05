Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173BBCD041B
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 22:19:44 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76983.1767651578267004643
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 14:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nQm7mwB8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.25, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6CxjrmIY1+opoxsiRQF9aYmIvY2MnLr8xSoPvB6sY0pDzRp3qoZVW6XbmYVt0NiZplKhArxaJ/fhPqwbZ3UINL1W9znqPUvhBEyBLeY99y9JVch1mT/SeE9v2afzTTOClP9SOGT9DctnvHSDw/blMmbyZvnk12wG4lgo+zZsjbb5tkSerzXpHMnG0GfPQ++kqp+JXY8hb9sGp6B0vGSgsjhSEKDRPxicw3IDPbYJQDY7UBjXbs/pJYzkXqZmjlKutVf9zupnvvx5fkpvCOu7DX1cytQOT46Hm41ltgODoc/TbhNLuwimNHuCx106iZrjiDvWzbihQTKTEP0WrU2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuuGu66vEcD631U7jYMT5NAz/QSD/e3Gq4AVNrV71Gc=;
 b=cPmEMetbtdIJ3zKybdiGPjLfI1GVSpANXc6esijj01JLjoOzSQhRLu2x55bmKCeZ9lPNUL08NVtsvsveiN7NVcKl6mdLmOdNDQgojhhvsQPWp5yWmVUK/rZWzeqpKvetbW4d2ayS1aNnVrlZ2VIgzQnu8NuQsF34ng6oS5+OqQZ8wGjkQ3UDtRHSxa27qd6QaBDvTH7TICCerSRqEo0zPvVZFisb7i+sudFGZ3dZ+51vXjAx8snEwiTEWlPkALB85SC4XS06tnSBTxAnh3nVRfAbFaYJ274blKoc9Xy4Kos5vbULxd+aDtNhFAm4BdwK2gMq5kH46Qrpo/643tvurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuuGu66vEcD631U7jYMT5NAz/QSD/e3Gq4AVNrV71Gc=;
 b=nQm7mwB8YuJgQHgGSJ1kWnOLFBzkpZo+uOaaqtQvgqIpGcnTxArz85A0su9rCqK+8vmV/sxPk+hVuN0wLnV6iae1aYWr7l2j685L3Nju9t6iwsE2IfXl5tqstoj68u8NgqUR/UnjfTVgUdDV7D3vmLz0Mgs3SNby8sRW9ztdrOw=
Received: from MN2PR20CA0033.namprd20.prod.outlook.com (2603:10b6:208:e8::46)
 by BY5PR10MB4212.namprd10.prod.outlook.com (2603:10b6:a03:200::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:19:35 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::d7) by MN2PR20CA0033.outlook.office365.com
 (2603:10b6:208:e8::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:18:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:19:34 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:19:33 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:19:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:19:33 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MJXe11862278;
	Mon, 5 Jan 2026 16:19:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/2] shadow-securetty: Remove unneeded recipe
Date: Mon, 5 Jan 2026 16:19:25 -0600
Message-ID: <20260105221926.2503358-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|BY5PR10MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: 464e783d-c637-4f06-bfa8-08de4ca881e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SkRxw1VdrkBfyP8ZXV/Pz6zSO32jtY6muB70+3oQtHgQPpODhYZpiFs1uuA3?=
 =?us-ascii?Q?BgNEjMwt4rZEJb1RSq7v7hVBoRcQ/sphInswgzHyXchrCZSwyKKF17RvaMBF?=
 =?us-ascii?Q?Lo9wDgCEZW6Eu9fW55nYuDV1lq+kR7HnUQxZU8trAOwUu2KQKKPX/ZEkJrEs?=
 =?us-ascii?Q?CUJWqLpeqeHsvt/Vc/Z1L9ykouo8AAdqHtGTwgAtSdTFDu/ntl8Qe16jfivZ?=
 =?us-ascii?Q?CyL8oKOe5NqMatvxZvBAphnFmfqdP7yRbDYLqoI+mLyDcNINdFV8MsvazeOV?=
 =?us-ascii?Q?Ia2eQpG07pw0GIWh5PFcEQLtVucaPbQVEDX+A2uGJQabGNVmyKiAkKAfHpAc?=
 =?us-ascii?Q?elIANmktZXnit2TC++iuvjGEpOYA+7fkwOG48FEI/5rMVPQJmNElHe+Hr48C?=
 =?us-ascii?Q?3f85w37TzzVDUlJ1MbKXvodHh01WsMT0xFfZMw2SrUbW89GxHMd2BnStsUpg?=
 =?us-ascii?Q?C5u9IMSTZzreJOPgb4QmNF+H+CV81qi0SbRyx8jMW0M85l9zC+bUfPl5s/nB?=
 =?us-ascii?Q?O57mGW22/l3fbdCRhHDgHQMpykIJFYKI7PkWOZhYX+pqsIoYyjdEYGKfpo1o?=
 =?us-ascii?Q?fCthf+egMp6Wv3TpRruTXBNJ93LcanuWi2MTH4vRtaSWWJE5QkUVyazQIHQb?=
 =?us-ascii?Q?PrnQTj74iONP8PiQjgK1X0gQewKvCgDBPW0z1ggJPNsTVWCVU4GDiqE7kFrX?=
 =?us-ascii?Q?Lc5zzlnm1mg7HKU/3zuh9UWPEuRI0SM6k/qIzSG2/Ian3wDlWuGkPz/+BCMK?=
 =?us-ascii?Q?Jnk1vEohegbFtzznHW3FtFonexmydt3JpwoICPa2sNkuEZLy7rv9zaKplQ50?=
 =?us-ascii?Q?jbEiwqLZJjTDm1F4EcAyg9eePZ0214KDBDBrtBeWGtPGvRi4Q9M1+ZyJ1bzh?=
 =?us-ascii?Q?v2J9bow1eho7sK9Z+KYxhBCs4AAfROdewWiX5X9Cp7pWuc4Lgf+Ld5D4hMoq?=
 =?us-ascii?Q?oLKSuWUrenDKDmRpfiSjI6ogd//wt3sFRwz5fEVMAF839p5mUK5GOEBrCbho?=
 =?us-ascii?Q?k+c+KuHwS6Fn6xbVNbqnRSLC34+2JGTomI/DPTnBUs6usrr0BHwvIwPlwv/h?=
 =?us-ascii?Q?E4GSKfjnIjTGcAcAmfy/xsuDgMjdpjQaSdyoYFA46FmAb5fVBpE86fa3/uOE?=
 =?us-ascii?Q?V6FfexdGlnmY3XNzDBaca1ZYbk9XrW2KqKlezxsoDil++JRQvNoTB5gEjN0z?=
 =?us-ascii?Q?Kg1GZI2CqaAaj573+IUaZz2xhJbjOlsIsEGW5WYlVrqswupc1azhIk8aEeSb?=
 =?us-ascii?Q?EcIHG/fIo+pHvyNNRnWFMppde3i/mfR1mbVsN7PWvxGz65JY3mAzPTf6tbON?=
 =?us-ascii?Q?PE4ypEMUJA/qqxQxHcRD8isBeOS+ospGrSM9VjppWq5Y9Pjh0P7SfNcny0XU?=
 =?us-ascii?Q?ZQ/iGtZyM2C6lrEtiFP6N2/ZmUtAfct80JVOhb/ZslBTMpuOyQvtGt9MN+7R?=
 =?us-ascii?Q?3Almr4jJE29AoS5zETLlCgfQekLKROl8uR4FbggKT1S2zpf8pQbAs5glRdbV?=
 =?us-ascii?Q?lgU3cDOKncyrmANlf/UoAgT0ynoTwzovpVSi4Epo0Yu0gwLoFgLb8goE5N9G?=
 =?us-ascii?Q?KoqKxMrSQe2xHfYyLWo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:19:34.9550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 464e783d-c637-4f06-bfa8-08de4ca881e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4212
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 22:19:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16921

The first 4 entries are already in the default securetty file provided by
oe-core, and we don't need all 5 anyway. Remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../shadow/shadow-securetty-arago.inc             | 15 ---------------
 .../shadow/shadow-securetty_%.bbappend            |  4 ----
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-secure=
tty-arago.inc
 delete mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-secure=
tty_%.bbappend

diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty-ara=
go.inc b/meta-arago-distro/recipes-extended/shadow/shadow-securetty-arago.i=
nc
deleted file mode 100644
index 62999d2a..00000000
--- a/meta-arago-distro/recipes-extended/shadow/shadow-securetty-arago.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-PR:append =3D ".arago0"
-
-do_install:append () {
-    # Allow telnet sessions to login as root
-    securetty_file=3D${D}${sysconfdir}/securetty
-
-    echo '' >> $securetty_file
-    echo '# Allow 5 telnet login' >> $securetty_file
-    echo 'pts/0' >> $securetty_file
-    echo 'pts/1' >> $securetty_file
-    echo 'pts/2' >> $securetty_file
-    echo 'pts/3' >> $securetty_file
-    echo 'pts/4' >> $securetty_file
-
-}
diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.b=
bappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbap=
pend
deleted file mode 100644
index eea8f292..00000000
--- a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-SHADOW_SECURETTY_ARAGO =3D ""
-SHADOW_SECURETTY_ARAGO:arago =3D "shadow-securetty-arago.inc"
-
-require ${SHADOW_SECURETTY_ARAGO}
--=20
2.39.2


