Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5250DD73EB1
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 11:10:59 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7999.1769771449990357015
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 03:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=IgaIS3Mx;
 spf=pass (domain: list.ti.com, ip: 40.107.208.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kocTxkPOvBhzJJT0wHWo9JTF87h/N8LxYQKousGRyxS/G++gmG+PSbWf4EhGsKmyjBvwxeY26QIJ2S/yEmRi6x2L5WLHdGWTbBaiqaPBdc5OvEmk9S0HUSvAEiviqm6TEDH0a9oHfKfZZzV9g4NvZ4CfPi5IMOcU16buzhwhGgR/bPkBvgzjUDsJw9DsmcSMwlMxdm4pUaNt7BIjMFbkr5xb2btnaU7Y8Kp0HDkN3q+FgzKPISr6jx0JGscVyk+D8UOCpfRy3vavizBKcE5z0+FLYFQ3GBtoCb5LtTes/8sAE5v3pCYvQuCxcXMj7274Qzr9O85PWfeOrWT9T/QY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujy76GQXnRsGdm0gp+Cjv+S5v/uPaKERLr33+SW4X1M=;
 b=O6KgzyxoiC2qJwDpRhZTp5cYQZRaaY10zwlWtK3NtdZQIhhyhtlTZTn4Qs0dxd0IN/WfZrrYvlfIw5o0ro0qe9yQXHbh45W8Jy6BhnvZWuLVcuTAG5KCTMUc0OpvvU/iW8kzjsiK02mp4DlwiUmoBFoK5eFzZ/LzWFi9FtmkSPHIhdzNSTfnZs/3KsLDRTtlbCnr9JYA72kJSPDgINO9bRUSwN2QXjhJhIacWIT+hsih4UKclX0SROSKMj8JvUYRCiIDnP+6B6uDUO1vVi5kcdFY7tldPyeGBAFsyukAOSzDvkwj4rbUejqJ8JLW3++tHiKnmuTh+Z/t96Wh6YH5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujy76GQXnRsGdm0gp+Cjv+S5v/uPaKERLr33+SW4X1M=;
 b=IgaIS3MxP3e1rcAdNEf1UCHodeKWR6zj3HOoY7U33q6RidLwyZed/6uMqBwnvdrorcXUnW3+pQn9Ga0bRQTh+5aLZHdCpxAcP9663LweZyKy6ZH/l6ntqAYrLq6VIkzm195j6RrMrixKuoVOYgzBtLRfjePpr3V6Txbeootq002DM07mjcrA3BXDb5YYxDo0OcCKLXAZtSZnrwRUSHghSfIIxMpZbp3La4UD9T4jRPp7pCO5vJ3UX5Hwu5jtyMufRY+8f3U8zfqSGRP9jf3oILIPV8mVgt2OnBFrynGAX1deNe8PeeMeDeYI3voknmM2w7boUnE7VV1RvyU5am+OiQ==
Received: from BYAPR02CA0055.namprd02.prod.outlook.com (2603:10b6:a03:54::32)
 by DS4PPF1F77AB10F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d0f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 11:10:47 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::8) by BYAPR02CA0055.outlook.office365.com
 (2603:10b6:a03:54::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 11:10:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 11:10:45 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:10:37 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:10:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 05:10:37 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UBAbH71214335;
	Fri, 30 Jan 2026 05:10:37 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 924259ACF4; Fri, 30 Jan 2026 05:10:37 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <gehariprasath@ti.com>,
	<a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v3] meta-ti-bsp: Add udev rules for MCAN to meta-ti
