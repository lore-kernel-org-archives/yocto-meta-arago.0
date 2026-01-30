Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B12EE6BF39
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 19:47:27 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.811.1769802437831931302
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 11:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=gPFqLMn8;
 spf=pass (domain: list.ti.com, ip: 40.107.201.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOB8aZmGFknyTiz5AIg340T0ttKLL8NUOE5LiEKhKijM+2grLFvdjVTWNThLf/PUTMEBIwOy34h8RF+uzu38/htmFAiAU22VmSF1spzWxGEEvWTr15F2yZMwc3Fzj5aRkm5n6Rd2shdaTP/UnxcfqyP6UxU0lon9Y1F2yVQ6kVFC3kkicVBf6GKGpIiR3BmTDCyxyjGe24n5KJtFOnNSMDTPR+X1cLo/VnHO41yXwzAV/qEpiLyjRA2xLO0laphWMlOxOP3JAdRP7Z3CzBJsqx07oXvtcbtMyqkyOAOCNr+4gMQCDjnMsr6NVFMecW1cyTosVn5fJF2ZonBQNscrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gibtYhzTi+Ne1nKpVBvHycOrv3qrpm1JuXcTNxC5Oc=;
 b=Q9d4Y05Mo9J2MwN78Nqt1Tqd5HWDQbWrkBLNtv1sNs4/r+JS/lc6mYWXM8IGwQiQkzBJJIT3xnkYCxMtOqxym+pL0yj45DCtI7nLhRqQFWlqAiQNfrWUlbr3LHwPaR9XwRpCdmQV8a5aMFzVGSrlJimGalV9TYfXSV7dA92T32zXlUmxmxke1abiIlIiXd1N6ik4+SqjybY3uUkn2A1Yo0oDWaz7OQKsLZQ1zdzRjectxFR45TufsUiKCq03nOkEpkaOkmmqYlvdB5T5OVmodOG5hr01BFz6eDT8Z0wvHO1JDJNdqugDru+gjf1M8p0FaaaU1wcITWUfUIygjwuuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gibtYhzTi+Ne1nKpVBvHycOrv3qrpm1JuXcTNxC5Oc=;
 b=gPFqLMn8j4Bkf4qSAk/XHlqbtXKuhBuPe4mzf6ePRDIAsYPTeoL7fFCAEXxiXdODrkGNK75beOUK8BxsOlmz+kw9zY6XE9cDMshnL/WYRMClhRkdvDs3DUNolmelQ1tPXOAW2lfnCDclCZjnvKkzkU+ElXgogKufpdCGSYO8qiBJkVJWwiOZXHYXEX+kX4+xGvDfe5qOBgMft99stVZ4bb7QGWsjNhYC9rl4jz96euhnjAi0fddwEsbZTQYztUAqnnYkHN5HPQty3bZNmLE/tF02RWDa78rkYgxv88Cw0EC3+1UiIo7d4VpBMsBw9g6h2h6hZWxcTWlD1Dys+m7Mlw==
Received: from SN7PR04CA0217.namprd04.prod.outlook.com (2603:10b6:806:127::12)
 by DS4PPF4F3334483.namprd10.prod.outlook.com (2603:10b6:f:fc00::d1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 19:47:15 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::79) by SN7PR04CA0217.outlook.office365.com
 (2603:10b6:806:127::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 19:47:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 19:47:13 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 13:47:12 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 13:47:12 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 13:47:12 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UJlCDe2975787;
	Fri, 30 Jan 2026 13:47:12 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2F1779ACF4; Fri, 30 Jan 2026 13:47:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202601300920
Date: Fri, 30 Jan 2026 13:47:12 -0600
Message-ID: <20260130194712.850046-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260130192501.1648172-1-lcpdbld@list.ti.com>
References: <20260130192501.1648172-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DS4PPF4F3334483:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e981435-9ac5-4b46-dfbd-08de60385dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GPKPsiZ5TkS/DgNOSjIgSpGnzvCrycfuRnKODDmboMZNggsUGtLxx7wix6Wn?=
 =?us-ascii?Q?gZrKUSQaasbbFV8QfbGplosM9juAoCQEIjWbO4Ml8/n4KNCbS5wWsgs8Pv2e?=
 =?us-ascii?Q?bCV9bWyy7aM1Zay5cxmMOt/QclP4fxwfKw8ngBGP9zJjLuB9m8tR80Xt5iDV?=
 =?us-ascii?Q?wHpn4cL20qCwVkuTGSFDhzeEUGNjNpR+r1RMeGhhfpZGGZOIw5lQ65mHuZ7/?=
 =?us-ascii?Q?wu8O3Orjm2zyGAyodimh8gZTvUnqr8nectHA0c7fIpYcfS6Pi7htOqlODpsk?=
 =?us-ascii?Q?W/KVIhuRu+Pw8Kwia88EHF4czLUnGnlr6s5PPfo98oHieZUylTH4NsnjFzT1?=
 =?us-ascii?Q?m7w4WXrv6W2fanQvkdODzdvPkdN8S4xndIi0W3ZGhaGDZFaQOVWfbN1gICM8?=
 =?us-ascii?Q?FLGkSGy4OGZsZqRzpHj66CAmHEFDWbXWTkghVnDJ+HQp11LqrGH9sBN6Zcf4?=
 =?us-ascii?Q?N/mmYHN2wzCnnLVDd2/wQmUdGsWA0QrWcJxQw+2gsIrM21amqFjLpes4q57r?=
 =?us-ascii?Q?gIxgxjvve6USIPufZcqmBUWZrq7tTnebNu+Hb0s2p3aYQaOFaywdczT3TRZP?=
 =?us-ascii?Q?Fs+7VmizrGLmFarFZGeHLJpFjcg/V8BlAPokOfrT21fYVzr7dfaNqwRCeAHc?=
 =?us-ascii?Q?Co9uJiO206sTXJxAuH+hi2QVrs47rB6izZ2UL9juZAJvqA+r/rlqjxuTv+pm?=
 =?us-ascii?Q?5e1HSTg1XFknlGdwpuZFY3LeGOyuQFo1lMADzZohhE6+8uo2Ju6bQXo/SxUH?=
 =?us-ascii?Q?J4rOq+hgorqRyzN7LJWGDDvbJTijexjQK1HZtcQQM17jjRF+WdyDlmczt7b+?=
 =?us-ascii?Q?VSuU3OetJopAe2XsP9rJ0d03NJzt4nw8brr5iGYtwQLPL41nEkpw0FGJHVRV?=
 =?us-ascii?Q?Nq+jTzOBbj9Skyu/2h+XATPm9zw3vm4Febbp31/CcwH8eXx/Eqa4QNqKwjv5?=
 =?us-ascii?Q?znhlcwR2cVdbf8LxC+ptDFIj2m42oYgBHqPuqObVgYhF4fu/RFaClnytIau6?=
 =?us-ascii?Q?fs6qHzBM4f39aNUzs6xcgojAaEr5cDOlVcL4ioCNxCucBOEmGW57ckiG3pDu?=
 =?us-ascii?Q?NOwQYjaSWmSwBPJkzAGw4pW2FDpWDIzMZS9CoZRRoPHhe1N8zQmDyaOdlkcv?=
 =?us-ascii?Q?ZjOw2PbOEhnp0bPK5tZRvnizA2sy8RKe7SNXuEXLTuHhXzzU/k5CK/Q8OzuA?=
 =?us-ascii?Q?Mbew/irKKPOZISSXhClZKucDcV+3kZXVIISonxpXbBX1gY8wwllOv9FGxO5W?=
 =?us-ascii?Q?bh8ZeptUBzAs47Z0Hx3d4arh9Sa1g/pfKm8R7HRdG3x2qXQYiy5/oo1LIlHU?=
 =?us-ascii?Q?t1j0vvc9S3lhuKjLjDvTuzITO0uKr/WLp+zM2YfEff7wItjr0fHHNdHz03iq?=
 =?us-ascii?Q?N7684tmoRauVc467gIR5V93Zgrkljoo1RITXflVzWmoVqZpplbKpcs63EnOg?=
 =?us-ascii?Q?DwZu1Nv22DlEcx6mFXvOZaMu5xPJKOTceJeZpvtvzriPnBOSnscJn1Vy1UIm?=
 =?us-ascii?Q?BPciReG2d0XY6MKcNNY5b3iMJqNo/A/yNxjINzEHKym5Z7hTvrqink1lJkGA?=
 =?us-ascii?Q?40M3OXLWjQC3oJmHYksSS+6MdiTjTN3VWfubMN5cTfpgeqWHmw3zZdhIDBNm?=
 =?us-ascii?Q?E7pS//qVgdgKFVRrQaxKlgk1xRMCviUnPQuAa38bq/AmrSseapYdB3PJRO+u?=
 =?us-ascii?Q?Vm7bZg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qw9KL6pzw069+7mfkz5m3eXgYTZ7U3giIbB51KW6/mbfjpE1dndGJ/lzuyL+2hatRNRYaSU4Ky0FXDydXMZHwecJlp3I3ItXGSC8rel/N1O+NhxThYJerUG0q8gRIeih6emEu3Vqn6ELcnGfd0wOK87p+QxFjMLkVDUmOu58aFDV9fXLnevkg/IwBseCWzlP6gqCsaqSzWaYbr4FnMm093IcvR6CAy26WB9YDMFinvkYEwQP9wbOc+ame3TWHaoByYREo85i7r2y5hMK/857ZCrFb84ia5QscHsfSDywqe7/cuuupS2eBmnBl8ujf6VLvgXxmgy4ojoZm7Lkv+sfJDWTb5NXKCcCJTnzYC8YZeBQgsCzd681ZPM8B0KL8SEB1tHo7F5mfOzqef1JxaP113Le5i1+Nn3nW1GtCtCliIU3Fxpi2wxXyuhEcGVPgusH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 19:47:13.8604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e981435-9ac5-4b46-dfbd-08de60385dad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4F3334483
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 19:47:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17056

meta-arago / na / 20260130192501.1648172-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202601300920
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 30 Jan 2026 13:25:01 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fe0097954370c27076faa18b028b589cd=
cdd7d91

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601151800
- Commit SHA: 63f45c3f6fce3d67aa65cf964cc58640de0b5a27

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
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




