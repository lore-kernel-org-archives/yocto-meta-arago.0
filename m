Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146E3D1266A
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 19:00:02 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.976.1764701994124747608
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 10:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hYg4pkNm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.13, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJorxbr12iUUg24k7B6Zf/xfMACO4rsgSxpvJOqKtWZ7X/tZ4j3qM4M76bz6B+5SABTeDptedT+UOeGd492oueeTjXEuL7X4oh6BKd0xQMD1j2K8CHQN16S87TdP5hoy1YX2ur/T1BWI0RBybKTurHUqvLQyVlv8yWDIMybP4b3zN8U4KXToPKzrrlHwuBQ6XgCkHb8r08XYNh28k/mYaiX0SRe95gYbQMFEk8Gyc5x13uEcVEp+TE8jBKp1G7n1qgAp+ygZ0zaodpI7Ewh7luQgnKU9vzZatr9hp29WN0atp/0ltqLEQO0rXW27clNOMdRSXh1wcHS9hB5pE4EKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1NrN13FxkIBLlSprci2my9yyjT/zvP8u+Xr/mwuIPU=;
 b=kz8H4MKyBnzQwr5c+qDxDXRBQ1K14D8dcOeXGA8TSydprZ6ZCHm3c3OxE0Zkt8NTnLDmldxcobOug647LthURO+HGbVM576y9t2PPXvrjHjzI0rE91IdrtKwpAsNRHeUgrozUg0jL4gP6fqAJKZ30QhIVaHu9m8O5a44lDTv9tJz99UjqI0EhE3/3WuhEwoSglB4z9KeKZ9l2ysHyeaDTsH5aXfAS/Su3n5obi+ngKczsag8tmwHFVYXPy2iMMTfpY2k7IfznrIT7wVl/bMOlBAaquL869uSAxx6PofchDvP1G2SUEveJP9PiN5KP9cC8UdLc/iDgT27/wi4tL33eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1NrN13FxkIBLlSprci2my9yyjT/zvP8u+Xr/mwuIPU=;
 b=hYg4pkNmQOcBlT83Kgzjy+jlbknlzaDqoYySjawoBMT3diFf/zvaVuiXogVaMIj3DNdwJglxttJr4SxtpHRA6aYtyvTGiUDzmbG5Rem+4Dg/jZct2k5JKWKyrqz8TOPdKHNAK2KCZvKXyqGqHQ3m2dEiDkxZecZ9e1ZOqZCobsg=
