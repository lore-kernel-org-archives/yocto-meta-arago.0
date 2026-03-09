Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A07FFCA17B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 19:34:40 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23344.1773084874700746253
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 12:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=dPf9aJAg;
 spf=pass (domain: list.ti.com, ip: 40.107.200.33, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v66mREUfRzfCGsLHjw4GwEuS4CW68VQih4hQfTfC574EykP15kV8kLY2bzeXxN7HOoqWrzy/bMzTT/zzVgKszmKwUbDrdRfz7jZVjWO/5tgQ4wFPSiYwOj7RNjFFzS9A4LBLyvoVoQlXg3W9rWHGwWQi5IGjKc8bZFHVa/LYHR+NuJ31I4kTNKI9/XZjKofyOZsAfMi1/zNyomqHGt0rO9i18joFp9CtVlA4g+laLxYTA7NF2C9/CyJhj5PLdMJhpLj0PIUO10W10rYeA2DwX4fMIbeEANbx8hT+ezIciw10wJhT4cUTHV9hXmch/kNlsEx0ozyO4dGL2w9HBfpcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btjiXy4K6EopJxb7V6lzunFhUTvAxayk4SIQVOeaFdg=;
 b=sY1mU5P28HCGNemGJpo22Jwq9Y/g+FBYOA4XyG8S/5h0ZbEHGd1yks0t2b6PPLdBaKybP6BThMrJbadIbKd48jboyiBbm7N9EaIGRQir5wzvYYUifMGWQlW6Ft8N/YtfJ2pkLYVt6BTfFC3DysiLr0us7DZvxLJwKH7+rlNZLTSD+bP7QJOBkYgmTJdbo+eS4pDU7FoIgO4OqNUtqQuvSJuQkrJrSzNWBry/TMdP5K9RnGVkxGH+hB10jiQz0/lG+oBYGCz7PpVAdSBSzjvOtkWJE0DB0kCZg0WDFhIFs5sp2bmi8jOqdzeNq3xKNPdyJLn2Yx02vJiVs6Awv93cqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btjiXy4K6EopJxb7V6lzunFhUTvAxayk4SIQVOeaFdg=;
 b=dPf9aJAgZWW8ce+5yseZhqbgu5QGL+MpKoa4mtWql/oga6/xtlx/yC/CpSxYAwQWzvi5lrmrGjdGar/wKfQSsnCYiTEw+3LaiwZhWDlqYypMSFB8rYlwdA6schFEuNqSKpjPIBM3TUAcfpNmlhm6WMwBerwa8a17TIxAreOlTuoJPzqIlGxqGLVkZX3EHGHQpPmeTjJDYh3MwQWWc2gh7njGmOP78cfLvHh5gwcbTd/LyGFCn+7NBBqE73+1XvOUlpZ2YuCNzJfojCst+O9TQDwtaS35Sp+M4TPgVSYsZ/e4pjXqNyHXOKqmRawSGN9n8hnvesNDTHpLseJRoI6cTQ==
Received: from SA0PR11CA0107.namprd11.prod.outlook.com (2603:10b6:806:d1::22)
 by CY5PR10MB6117.namprd10.prod.outlook.com (2603:10b6:930:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 19:34:29 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::63) by SA0PR11CA0107.outlook.office365.com
 (2603:10b6:806:d1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 19:34:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 19:34:28 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 14:34:28 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 14:34:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 14:34:28 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629JYSVx1181307;
	Mon, 9 Mar 2026 14:34:28 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4CC7F9ACF4; Mon,  9 Mar 2026 14:34:28 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: Add missing iproute2-bridge dependency
Date: Mon, 9 Mar 2026 14:34:28 -0500
Message-ID: <20260309193428.574229-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260309191959.1659898-1-reatmon@ti.com>
References: <20260309191959.1659898-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|CY5PR10MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 57090e56-b792-4e34-5f57-08de7e12e16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014;
X-Microsoft-Antispam-Message-Info: 
	DiTmx48N5YUpu6Ehh4YrHHIw8sr1McX4I7U+M9BwGamPlDCET0MfXLxXs1lblIIuafJIAiOSO5fZD4KFNkCkcZ4amalF6eqDvkbCcGiNQNi7pFu6JcIzgfg3XFY+urIv3bByXIKr5nieJekXZm4w9f+rH8hqiDN6KVCa/HFd/Z/W+81PZigwZ0YS7IKDQiKQ7ApS4pHMhhhbPMuTdil0aLeBTt97O2CAFSc1kGxxEcUYk46Dx658G/1yrHvViPCbz8l25w6kUs54dpqse/JaSP84WQeO89hWSqQYzLVWkXzVYbsGFeq8FPiTNKli7i4irRViggsxwXElCCBuc7qXGgp0sPt3OgFRUSNOuxBp+fbiOzlWtiterAlpYesdB/ET+n+SanGdar12RFnsp6H0MWa8LUN3f3OJGEEIx3Kkzzu/xOgLu/6QCFdISgwHyyT5GB2oT1I0ZxWFm8GWLtZwyiqbrCWdR9tro9xL42QbpOpY4l+SNSrGLmJxSisu7YeW1yndqdpi+7sG+o//54ZYA4MstRmgU6UBQkc0Qmabq3uREgXFA5vB0duVzkzZDfX43vGc2c/Xi5ahSfoqPIXhAziJ3kBweyLDfvjDX992SDHOV0maKz0Fr/3j8GijvY9h6efqXQUcgyQ+dXiF7JLmFnBAVrj2lfl+jKFRz+k23lfQ2sx1WmLhMEGjwkRkvUVpei2DTXGY8wbv0foa5lzIczppJMbuDlK1h/JDn8um5C63Kgp699cE79YnYraHQQuvN9Dz3AXlsQhgkmAI9AhrdA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ilsyHXlZbVNMntpidTjD+x0R1WpdxnTM5GjCNb1fFuxocqPwnbctKIrxOGMSs9dfn/rEc67FP1RVjQOHZlXgG4Q/6Hg9u9jrdalDWnjo3A2HI35vaTe3V2Afsu9IgF+u5145qHqlx2oK+4YlER4qdTETb0jJ5EKBQ+NHuMbcEsXZihssB0/oeIanIrUVV00v5gn3g91n8NDmk35lT128fI6VwjYgaL7nW+F86f8IlQ/1Ip5jPdjZ0Z7phQoA1azexbE+yerpd9FA8lMAWKRU1zHq7uOF8AapRu4DTwmH2jZQbIPTgUYfY6Rgr9HERZ9q9vYEQAoYlzEsTEnR1eRQQKA+uufvXhTgnab5bmxpWF1gsbAn0qdz1tkFbwa5ervOpBY5cYIFdP9P3AQQ0eF26t+v4Brcg9f9zEA4S04XKBWOH3NnpnbQL2jyaaoDfUjc
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:34:28.8928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57090e56-b792-4e34-5f57-08de7e12e16b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6117
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 19:34:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17298

meta-arago / na / 20260309191959.1659898-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] ltp-ddt: Add missing iproute2-b=
ridge dependency
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 9 Mar 2026 14:19:59 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3e270bf6c4497889ececbae8e5d0627fb=
65e18c6

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ltp-ddt: Add missing iproute2-bridge dependency
- Commit SHA: a57fbdefd04305eb187fad262d7b19a104977e28

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




