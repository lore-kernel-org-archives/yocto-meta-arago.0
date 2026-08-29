Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E63BC61DB9
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 03:09:05 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.640.1787972935521699511
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 20:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=j3DfkPvf;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=RozBJcqQ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67T1wILM2997844;
	Fri, 28 Aug 2026 22:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rXpN32he9oeHR+KZ20JNhkrT1CBSr/IrC6KBkTEWV
	vE=; b=j3DfkPvfn44f5nBbiDE2GCaPYYSPp4UwsNIS5Pyw/NwES/PJDpoFBzKIr
	RgOggB7+4zWNZNF7RTx5AlWTRmCjikALHZmYF7doPBM/fDwQxjlEq7cKykXm3Nhi
	LDwcWiSuiXrDdJVYCRYES3E0XeUkBOeZAlI1ElvgXWg+whRQ1pCXDK12WCCSZlGx
	asXlZhH8v7/UpAQ/1XEK0AQV6JFf+cPduoVOJj+G82whK0dcSuZP+2E1A/0oMlIr
	jFL/VWJCWu9vNSRQXKI/B7dvfyA2lonTIJiO0kGRAKYyAcK2BvmUcqHKWE47EoGS
	pU9LbeodxA3Chhtu6rCzuNMXyzeOA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gb5kdntsr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 22:08:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVkhm1rStM5sanMRdu3B/5ZHjoobDf5tt6ER5gJVcGxTbfJaCwXZQrUKqBlaYpoArobBTQ6Uu/5SSypCFImm3w8n4rygI7IN2mcO19JPx3Mp7zG7Z49JZ9BDA88CxvIf/EjcJWek1pJXPAZdX190JVpWz/SdR7+s4/hJLRHSmvSEbfp7lLp8WQj1R9qo4XjPAn+OYxenqa9vQ1DkxBQ5Q4V4wbHkOzQ5RWZyuCK9mJrJV59Nvo0AK9yFxsO0BLWoBzKZTRSkUHh9COeR/HimFsJ9avBqRI7kvw/0pn2mOwy2J+ItPpIPZaAJOEehSwp8RcWOzn4kPECHa3oPL9es1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXpN32he9oeHR+KZ20JNhkrT1CBSr/IrC6KBkTEWVvE=;
 b=n5rkJhr0QUHamu5mJcLUr527YS/3f1wJ9kj6OFB0Z0nrsqfBfObCsROZqbqtCOJ3Vpl/MJDvKdwANhyShJz5dQNr2+epSb5WjfhNPP6XhcWjFO0q5ozUDfzWeNtJc6fCCFehH4wkOMN1fYY2RdI3YarpfHDAx6MqkolSuqJcRxdb6YVrtrket6PPaBiPYrByfojqW04LqH4mEdzP2RB8TXi6i5P5AK7SA9aNmXo0elCKOPZmFfaoxc65s+zFL0KMlhLd98M2DpKg3O/GQeMpXn46RZqSpdNP9zAKkTItXNSyzJJs94Q0fSOXtrCC6PN4O4wnRXbNYskngQuAv3A1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXpN32he9oeHR+KZ20JNhkrT1CBSr/IrC6KBkTEWVvE=;
 b=RozBJcqQDD21YHaIaPHTn8c01OLkc4iF8BwVia7yqe3jzxRsIFTjMfuQ0uUWmkC2CeGfRdcpwhBR21aEd2Je1mgyPBpQLBpT3+Le3vCc//JwdasPTIIJcVwqmkZkAYUlk4oYuswA++a0oxFjl5W/bgZCtdUvfM6uX7HWTOkr+C8=
