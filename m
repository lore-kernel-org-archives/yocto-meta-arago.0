Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA348C61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 13:51:41 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8851.1788097901320496126
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 06:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=hqsQQPcO;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=RE4KGf9e;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67UDelT42611599;
	Sun, 30 Aug 2026 08:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Asg24Ngz2YARdZEmJmcFJ6aCrP0m0Orq2OSKW/OdD
	6A=; b=hqsQQPcOvNGUXgIvUZV+o412U2LUtDSja70rchwmrxx+Y+MK5lCpaNj+S
	xdlf2QFPInZ8E2RuPS+vqLF31wCsB/p9jSahWDAU1vaQCz6N0pEOXH10nlG2HLlo
	oK3YXoxYj5iVZY6vz0xhlnNomH/qKZW2lSS7HJcDrIBu7LOU8uzgiuLP8tIMXbF3
	MBIi+Z0LZSghV+xHfkFBY+kgHoV1hgezwOgXQgoLdISs+hJRqdlr+JAQcu//ozif
	qdFhL6LGNE82TYqybZUVSBe1D8gGXiwoOJqTtLLkhIeNqoOErAbqRFZ4ohcCLOdO
	134cZsFSc1GjWHlmT8TJib4A0HNzA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gcgen8uqn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 08:51:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohIzG2vRvO1D+O6UTpLMPPXqTeuXn+hMaO+x29GtWYc8+4hlrtWtRZl68LaaWQYHyqwOqCbiRNn/ZSkxWu2rlWoAUkQ+hNjnvyDtqMWCXdiUunFqZh5l0jgzLLdMMwYCj/38pdRdvNnjNVQ/pSFJIDTj87+/MhocctWXKUqwJfqeqodUxttfzOKObuhCQBkUNSvudLSf4R8Y27lYKh22R2O7mys4hv29+/PIM6+hIFLowYF7hsMWUb8CszlD29iFMVbdJFonJeyLgTOXgPAyPULEImZPRe7oHfw/Fo23ntBy0knOp5rq5gauLbXZIPXSF4mwPuUfbd+2ZJu/7MAu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Asg24Ngz2YARdZEmJmcFJ6aCrP0m0Orq2OSKW/OdD6A=;
 b=W/CKOMG6gSH0DCCfyeh9JEPn19aIjkxGKSnTMMZbKo1I03gPpli4HdrA+bllZBcgGRYLJT7hjHdDUi+gro6TtuLuQmMtRkct6Z7vcoChF6jiZunCDoUkqx7JjjXD97b+1pZOyLOl22xenIdCTm5vuhsxo1d3n8dYMxxp+y3qXqXKIzVpKZHAqvPdWQSqVoYyIGOwPfEQAGpt/DFj/UCowImxZdThiT8nK5KDkk7EcFsuYH7h9VaRraZQ0qn/r7OXlanamAZwhCmqPH2390CBFNZhYe6vrdWN/FMmu3U2jcu9t4NINgVdk7hR5fwfyFs3EbNy7mXQqUC+owqXNnn07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Asg24Ngz2YARdZEmJmcFJ6aCrP0m0Orq2OSKW/OdD6A=;
 b=RE4KGf9eSYFJ1cj/uXgfRnYIC0GBdqa5dphAqVD0FCrGq1UCMdJ2o2Rk1kwlfuIf2qHJOUVXcSIrMa1Kto4PsdZWE0j7krDFjXcfVVYCHUkRwlYAZjeZDkUbt4El8bgLOgwzV2IAfPy21qfnu8c6SgVCka+tIPTK2MqNKcS3cQ0=
