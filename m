Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AD7D49C67
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 22:08:47 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4189.1769810920704137459
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 14:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OUW1e94f;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.6, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8XNPZZbquaF7JVyYVEvLY/tbDJUV8d8sjJ+zUmo4eiz2N/DWol/VgYCy+g3BJjse+9DXmBTsB7gLkoCYQqkuKnVQu4oGvFZv2BMlwdK0Ip7M6AgQSGKwTZkPI67AMBqXWj4rMAVZj92ppJEgzv8xB2vWYVduN5fKR/sx2vQg6HaSmWnwFOUc1QHg5oSA+BN5RZyMJps4RxV8bWoXfV1nk1ZDVvDBVilI02do/cmNzpEZzTlNc0MHR3eo+qxfHeByT18aG3GE+uMKW2usH28yq7McE8DlVtECuao6mnNSl0/VdIbIxPqZpD897kS2yWjUhdV3iA09EXQUqOUilEIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SlgB25156cd1tOZEl0RoYr3Ex5UKW4Js9mo31l1rOc=;
 b=hX2/svWhHnEb1S8OoWY3Drioa7kk5vZxG8t7i1spe0gZe+mdf3b+yMIxeEqeDV0L1+3pNAU7rA81JW53WEHsRgOStWAefTBYvKlTWUlhb0lUwlNP2f+h/1Vfxpja2/PO0inSN+cZ8qklA4MPOsd+iQC59Rrsj5SFpa/5BkyRefDNpW4q/dEKbZp5qh7Fc+8skhoT2SGNarP36liiAXiKcAhNQF4ZqSxGx6xi/rQz5EDg3UbRm91PBn0XOG/OCYQXOPh4VxbQHoPQ5z7AvVmye8R9vTmy+soYEBhUfYbnCIg69kVSrm88LXAJ74SPmnXD41MxT90BORr2qa6hSydzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SlgB25156cd1tOZEl0RoYr3Ex5UKW4Js9mo31l1rOc=;
 b=OUW1e94fRapTZi4V1/Dgk2FE/sLmA65FVzpfUSnc3yiBZ4u1oh9zdu5p8SpoePoB84+amLDcUrkrNn7k199w5lD7BQIV0PfkYjuem/Cw91K43sXjjg+Kcy1EzrSMkER8XHmXJlGAEnd0y0EZGmTFRgWEQl0QZDTufrByTIBJRT4=
Received: from BY5PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:1d0::32)
 by DM3PPF2867093BF.namprd10.prod.outlook.com (2603:10b6:f:fc00::c13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 22:08:38 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::70) by BY5PR04CA0022.outlook.office365.com
 (2603:10b6:a03:1d0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 22:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 22:08:37 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 16:08:33 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 16:08:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 16:08:33 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UM8WGW2385490;
	Fri, 30 Jan 2026 16:08:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2 1/2] meta-arago-distro: Remove TI SDK branding from Arago images
