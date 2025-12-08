Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29FDD3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 21:51:08 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4851.1765230667822414732
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Dec 2025 13:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CSMW0V1f;
 spf=pass (domain: list.ti.com, ip: 52.101.201.48, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrPKOv/vA0HBnt4f3iQ2OK+rzUBl6P/f1aaLajTnwG956fo20/B4BCzO8JJoZN7HSM7iMfip0e/jn89NdD7MRZDrEZrU0EiE9L9ZQfyEdp+LMH9fk2g9leD5y6VRH3gar+XZnw8ublq10aH62mvEWf5aCAhQ0hJD4JJyxpKqNIEcj7WXCrYjGP0T/TquVlTKTENBlvUS9nN5/ZZo6m41ejXpXRmLZ9etoTJsMDG66nWKuc5B/dckX1q9PYVoqiwrtexJoBb3NBBJsFP3y3nn9N9uQqqmN6a7wI932zUZB3vUYMTvkSC4p/bZE7KlvH5yYcZkuM6fxAhJ6t/AovoQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gL+yyyrJMEKwY3DEwGIUkWMEx1iGj0y2Jgdvwuuj1Ew=;
 b=Jp/s/qQhQjVdUh+11dftSptDSib80F0bUCypHRtMsfpvQXjLdOKVB+3QVtgeSwNLnJzcbXZO1L61vE1mQ3Vrq//DxEquOlX4c8BDzAKh1oF3c1PfSVWhUWXKrs3YVzL7Iuwe5G+yHmVnI1Poh+2acPybPgc8udUT6p2W4/F9dooVk4+3kmwvkhY+DHVdiiwbY7AEHmH9Xu8XacYQGvLRyIDCwuG8zE3OZzfcUO81yJZ87YqQ9a2luvVH63LJ2/xMROeLvuJ9QbCreVrasxmWuaERESHsCpDOfU8hyYq0LLsmyjcLf/O5tW4+9lt4VWUMKuf1kZXT7rdxOJLUmy0Qtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gL+yyyrJMEKwY3DEwGIUkWMEx1iGj0y2Jgdvwuuj1Ew=;
 b=CSMW0V1fmy8WVwfRPrrMmH92ry5B5YW3IimKDDZzwwzNOHsslzIgrUdMZ3ta7Nqpi12RARfRJIq+TyYWxI6BWjkYRlngJD4ueYt6wRXxPcFreB9fXm3WSVDzU737jC46G7QcM152m4GC+py7Ov62j7bCsYe4Dr23nLYicpxxVTc7+DLmdBBEn3R4mEXKYW93fzJVsYgI4/0K+X9KBNn5p7M5zbhZDhjCLfrOLq45y6LYdPel/eERvWtr7yRlu81nsv9l5h2xIWfPmyuhF1AsmxX3C9L9Fs1SEZSGLzCz1Zoc9JcNqUR2ojr8V/10MGOH1J3uAyYKtSroh05n9WfO0A==
Received: from BN9P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::32)
 by DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:51:03 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::38) by BN9P223CA0027.outlook.office365.com
 (2603:10b6:408:10b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 21:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 21:51:02 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:50:59 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:50:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 8 Dec 2025 15:50:59 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B8LoxBN104954;
	Mon, 8 Dec 2025 15:50:59 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2382F138B5B; Mon,  8 Dec 2025 15:50:59 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH v2] stb: Update false version v2.31 -> v2.30