Received: from BLAPR03CA0156.namprd03.prod.outlook.com (2603:10b6:208:32f::29)
 by DS7PR10MB5928.namprd10.prod.outlook.com (2603:10b6:8:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sun, 30 Aug
 2026 13:51:35 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::74) by BLAPR03CA0156.outlook.office365.com
 (2603:10b6:208:32f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 13:51:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 13:51:34 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 30 Aug
 2026 08:51:33 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 30 Aug
 2026 08:51:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 30 Aug 2026 08:51:33 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67UDpUnF3177387;
	Sun, 30 Aug 2026 08:51:30 -0500
Message-ID: <cc3e6ad6-1e27-442c-9bf8-11064169f111@ti.com>
Date: Sun, 30 Aug 2026 19:21:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] tisdk-default-image: add
 ti-vendor-kernel-headers-dev to DEVTOOLS
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828080918.1161144-1-gehariprasath@ti.com>
 <e2ebea10-e5c3-42d4-b6c3-5675da4923a9@ti.com>
 <18D027E982BFB652.841883@lists.yoctoproject.org>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <18D027E982BFB652.841883@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DS7PR10MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 251646f5-5085-4a1b-732f-08df069dce1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|23010399003|82310400026|36860700016|56012099006|10067099003|4143699003|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	8PVYdgA25hAJjkPkErZom3pOYQSau4HAKu1DHk/ZxDBIY2tchOGpyei2odjQPrhEOS/cRBpjkdhJNIoX5gDdvlxPVGXMEzDOYy87ymRbMCA+bca0Fab0Px/dZtaBTRUgPrbxunSAImN52x99c4dhjTUJnOloyZ63DiDzbSap3/6xU9yNHSCqR31N1rWGQknSM55fohd5OosZNeSmfKKu8qFEO4s+Ak9Oj3XzPduqsRVvK7w1eZiWzy674zekTSy3leaz8aE/VhfW/tJ21139Vn4eR71iiaVUqLcGCpmpHAOPbDoXUgFZz/A71zvfw7nyWoByVZ2x42o31w8kdy7rdNzH9S+2K0BqGsg9bTKkjCW5Ue+RTy0PXNvOBZ7vJW5tlbI12o9o7FU/hzHnRvxYDjHlrq/kpknz1gv3i4IWWEkMW9c+aMSwfeYUTSeAfbQoJbhhW0h8kIRrAS0sBpueAg7c+ma1ge5AZu1o8ymHNtZ2nkrDghlrWVCKxfR3DRsS4dfAVqlv3PqM5/Ojlafe9k6hCHFNhElIT7LIW1XCNzUpN/Asl4RB1cVRAkb8dE95F7nmEDsQdnNNBtf/7wbzZLRYMt6i0covgmHgAZTUgmkiXAwOqnPXAUl+8DZ3tMrJMZUjjA8SvG7bPzJ0cer+Qg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MNpXo0UEJhLKZY/aVeVcygA+O95zMGhsq1zeF3Sl0j0HLp/VkNrpyv9brm6b7HbFrYMeAUHAgyAZPiXnQM3M3v6vR0h56Ih4yCSKKryrlqTdzm3dqgqmiS/MMlOSkqLaZevno7MSkGLw2NTxL5tHg3/FYdOpxB5aFx9gJ7sPwLRlCGvD5YytNABOeLAYvZA4tCJ20ybRz1cQUdF1zDeOuOLTfMrWCdhbZ31njByK70lvqlTQxPD/7j2OlIRmTIEqlff/7oCLICvDYsxjIxkaL0aRDL+o0So+kZNxiSpejATydhocg+domg9qUckOsDH+t5VGSzAEpEG9LPaQ0uaGzwiHg70CMalvrUtHSEx7AupNQ0noTiwepOO+n+5yc9IErXaqXnVV+ygWWL7RjwHo0GPl1U4ijVN+Zx9SzxO4lxkkMA4VQ/Bs8ZTSK1Cp8qum
X-Exchange-RoutingPolicyChecked: 
	2TQN9Jq62g4cBQUI5C3cZstmzHAGz+V0ffOjieRu1h4KR9mZAJjrXKyHjZ6gp7dUQt8+zQOvXIyaw018PDjDp60ujWQ4qDC3bM0D3ztcAE/6dvK1rFg3JPBUcEeGmFNiCvd23DuYLmZ/j8dikIZhBo9zqEnzh+KOQtsKa87yIAI+AkXQlOTZBXbiDdgKOhe1epY9vROWPsJa6PoNUni+HHGnHigUh3HriVjKoTR83B4ISBlVrzea1Cu4jstXRBk4mnDToKAN46SE3m4vRbNHtTKWf8c1fuWLBeMjludkdfMfGPotS6genCr7snc5u7gBez+HdgQsgroxmcnVrBhuBA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 13:51:34.6286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 251646f5-5085-4a1b-732f-08df069dce1c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5928
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExOSBTYWx0ZWRfX6OsPMpt2w/jD
 ORuMKvlxlyKGS2fHhTJMYPRxh8EGdnSEcGAiSq6tWKR/UDR87WMf4ZV3DQlFnJ1GPWE/MiFC5Rt
 Cultlf3UvL3xhBlfXRuiz2ymZR6SNS4=