Date: Fri, 30 Jan 2026 05:10:37 -0600
Message-ID: <20260130111037.1779232-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260130110622.2338091-1-a-dutta@ti.com>
References: <20260130110622.2338091-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DS4PPF1F77AB10F:EE_
X-MS-Office365-Filtering-Correlation-Id: 72372468-be74-48b6-c22f-08de5ff03726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9P3SBSUxa7QMdXMvT3JU+2ZouapI62+LC44nEh2RDcTuC7V3sUA+xjEeXFku?=
 =?us-ascii?Q?dKstO94SDf/UprNPybdADnDasuMrg8pmuMHsntvk7zVYhroz2vIGA8vOiw3m?=
 =?us-ascii?Q?kTgdyBq+M0oojDVMVMpd2fpynmK+AvyE5G3oOiOibkNkt3TRmmMo3VAe/1CB?=
 =?us-ascii?Q?9H9VTgQASWb2KibD08MzNIobAbqS9AZL4wAtrlQIfnsbPxQYSKos5G7UUh8x?=
 =?us-ascii?Q?76uu4/fgMkqmw/FwxGD40CpZ4g/fjah/p4l4QUda2XHc6sMooogrIuJTUlAY?=
 =?us-ascii?Q?X2NaeBe0dv5YioYtYST5mQIm8OpKZBQlIkqJWkocHyrWY2FiS7/3yuVYlVsc?=
 =?us-ascii?Q?scMR9iWrOkxM19/ByTzhCuHZZRbhifF332f+lC6t0haImiWM6z+LuXBfh7jc?=
 =?us-ascii?Q?bX0LvQ/1/sh2AVIP70zb6immgr5OiPj/5gKSQzbSmaZTo0LVMMGHBG4UxyPx?=
 =?us-ascii?Q?N+8uVzAcMKy39Pggc8txVqpxEQEaCb9tdAyWvU4ym4aWMLFSyVQC/e+nLhgL?=
 =?us-ascii?Q?BuMuHHRE9p3V7VQso8wkIfQOrXgIr+3CRXkNeq25CF+7Weg7Sa2h74BBsHpv?=
 =?us-ascii?Q?CfSLdstcoTkgTiEq00VtdF2xYssxfWyjdU2F9O7mcayag7JAbV61Ieq/6K3e?=
 =?us-ascii?Q?607Ez6f1tumuofgPd4NCDSahsBCxVJ7BIyQcKuQKm5YeBbIAJgCHTzozYMlD?=
 =?us-ascii?Q?CFb1iD1lBXhYWcMUd77BV2P28N6cuQOA18+giqDA6aXJWTVwb0m8xGIHffr7?=
 =?us-ascii?Q?LvFWOjTIeipla28Rvzx2c6jVkEKMx2WtP3to1LbaJ6kYWct/uP0ezu5+gW1C?=
 =?us-ascii?Q?zIIM/BDP46f0YSLYPQWWt5Cz2dioAiv98hEBWBzqzoMmK7Y5MpvKiDyOf3W4?=
 =?us-ascii?Q?l3m0hrCaC28nVXG4tgNXZQjdrTlFn/jONvAImIkxaz8zrxpMAm6rrDYM1xA+?=
 =?us-ascii?Q?nmG5IqG8DuV4VY0eMwSam8r24bGcLWHKziFB3UyWV+z+klGekhRTK/2RSmID?=
 =?us-ascii?Q?GpoO6TRESW3r56n+Ld8SY0/O7TaOHkE+9bklqYretFuAXUh/YkwT3DFHIpuo?=
 =?us-ascii?Q?QNXzW4TsPAHcgI01lgx0JGrHSQV/QuwciZZbFq+8GPzpQbswafEVG4zsxSUc?=
 =?us-ascii?Q?EKU12eRvnMRAdHr3e5JbaVKa7actYxaciZWPo5mBgxYpXPV7ZWjRCFSfQMut?=
 =?us-ascii?Q?k4ME0/kInV49TrHUQCCoRLrhLaPO0O8ZQm5PRNWrYyMtLOOnBYRyR10uhgc1?=
 =?us-ascii?Q?Kcsgoc6cTrZSew4IQmqZDnZqtW+a3psaaRnmj/zxIkAu2hV51+iIJ5lEFKSH?=
 =?us-ascii?Q?luU25AJc5XXzuMUpOvMy3iBf3DCw85Zek6kI5fDMlQJf9LZ+YojPHZi2dlC4?=
 =?us-ascii?Q?nle6oSH6+KKsceX0jHnjigp5SWVoIDF86Dwr03lrP5qbl/WcQfbjaJ4OrVDF?=
 =?us-ascii?Q?QnH9+AWcE1hYp4F4k3TDg6l+kVN+UzOm6jRGrzMmonxeHGqDyp/kN+cKpGKJ?=
 =?us-ascii?Q?TYOuWGiF/2KPTAWEF18ox9hrA8tXweZ+RjSY8tX2TwSbWtmIVJC2vRc/JAYh?=
 =?us-ascii?Q?MU1FsTT1WuJ7SyH7+poRsUFiUWqLS4zgzCVetLZBbvRy6jULrLrpUOX9BIZO?=
 =?us-ascii?Q?UNI/TjCIvdugeNTEruGOQUb8xKzpBNtt9SKMnAAE705DfyQLjqhhh6+BWI1E?=
 =?us-ascii?Q?mPp76Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5tU4vx/XGXLdWfiYnp49ywItel/yB12mloAnp6kiE8tpbj6nQOq5lRQ5O2KsNCrmAcq1EvLyq8AIIF59DTd5HHqif1mPhFOt72NYlOq57yX0rcc9GDYWqYHN9f22ZvXJwu8mGHXY0cCYX2m1bLNdsd99nV1inERIBRizCZL3z38oiXgl3c17f5dxiiN11bkCB1Rgzo/XbpPgq/csu285kUDZic4XxEwtNpsiDclyXHoXcgMlxx8MIpEIDcCYNTMYi0zVjQL0XRNrF0qP6LsagCFq33jQRh2nRzE8FFLlkcBrKwRcXUsXGBffQL1wSulEiCtjqCkOJsVkhKp+acMbHaFFXt4mbfik37GOUD7iB7wykJxnvo/nfNfbFlO/W6ax/XB4UM+1WaJKIBcb1VIaTlRigzPAdpis6WTHCHuLBnfulN0++dkQjQt/If5K9PPh
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:10:45.3856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72372468-be74-48b6-c22f-08de5ff03726
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1F77AB10F
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 11:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17047

meta-arago / na / 20260130110622.2338091-1-a-dutta

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v3] meta-ti-bsp: Add udev rules for MCAN to =
meta-ti
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: Ad=
d udev rules for MCAN to meta-ti. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: Add udev rules for MCAN to meta-ti.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH v3] meta-ti-bsp: Add udev rules for=
 MCAN to meta-ti
- Submitter: From: Anurag Dutta <a-dutta@ti.com>
- Date: Date: Fri, 30 Jan 2026 16:36:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1cd4adb4f4f5289afb93a4e9feb18cbf5=
0f3876b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: shadow-securetty: Remove unneeded recipe
- Commit SHA: ec59a3b33249af3f91b45428a35bca8cd1141fc6

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH v3] meta-ti-bsp: Add udev rules for MCAN to =
meta-ti
    error: meta-ti-bsp/conf/machine/include/k3.inc: does not exist in index
    Applying: meta-ti-bsp: Add udev rules for MCAN to meta-ti
    Patch failed at 0001 meta-ti-bsp: Add udev rules for MCAN to meta-ti




