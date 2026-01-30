Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCE4E6BF2F
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 16:43:01 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14924.1769791380361527777
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 08:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VJ0Cmw6E;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.27, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBAfLxy9wmMzsApDR1R3T63G072y99KYRhYsRKyuSSrqV9B+a7vY5Y1ZgGeJM7x8n/iqv90X4TwG2BYqon7I4jIhPvPacwhwvGUANTjvzzrxEiIa4RGArPQbU7wDIibs0F1tqZT7y/OvsCivlynWgBPp//E4wQDjVZrCGTmqDAw8aFH0xyvp4mnSfnBfPJ0I455YwJOr9C7HvsSICWIPumiuXlMRD0xyJHvfATDjZjN/KWgpjoiWRSBN1ixYsGBpOHPFAmTiViNv5TXkmkWmI2bbp6PATYL3WjgLhwvxU1Hcwy66ro1pGdaXihMWMex21tDSX2hhrzyyF7PNFxWGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlr0mESqEmNoCObETtC1lBSl4NMSrGkgx0R6I6beAds=;
 b=b+Tuo34S8ZRU7Xa0LGXW6c8YlykBjyTnBU/i74TyUsdHpUfJrpHWv6bsYdOXAFX4b31KgL49Y1vkHSfJ7QOXP4B3RDttJPdwZwWcjE+PXzM4FshY1tIBwkluBbOxEoBj1MoNqZEC2NywYbhySXo15+Ja97+COua2eTZXWTBwiHRT6QVtL/UJvipK8IEdbPE+ss0TrYuuVjKPZgDDWD+W0/Rq00uAFSZDj0H+tqtI7JI7bmZk4ruyhWR+LaaTkKT4RBhNE6agWO76+D96OPQtPIeZjGn3e3uhihttCxIttanFIePqj27i3gDiedzT8gtDIwnir7HCE2+aZHfg8fzpJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlr0mESqEmNoCObETtC1lBSl4NMSrGkgx0R6I6beAds=;
 b=VJ0Cmw6EXlphrLOOEKJmAZwLRJC3EJNKjcVzQk2bLTyuwsMlwWXUsso/JBayo1zL3U/bQXfqm41wiHVBokuGIG8uJTGZMT+RTEVNtYA/PGjGdeJspCgkv+GPHfT4TDUfWZtnFXlBge9N/N2k9jm3BLvjQIXt1DQ0XCfioJGLlqk=
Received: from BYAPR11CA0045.namprd11.prod.outlook.com (2603:10b6:a03:80::22)
 by PH0PR10MB997594.namprd10.prod.outlook.com (2603:10b6:510:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 16:42:57 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::2d) by BYAPR11CA0045.outlook.office365.com
 (2603:10b6:a03:80::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 16:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 16:42:57 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 10:42:56 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 10:42:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 10:42:56 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UGgu0w1610487;
	Fri, 30 Jan 2026 10:42:56 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 0/2] Arago image names