Received: from SA0PR11CA0016.namprd11.prod.outlook.com (2603:10b6:806:d3::21)
 by LV3PR10MB8084.namprd10.prod.outlook.com (2603:10b6:408:282::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Sat, 29 Aug
 2026 03:08:51 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:d3:cafe::1f) by SA0PR11CA0016.outlook.office365.com
 (2603:10b6:806:d3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Sat,
 29 Aug 2026 03:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sat, 29 Aug 2026 03:08:49 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:08:02 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:08:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 22:08:01 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67T37ww4754992;
	Fri, 28 Aug 2026 22:07:59 -0500
Message-ID: <cc7986da-96de-469b-8c52-773cd3c118bf@ti.com>
Date: Sat, 29 Aug 2026 08:37:58 +0530
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
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <e2ebea10-e5c3-42d4-b6c3-5675da4923a9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|LV3PR10MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3756cfab-c02c-42eb-4a30-08df057ad913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|6133799003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	/Q8S+iYNFgMG2jtvno9layxP+WffkSRbdT69d66gmdbBuXqir1y2ukvRCDvO7sMISeIyOUpsdCAzIME8RKe1//XkIWM2592dhRFXPHxPjf9GxD8Gyjb0sGknhto53uuDEwQiy5bP6tYaRXSdl9Y6zu6qud3uZ7rjstYqIuDK4mE50hCwPhU1I0zlcJZkNJ0AIMl3PMd3HdAkQa7INZzl4Dd4vq2vA1mkrMRtaAcj2S9wxwPQiplhgO5wUGxsMuoZN6+nP/Ko+7KeAgW3DWxnbI1sS/b/0BtBHfxGyMNEj9E7tN7rQOSa8EcWxb3CjT0u7jy9JeZ0PPVqMWFuQTHubgtvmPJfFiaRKcXyViterSxYXtz7UEicMufEIDn7zdT8FbJsaBoflv+cWEDmV/VArh0JXnEfs+9tbqnepSVFP/lzIiT+/5xWxL+quROLfc44pFg500RxPsW0eShA9I7fAejJUupu+oJ0FP2YJBSKys6y8F/Gacfv3zGnE17lWgrJ2krurKFbPnYUFz1wQDdnd+eaIA7xJ88zIhhubB7/WFD3qC7PpQjySfd5avLEvVpalWAmt0tVI9C9e/IlIhTvPzC03TIszCOJ39YdbXjrKwva/AUT260yQ02I5Cig7FQLEOCui04+N5IfsQEeIUiFif0DmHknG6CS2lh4cN6rx0VmX/J76chfOefLVJ4MuRcELN3MsjjxXIf92gUme/iP6Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QIufdsFB4c8fX+aq8nyhay5z2w3falT0mPwh0lSfH/Gye7h6R9WV/doIt9TA29btWOQej42zJoSb8RTv5dItxacLyoG4UJ15xYlsmPlHvoBPET2WK4/jxiFGZjuKXElVpdVAwdsenkIZ+vJtcQbLzIrF3eU88CE4Hxb57jWSd/iGxgcGYloiGaPblhVOuXTL8uJ89wAdTuWwonXZIdWCS5erGtblz222r2V0ULFE1jOzapcXYoYHGmVegX7qkWN4pys6eHoS6sU0wVYbRjDhTQ00g1bUKT+TK+cbXbyLi7T0nkIW+rbM8LK4UD7LMU+BbU2JcopXFCk+l4iYi9KX3Y4Ge/usnx+i0VNew5mPNFUW8hDwrGOnMz5Inkdj4Ca07SJHTl0I4yjKupuwmn+T+bfjpX8JQrn8v8luF0EYti0EKMH0leaYDfygXM6AVg2B
X-Exchange-RoutingPolicyChecked: 
	zaapTdQ0FUNOp4qNaPB44qr6u9Sz+5GjjUSiMzS+Ir6P8xydfU4QycXajbiC7Rxo7OBoczGuXisK0nmxJmMX5Z1cH6u+uHDv2uBVkM9h9DPAudWZWj0PLSxeATTUxr2ULSZBrWnfcJgrDJHKHdsq7Y/l57+p7L7shBjPCofkqpKdxmmO1S7Pffye1/Kzme6Cyin9ADxliv1cNE+gxB4URPlwQU7xFlopcK8+kd1KyXpfqfvDwdSVPD07veZanEI22ni4CFAe1mY6dXYdT4/OHth3fnUO0j3JB+yo0lY4Znn2hlrNgTlCzbYsPHqHN1Z/EIq2sXpEfaNgtB5GVf3kWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:08:49.5310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3756cfab-c02c-42eb-4a30-08df057ad913
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8084
X-Proofpoint-ORIG-GUID: 2EPCwS5WgwtdD4fMmdwCtx04ryFa-0CJ
X-Proofpoint-GUID: 2EPCwS5WgwtdD4fMmdwCtx04ryFa-0CJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDAyNSBTYWx0ZWRfX8QQ7X/Ct6xfJ
 nQUGNcbupl2JpWpU9umXZWbNuQnf96cxXLYzW6obqsERiFY9j+CAgd8d9nDlQYK4nG2NxkRnQji
 vx650inE5xWQr5ggiG4i2xZU2++f9Jc=
X-Authority-Analysis: v=2.4 cv=UPPt2ify c=1 sm=1 tr=0 ts=6a924d45 cx=c_pps
 a=a15oepxCFtbapkdjUscCyA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=cJeu0K5Di2eUH5Fi-dEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDAyNSBTYWx0ZWRfX6VAZkTg7OO7R
 +IFXTAoHzp9H9jVdce3qhsx1OEcM8dZrzYLEDMSW1wDaDLTVoap6M7y3TWawm+7jMAm3UfljW2I
 6/awddXiT0j1R/AmjT7ylCHGRjigbyDZ1E3PyoCQVocYPKixiEvmReX9GDFPEeVh2dNZ+p8MgsX
 v2zVgKcdphWILEZGB/NyLamnyiLwwNxbECtmrLFBFSCh8MbCV69cQe5RmwOaMYVR59gEyH9VvF7
 bd2qxe63F96pWa+5p+iV3z786TnrpV3Tc9ePbKu1qhlGHM71qM8FqQOPr138qQ1Kvzdbno5/V+G
 MU65y5ibbFlehrJOWoa0lieLdbzMvJmMsWe5/m+9XmUz1wU4Ptwuw5hBzIdn3bftD6ab4ep54b4
 3r4DIjyW6HSnsUWBCyI8GyrOgXQGAHh5Reip2erk6UA1IDuFZnbj/vMWnpR6Qzlnao2oLS0p7jl
 aPKfgNAikcUeXJBRRQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 67T1wILM2997844
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 29 Aug 2026 03:09:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17623

On 8/28/2026 7:48 PM, Andrew Davis wrote:
> On 8/28/26 3:09 AM, Hari Prasath Gujulan Elango wrote:
>> TI vendor kernel uapi additions (e.g. DMA_HEAP_IOCTL_EXPORT) isn't
>> present in the standard header provided by the linux-libc-headers,
>> so on-target compilation against them needs the ti-vendor-kernel-=20
>> headers-dev
>> package alongside linux-libc-headers-dev.
>>
>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
>> =C2=A0 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | =
1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-=20
>> image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.b=
b
>> index 264d1b2d..cac6628e 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> @@ -36,6 +36,7 @@ IMAGE_FSTYPES:remove:omapl138 =3D "ubifs ubi"
>> =C2=A0 DEVTOOLS =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-libc-headers-dev \
>> +=C2=A0=C2=A0=C2=A0 ti-vendor-kernel-headers-dev \
>=20
> What application(s) actually need this header file, shouldn't they
> add it to their DEPENDS line instead of unconditionally installing
> for this image? (and why only this image, we have other images
> folks build on)
>=20
> Andrew

The application that requires this header doesn't reside in meta-arago=20
layer. I don't think it resides in the meta-edgeai layer either.Maybe=20
Sourabh or Puyush can confirm how they are compiling this application.

The ADAS image uses the tisdk-default-image, so I have done this change=20
only to this. I cross-verified with the processor SDK folks.

Regards,
Hari

>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-core-tools-debug \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>=20


