Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A0AEB3648
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:58:44 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7924.1772499520707253352
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 16:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Jig7Nbmg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.12, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKbzBTlr7Xb/y/i2oT7ED9HuRt3+Kc7pMEEDEeNXvhV+5XkxcQqCV7Pt2CddhpbsWrxufrETCwalvzZDOmK7LKQrQ6Pnux5uye/86HVwdT6aOXFEpRv4emn4Na/i5v7te4DPVNvGm8iYz1ADpcIcOizDNCbSnqumwMSBweQ8pBPQKSOCCtnO0zl9H6Mnvk9GO2N5U60fUeJU0fIzciCs2rcRAp7NpSDKEVMnxtGquVflPGGj5zdFvprG5KQIfvKOANk7klhzh0YYfLLGEYePtqxZODH06r/GEKY/k2B1jx9vGLquTsUPUPEF8CwhrkaYxHLruuj4sAr8qUTl7IBiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOJHqKIxs0VftJoAhePDxYALm8JfBh0M2A75JLwM4Uk=;
 b=GLkw1ArtHqjo9HOVMe6MPx0nTPTj6e2sTI0DUmbr284Jcwm3qbdJIHIe2wvSfbE+Fr/ID6jZZGbyFrHBYJaSKYl0Yxdl7SO74KJDz6SzyDc8P7fhtc/CtxYC+O52pyOhWvnqjHS8076zhU9DN0Zf+7u5I0TVTxyvHjdYzPMZ0VSIa0kTmpCQnTzkjb5FHRXepNegAq1/dP5WZ0LcRZtqCvkWjKQTDQdKc3u3utdh13egdeYNmiunQECVPIy/dzYfdU3KWUTKJVfCPLckxfrkszGkpvF3ZOZ3v9UcSVauhnvtjskQiJsYhTaFgsgKXVZ8OwF+p4xeK3x6LQvdhdGE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOJHqKIxs0VftJoAhePDxYALm8JfBh0M2A75JLwM4Uk=;
 b=Jig7NbmgKE2Ud5lQlBqqEoZteKbk1dQH7kWBOXzzjAyek57zE+QtzhhJbVhx0J2caF3ODGrKQMG8YLI/TckWZboY+Hw7vgvDuStDs8VU/ZuSusLSv47czfBuN05Ifzmqsot1H+Op/uVc0c/tivGU20m9laE/UYvFWDqzTC8VY0o=
Received: from MN2PR19CA0050.namprd19.prod.outlook.com (2603:10b6:208:19b::27)
 by SJ1PR10MB5930.namprd10.prod.outlook.com (2603:10b6:a03:48b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 00:58:37 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:19b:cafe::c7) by MN2PR19CA0050.outlook.office365.com
 (2603:10b6:208:19b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 00:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 00:58:36 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 18:58:36 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 18:58:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 18:58:35 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6230wZR91705313;
	Mon, 2 Mar 2026 18:58:35 -0600
Message-ID: <fd8bd7c4-4348-430f-9f6f-ce9304aa8b0f@ti.com>
Date: Mon, 2 Mar 2026 18:58:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 3/4] meta-arago-test: Add curl-cffi
 and yt-dlp to ti-test-extras
To: "Lannynd, Thorsten" <t-lannynd@ti.com>,
	"meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
CC: "Etheridge, Darren" <detheridge@ti.com>, "Brnich, Brandon"
	<b-brnich@ti.com>, "Christidis, Antonios" <a-christidis@ti.com>