Date: Fri, 30 Jan 2026 10:42:51 -0600
Message-ID: <20260130164253.1601744-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|PH0PR10MB997594:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbb5a5c-70d1-48de-9709-08de601e9f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s9kiIpgKweWgGmtDnhwcZEFQtUeWKUD7HWOnCtkTAOGOYQwdfOhNb7h/UTzs?=
 =?us-ascii?Q?bt/Sv3LkoB3i3v78lfMP2W8mAUlirsgWYqJ35lSr5M0ek6/52PH2V8B8kFk3?=
 =?us-ascii?Q?8Rv2+UpuF/M7fTG+wgCXJyARV+zy1NS1wKuYBp3LLq6y6NpQignvIFccGsrB?=
 =?us-ascii?Q?BkzeobfCt2Ph+8S1fzV2KMgwE+9Jdc9WOM0HrKQA7uPC2dXwAr4I4Zo424Mq?=
 =?us-ascii?Q?bff9QNkKjum5Ql5oUcYbSTsWk/d6apf8Uvctra9Kp5SotC1q01EdGQp0jb0y?=
 =?us-ascii?Q?r8a7wDaRppvREteZSuaTgWtm+7F9GdBN40ueTx+CU4eROvYpK0Ao4tC8nhMx?=
 =?us-ascii?Q?mnW+cHEP2l45aB0M1SJu98lPtw5SS00QEgwxXeZuBRHzNJcSYWbxyVvy6aQ+?=
 =?us-ascii?Q?ELkUz2qwEoCi02+XLK3zme68n47aGUgpw/RL/TXaaeFAyw9qJ+iOk7VjyX0z?=
 =?us-ascii?Q?15bDi4CL0Znr4OO/dRV0OpmqKRlXWTzGTYtDVg7w2IalmOGlVjq8g2jisasr?=
 =?us-ascii?Q?GB50RxtcIziFl92UxaJrZY5jwDsET8WkCPzrg1x3LL2blKIOUGlTZMB6IrkP?=
 =?us-ascii?Q?fBBMDl07icU4yr3YT2Maolufr6ZP88dmpv/GzMWF/tTjUr7wdzPO8xAZCgWc?=
 =?us-ascii?Q?DPXCxZEUOpb4J//of0n6MzibYAOzmBY/6E+wychB5QdE6i12qcjre2EcjDSV?=
 =?us-ascii?Q?C9KvOh+P92SABdd7FZ6O7IlDhOGjTwLOsC+/kcmdWjmy6qCtRIfBwQc4YlCT?=
 =?us-ascii?Q?qYOIMMQHCg/RGzCIEiStFo+F0xmw1I6eUEvvSCzgVILelPsbqdaxWcf2uB2g?=
 =?us-ascii?Q?R/hgapVwF/u9SfgeUnaJAWmkZx9ACPd9OzjT9BKEJtfSGBTAFPKub5yU04xX?=
 =?us-ascii?Q?/oPcFDOPOoxQjHbmbRSvTZO9ZFGCXCPr538vBJdi8k/cL2OGwSjaBtShabrf?=
 =?us-ascii?Q?Wjq0hQI8u45zvpCI551hbMhwsUswCJQAp+d70j13KohH8KwjIYDWsB0xIVY6?=
 =?us-ascii?Q?jNcWrk3iALs+HT5VN3Bi/I1o1PSwYGSxqwOAL+R8YocZFiSl9c7uK+GfUT+8?=
 =?us-ascii?Q?/qceNXexfvUa9jzCCaTAAEaNhbdspMmKhZLrq91KZz3kUVWHMnDciR5ZHdmd?=
 =?us-ascii?Q?DI1TIyPZ+XHud/2/coJGcY+yuoonYfczQP+3K5OdKo4TjR9Ey1Ugb8PC2MK2?=
 =?us-ascii?Q?9i7HsTYASNJPge6wSfeRDNGUkjDKos92rHsD58A2O14QoNkf12Df0vFWcbcW?=
 =?us-ascii?Q?uGLvhZr4PFWvINhYfO0ESu9nUrqkQ5OYz2nXM7ZmdwNVJdtu2Fb0Sjm0dYjr?=
 =?us-ascii?Q?0zv8N0V1BmHprQEuQmj4AB75PuUT8dkyIvTYWY80bWdx0sSOePzRsMxO6BwA?=
 =?us-ascii?Q?N4xbYiSniwYum44Pzav4oCUMfNMvm116HfZc7YeE5XMH2pYRcFyJ8F81+UDw?=
 =?us-ascii?Q?YvXfrTTdic2RKJoOkGMNVzkDLJ9btMQS0mxwNaKjm99MnAHkuUjHXj/RqUgT?=
 =?us-ascii?Q?TjJkh1g/2Kx8Z5K/bYdCpVACKBXPOOu8NPiupk6lliz5RulRJe4EAEkVRWVv?=
 =?us-ascii?Q?OMlStUjrkdCu79qSkbseHKZktwF8Yi9g/u4Rgffc3z61tngGn7szYX5u/XDA?=
 =?us-ascii?Q?FTHRoiuk8Zcd8JEMrAZ+Nnh9KZNHDM1huyyMsE0ZEdP4mGz644cocQG6bJhC?=
 =?us-ascii?Q?xDsENA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rclOvnVN8vGA1jM23PPXkmVX/G26ByOT0vx1DH4okXg8y5AgTq8VKZqO3RicoRonqFL6vB+cUvyuiykJBSJpvAgcDUcqtL4YrK0zRAUOcRfbyw9i7eTUUrAsL6B6WC61rM/BeCIN3V9iORJzMm7+K9TDVdm4Gu5xyj/wRuEHeFPJA7byqCBj/VYbWgyXO8z5HjriA6zg6qUOVyY17zBQyn2Urz2UGdZVtOkW7VsZ1+l23hIhn6GRFl8cNO5W/6yXEav1i6HkhZfCS8ahZyp5l8rplAReksHIK9SZr0w7Ci7neXjJUgr4ataCUzZd/lZk4NJNrgV2yG1GmHPzAaMsaL/M+uDxCORnbM9F3Fcn4ELaC0XiK0E1SolLKDT3rcoif3Lfx/3Hws/5rTUO8yox0waZt2W+5DVJMHg1crQFy4FzjziHHXPUZqRgd1kmrbz1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 16:42:57.0117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbb5a5c-70d1-48de-9709-08de601e9f53
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997594
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 16:43:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17051