Date: Fri, 30 Jan 2026 16:08:29 -0600
Message-ID: <20260130220830.2173125-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260130220830.2173125-1-afd@ti.com>
References: <20260130220830.2173125-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DM3PPF2867093BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 612270f8-f69a-4ef8-a661-08de604c1e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2Io6mr/nZUuG2tDjNbG/UM+FryDHyuCahsdhPFqfQcV08fKqACNa9nFkhD5U?=
 =?us-ascii?Q?SC7IxJMLD87KyUR+FxM0XnJyuMnze2akCsoQqzuR4gnjdbM5FtYoEftnQVNY?=
 =?us-ascii?Q?CTS6OvoFOQ4OPCJ6r4L+a4c6NJVyVW1Zf4/UZsnwuuyXDisojy9TrkTqnHn3?=
 =?us-ascii?Q?FOWrce3aukHY0U0c1fylxgYdSzs7dTgW1tXZe2Gk5QgzEDNvHhy6umz5qXcR?=
 =?us-ascii?Q?ZzzMBtHXZyBP8CSRloHRvByjoVuxWDloX7GD0TqNF3xY+3akGZqUJGy3KVbl?=
 =?us-ascii?Q?A9Df5QCEvc06urF6N4N5D2M9VmkyeD1jFbi1wAJQlbPT4is/Um2ue59Dy9NL?=
 =?us-ascii?Q?3CPmTf6wEQg7erzvaPWDUiefeKVyZxwsCbHtblDthz/29Rrdmnka6Y22CMyP?=
 =?us-ascii?Q?FZTx9rV2uIjd8rKFIOn58vlMIHPWqbKghRMVUUdirl9GcKpaCEOIX/eMspon?=
 =?us-ascii?Q?GxHZ6hMXPSnUTNKEaofs5g9+7yCn/BYAVuX0hvPt+El3rYazsHtouhsokva9?=
 =?us-ascii?Q?OiPNsfkAxIrVcWup66+cr8/3X8zJYEW6XAogHeUDTeOSRKfsE6pfcCQ70YZ1?=
 =?us-ascii?Q?BLzrDraGuR/pBFMTznHXzKotMd5Bna2gYgI437HqKFKfoXGzuNZDulDWlqxd?=
 =?us-ascii?Q?IxHO7FWcCKBMeGMGyNiCadrR5pTcF8WbWfbinHijdSkIX91L8BkyGKxJo9pG?=
 =?us-ascii?Q?KDbn5XyDr8vv3Yr/mApYMgTB3Sdd7LtJXtTktvyhP8tYJBWDpwyr1g5t/rxf?=
 =?us-ascii?Q?kxu/ozXq8UaQ3doyB9liJGTGmWXjYjEb57WT73pe8fTGaDSt3+WYxTgt8F+z?=
 =?us-ascii?Q?V9t1zRIN4/V3JTM6jzrtGt/gEWjOKCI3nbt3qg1wvKCVsvqTA97nJXDXDryE?=
 =?us-ascii?Q?lZSWhg+rLee16695VBAfymbISwIU9ju2kxrJmoLA1Ht+fRbZiPyGgWlloICQ?=
 =?us-ascii?Q?YggoyhG8W9irqKp15IX9dFw8efiAvSarm0AHPdK9Xx7JpefKWzg7gIFBHC5T?=
 =?us-ascii?Q?6PlI/oQ1rDD2wn7pB6xIRlGQgPeJDD0wHxaIVwmMxL5TR313Rry7DgJ/lpd/?=
 =?us-ascii?Q?yCbJp1r8DMDBM0zjsLncXy4U6IhzLvixtaau4FOOWDWTcKvVYdu2pA6ESuYn?=
 =?us-ascii?Q?Sgd+uUxK2uV6fTvr/EQmICc1vh6lNuXqGWrIbpLqkumxJYT+Qnxglq8YMmCS?=
 =?us-ascii?Q?vLEA/8xFQ045YURdRXpKP3kgik5Cog5tMf/9Mw7BMO6EmK6vIW8XcxhzGXVy?=
 =?us-ascii?Q?UIAKCBTgGu32dp0G2s/S6ejp2RTZytQIEJ9VB29whpJnujlfpFGAeVmwFv12?=
 =?us-ascii?Q?vRszR0p6XVOch5ZiS31F8MhnJv/GNwm1/nB8BmndRDaw2zgVZzjrXmaVstvK?=
 =?us-ascii?Q?UjlR48mhbl+OUMqBHAZV1VLm70i27JYe957mneEMhul5FPF3q9dvrP5uvwRa?=
 =?us-ascii?Q?V/i5EBW9mYSuS6avkuwy7rkxmD8vE1b3k+fFBDi8d38URqK45VKmT1tmH6n4?=
 =?us-ascii?Q?PGRmqVjgwqxr6D15yWXy7qttWPO+gP4X4IUVI/ZAM+3RcaU0nE+MrsDZKQ6V?=
 =?us-ascii?Q?xuwb5S8y3v6e9FT5tmeocLSq2ycrWfmnaGStGgriH85NbS+TtoZSgI8T48xD?=
 =?us-ascii?Q?A8az83bjyjJsbsNLuOZABhVO8NcbMTDyjNOCSZjOdaqsGGigXDudOiQqrUYg?=
 =?us-ascii?Q?IYl3lA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GINiRIn9vUDauC4FELb03weyNJXInZB7Y0v7c2ointbAln/xTE17/RaH7SO1gjnggR+7DGlLg7o8y8mCHlsiwxlpM5Ov/EYzjlVhczatdeWtjq0k7X5Wn6Rfbo3m1wOgnR37KESO032Qc5CXS23WrrJleGm1wwBinwurgGw7VPv1XjU5oMo33hhABMGxzaZ1//dsqT9DYGA+MvEkYO+WgWUssPvDpBxR7puh5FaoM28AlQifMVh/4W6D6Fvl6NyS6myoRX8WMQ08Wz6Eh91GOA4pleOFkX7xP5shGnDSNKYYVyHl+H9IzVoYGWpTIjGrOOUQJvC49wHSmsdFkkyHOYVOC+IduCNs2K55udNgHwX5LoH53uMGobB3W1bFakOEUZhWW8v2VxtJVFqTIpNu6NW7v0Nwb5qHnBLjX+1mwlSvHTOP2Ge6K6cgpn6i1iyd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 22:08:37.6046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 612270f8-f69a-4ef8-a661-08de604c1e6b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2867093BF
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 22:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17057

