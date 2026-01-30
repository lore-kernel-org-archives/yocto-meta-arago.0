Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B014E6BF2E
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 16:43:01 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14926.1769791380815039150
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 08:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WlJR8ztV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.65, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pu/Kjos8AsQ192HmNyOzmXEMs3rvUNtODhrvDt0Gr0fMfMy93BZYKseo7BAyeXspPO061Fk8V3QNirmeKSWIbd8+v59F8RryOAdytPVRmED9xGWRjLLXl/GWcTN0w+iJnPoARe5DSkfS2giotvz5jcnv1dU9n9r0Xj9pKvFog8Y7NIVUuCOq+PpttqyvW9lz1r6T1BSN8GMxJ4dRdabAZEaXwICZe/tusJrWSzcyDBj69hb0GtYrQLn4XDlTU/h3QbrLzp4RhGO2ROXS7wDkoY0KlhuCrDNYGL4o3kghh6QRkAttX3dhXHNiYHVIyYP7PE/GnpFHh8+o2ihSNMfDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SlgB25156cd1tOZEl0RoYr3Ex5UKW4Js9mo31l1rOc=;
 b=JE75oaZsNHGmFT6WasqM/MpniQ/+IUR9nntRLRgiAPJS3wUBBUSQf84wx1OWv87bCLhb7L7QFVvulG2u4pr3ZetE5dEGNRRnja5gxJx/w54sO0y86VI7q0qLgqd9GXfrV/tZI1ivG3WJHKBGFzXMewS2F9ep5TWEBwimFOECx4zaSCbVo034vo0A0jf9P/DeNS6OjfY/yf47KOJR5+JQoUH7MeGu7iD4JrkdBB3F+Xm+cn1oQybUypvK/HduC6S3kpcU4s1Dm2xuGrdGO0uf4Yg9BNsLZKUGMt/OLzaNSJgjG+1yunnpKLVG9JuLmdZzWvEefWOH3ytdiXGiExVm3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SlgB25156cd1tOZEl0RoYr3Ex5UKW4Js9mo31l1rOc=;
 b=WlJR8ztVraYl92Hfy/rqyQBoABW+UjMBpFBmezocM8mtfuaC6z5B1BAxE1Qal4EUwEAxpWGzkxiQTbaKWEcELiwFnAv9OsvZvkNR7pko6zcjjvU4+EASU8RZX7rQnlixsPAZZEQzTP1gW4jWJ3ocY+AaYTMxWLjUvGKhykxaHcw=
Received: from SJ0PR05CA0125.namprd05.prod.outlook.com (2603:10b6:a03:33d::10)
 by SN4PR10MB5798.namprd10.prod.outlook.com (2603:10b6:806:20d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 30 Jan
 2026 16:42:57 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::5b) by SJ0PR05CA0125.outlook.office365.com
 (2603:10b6:a03:33d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.4 via Frontend Transport; Fri,
 30 Jan 2026 16:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 16:42:57 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 10:42:56 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 10:42:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 10:42:56 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UGgu0x1610487;
	Fri, 30 Jan 2026 10:42:56 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/2] meta-arago-distro: Remove TI SDK branding from Arago images