X-Proofpoint-GUID: cFb1uZ_37toE7BCzIrWbLpz4yOEk-8sP
X-Proofpoint-ORIG-GUID: cFb1uZ_37toE7BCzIrWbLpz4yOEk-8sP
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a94356b cx=c_pps
 a=Z+ESqgFbrcYkgT1kPBc/rQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=iGHA9ds3AAAA:8 a=xzG4CudDZr87uwkR1ZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExOSBTYWx0ZWRfX529VLTUkGnsG
 40b+MKpddbUphjkdL0f2hVC1dGfAyvpBw5aszbKgvFHyaVEgNzl6H3duDOxOPJQHzBGDXWrIP4w
 Ctsw0K/ohHB0d7c7SIaDQpdWy402sN2msB86i5AdtVB4SgoaZMRbRAqU69Wz5UpYnYM4nnhEw+Y
 VsAYPyZ+y8pIND/+aSs2n5Yj94Qeh2eQhkPq94CaDjG99db3KzCmdaNpFSGANd+7pk1KG74/eQr
 acOgvW39UHtKVQc6kDC115MWhZ/5FiykgkgjmOlo6U+aCHLHll4YRxdOLsj1Rqx/oo0+rHrW1wB
 wjzc41/oyZ2HQeCZ+Vggt6ennn6s79eYlcSDDm9PaMEmTRlMNfsO4XHwU5iexBBlzXMxwyE1HbD
 aJ6H80vUPJ4VEVUn+aUW3UjRRODWhM3elfl4bg5Sp9p57v3InegFXOwSMrlacSkYd2+h47zlB56
 3DDu/zmiXw6sjCzZhog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300119
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 67UDelT42611599
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 30 Aug 2026 13:51:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17624

On 8/29/2026 8:37 AM, Hari Prasath via lists.yoctoproject.org wrote:
> On 8/28/2026 7:48 PM, Andrew Davis wrote:
>> On 8/28/26 3:09 AM, Hari Prasath Gujulan Elango wrote:
>>> TI vendor kernel uapi additions (e.g. DMA_HEAP_IOCTL_EXPORT) isn't
>>> present in the standard header provided by the linux-libc-headers,
>>> so on-target compilation against them needs the ti-vendor-kernel-=20
>>> headers-dev
>>> package alongside linux-libc-headers-dev.
>>>
>>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>>> ---
>>> =C2=A0 meta-arago-distro/recipes-core/images/tisdk-default-image.bb |=
 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-=20
>>> image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.=
bb
>>> index 264d1b2d..cac6628e 100644
>>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> @@ -36,6 +36,7 @@ IMAGE_FSTYPES:remove:omapl138 =3D "ubifs ubi"
>>> =C2=A0 DEVTOOLS =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-libc-headers-dev \
>>> +=C2=A0=C2=A0=C2=A0 ti-vendor-kernel-headers-dev \
>>
>> What application(s) actually need this header file, shouldn't they
>> add it to their DEPENDS line instead of unconditionally installing
>> for this image? (and why only this image, we have other images
>> folks build on)
>>
>> Andrew
>=20
> The application that requires this header doesn't reside in meta-arago=20
> layer. I don't think it resides in the meta-edgeai layer either.Maybe=20
> Sourabh or Puyush can confirm how they are compiling this application.
>=20
> The ADAS image uses the tisdk-default-image, so I have done this change=
=20
> only to this. I cross-verified with the processor SDK folks.
>=20
> Regards,
> Hari
>=20

It's the ti-vision-apps recipe in meta-edgeai that seems to need this=20
header.

https://bitbucket.itg.ti.com/projects/PROCESSOR-SDK-VISION/repos/meta-edg=
eai/browse/recipes-tisdk/ti-psdk-rtos/ti-vision-apps.bb

- Hari

>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-core-tools-debug \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17623): https://lists.yoctoproject.org/g/meta-arago=
/=20
> message/17623
> Mute This Topic: https://lists.yoctoproject.org/mt/120969416/10119719
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
> [gehariprasath@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


