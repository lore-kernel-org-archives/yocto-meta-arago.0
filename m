Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10BEF47CC8
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:04:07 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53410.1772741037891293341
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 12:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=OMAY0+QL;
 spf=pass (domain: list.ti.com, ip: 40.107.209.56, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feNjvdocf2XVyarbwzbn6VUEFayWkbSNWEvVgt7S1W8Uu4/CjrCfKQDrt9csZeV5rpQWxnkbLsfHFcbj6Q78A8y/Y7hM7rEJwA3gXa9pQYMAlTsPk2qAhhp37RXHMmC3YzYfHBqLUFB1I03jZT+8oeNKZAf+kO1yBU0pD9hooxMVR9tP68NUk65EYPCaIRB0v/BRVsqTfgiV+X/eQ19X6rTaRBqYFEzmWQ0Zn8nf0URtVhMZ1gQ/WMh/3kDLXAbJglZ6gdkYoZr4w5/8Xfe8+aBkUfx2J4+dO4OQihf4iv/hNcYw5jAfy3L+RKgKXVHyY+lYmoDxeo3pbgmZh+Bj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keFA1+uJ0lEP/UBz7K4s1Rvl4szsnuC6RaTheewDi4A=;
 b=hHXC1FLIQJ+1XDQPkYf9+t5d0EduyzrDwxlC/59QC3Tln4qrX/S8DbifrfPf0Tab0IEYGEWwJt225K6En7wLdvKfxR6aClwiBPxOLZSfJj1so23iF1IF/coMwWM6kEHZKjmifFZ7K6Qm0ECLnm5Z/6sb5l6VakQZ67nMztePesvZ4eAFX++NLv6dTqC5sev254jSjtpIumkom9AXML3YJ1jVZ6A4KisN+N0DPAVcipB6bve6GRU6rpEfrW8l/nfSXqL0pQhT1Lulvp6Ld4m0IuYKhTUseS+sb0pQKdG/gNAktmBWSAKpC/8nCQizOzl4m14d1pUk0Y+fegD0151ISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keFA1+uJ0lEP/UBz7K4s1Rvl4szsnuC6RaTheewDi4A=;
 b=OMAY0+QLU+OYqPamiTySlu7kMQly+/SaH3zw6rIA8Pd/mH1jovtKdwePYxQ5p6PfDiRlYp2x4XiqGnIpRkvWr6l+OceiVrwJYnt/sNhPZMArmIwjHAYml4zUM54RM9jeLYUTWVBEhXeGmW64xuHrPzLSRSH3u7NdZcSAEAbK8kFwmA9Uq/8B6e/d8kV5kaOFIFkIa8AFd4dmkFqZN5EYqM7aer31HrKb/zYn0kGzbeeJ6D21mZLE6d0JbGLd96th9Y0dYdkxCwaT7qN4DGoFyx3ytMyAch2PZvfG8+HzRwdssCEFWcJJC+RvGjTWGzdy/HD6DT2cWSnXKRjBZE98Ag==
Received: from DM6PR21CA0013.namprd21.prod.outlook.com (2603:10b6:5:174::23)
 by PH3PPF079E800A3.namprd10.prod.outlook.com (2603:10b6:518:1::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 5 Mar
 2026 20:03:55 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:5:174:cafe::4) by DM6PR21CA0013.outlook.office365.com
 (2603:10b6:5:174::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.4 via Frontend Transport; Thu, 5
 Mar 2026 20:03:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:03:54 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:03:53 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:03:53 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:03:53 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625K3rWo2467288;
	Thu, 5 Mar 2026 14:03:53 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 78133136F37; Thu,  5 Mar 2026 14:03:53 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH v6 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Thu, 5 Mar 2026 14:03:53 -0600
Message-ID: <20260305200353.2843763-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305194339.2081304-1-p-deshmukh@ti.com>
References: <20260305194339.2081304-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|PH3PPF079E800A3:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d89230e-f1f9-4d89-da19-08de7af253fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: 
	cY8F/6WxgHcjJgpZBIRw0U8m0faw320BUGnd4sNHuGvdBgjcR1QrnAtmf4IYg5fOQP5tvy2bV/SqSCAMt6orG7ZkcGspQzMtzD2CKSgOBbCGwvpvr9jBnCaV8mJEJSks7O/NQsaizXPuZjVhcjvjANouaz1rbrzT3ML54SCsz1i4ADdlR3kTiigaQSM6Xe794XqbqTAC57YRi4RCSokZTFwdQlIGFbu8wYDd6Kmnns0LfVJTqGB5/XrDbCnK9dnLRYP5xNqkDWsKxd49nmmnf1YrZT3j/2pamgO+IJRiWwGBAmIq4efWwp8KMNp3a0AMIGcB4gAQ3W0UGM3DjBTZ2+05xBpDovb3B9IZ9FWbZhgR9GprYXt2am1r7TcPSUCDNug6DE1acFODyULEvMBhLWr1NZEHwdX/5mLNV3JqIjo9oVtjP+CfW+/Eqs8qfeZK4FwI6nC243Hqhu8Ke/m/770KVzS3TRoyVyEyfq8QWK58Vf0n51+1Q7lpWQacstd7hNmfqNFRndsZFdB8zi5QcnGsBuil91OI95hebLhuz5+35dRKQL6RwBbv3OINsCXHKVijz57zxZ78k+5qRUSaIINZQleRZWmO6KI6sD+sNZvve9DXu6FLmVlIKUkOnGlKJ/zjLOqk0uPcW/oT4gYlCSMdX/3gs+zOGVJwzUXN2f227s7Tr2lZAX6UaMf8ZfoPraLxUrrICKh57F+5Nghdc/jl43QjKPqwtrQoYwP8ACWuA24/Q7utrnID146oXRXpc8RMzBSmxk46V0Sn/8YYMA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TMncvTZ59jknL7YPWXVoOq358cbfpxHTzV5pzS7N5jkMH2hn0Mgca2bZiWLkY2hig4weth8xx8CuQWXNiajwVOnxS+hkFzkWgoWZhRh+G9LIdEbtiT0dn9271cMuDnsBlhPGI/7z5tW2WYKE+DENjoaNPcVkHb3dgXC/XXJhGlFyg4sEt/Pxz3LzRAYaZjkwRyQlpeW4SpODf59G08mryqKdKUBr0gf6NYZBU4DNFBdL+N13oEKrj2RqovhgEofPdafzSV+cyspYITILqQbpkdt+9qbc6le9ENkJciccBQOQQXgCw20d9Nv0GWA4c3mNhjnRR9gtpTqqrGPh2dNICF8BifYJiH/jxwZA+C/P3/obDqc2xiu5OaAS9x3F2Rw9aT7CJZjVH9ataL+wpHBz1y8yaWtT+IS+zAbms4TO6Ka0WYMLX10/nOJQvQIQXdWF
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:03:54.1855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d89230e-f1f9-4d89-da19-08de7af253fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF079E800A3
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 20:04:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17266

meta-arago / na / 20260305194339.2081304-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v6 0/2] Migrate ONNX framework v=
1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Fri, 6 Mar 2026 01:13:37 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 9446a4616c00a9a21985cfea9b631999c=
f8f5201

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Add iproute2-bridge
- Commit SHA: 538a04f7f91be5e391fe5613f298d6689ac3a2c0

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