Date: Fri, 30 Jan 2026 10:42:52 -0600
Message-ID: <20260130164253.1601744-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260130164253.1601744-1-afd@ti.com>
References: <20260130164253.1601744-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|SN4PR10MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e366b7e-e095-4fa0-193a-08de601e9f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GPk5LCAslDuL7YnUPQ9MXlA+I2uIoE9+HrWXFRxHeeUox1rpe/cWnmmoBRVp?=
 =?us-ascii?Q?CbxaBGVm5mGoWDKDB0xgGa8EZX8TdJld0wWbdChvSCavQiaZ8mcUBhDborR1?=
 =?us-ascii?Q?6IVxcaZGbHtwLRbEMZ8xb+oAzp1t3Qo9AfzgFJ1N3u0nzjH+8J5ZoiXohxNf?=
 =?us-ascii?Q?v2jA1iJ7GZhMMIaRq5FM1ex8GoAzzedp92AgtZfle1f4Vp7fhrnu4zSqdtKp?=
 =?us-ascii?Q?eNKFVV25njgyWnzbbJm6cXkOqh+Pw8C7T+aWEzdhykuyj1cBw14e98MSK+rX?=
 =?us-ascii?Q?PkjdzOu8ov3tUiO6UovKY8I7cAzkg/tz1f5IAcM8nkQHXXbFGfuwLkwCI/VF?=
 =?us-ascii?Q?2YzODk6MZciE7wRtHGPn4b6H7K4diMQPxdMdqSCLsc/WlCXkqq4N+SQef8DQ?=
 =?us-ascii?Q?0yTBHNihZccverXa3FbNazuaiVkJltHXIo+Ao4Q3zwJnBG8s8bx369i8N7Pi?=
 =?us-ascii?Q?xOTtvgzb2ct1jSP5fqVrzjMf5fm1cmJ7t936UkfX/rQx0ONab/u4+GseKZOs?=
 =?us-ascii?Q?93fjFBoOygp+1dtU3J3DuFqKBCc4Pr3+czKkh0Q3mnullU0MAAprBJ9ceQPx?=
 =?us-ascii?Q?ii/wSytKphABeMKh7YdCjd7IAyac+q8jMqvfVMDFj8boMUmPNTkCCQPNedkX?=
 =?us-ascii?Q?y8jM6M6BCFuOPxSlj3UVklqi20lsT25KIsCbJDpevStT/0GbVW0vYO0GvjsV?=
 =?us-ascii?Q?HDOlckvjzLMEKlYD0JgVQYRDMMciCI4ArbO4hyKmmjZGn+JmdX0Pycf2ZFlP?=
 =?us-ascii?Q?V2bWwAZCGFanOqeg/QumyHXyTocfYTp5soAJySCFObX1c8zaN9BIgyQfkAYO?=
 =?us-ascii?Q?5FvEb9d8PLp7F2/D4UuvHCFcx8eNhrH8xgdJxZWtQhb6TH+nzJSNYw7VZJtG?=
 =?us-ascii?Q?p1ZpjvYOCrBhNWow9PjfpyBmPAG1Fn+oUbv01C17jozpyKoXXBDT3dXV3FuF?=
 =?us-ascii?Q?BQpPYVsfEIfY4MnWCvA81A/sbn7/3Xh+VR96puj2z4VZ5acF4UoAu4oahejf?=
 =?us-ascii?Q?geMDeZ3U2ES/VEbGPwYXvmVcPIPUDf7cQzRRJMmnGHxITdqqm6VtNM+KhAuE?=
 =?us-ascii?Q?I9L2hdZWnTayTNBHZTdTaABJrqqFn/YiLjo720CVWvVeHM7lNNyxBo/L83hh?=
 =?us-ascii?Q?pSepHUB4j4HTcRqBztm41B3vL/QCxrDLnrSamOKi1EAwwUK4sNXtiz6iYkse?=
 =?us-ascii?Q?RUqy/GNIotVqeTsu+0eSQC13Lc1Vdja2K5aIa6Z7DEdTFf4IxoY3WvaxfZwE?=
 =?us-ascii?Q?5HlwRKOtc9J81FULwwrNYlHzZj6qDpzQVELm0ApAaxC8V4TcYmAO6KpvRI3C?=
 =?us-ascii?Q?0bpptgHke6OjXTIWpwEtOi99El3BAg07BEZkhZmnEzz+ED2RJAvO+yeDLAAF?=
 =?us-ascii?Q?sOfVOYKYNpcZ3z/SaERoCDguUv1qoyYBlyw5hI2B+gBsnwGKq9CLjnhQr8yd?=
 =?us-ascii?Q?YvdYyiqNcKE4k8v1Yls+64KimBplnSInlS6iuJgjquSRg+oX2b0k2b8Xcdkw?=
 =?us-ascii?Q?lDB+h6lAonbFoT3WGTM4KyjbnYtYh3P/O1O31FJY2/wc9NP4NlY4IpNxsvUL?=
 =?us-ascii?Q?oONzokXy0ZaNLQMiyEHsQr6zpilZ48o49dsEyVaqcMap4yDqB7e3yRymwn3u?=
 =?us-ascii?Q?DhzaDZRoMfspm/k/NU1qybnBWv/Ge7DCM49QrnWAP8EBf4+wf+pjAaIDDFqy?=
 =?us-ascii?Q?R/yeaw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mictK5AhI1dHsReEVpf0ND8KcuUp/lJb4S+MDCw5AOwaO4sKTQWgOM+zLaac+8qGSrEqMpNHkjf60afW1yyDZr11w2xvu/cxqhxXnBUkaR3zbazLq8EhCJWRAWbDTu5mfPHoxTbuw/Fe3vXWWc3r47T3t/6x8Gy/bnahpWX76YvX0LTDSflgknozsKb5Hm7e+DFvwO2pmQm97OwcyyOGqc2mdX3OqUfGjpUuqDFUPDR2fQ7f6xdULmCTWN37SgI/hUApZd8+F6Ffu+38XuHhhWS4xaKZcPDT4TM4h2iNQPVWgHHvI3JZRaxO5sz6DQj/+SSe706mhmJvZfNza1JgvinV0mdzKVLDhkQjBV3I68CwC3211tXkEtvtM832oU8zmL6UmfVaM7oApabupgrUJL+WBVFiILNx/kycDrKaCFQLuE0IoyUxUtEEebgkOmFY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 16:42:57.2794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e366b7e-e095-4fa0-193a-08de601e9f7c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5798
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 16:43:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17052

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