References: <20260302205436.1117890-1-t-lannynd@ti.com>
 <20260302205436.1117890-3-t-lannynd@ti.com>
 <c7bb76ec-980b-4086-a399-c7e76774e713@ti.com>
 <dc5504deaef94d898642129969ad77c7@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <dc5504deaef94d898642129969ad77c7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|SJ1PR10MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ff64ac-08f7-4ff0-b21e-08de78c00046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|34020700016|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	6AqIgzFXOfB0tBdFqqomT7tB2BxUJAzfC2DLTZ0cDrbdj0JFu5aQDVIbKlgPc2SndkoprfB9xzw4StMJ+OVs5umd7VvSj2OYj97ZqRVodMUl4dUN9e6niEoN1L9S6LFIZhwH1DBVyquRQphPDcPYXjNjqharTLOYVXNGKz/zvgz4j1zCr/grW7Q7c+d5texZllPVmMagZwCJIXjm0SIiKiibbtBsigQ6RcMU0CvIS1ZgYxNDUrUfTOLu8zIQknxAe/iZakboc5ZT/kuV6vR4EjOQYNndUbx+kE1abPMQjpgwBV2fnv47MuDBrWrXxn4NoiYFcGhYYBNUNGdrD0Sn6Byx9sOB+GARcoWRvcGaIcAIPmWPd/s+wAUUFZVNLslOQRpi9WYwRJkzehaPCn1eBqUzHPiJ2xgSKxpk8hlmaWjDqAVfi48DjcuQFHgTejrLZcw7mWSoQbxWiZUgfoLHezig4Ws+GxWuO3i1naXEOZwQmncoqXcT+0oZhVAKlgJyf3giWd04dowsEX9skaJNyO62REoSFYvkDSD5cycFvZAXn4sFhpcQ6IP65Ybx5HBNxVrYfI9AedBQyJV4hyQrw8s/zWFdfbflYOETa831Zh+bOuRqL08bEsod96ha6PxdJADfGVI+K++BeC+M9q9QfpZtfIB8EdOZJTV0Le5i2vbLNq/3bv7TPd6nufdKTI/MtwPMucuYiTsesDWiRhoKkbwgwB0QEtjGwAfbsZBJ/CVqvF8x3GdFBKaHm/hcYrjdXjldl0iJiZsSNyKdY7vrHQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	92YbhVH6hAhHW3ERBnXyoep2aR07C2XOof+rUmRmpLvtJoCYVWqUYlZFVShEl6hiz9YnSu2cx1trn6W1ck32Hk2WxRfF1+dvjG7tsAxkdgNQGmcp+tO6upBJ/6E3mgFG6kxkiIsD0pnkBrbgwerqISRta6Bafj3jM8fdV96ujVoXjL1aOSseXzYcq0pc3kCE0e0gz0IPI2bGghQLQ6Aof8Ufi+TYY64r8HtMvgbircckENVRsjiZ28+dKLOuPNPnL1JWhSCm/pOZeEbWkJSdyc6iMXnNSY7QEC2miBoxXt8Q59ofX1P0kcZ0H+ryKFGeZBKH57JtXaDaFFp+c89QYFxfAzkrBGgB+0f2uEyV0gfLdEPKKyHYm/UBcZ7RkrLPXZVMwr7z7U+wYmGTX2AWcgmur5PekZwOfnbnsGmWc/BPDZMC2WyWXS1IqsHYYEiP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 00:58:36.5664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ff64ac-08f7-4ff0-b21e-08de78c00046
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5930
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 00:58:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17184

On 3/2/26 5:49 PM, Lannynd, Thorsten wrote:
> On 3/2/26 4:56 PM, Andrew Davis wrote:
>> On 3/2/26 2:54 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
>>> Add curl-cffi and yt-dlp to the TI_TEST_EXTRAS packagegroup for
>>> additional testing capabilities.
>>>
>>> - curl-cffi: Python library for curl-impersonate functionality
>>> - yt-dlp: Enhanced youtube-dl fork with additional features
>>>
>>
>> Didn't youtube-dl run into some legal issues.. Could you expand on what
>> these "additionaltesting capabilities" will be?
>>
> These packages enable automated Chromium testing to verify video streams =
display correctly. Our usage is minimal:
>=20
> yt-dlp -g https://player.vimeo.com/video/253905163
>=20
> This extracts only the direct CDN URL to Big Buck Bunny (CC-licensed) hos=
ted on Vimeo=E2=80=94no downloading occurs via yt-dlp itself. We then use t=
his URL to:
>=20
>    - Extract specific frames at known timestamps as golden references
>    - Validate hardware video decoding and Chromium rendering pipeline

A direct URL to a video file does that? This whole list reads like an
LLM generated response..

>    - curl-cffi provides the modern TLS/HTTP capabilities required by vide=
o hosting platforms

Yeah, I read the commit message too, this gives me no new information

>=20
> This approach eliminates the need to download, store, and/or host golden =
reference videos and allows testing with Vimeo directly. We can programmati=
cally extract the exact frames needed for validation directly from the sour=
ce, ensuring our hardware video decoding and Chromium rendering pipeline wo=
rk correctly.
>=20

"hardware video decoding and Chromium rendering pipeline" LLM generated
summary of the above LLM generated list, don't waste my time.

I just went and asked Claude to write a script to validate my "hardware
video decoding and Chromium rendering pipeline". It spit out a script
with these lines near the top:

> import yt_dlp
> from curl_cffi import requests
> from selenium ..

So that would be the real answer I'm looking for, you're adding some
generated testing script that uses these libraries. You could just
say that or point me to the script itself.

Anyway, what is wrong with hosting some set of reference videos locally?
Are you planning on randomly picking videos to test against? Otherwise
having every DUT fetch the same videos from the external web every test
run is going to be a needless bandwidth hog.

Andrew

> Thorsten
>> Andrew
>>
>>> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
>>> ---
>>>    meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> index f2ae1aef..d1d049c2 100644
>>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> @@ -77,10 +77,12 @@ TI_TEST_EXTRAS_OPENCL =3D " \
>>>    "
>>>
>>>    TI_TEST_EXTRAS =3D " \
>>> +    curl-cffi \
>>>        python3-pillow \
>>>        pytesseract \
>>>        python3-numpy \
>>>        wayland-utils \
>>> +    yt-dlp \
>>>        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
>> '${TI_TEST_EXTRAS_OPENGL}', '', d)} \
>>>        ${@bb.utils.contains('DISTRO_FEATURES', 'opencl',
>> '${TI_TEST_EXTRAS_OPENCL}', '', d)} \
>>>    "
>=20


