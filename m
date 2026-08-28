Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2317FC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 14:19:24 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1772.1787926761150247246
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 07:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=puYtlN8X;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Y10fBS6y;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SDP5Xj665477;
	Fri, 28 Aug 2026 09:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=C9QvzuZ22NoFApAlY8hIX1ZNU0ha5vxevRhtnX77K
	Hw=; b=puYtlN8XQkpLlxTCZmMSwmvwsbxfvLy8i8STRhyGMGCXe74Lb0ZUIxzx9
	1gCYwThu9knDDPzx/ni5I7Pb/XOZxEgB1EEJbOkUqhmbT+AKXPLP4Xgq+IQiz5VK
	QByB4jAmSbkVfsk79gey1e/yBYWd1jb5stOI02rbS7oYJ0mDxTs4y493dQknYurz
	hlK99bH6mq7ppMsswpNoScmZnBAp6tYznRJgqJhcaTEtids2LCJ1hHq+VgtcYngk
	Z2xVp9pP7MwQHx32rc2GC5RdZqjzg4S5J9jUDeKuthvnvZog8A31sikRkS5qycIr
	FQCY7q8bvoMoes4V2bcR2Yc9tiAkg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gb24pba23-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 09:19:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRktNq8FKngyNsx9GN/kbDmbgvMEezbzVFW9BUwX/4PZJX2z0dv8bUlJsqxCL8gyGp83mumVXJwFZS43bUlGjFfO/BIsHoptrR84jb8pJZKuo8t6N3na0diut0KQlnzxTvUnTbCyvKuAhyQpUP7DuqBeb4PPhwykGtGKbDG7UFyn7pNeYBrwKMTF8+xdx91glIlxudU5VoJcCYhdc282ogWGJJkLUkhpqyOoF6qJKG8WOGNiHzbU+nTcGYB27RvmNNLK7u/qJOYpSwa59mfeniwoOaDKdCVreCnkebiV5hU6QVlcy+UnEJnVlpXS3wZjuZ38tEGDAh1e3OsC1rkEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9QvzuZ22NoFApAlY8hIX1ZNU0ha5vxevRhtnX77KHw=;
 b=h87PoV8U/8bAcehghVcSZg1SiKAPLJHCXmtGfmCkf+sbRj3bHTvKX1LCRQDJvHRXEnUKrcyRLV0WO35YNeUmWwpW8JQxFNtqn+oMI1P3F7isXMAUPSbHfesa93603f7JQikVOdtSj4g5THC+ieVn4QmxbiN5GG23hW3MXDSkBKCF/K9I9MMNO33Z0luWslQ7UaMcBTTmjZZGNPjrN30l9DbWU4mRAwmDCAJ39tNAgLLuFRHjipYEESjRGMoEOutU4OVWP0eOctgiMKbgF+3hoQLBQQ7N8NgkulSqnnHaJKFSVypbu+XaAYtirJJlDINYbLK04fvxSZsxKZSzcDsz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9QvzuZ22NoFApAlY8hIX1ZNU0ha5vxevRhtnX77KHw=;
 b=Y10fBS6yuSFz2X9107Pd9y65KVMRcbX6KqN1yrMghbx4UdFrxHg4CwBv7Du4FtsbiE8ZCB6yZkHqHrInvOQvbe+OWmcfIHy4mNpTx1eg7gGBvpoKf4us4EMvXLGKxlIilqpk0RIj26xXp/H/G4aBZ/RWk4K8BsWg7LjE9pmW6tQ=
Received: from BN9PR03CA0941.namprd03.prod.outlook.com (2603:10b6:408:108::16)
 by CO1PR10MB4691.namprd10.prod.outlook.com (2603:10b6:303:92::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 14:19:17 +0000
Received: from LV8PEPF00000068.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::33) by BN9PR03CA0941.outlook.office365.com
 (2603:10b6:408:108::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 14:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 LV8PEPF00000068.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:19:16 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:18:55 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:18:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:18:55 -0500
Received: from [10.249.37.116] ([10.249.37.116])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SEItMp3967846;
	Fri, 28 Aug 2026 09:18:55 -0500
Message-ID: <e2ebea10-e5c3-42d4-b6c3-5675da4923a9@ti.com>
Date: Fri, 28 Aug 2026 09:18:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] tisdk-default-image: add
 ti-vendor-kernel-headers-dev to DEVTOOLS