Date: Mon, 8 Dec 2025 15:50:59 -0600
Message-ID: <20251208215059.1739308-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251208212718.4002485-1-a-christidis@ti.com>
References: <20251208212718.4002485-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|DM4PR10MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8c4625-4a6d-4df6-ce41-08de36a3e183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jpp2HR0zUW17QeWysHkY+IVsGA0X0ueGQp2ohkPATPdMrjaFebdjaIN7OlTV?=
 =?us-ascii?Q?dv5fELBFU+aZETpH/HPStFLdB4SjAun71Z6Rm3XD1zrAHwS6cJlYVqukncS8?=
 =?us-ascii?Q?kPsO5sAP2yonElBs/HcvU4x4SQIiml0WOPrKcNg3K4QSV4k5KRMfiUKTq+M8?=
 =?us-ascii?Q?/k/syw3bw3O8VgMF7CFT/qf5o2mPUV96yl+J2jSxbQghSEaYrtmO7s9WMYlD?=
 =?us-ascii?Q?MXnNbWo5SpJWNRPiyTnCsoIn3KngUDwdc5UgHzsYzVNp8D3oTNnQkJneHiFx?=
 =?us-ascii?Q?HCG/RPlz8nXYjc4lNiKDAbYK0Uc+lX/p+RhIpwfIjbFkHrKSJU/tkJCp96DM?=
 =?us-ascii?Q?GLpeGEYUXwkBR28wmTRXoVQXlAyBvczx4m9inxPYS0720jCbcrS2em9y5aGb?=
 =?us-ascii?Q?ST6V7jhu7tRY4S2kGgCPxWp4AQFvUgN+O7VyApdNImtg1RWN8WIo4chIL4z6?=
 =?us-ascii?Q?3Wb0y6IZZY1Gj0UhBHvxtcK5wiPXG2ZYD9JStKLdMWWCcPVKbDgyZK/DdUOK?=
 =?us-ascii?Q?mzp/sVRvzllEpEupvQZzZWIxMpJ6grR61LaYxJylyvPrYL1/cwRkLQOqZV/e?=
 =?us-ascii?Q?tHnP/n7Nl7/9V92zXieVFi9SDVmisslEoSOVk0thXwHDuNHIc3HYPDJmYD0b?=
 =?us-ascii?Q?2fhkjWtF5i10A552JOEas42fyLqPPFpwa79CYkEi1NGey4TD6Xl8cxEYC7xn?=
 =?us-ascii?Q?KvJFUnMp1BJvcyCH5nSADkSX27PpND/ldPuha2qAm20Sd2cnT/EWYxxAYcpi?=
 =?us-ascii?Q?aqULeFRK/9RtNDH+ZF6PYTxPW/cNPVI/db3DzrZDG8MQOsVKQShSh2siFtmB?=
 =?us-ascii?Q?i37ub59S33YmKIpYTv8Ss4fJiGRMZR6gYfgvnpffrtXM3L6SCoGXx1z2lMDj?=
 =?us-ascii?Q?HHQ40uCMAoXRODBt4rXkUViPZ1Fo104xWAuhz11KlgLLGitSOLsR5DM/pDZV?=
 =?us-ascii?Q?Z/QeK9Y1Rm+XiNVTnINaQ53rr3vAO8jKfxQzS8GcfEaMQMdVJu3xq79hD/RS?=
 =?us-ascii?Q?YY/bTt8vH5OrF3dg8mBItqv60k5WPUcpBQKko7Ftl1593XJ4IB6d7VEcd6Wk?=
 =?us-ascii?Q?ncyXDFKJ3PhGuOF3ccM4W3NlsIVewTiQf+oiNHfLltUJUHR3UG+fnDsaCYxu?=
 =?us-ascii?Q?EKCFxcJU1JwNQq9D1m6m/bxINzmSxObCSk/GNDQG3NUyNNOZsuEw/DdbUnWC?=
 =?us-ascii?Q?EOGVtJ9F4bY6vN3FtWrmXh3r47daNJixolEY4SEntob9ajw82Mz37bgo2AMs?=
 =?us-ascii?Q?mNep0yjTERQnYlySVa0nAed/qYSp1Cc5z6l0cUwh2fHPvIXZYFPa5ALJNYEk?=
 =?us-ascii?Q?FyDZmdTigeORC8vzveW7zqrt6XBu/OFoRgBD0WqzSEclv0AkQG2DIyrJBTcL?=
 =?us-ascii?Q?yIZ40C9j22aExKmWHHWL8FiI0VjKDxKB5OB9GE3eP8w3jtgwJ/suBFV2382/?=
 =?us-ascii?Q?0vlZ49EmfjRNKFfvgXLRtghjpUBK98E4f6qF4UnNmIfNcO+YO8oVlECvkHnK?=
 =?us-ascii?Q?0tFAogQW4aj8BI8T5Nn+Npp/XaDAT34DWZi13W9AJMlDmWfTcYgMmyMWYJGE?=
 =?us-ascii?Q?ML/EYSH5V79Vl+B/v4s=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:51:02.3890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8c4625-4a6d-4df6-ce41-08de36a3e183
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB8218
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Dec 2025 21:51:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16875

meta-arago / na / 20251208212718.4002485-1-a-christidis

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH v2] stb: Update false =
version v2.31 -> v2.30
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Mon, 8 Dec 2025 15:27:18 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c7c49f4269055553b872e37d0f26099d2=
b7cb1b2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512040100
- Commit SHA: 410e1081aaedc1c525825851a9df7748b49cb659

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH v2] stb: Update false =
version v2.31 -> v2.30
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Mon, 8 Dec 2025 15:27:18 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c7c49f4269055553b872e37d0f26099d2=
b7cb1b2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Denys Dmytriyenko <denys@konsulko.com>
- Commit Subject: libyang: suppress multilib error
- Commit SHA: 9b5313c8d016b8a09fb6699839379d1e77a37110

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed

scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