Arago is a reference distribution for TI hardware and a foundation for
application/product specific Linux SDKs. While Arago can produce an SDK
for TI products on its own this is not *the* "TI SDK" shipped today, which
is generated by a layer called "meta-tisdk". This "meta-tisdk" produces
images with the tisdk branding such as "tisdk-default-image" but as Arago
provides images of the same name this is done by appending to the Arago
version. This means the content of "tisdk-default-image" changes depending
on what layers you have included. Instead there should be different names
for images containing different content, the solution here is:

 meta-arago -> arago-*-image
 meta-tisdk -> tisdk-*-image

The tisdk images can still be based on the arago images, but this way
it is clear what you are getting based on the image names.

Rename the images here in meta-arago to be prefixed with "arago", and
remove some of the legacy "TI SDK" branding.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 check_yocto_rules.json                               |  4 ++--
 meta-arago-distro/README                             |  2 +-
 meta-arago-distro/classes/tisdk-bundle.bbclass       |  2 +-
 meta-arago-distro/conf/distro/arago.conf             |  2 +-
 .../conf/distro/include/branding-bleeding.inc        |  4 ++--
 ...t-image.bbappend =3D> arago-default-image.bbappend} |  0
 ...t-image.bbappend =3D> arago-default-image.bbappend} |  0
 .../bootstrap-initrd/bootstrap-initrd_1.0.bb         |  2 +-
 .../{tisdk-base-image.bb =3D> arago-base-image.bb}     |  2 +-
 ...p-base-image.bb =3D> arago-bootstrap-base-image.bb} |  2 +-
 ...k-bootstrap-image.bb =3D> arago-bootstrap-image.bb} |  2 +-
 .../{tisdk-core-bundle.bb =3D> arago-core-bundle.bb}   |  6 +++---
 .../{tisdk-core-bundle.inc =3D> arago-core-bundle.inc} |  4 ++--
 ...tisdk-default-image.bb =3D> arago-default-image.bb} |  4 ++--
 .../recipes-core/images/arago-jailhouse-image.bb     | 12 ++++++++++++
 ...jailhouse-inmate.bb =3D> arago-jailhouse-inmate.bb} |  6 +++---
 ...k-thinlinux-image.bb =3D> arago-thinlinux-image.bb} |  2 +-
 .../{tisdk-tiny-image.bb =3D> arago-tiny-image.bb}     |  4 ++--
 ...sdk-tiny-initramfs.bb =3D> arago-tiny-initramfs.bb} |  2 +-
 .../recipes-core/images/tisdk-jailhouse-image.bb     | 12 ------------
 meta-arago-extras/README                             |  2 +-
 .../recipes-core/packagegroups/ti-test.bb            |  2 +-
 22 files changed, 39 insertions(+), 39 deletions(-)
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
arago-default-image.bb} (91%)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-jailhouse-i=
mage.bb
 rename meta-arago-distro/recipes-core/images/{tisdk-jailhouse-inmate.bb =
=3D> arago-jailhouse-inmate.bb} (53%)
 rename meta-arago-distro/recipes-core/images/{tisdk-thinlinux-image.bb =3D=
> arago-thinlinux-image.bb} (94%)
 rename meta-arago-distro/recipes-core/images/{tisdk-tiny-image.bb =3D> ara=
go-tiny-image.bb} (81%)
 rename meta-arago-distro/recipes-core/images/{tisdk-tiny-initramfs.bb =3D>=
 arago-tiny-initramfs.bb} (93%)
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-i=
mage.bb

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 7b3e20db..a6a46f42 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -12,8 +12,8 @@
     },
     "GUARD-1" : {
         "skip_files" : [
-            "meta-arago-distro/dynamic-layers/chromium-browser-layer/recip=
es-core/images/tisdk-default-image.bbappend",
-            "meta-arago-distro/dynamic-layers/selinux/recipes-core/images/=
tisdk-default-image.bbappend",
+            "meta-arago-distro/dynamic-layers/chromium-browser-layer/recip=
es-core/images/arago-default-image.bbappend",
+            "meta-arago-distro/dynamic-layers/selinux/recipes-core/images/=
arago-default-image.bbappend",
             "meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux=
/linux-ti-staging_%.bbappend",
             "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend=
",
             "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/package=
groups/ti-test.bbappend",
diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index d4ff2dd2..d5ec23af 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,4 +1,4 @@
-meta-arago-distro provides Arago distribution configuration for TI SDK pro=
ducts
+meta-arago-distro provides Arago distribution configuration for TI product=
s
=20
 This layer works with the latest Yocto Project release (currently 2.2+) an=
d tracks
 the stable/maintenance branches (currently "master") of the corresponding =
layers:
diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-di=
stro/classes/tisdk-bundle.bbclass
index fb2073ef..cc5d1481 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -31,7 +31,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 # List of target side images to be built and packaged.  By default take
 # the base image but this can be modified if desired to package
 # additional images.
-TARGET_IMAGES ?=3D "tisdk-base-image"
+TARGET_IMAGES ?=3D "arago-base-image"
=20
 # path to install the meta-toolchain package in the SDK
 TISDK_TOOLCHAIN_PATH ?=3D "linux-devkit"
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 9f68e162..90c757fa 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -124,7 +124,7 @@ PACKAGECONFIG:append:pn-kmscube =3D " gstreamer"
 PACKAGECONFIG:remove:pn-opencl-cts =3D "opengl gles vulkan"
=20
 # Configure RAMFS for jailhouse linux-demo
-JH_RAMFS_IMAGE =3D "tisdk-jailhouse-inmate"
+JH_RAMFS_IMAGE =3D "arago-jailhouse-inmate"
=20
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?=3D "perf-scripting perf-tui"
diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/=
meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 4efbb225..9d470c16 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -35,5 +35,5 @@ DATEH :=3D "${@time.strftime('%Y%m%d%H',time.gmtime())}"
 CORESDK_RTOS_FILE_PREFIX =3D "${DATEH}-"
 CORESDK_RTOS_FILE_SUFFIX =3D ";downloadfilename=3D${CORESDK_RTOS_FILE_PREF=
IX}${DEFAULT_FIRMWARE_FILE}"
=20
-# Build and assemble TI-SDK, but don't package it
-IMAGE_FSTYPES:pn-tisdk-core-bundle =3D ""
+# Build and assemble Arago SDK, but don't package it
+IMAGE_FSTYPES:pn-arago-core-bundle =3D ""
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-core/images/tisdk-default-image.bbappend b/meta-arago-distro/dynamic-laye=
rs/chromium-browser-layer/recipes-core/images/arago-default-image.bbappend
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-core/images/tisdk-default-image.bbappend
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-c=
ore/images/arago-default-image.bbappend
diff --git a/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/t=
isdk-default-image.bbappend b/meta-arago-distro/dynamic-layers/selinux/reci=
pes-core/images/arago-default-image.bbappend
similarity index 100%
rename from meta-arago-distro/dynamic-layers/selinux/recipes-core/images/ti=
sdk-default-image.bbappend
rename to meta-arago-distro/dynamic-layers/selinux/recipes-core/images/arag=
o-default-image.bbappend
diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initr=
d_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_=
1.0.bb
index 57070459..c64f0303 100644
--- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.b=
b
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.b=
b
@@ -8,7 +8,7 @@ CLEANBROKEN =3D "1"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-BOOSTRAP_IMAGE =3D "tisdk-bootstrap-base-image"
+BOOSTRAP_IMAGE =3D "arago-bootstrap-base-image"
=20
 TARGET =3D "bootstrap-rootfs-${MACHINE}.cpio"
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/me=
ta-arago-distro/recipes-core/images/arago-base-image.bb
similarity index 89%
rename from meta-arago-distro/recipes-core/images/tisdk-base-image.bb
rename to meta-arago-distro/recipes-core/images/arago-base-image.bb
index 25738059..005704c5 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-image.bb
@@ -1,4 +1,4 @@
-SUMMARY =3D "Arago TI SDK base image with test tools"
+SUMMARY =3D "Arago base image with test tools"
=20
 DESCRIPTION =3D "Arago SDK base image suitable for initramfs containing\
  comprehensive test tools."
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-ima=
ge.bb b/meta-arago-distro/recipes-core/images/arago-bootstrap-base-image.bb
similarity index 91%
rename from meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-imag=
e.bb
rename to meta-arago-distro/recipes-core/images/arago-bootstrap-base-image.=
bb
index ed964415..f6fc23d9 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-bootstrap-base-image.bb
@@ -1,4 +1,4 @@
-SUMMARY =3D "Arago TI SDK bootstrap base image for initramfs"
+SUMMARY =3D "Arago bootstrap base image for initramfs"
=20
 DESCRIPTION =3D "Image meant for basic system verification of linux kernel=
.\
  Intended as basic test system, this image does not package the kernel\
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb=
 b/meta-arago-distro/recipes-core/images/arago-bootstrap-image.bb
similarity index 90%
rename from meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
rename to meta-arago-distro/recipes-core/images/arago-bootstrap-image.bb
index d0aef0de..d6fa5444 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-bootstrap-image.bb
@@ -1,4 +1,4 @@
-SUMMARY =3D "Arago TI SDK bootstrap image usable for board bringup"
+SUMMARY =3D "Arago bootstrap image usable for board bringup"
=20
 DESCRIPTION =3D "This image is a complete package containing a rootfs\
  and an initrd with platform test utilities that can be used for new\
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/m=
eta-arago-distro/recipes-core/images/arago-core-bundle.bb
similarity index 81%
rename from meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
rename to meta-arago-distro/recipes-core/images/arago-core-bundle.bb
index 0711ec10..4b188fd7 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-bundle.bb
@@ -1,11 +1,11 @@
-SUMMARY =3D "Installer package for TI SDK - NOT for direct use on target"
+SUMMARY =3D "Installer package for Arago SDK - NOT for direct use on targe=
t"
=20
 DESCRIPTION =3D "This creates an installer including all the default image=
s\
  recommended including source, binaries, filesystems, etc.\
- for TI SDK. This is meant to be used on the host system.\
+ for Arago SDK. This is meant to be used on the host system.\
 "
=20
-require tisdk-core-bundle.inc
+require arago-core-bundle.inc
=20
 DEPLOY_SPL_NAME:omapl138 =3D ""
 DEPLOY_SPL_NAME:k3 =3D "tispl.bin tiboot3.bin"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/=
meta-arago-distro/recipes-core/images/arago-core-bundle.inc
similarity index 83%
rename from meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
rename to meta-arago-distro/recipes-core/images/arago-core-bundle.inc
index 2e3a3072..63b73229 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-bundle.inc
@@ -1,4 +1,4 @@
-# This include is for the common setting used to build TISDK images.  Thes=
e images
+# This include is for the common setting used to build Arago SDK images.  =
These images
 # include both host and target side content.=20
 LICENSE =3D "MIT"
=20
@@ -27,7 +27,7 @@ DTB_FILTER:j7200 =3D "j7200"
 DTB_FILTER:j721s2 =3D "j721s2"
=20
 # List of target side images to build for the SDK
-TARGET_IMAGES =3D "tisdk-base-image tisdk-default-image tisdk-thinlinux-im=
age tisdk-bootstrap-image"
+TARGET_IMAGES =3D "arago-base-image arago-default-image arago-thinlinux-im=
age arago-bootstrap-image"
=20
 TISDK_TOOLCHAIN =3D "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX =3D "-tisdk"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b=
/meta-arago-distro/recipes-core/images/arago-default-image.bb
similarity index 91%
rename from meta-arago-distro/recipes-core/images/tisdk-default-image.bb
rename to meta-arago-distro/recipes-core/images/arago-default-image.bb
index 27c5671c..becd3e9b 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
@@ -1,6 +1,6 @@
-SUMMARY =3D "Arago TI SDK full filesystem image"
+SUMMARY =3D "Arago full filesystem image"
=20
-DESCRIPTION =3D "Complete Arago TI SDK filesystem image containing complet=
e\
+DESCRIPTION =3D "Complete Arago filesystem image containing complete\
  applications and packages to entitle the SoC."
=20
 require arago-image.inc
diff --git a/meta-arago-distro/recipes-core/images/arago-jailhouse-image.bb=
 b/meta-arago-distro/recipes-core/images/arago-jailhouse-image.bb
new file mode 100644
index 00000000..e1b265b5
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-jailhouse-image.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Arago image for Jailhouse Hypervisor"
+
+DESCRIPTION =3D "Arago image meant for running Jailhouse, a partitioning \
+Hypervisor based on Linux. This image is derived from arago-default-image =
and \
+contains additional firmware and management tools for Jailhouse.\
+"
+
+require recipes-core/images/arago-default-image.bb
+
+COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
+
+IMAGE_INSTALL +=3D " jailhouse"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.b=
b b/meta-arago-distro/recipes-core/images/arago-jailhouse-inmate.bb
similarity index 53%
rename from meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
rename to meta-arago-distro/recipes-core/images/arago-jailhouse-inmate.bb
index bcde33d6..0ee22878 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
+++ b/meta-arago-distro/recipes-core/images/arago-jailhouse-inmate.bb
@@ -1,11 +1,11 @@
-SUMMARY =3D "Arago TI SDK super minimal base image for jailhouse linux dem=
o"
+SUMMARY =3D "Arago super minimal base image for jailhouse linux demo"
=20
 DESCRIPTION =3D "Image meant for basic boot of linux inmate for jailhouse\
-This image is derived from tisdk-tiny-initramfs and contains additional\
+This image is derived from arago-tiny-initramfs and contains additional\
 packages for OOB demo.\
 "
=20
-require recipes-core/images/tisdk-tiny-initramfs.bb
+require recipes-core/images/arago-tiny-initramfs.bb
=20
 COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb=
 b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
similarity index 94%
rename from meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
rename to meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
index 477986e4..a30acbfb 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
@@ -1,4 +1,4 @@
-SUMMARY =3D "Arago TI SDK Thin Linux image"
+SUMMARY =3D "Arago Thin Linux image"
=20
 DESCRIPTION =3D "Minimal bootable image with container to start the next\
  complex system up."
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/me=
ta-arago-distro/recipes-core/images/arago-tiny-image.bb
similarity index 81%
rename from meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
rename to meta-arago-distro/recipes-core/images/arago-tiny-image.bb
index 40c58e99..76047f75 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
@@ -1,4 +1,4 @@
-SUMMARY =3D "Arago TI SDK super minimal base image for initramfs"
+SUMMARY =3D "Arago super minimal base image for initramfs"
=20
 DESCRIPTION =3D "Image meant for basic boot of linux kernel. Intended as\
  bare system, this image does not package the kernel in the\
@@ -16,4 +16,4 @@ IMAGE_INSTALL +=3D " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
=20
-DEPENDS +=3D " tisdk-tiny-initramfs"
+DEPENDS +=3D " arago-tiny-initramfs"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb =
b/meta-arago-distro/recipes-core/images/arago-tiny-initramfs.bb
similarity index 93%
rename from meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
rename to meta-arago-distro/recipes-core/images/arago-tiny-initramfs.bb
index 8a4262b1..4605b7a1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-initramfs.bb
@@ -1,4 +1,4 @@
-SUMMARY =3D "Arago TI SDK super minimal base image for initramfs"
+SUMMARY =3D "Arago super minimal base image for initramfs"
=20
 DESCRIPTION =3D "Image meant for basic boot of linux kernel. Intended as\
  bare system, this image does not package the kernel in the\
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
deleted file mode 100644
index b7bfc825..00000000
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY =3D "Arago TI SDK image for Jailhouse Hypervisor"
-
-DESCRIPTION =3D "Arago TI SDK image meant for running Jailhouse, a partiti=
oning \
-Hypervisor based on Linux. This image is derived from tisdk-default-image =
and \
-contains additional firmware and management tools for Jailhouse.\
-"
-
-require recipes-core/images/tisdk-default-image.bb
-
-COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
-
-IMAGE_INSTALL +=3D " jailhouse"
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index fc04e6af..9a4c5b25 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,4 +1,4 @@
-meta-arago-extras provides additional TI SDK applications that are distro-=
agnostic
+meta-arago-extras provides additional TI applications that are distro-agno=
stic
=20
 This layer works with the latest Yocto Project release (currently 2.2+) an=
d tracks
 the stable/maintenance branches (currently "master") of the corresponding =
layers:
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 22957218..f2ae1aef 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -169,7 +169,7 @@ RDEPENDS:${PN} =3D "\
     ${TI_TEST_TI_TOOLS} \
 "
=20
-# Package group for things that should only be present in tisdk-default-im=
age
+# Package group for things that should only be present in arago-default-im=
age
 PACKAGES +=3D " ${PN}-extras"
 RDEPENDS:${PN}-extras =3D "\
     ${TI_TEST_EXTRAS} \
--=20
2.39.2