To: Hari Prasath Gujulan Elango <gehariprasath@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828080918.1161144-1-gehariprasath@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260828080918.1161144-1-gehariprasath@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000068:EE_|CO1PR10MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 9676f0ef-e3ae-49a6-060f-08df050f57c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	xTLwz5Yn6esL+a2sf//Q0+5ud8M6vL8mzxGXGVpbxidhot8nqvXtnAa0APsc1vlB0koZrvKDNeBl6WRwzM507i8UtwJlEB99nAl7Qaz9CQj1R3rGbCclvCKcFdQqZojwZG/09X9jGp5uEypIeX36JJy4ApDo3cCXDyiClcAkJcnCpPWy/gsuFJskscrgiLt7c38i4dtQm7MXQus4NjPM0DwZ255AJZP1SWI0/Js4NJu8hwsXu0QEUBEfx4ptA6xQHOSFNRZdEN8W8o1rS68co4j2gzWO2+43AcbwY8FUt8Rv7afdbAWJfFapGQsS7pxb3U9+UaunyLhPooj9U85pAn/N2K1XSG43YadgQnPTGa7UA/RXRBNfnCY8zOcWH2bI8OutfHibq7GGOWZk2YauLOH1TE4MykU8lloYArh3c/ykGYXRVQiBoMsqAOkd11Mnhm5B2qBNRtxiaw4Ur2NxoetKTW/PahDuHq7aARqJV6sDorwFfLW4pDKI8/4gaIOKrVbEthqGhzDSXGOLRgL+TI0J1wx3u+omPZwPYDaUJXYrdgqYUlTg1CzPjw/t4VHObgiNmuyJQYUQIq6K3YUNXDmvoaEtKHGhnohUxgMC7vfdcXJhCaai0bUVYKMqxwLvGSJPIYICezw3DX3wikS0e0EWjatTqmsNml9FYmpHEvrGwdZwj5+uci3PqKPcN6YIKhlss/JiV+c36jEGJcwVcg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JiwXOKjJN9sh26yxxrVLH/U1tRslKHZhmx/xYpOlTkfKIeU5vayYqyESM4q6j8PWJD9EyvqfTfyxhD+3mgy4NICRiknYK16RF1TLjzBokKaUZ4fy81k+izauOiH3ETdHvY84WLkfBFwT2ufB35RT4G/iv4sic3Z5mU2kOdaYgMqH2FmxmWTNmKR4t1DxktJlcW0RCj+/xBtZZmASkdD6Wb7KhMrCo8b415neVHC/1ffMiYA/0+OSxE2zC8+bzZQjwtknEn1AQHYYpglSFXWEFfNWmeGMcw2ZBmncbAjmeuwyZ/GulsUR09KCY087q+JtfHvuDQ/aGmJfMfZgB4zAxSJn7xikGiZ5wXedNZqI1KRmAUGZC0KpUK5tKcoZ6dtzv1PIoNS4gx/ROlsIcH5nlMBVoYX5PATSeaQm58Xn8VUxDBfLk8amlOawJKOkaKk8
X-Exchange-RoutingPolicyChecked: 
	Gcn2iGwf2lqfQbGKBVATanT0hP2+XCPOdR2hPVcQHPYMZxCf5zsoY/F6F8AhCle5Azonajzkjyr6Y5ix4uFnvg0fnkWl+h/1Bqb0K6Gtl75eoPKSmW7lNIl3b+qEW43P3x7Dc1n6HDXEJGrlDkelGAdka/eRX4VNB2akUYBzurWuAgYefssNhUHJq63nVJNKGxA1y+EIfBo9vUOoiPVL/sshoDZGEmsUAV26YnYQkVeGPHCxMOLKBTNwlvmnW7W57eWmeJz4hwBYM+m0I1k+2GBrgjaVsABw2ZLwVwTQhaBWuXwIoVZ5YwADdbJ0541z/tA1y9PMHTTxotuyD6YqHA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:19:16.3962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9676f0ef-e3ae-49a6-060f-08df050f57c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF00000068.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4691
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyNCBTYWx0ZWRfX8blAsfMmYEPL
 vjxxCLOjM4/NLWC0r19d+L4METMnyiNO2xzjZotb4X7dfOYqb+SAzQJdgtaRYcxNmrLiKT0vPwj
 92yFNu0gFgih5sgLlKPa/X4DfVq07AIar+yp3BAXVNDnzh/vslyGr8LOID0k9juYjMaAg51G2HL
 CHFzRAGm2UjXuh3ucg31ahcYFAED9Fi82MyCKMjMzWbzEg1F4FtesU67JqQL6MnbAmFt0Bo/F1z
 zRyakfjj+S2QZITMeXOYDq36XtRgGkPSCAQGnjB9IpiTtZfgzQU/cj2fmKLNYl6nZZs7hO36veV
 WOjddNTAl8e/x+e1kknG+E6M0yK+8HKQwxiyddSy2PtWK5sbTFxbNERcAb0uEhBsvBRJJ1scqDs
 bqwcnS1QblyYO9htD3BPNYVx9NbNNHEGCt3jUqXsO87sSg5PxmPxPcXTtNju5bU9grjlmjsP6MO
 Bi86bnPkuWKza2m/fGA==
X-Authority-Analysis: v=2.4 cv=A7pc+aWG c=1 sm=1 tr=0 ts=6a9198e7 cx=c_pps
 a=m4QPU8/Yf0DQKtM+qTkXOQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=Tf1iJv1qShZwqqr7h7oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: XfU3nuO-JIMYTlc0u8Gb1wRte6VfLKGb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyNCBTYWx0ZWRfXxC79cv0QBfCW
 NNR6A+ZfLvjym81TYh0Qs/ijKKzwpVMDMHschdEiieVBsXnayjR+FvO36lejIuI0I8pQ9s/RFl0
 bEDbzJeenEFlnYzETYiMUxOalXcaKhk=
X-Proofpoint-GUID: XfU3nuO-JIMYTlc0u8Gb1wRte6VfLKGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280124
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 14:19:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17621

On 8/28/26 3:09 AM, Hari Prasath Gujulan Elango wrote:
> TI vendor kernel uapi additions (e.g. DMA_HEAP_IOCTL_EXPORT) isn't
> present in the standard header provided by the linux-libc-headers,
> so on-target compilation against them needs the ti-vendor-kernel-headers-dev
> package alongside linux-libc-headers-dev.
> 
> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> ---
>   meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 264d1b2d..cac6628e 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -36,6 +36,7 @@ IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
>   
>   DEVTOOLS = " \
>       linux-libc-headers-dev \
> +    ti-vendor-kernel-headers-dev \

What application(s) actually need this header file, shouldn't they
add it to their DEPENDS line instead of unconditionally installing
for this image? (and why only this image, we have other images
folks build on)

Andrew

>       build-essential \
>       packagegroup-core-tools-debug \
>       git \


