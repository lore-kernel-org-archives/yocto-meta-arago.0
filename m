Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6281.1793912767664159302
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 13:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hTBA4dwP;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=ShQ7nMVD;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: rs@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5HgmuV3092969;
	Thu, 5 Nov 2026 15:06:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MAqWj7Gr+stdIET+lPg/RChH4EjxQdRUQS3ydgLjN
	HE=; b=hTBA4dwPQd+Xa9+SrlOlPOy2wRydFglqVW5BLpIBz0eLHUTppE8+oOE37
	5MaJRWbk7hxj1wYHqmCLZbf6Ib0AwenTP12vQXm8qEXRVmuCF+LLW9R4QOw+3To8
	JjS+3L26ALZoMAuhducXuDX7H0Dzx33z1OXf8nnZbkvWfvdwJydt7vq85eYB3MfN
	uF02f6cyvF08Jj15BwwUelTvoUXuZ3eRy4Dhby6rodqF21+SxVfXPaMbv//zVIrD
	O+Mwo4NV01O6oxnGg/U0zFplvJUvoiB4ARDEQZVBPbHLoC64Tv0tVi7X6Qn9GqBK
	A2YX3cf6TZm4j/6QPWA85MtOxUJLQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012068.outbound.protection.outlook.com [40.107.200.68])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9prgw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 15:06:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3rIfLCxVhsdQ5ftilk+QdV8GOSrt5bWGRVqjSGtzRnxQzQk9mDFZq71h8Kb+HHTvM1ybj7GSlqTTdPuUA9L2h4B2CSk+CCkKE2YxYtcmzKjhW1VF981Zv7LRPy44NqXavkAqHEwtr30LNW6rjy/Wb2AqPQKgJp0C2TNVsB69e6/ajDPsCMW4H3f6OoF8FzIx0Lr1RZ7w0Y3JG2hqDj/5hOvTN2iRAmQr50tHfr7yVSsDTL1u3YokJJMXLhTKA5fcxRJ48k9nDwd72cVIaZwPhBQF2p3I/jZwZi0ZEPb9OTSXn3MIFfz/lisTbEJWdv3QVMe66BGi/c3ko0Jd+i7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAqWj7Gr+stdIET+lPg/RChH4EjxQdRUQS3ydgLjNHE=;
 b=uVGkHvjmDnzT9HlIGd4XNDB9uG8pqDN8JFDklXDYe8NLGEhhclTeYcrLPPOXuG7iiCwsQwrwj+Gv7NaUt9MntipU3CKMaZhtwQYbxdCJrHV70P2cBmLzm3/LxExoptAMVDPQ+9cPwg8LpUoqnuR8PY6POlO93W1C7jNccbmKRhxjgu5ih37+1L9AbkpleQw2Rn2FF+kIrrxQIR5orsAaIjFL4aVFAtgWnSuq4ZTXfSg2jzQmmBwyPyOCfhwL1Z0co8To9du6dXEPG0406KkZTSIU8/tasjLptcJ1ES4YkbF1QZQNi5FuTeNd9zxlhNxFZE1wjQ7i/85CpYUNcyXPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAqWj7Gr+stdIET+lPg/RChH4EjxQdRUQS3ydgLjNHE=;
 b=ShQ7nMVD3/BYg/AsDC2bgdd+H63DdvNF1iwq/RKif+9AusLOIgVOZ4jNORnFXrd1/HzX+ykQ+lCd5hDIpUqSVnbrRVv1+W66TZKRfPxkQPUzm1bTv9Rqwk1hBdGGhGH4ZwGwtl+gHHW5schNVv/RUnyHWhYS5bLI6mPS5ntA7hc=
Received: from BN9PR03CA0182.namprd03.prod.outlook.com (2603:10b6:408:f9::7)
 by PH3PPF67E073224.namprd10.prod.outlook.com (2603:10b6:518:1::7aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 21:05:56 +0000
Received: from LV8PEPF00000069.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::59) by BN9PR03CA0182.outlook.office365.com
 (2603:10b6:408:f9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 21:05:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 LV8PEPF00000069.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 21:05:54 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:05:07 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:05:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 15:05:07 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.75.60])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5L57kc4066861;
	Thu, 5 Nov 2026 15:05:07 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Nov 2026 15:05:07 -0600
Message-ID: <DMNKZCPYQRYJ.11492CGFR157C@ti.com>
Subject: Re: [meta-arago][master][PATCH 2/2] libdrm: Remove ltp-ddt test
 harness workaround
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        "Ryan
 Eatmon" <reatmon@ti.com>, Randolph Sapp <rs@ti.com>,
        <meta-arago@lists.yoctoproject.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261105203726.1306888-1-afd@ti.com>
 <20261105203726.1306888-2-afd@ti.com>