Hello all,

The meta-tisdk layer produces images with the prefix "tisdk-", it does
this by appending to the images defined in meta-arago. This means adding
the layer meta-tisdk changes the content of the images. Meta-tisdk has to
do this as the image names its "tisdk-" prefix is already being used by
meta-arago.

What we do here is change the images and package groups defined by
meta-arago to have the prefix "arago-". This way meta-tisdk can have
images with its "tisdk-" prefix without having to modify existing images.
Instead it can extend the images and give them a new name to avoid
any confusion about the content and source of each image name.

Thanks,
Andrew

Andrew Davis (2):
  meta-arago-distro: Remove TI SDK branding from Arago images
  meta-arago-distro: Remove tisdk name from Arago packagegroups

 check_yocto_rules.json                        |  4 ++--
 meta-arago-distro/README                      |  2 +-
 .../classes/tisdk-bundle.bbclass              |  2 +-
 meta-arago-distro/conf/distro/arago.conf      |  2 +-
 .../conf/distro/include/branding-bleeding.inc |  4 ++--
 ....bbappend =3D> arago-default-image.bbappend} |  0
 ....bbappend =3D> arago-default-image.bbappend} |  0
 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  |  2 +-
 ...isdk-base-image.bb =3D> arago-base-image.bb} |  2 +-
 ...image.bb =3D> arago-bootstrap-base-image.bb} |  2 +-
 ...trap-image.bb =3D> arago-bootstrap-image.bb} |  2 +-
 ...dk-core-bundle.bb =3D> arago-core-bundle.bb} |  6 +++---
 ...-core-bundle.inc =3D> arago-core-bundle.inc} |  4 ++--
 ...efault-image.bb =3D> arago-default-image.bb} | 20 +++++++++----------
 .../images/arago-jailhouse-image.bb           | 12 +++++++++++
 ...se-inmate.bb =3D> arago-jailhouse-inmate.bb} |  6 +++---
 ...inux-image.bb =3D> arago-thinlinux-image.bb} |  8 ++++----
 ...isdk-tiny-image.bb =3D> arago-tiny-image.bb} |  4 ++--
 ...y-initramfs.bb =3D> arago-tiny-initramfs.bb} |  2 +-
 .../images/tisdk-jailhouse-image.bb           | 12 -----------
 ...> packagegroup-arago-addons-sdk-target.bb} |  0
 ...addons.bb =3D> packagegroup-arago-addons.bb} |  0
 ...agegroup-arago-connectivity-sdk-target.bb} |  0
 ....bb =3D> packagegroup-arago-connectivity.bb} |  0
 ...> packagegroup-arago-crypto-sdk-target.bb} |  0
 ...crypto.bb =3D> packagegroup-arago-crypto.bb} |  0
 ...packagegroup-arago-graphics-sdk-target.bb} |  0
 ...hics.bb =3D> packagegroup-arago-graphics.bb} |  0
 ...b =3D> packagegroup-arago-gtk-sdk-target.bb} |  0
 ...tisdk-gtk.bb =3D> packagegroup-arago-gtk.bb} |  0
 ...ckagegroup-arago-multimedia-sdk-target.bb} |  0
 ...ia.bb =3D> packagegroup-arago-multimedia.bb} |  0
 ...srepo.bb =3D> packagegroup-arago-sysrepo.bb} |  0
 ...ckagegroup-arago-toolchain-tisdk-target.bb | 12 +++++------
 .../recipes-core/packagegroups/ti-world.bb    | 16 +++++++--------
 meta-arago-extras/README                      |  2 +-
 .../recipes-core/packagegroups/ti-test.bb     |  2 +-
 37 files changed, 64 insertions(+), 64 deletions(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-cor=
e/images/{tisdk-default-image.bbappend =3D> arago-default-image.bbappend} (=
100%)
 rename meta-arago-distro/dynamic-layers/selinux/recipes-core/images/{tisdk=
-default-image.bbappend =3D> arago-default-image.bbappend} (100%)
 rename meta-arago-distro/recipes-core/images/{tisdk-base-image.bb =3D> ara=
go-base-image.bb} (89%)
 rename meta-arago-distro/recipes-core/images/{tisdk-bootstrap-base-image.b=
b =3D> arago-bootstrap-base-image.bb} (91%)
 rename meta-arago-distro/recipes-core/images/{tisdk-bootstrap-image.bb =3D=
> arago-bootstrap-image.bb} (90%)
 rename meta-arago-distro/recipes-core/images/{tisdk-core-bundle.bb =3D> ar=
ago-core-bundle.bb} (81%)
 rename meta-arago-distro/recipes-core/images/{tisdk-core-bundle.inc =3D> a=
rago-core-bundle.inc} (83%)
 rename meta-arago-distro/recipes-core/images/{tisdk-default-image.bb =3D> =
arago-default-image.bb} (71%)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-jailhouse-i=
mage.bb
 rename meta-arago-distro/recipes-core/images/{tisdk-jailhouse-inmate.bb =
=3D> arago-jailhouse-inmate.bb} (53%)
 rename meta-arago-distro/recipes-core/images/{tisdk-thinlinux-image.bb =3D=
> arago-thinlinux-image.bb} (80%)
 rename meta-arago-distro/recipes-core/images/{tisdk-tiny-image.bb =3D> ara=
go-tiny-image.bb} (81%)
 rename meta-arago-distro/recipes-core/images/{tisdk-tiny-initramfs.bb =3D>=
 arago-tiny-initramfs.bb} (93%)
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-i=
mage.bb
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-addons-sdk-target.bb =3D> packagegroup-arago-addons-sdk-target.bb} (100=
%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-addons.bb =3D> packagegroup-arago-addons.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-connectivity-sdk-target.bb =3D> packagegroup-arago-connectivity-sdk-tar=
get.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-connectivity.bb =3D> packagegroup-arago-connectivity.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-crypto-sdk-target.bb =3D> packagegroup-arago-crypto-sdk-target.bb} (100=
%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-crypto.bb =3D> packagegroup-arago-crypto.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-graphics-sdk-target.bb =3D> packagegroup-arago-graphics-sdk-target.bb} =
(100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-graphics.bb =3D> packagegroup-arago-graphics.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-gtk-sdk-target.bb =3D> packagegroup-arago-gtk-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-gtk.bb =3D> packagegroup-arago-gtk.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-multimedia-sdk-target.bb =3D> packagegroup-arago-multimedia-sdk-target.=
bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-multimedia.bb =3D> packagegroup-arago-multimedia.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-sysrepo.bb =3D> packagegroup-arago-sysrepo.bb} (100%)

--=20
2.39.2