Received: from PH7PR03CA0018.namprd03.prod.outlook.com (2603:10b6:510:339::15)
 by SJ0PR10MB4528.namprd10.prod.outlook.com (2603:10b6:a03:2d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:59:51 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:339:cafe::33) by PH7PR03CA0018.outlook.office365.com
 (2603:10b6:510:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 18:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Tue, 2 Dec 2025 18:59:50 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 12:59:43 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 12:59:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 12:59:43 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2Ixhs32736295;
	Tue, 2 Dec 2025 12:59:43 -0600
Message-ID: <a1bafdf5-a33d-4a16-81f5-e92fb8e245dd@ti.com>
Date: Tue, 2 Dec 2025 12:59:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] libdrm: Update patch for recent
 version bump to 2.4.128
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20251201184055.1371866-1-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251201184055.1371866-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|SJ0PR10MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf8e7e7-e9bf-4665-7007-08de31d4f892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QU9JK2dyQnBlelV4TCs5QWprYmxWNC93ZlZzdmNGckJhOTFSU0hIT1dFY1Rp?=
 =?utf-8?B?TzhDSFh3czRUWmZmRUdTRHAxbDdFeUdhRTgzRVEzVHZ1blVNaFFtUXRKaHVa?=
 =?utf-8?B?NDUydGlLcTF5bWYvZG9uNUtWcWM5VUcvL20wOEo3MWpDRW1NU1p3M1NDQitj?=
 =?utf-8?B?MDFSNk9HZGdtTkkxcWRiMEd2WW9sVDlibStVcUlVWWFaT0NTY3FEQVEzS3N6?=
 =?utf-8?B?aU9xd3k1ZllTUlVhaFI3YjRDa3V6dzcvTDJuLzR1bjRyQ2FPM0cyRnlCZzQ4?=
 =?utf-8?B?UDBwb2trTDVhYVJKeElvMnIxeWhLZVpYSlMvSG1HTytLMnArTWVSc3VLelN0?=
 =?utf-8?B?VlBNRXdVZk5tK2hLUVR6QmlRbnhOdENYSlc1Wkgyc3FwcjRVUitNMUhlNENo?=
 =?utf-8?B?bnVBR0pFWDljTjRlcEJjMXZxZ0sxejkzNmxQRyswM0R0dmtLYlR5dnRKNDli?=
 =?utf-8?B?L2hJK05jUWJwWUUzMnkrR2ZaWEVvM1pqN05CYUpvN3JXd3dUamhyZDlnTk9F?=
 =?utf-8?B?aHEwUUZuMkZyYVNuS3daeDJYWjEzMktkU3c1WUo4dGlRa0RyR0hqamZsSmtI?=
 =?utf-8?B?NUVQdEFjMnF2Q2ZFUVBQYlNpNFBUUHFjY2twUXJ4L21vU2pGVjVBTHZvdlVI?=
 =?utf-8?B?UnUxaEtZMmFmLzdMeGdTNlJoeXYwTWowRzJBK3FEbVZrMW5aVkZjRUNtTFVB?=
 =?utf-8?B?MExRSXVKMHN5UUtKR2hxajFQNjBBSis4TlRJVWpDQlhmcTM1Y0ZoSnc3VlRI?=
 =?utf-8?B?WDk5UmxWdEdETENhSktNSUVaSGI5OVBpSlZPNkFRQ0U4ajlZOHR0OTNHck81?=
 =?utf-8?B?R053bGU1aTNwd0tzQ2Z4REhVbDJiWklKVHVwRjROTVNmT1hRV0V5VVpGNjJ1?=
 =?utf-8?B?eEhLVW9oL2pPQURuVVUzNkRaUUdlbnMzZ2RyQzUvQmhpcXZZTFRDbUVFcE4x?=
 =?utf-8?B?a0JxY2p0a2VUOVRBT3M5c3YvcXZycExZMWxmb2NsSEhLZ1kxSGpuWjBoUkdq?=
 =?utf-8?B?amFUYis0MGliRmRMQllxbVpOQ3ppcld1aXFrUlJzQWRtN2lWeU5UQS95blNN?=
 =?utf-8?B?cFBpc2VmbUpFMSszZ3VFTkQreHhFeVBRb0NFVURpa3RBUjk4aDdQUGN5MExC?=
 =?utf-8?B?b0hxcGFhazZKdS9sRFVzdG9SclBVNWpkVVFlRTI4MXdMdzlpeHBUUEcxUU5H?=
 =?utf-8?B?eDFHUnI3dlhCQzRnSlc1QzcrTGtOc3NtdXZLT0RKSXBJV2lPT01PWkcwa3Q4?=
 =?utf-8?B?RUxiWmEvTmE5cDVqOEtjV3dSZkM4cWZ0N0xxODdqL3BWd3RGSlphdUpBc29N?=
 =?utf-8?B?NGxXRW00dStYaHJ5ZWVzZmpzR3MxK09ERFpUZS8yL0d3QmJxSWdDd05NQzUy?=
 =?utf-8?B?a0EzeEVyZzcyNGFxTUlvWEVTR2l0TTZhOUM5cXJjbGtXakFBanJob0NmSTA1?=
 =?utf-8?B?aTRXdDc2NjE5WXNVRFhoTWN6VUxualYrSit1eGlvQ1JlYjFvR1ZMaUloVGJL?=
 =?utf-8?B?SWJ3T0FMeXRjYWdqNGZLMUJSb1ZySHVHa3ptaTNYRVBwbzVaVFpyb3V4ODNK?=
 =?utf-8?B?cEUvTzRJWVM5V1FMdjVRN3Q1ZkYwZmVOQkJjL3FnTkpQYVJmaklvYTVDcWtM?=
 =?utf-8?B?c1dKU29DcXpBZmY4RnVkL0xVZy9ZOTJLa0x1QVJBUThNQ1R1VnBIRTNLM0tn?=
 =?utf-8?B?VC9nUmx2NjRyelQ5M3Q0U3Z4T2ZWRGZ4QnJ4bUp3K1Y1TE1PdjlnT1lvMVB6?=
 =?utf-8?B?Y3VaL1VNVEVtR3QwM3lISFF1VnJtUll2K3VoajhnbytpVWxOUE4zYk1xdlU1?=
 =?utf-8?B?TkZtNW4xSlFMaGxZdEkyZ2V4TjZQaFF2d29MZWhhOVNJQzFlSmpMV1p3ak5O?=
 =?utf-8?B?TUcreG9VTU1QMm5WaGw0elVNc0lZTEdQRzJPckltN0l5eEoyMEMwUHl5YXND?=
 =?utf-8?B?ZmFtRkp6YjkxUlQ2MWlxNEZtL2phcDVYS0dSZFBxSGRPNFVaZkI1VUo1c3VF?=
 =?utf-8?B?STVMVjhjSWRHNm5VK2FRelg0NGtCcXBmbjFJVDZMclFuK1RKOTRhMGJaV0ph?=
 =?utf-8?B?WTFmQ0s1Z29kTGt2NCs3SDMxenpvQXpFaTV3dkhaVlhtQ2tiMzVrWlF2dVFm?=
 =?utf-8?Q?vVTg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:59:50.5348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf8e7e7-e9bf-4665-7007-08de31d4f892
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4528
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Dec 2025 19:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16852