In-Reply-To: <20261105203726.1306888-2-afd@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000069:EE_|PH3PPF67E073224:EE_
X-MS-Office365-Filtering-Correlation-Id: 5399cb1f-3d9a-4dd6-c915-08df3b8094f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|4143699003|56012099006|261026121527099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: n1vSW/uKvHtzy1ekILrj5XbOZq3WoIzdWyHs1GvGzFwgAAKZDFyMAiu+/BojmZNhoVj0D3JsuUwVUr4xuHndOOhcNnADEOyBDLSqhH8p/SBSn7qYulcofqVucBHdfKW6d+ZIx4OzlyIfJrPoLuBiXWyG3RSsr7xmHGeziJlHNl7OkShAOhbUiXsrlwAO6VWgMt09mdjqFjZjB402fC8MlfUYu2n6ujsHX6iPSa9B+6OWaVS/5eflKOUd+B4eHZvnp3SfAT83LYa0MuLppgfxrR5Luh5z49K3qWg525tKdEAXiH2dnjtvudsV629w8QFRiJOW+3TYG+eRobpH70uz5BFw5zhXWKe4oi5Vi3+/sJOV42/cts3dBeAUXckz1a519HkoGKtAjEHr5k02vD2cQGt3FOTV6IPhnW0Q78xLpDyMTLYZVDdtDVA5u7VNkr+r4R8aB5K7eXtmsbtVz8xxFvMDfKGHjx4GlJydUvjthEUfuuI92IjLeisc7bEtiAiC/0mvvPjRjBCpIf9BnzCboyW0SHcFZnelSOmA1zWWWcLV/2JbA0zQb5cka8vX7F1u3nar8wFnBrCXos4ECeDsGigvtEHLYM/ReP8SnqvALZTWtghMzmkv6Pih2eG5IIa5QFFqC6PbAk1YNID3lAcsp+K1j4/X5NnORankR+h6zc5/f4c0EnlTwWIWOSXGo3WGEt+R9tF/QmMBozc2vi55wg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(4143699003)(56012099006)(261026121527099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CQ1KE8Zw90S6rT5I/pEt3eXI4DDPmYCItsVX728rTMDemAYdLmhGk7hZR/+3gBunyvuBxZKUsSDA92/I7UHBpXdacCWVzLTfalwnquNLl/KqPC2+Tn8ILIONoBqCNOB6CQ661CvK67hdBl5WWSh2cqvZhnftlgfh44x5QoNCVXkAHIx07Y5qLd967BUt88TrzDA3kHpLUFMEa+mztNOTq3vW93n7z4xs6ZI3Aq5jxg6P8ueIJMH/mVGD7fjsHXbC2jMDvF6FuYc+x2K8fdR5S6z9njPZGDCfDYt1wjetoPI7JwUgGqYG4moDO+gOb4U5ec70FMGz5F9CAUfvZKmvoSaA7sO0GK1WI+mHH/mAURqtZzQyjAzTzwgbdCk8r1BWTAYPVPONqOq7wiXc2k7ZEaqNh1alF+tt0oj/8pFw+pWN9nPVvjYLP+zHmNpCjxRP
X-Exchange-RoutingPolicyChecked: DJsvt5mD5eOYS02wvrwCMJFmRj8v5Oex08jJlymg/oIyVK+U5i06x8ON8LNa9AvXBpjvOlkLg6g8ahIcXugASmCHKSSw+cH6tTVbtmVnLiPF4WCDgVtrS5uYUT08fku6hMEX3l//136KH6h2113OKF+WH20DwRBXHTRWTpptmzwDx7fVUG0wdxWzdibzlLKnM/Pyem2na084ZGEeRftsLW93ceNPmXroWCMwbOEf2Qq6WUXs9w57pWUova8c/2AJyfXT2aqLiiwuXjsyCEhlGrIW+UL0gYUkQ93w+0zR50Z0qkUsa9/3qp4JnjStquCz2jYo/ka8oy3oBJZyJ0SGOg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:05:54.9358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5399cb1f-3d9a-4dd6-c915-08df3b8094f0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000069.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF67E073224
X-Proofpoint-ORIG-GUID: U5S6pWBIfIJUvGynmVo76lLEqGhWpAYN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX4NF8QetN282p
 gGPsBKYWqE2JIzQ1o8hJwzbheZ+WDlwT/VRvfq45It7BeYFxu6qocV94+G0HeaObYcmIBGV9mCf
 4McdiJ9EeLPd1QlJLhPdb90ds+DJ+7g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX7NYf7HY6xLQG
 AsaoOJrsIOhrgKDjX4EASQ5QDqj0fiK3ABCd841xPouHr6IfR8iGZ2NdD1d40IHeVyP6ywxH+qe
 s/nUAQpL6nVsf7M8QUvO+PNPmoL8fCgbZ4GtYopllzPJY5pNZ+6Mx1PrhuJ3YifKgzoXq2ARYTN
 Peuk0Oy8nn1qQP1iCv2fFW/1SRZ/GejJvDWzOfx0s3YfxtWKryLRC6ReeVJq/o314eJbry3JUvb
 Y/qRNtRXPJPzisFgHeqvvm3O6pFORVaF1d83sCJohqNhCvzxjc/v1lEkMgOf55R0m6+Sen8r2O6
 cj89Mt7yUAACqrurJbkGx5zdloGgazaJSJ3b8PVlExq2bSzZpnGhvrXQ5wZe/FRLI6SXLxSPHnC
 NPmQXA7FnbK1mvderrAhEb+3QofDswUZL8jFxzhmMavRpCPO1KkLme3IDbutisjg/NtyVAxtJfP
 zp5hkduOGxqIk/2XCPQ==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aecefbe cx=c_pps
 a=hdF+edV3qND9tYm1xB2jJw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=aKgG8XmsCIHBWqmSuEoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: U5S6pWBIfIJUvGynmVo76lLEqGhWpAYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050083
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 21:06:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17770

On Thu Nov 5, 2026 at 2:37 PM CST, Andrew Davis wrote:
> Modetest exits on stdin input. ltp-ddt sends data to stdin when a test
> is run, so a workaround was added to modetest. Instead the test harness
> should be fixed. If it has not been or cannot be fixed, then this patch
> should be worked upstream and carried in meta-ti-test until then, not
> here in the distro layer.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Yep. I actually showed someone recently how this can be worked around using=
 pipe
expiration with bash lists.

Reviewed-by: Randolph Sapp <rs@ti.com>