On 12/1/25 12:40 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> oe-core recently bumped the version of libdrm to 2.4.128 [1].  One of
> our patches needed to be updated to apply cleanly.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=ac7327583aef83fd400190506f3147623de38b68
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---

Might be time to just drop this patch, I don't think anyone is going
to push it upstream. Instead ltp-ddt should be fixed to not send
data to stdin if not needed.

Andrew

>   ...1-Add-option-to-run-a-test-indefinitely.patch | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
> index 2abe5045..5b051361 100644
> --- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
> @@ -21,7 +21,7 @@ diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
>   index d9e761e..687f7a4 100644
>   --- a/tests/modetest/modetest.c
>   +++ b/tests/modetest/modetest.c
> -@@ -1887,7 +1887,7 @@ static void clear_cursors(struct device *dev)
> +@@ -1888,7 +1888,7 @@ static void clear_cursors(struct device *dev)
>    		bo_destroy(dev->mode.cursor_bo);
>    }
>    
> @@ -30,7 +30,7 @@ index d9e761e..687f7a4 100644
>    {
>    	unsigned int other_fb_id;
>    	struct bo *other_bo;
> -@@ -1945,7 +1945,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
> +@@ -1946,7 +1946,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
>    		fd_set fds;
>    
>    		FD_ZERO(&fds);
> @@ -39,16 +39,16 @@ index d9e761e..687f7a4 100644
>    		FD_SET(dev->fd, &fds);
>    		ret = select(dev->fd + 1, &fds, NULL, NULL, &timeout);
>    
> -@@ -2179,7 +2179,7 @@ static void usage(char *name)
> +@@ -2194,7 +2194,7 @@ static void usage(char *name)
>    	exit(0);
>    }
>    
> --static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:";
> -+static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:t";
> +-static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:S:";
> ++static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:S:t";
>    
>    int main(int argc, char **argv)
>    {
> -@@ -2196,6 +2196,7 @@ int main(int argc, char **argv)
> +@@ -2208,6 +2208,7 @@ int main(int argc, char **argv)
>    	char *module = NULL;
>    	unsigned int i;
>    	unsigned int count = 0, plane_count = 0;
> @@ -56,7 +56,7 @@ index d9e761e..687f7a4 100644
>    	unsigned int prop_count = 0;
>    	struct pipe_arg *pipe_args = NULL;
>    	struct plane_arg *plane_args = NULL;
> -@@ -2299,6 +2300,9 @@ int main(int argc, char **argv)
> +@@ -2314,6 +2315,9 @@ int main(int argc, char **argv)
>    
>    			prop_count++;
>    			break;
> @@ -66,7 +66,7 @@ index d9e761e..687f7a4 100644
>    		default:
>    			usage(argv[0]);
>    			break;
> -@@ -2449,7 +2453,7 @@ int main(int argc, char **argv)
> +@@ -2464,7 +2468,7 @@ int main(int argc, char **argv)
>    				set_cursors(&dev, pipe_args, count);
>    
>    			if (test_vsync)


