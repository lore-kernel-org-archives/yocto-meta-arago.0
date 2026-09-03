Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F54C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:52:05 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4071.1788429117162977709
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Sep 2026 02:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=jOusI5ZJ;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vg6oQ8HM;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68391BmR3302147;
	Thu, 3 Sep 2026 04:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=boBY3G2usndDUJvFQRPnwM4v1ZHclTfW3AxCR1Pi4
	GE=; b=jOusI5ZJJefBxxxdDqkqFZuDQxCycjsmdEZcyqFw3TyLcgjUxfPiPYcUk
	zKuJTHgZ8g0s74wUJDcJMkLd+ldPVWB267LHAbKCXRlI0F594HbxuoUa/+1MWCZZ
	zDoeY5oyNTiPqYYfyObk8kafc+mKzqclLlbISJWRNdOR8gEIHvjuybxNMjg/lJTI
	yW+7z1ecjSH/j4A+X7wnUB8dPqsMtjJ1j04E8GXvS4n+I5IOTZ/SFy/UlTjXSaJw
	/VmDl7r0DKQ5XYXb6zzRbMtUZQ9AOgorBRAXJW1WBlO3d9tUnl/rOn9nOBVKubMP
	np6cq+iXsAd822VGsFkcGi6FDqwYw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012063.outbound.protection.outlook.com [40.107.200.63])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv20w7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 04:51:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gByvNEVNe6xgAC6ZhDt5pm3ncDO1QonwMn79KIbcD7cHkhMFGfVTxZHQIcz2Q3VWm/gPRfzl8RtTmT4p9bCBsOwJetKHrOq16jyxRqRA/KFmd2e1yqcEkKDYmq6TyHwRaXXuPdzD+SCV3RbH/PwbPHfIQX1egeDn/Qo7d/d/X6YYZtVLBzdz/nKPBthvqjOPsIwRbFM+fDKcL7rihQdXMMzbexsPb2PPVpd8N5kClQOPsZXfs95qyycLhkH+4uM019bnkuWrFdoAAZjeCKJmOdolLpjEOZyl/gQqerViu99uOFxVMp/wkSa7aAD+jbigJehJhgrcnXViJGImbvv0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boBY3G2usndDUJvFQRPnwM4v1ZHclTfW3AxCR1Pi4GE=;
 b=wjFjOS8fAa7uW811+IcvNeVkJy6eIYDWt+g7CGwi9zcFdiCajMMbnV2wOXfjgQo1rXtsxgg/QySoEsphKQzmYnzhpVS/Ex15yXqpbDl6RMGHFZjS1b2oE2RehnhtCNpD7Fv8uA2+R+2taRiABHlfZm1NUge+h1xRk8+wJOgcfjBBJEpVGK00kjkYK8LmtbzrPhFS9mNzwZlBpvkEIS+xWafwzTz9p5kQAv60srHVhM1mH7FZTvP8Wd3yrfljb/UVJ5h9e8TleFbJfMb7Su9p/PUVmej5Jeb1V2mXrlR3fsFnjh797S1dEO+wo4TH4Pu0c+ycPvWPgDZZzGtXCjPmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boBY3G2usndDUJvFQRPnwM4v1ZHclTfW3AxCR1Pi4GE=;
 b=vg6oQ8HMBlQNytXyP4Up7Kb6ICR2/l6QLu17d9KwyZ3YldLTSUfJjCRMXY0y8wLmjF4gi92uZJ3jhpF/hUIxw7zs6Ld5AGTJxGR+4btrSBVScZumT0RVoPYCcIdKTH8RasV3W6wnGT5VfAsHvMKU+9Qhj/GCVEowZyOajzxygLU=
Received: from BN1PR14CA0029.namprd14.prod.outlook.com (2603:10b6:408:e3::34)
 by SJ2PR10MB7619.namprd10.prod.outlook.com (2603:10b6:a03:549::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 09:51:48 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::3a) by BN1PR14CA0029.outlook.office365.com
 (2603:10b6:408:e3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 09:51:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 09:51:46 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 04:50:58 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 04:50:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 04:50:57 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6839ot2B1312236;
	Thu, 3 Sep 2026 04:50:55 -0500
Message-ID: <10794eab-552c-440b-b430-5dd644798df8@ti.com>
Date: Thu, 3 Sep 2026 15:20:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] recipes-core/images: Build ti-core-initramfs alongside
 tisdk images
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
        <gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260902132838.2135551-1-m-shah@ti.com>
 <011794ec-fb47-45e9-bbcf-fd8450892765@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <011794ec-fb47-45e9-bbcf-fd8450892765@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|SJ2PR10MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3e1dfc-4e35-4962-3b19-08df09a0f7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	HDWxsJawzZf5l4ixtq+c0UM4LV7PpsqtOevB9n23ntuM1zr+Wd+gF3gps6HBFlYz5PS/AhgNyD4jzUgxr5m7ESI6ffdpw6hM6pRPPNRz7NqBYlU1QJG1OVKgOAMUBJQ0XR9/0TFYwxnnENdJSNQFZXA4L2U7a8F1W/kPZzgmaNPb766bYN9R7ca6eW9OQhfQziBxW58xGEvQ5GzishnCmjIh4pShb6lmi+dIUmzO3sJlLH3dbA6G0CzCwczghPPGNFkZLcUJiiMyAYZupAJU5WK8rI5nA3ZePq6steC8y6h/bpHjEu9KL6l6UAeCqSvCZYnm5hEyfgCGZ3oIOXz7Al0HPPQW+50styjHUoJpzfmMzoZwQC08/wDw8UJrDq7LL86KFi2MD96PI1JehMh8g2rML+ir9bYSJcLSjk2xDYsPt3WK1l86fmLWAptfZzVtHpQb+po/fLMAVL3dl+EKkWgIQNk0RGeEAC45BAl8RODk+jIUXV18yfokrs00p5SwMwbJDORzvx8uH8mPNkSk+ovs93h1Sk6gXLyhEIoSWNHiuVtwYA9yKquyyp+rtA7xkYZ4aTKQUF7QlSHb8X/9oa5kFDze2daNZAgJAniL7yNBtFsENzDwCgc46yg5pO0WrhkFctNW6E7C8TxS6NPI4g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LcdiPovYh65JFE7Kh35YVom1yXoNUmWPufHVJCUEWkpvFw1oCU+gDhyBbFer+5cJn+hQNt9rd18s7QGvNS8SeZ8cMxPPul0Msgs7O7uNPS1AoGGyAE1bIaoAEYs7eoiloWx+JzT/6Ai34qURVXasOy4+cA59nNHU9722pLdfhA6omqUl2yH8p3VRswvskPodXV6joNAJF0ZUu3m/IbPDCNRYXGunrJm1EocOVE2oYl97ohM0lsKIZ5+ksxXduuMsLsjhD/7rp54tPTtD+wLptfO7ORwD+eBuD6RF4FGwRSOwNLUqsLHtAvBkB+4KhLZwmM1jddpOXCeVPW46g4/XQUpW+tCp/nHfqzAOIFGIrkHk0TGu5X4iAkW6yIi0uEN4VZkk3TwOpmCe5Z0jxEJw/BF+W6jcyf7ARR0iTUxNYIHVF3HpsYy6siQIDRJWKK47
X-Exchange-RoutingPolicyChecked: 
	kHnvUac1PjVHe7xp/NOLy4mKGMbNh9xxHt6up2c+PyE54bo/w2n1oUaXgNcawg6q9bp6PIxhHK3bd6uvyF+XFezhGu6tpppEeXWY68rZKoeq75SSFNWecmVzyLtOu9OweMmiz7t/5F5woQqBs3mFBjnuQuYhZn7aUQM+AnvY0zr9+b404zq3SAdd8kUdV/NkrStpaFu4jIb+Y52I8MzaPadQPKsR545VjFbeYREx6do5udSJ6htaKMpnlByK51XLhBEYEVoxCwKW3/FGmoUff8Nw5JYFuDU7i3Z68KqaAdOMAqljNJ2BtAqFchY4G1AOqJ9131vWgg6x+sbQZmyh1A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:51:46.3029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3e1dfc-4e35-4962-3b19-08df09a0f7a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7619
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4NCBTYWx0ZWRfX9RGXjGb8BjCW
 i/nxGLo7GFB/0NLSQ3rT3f+2nbADHL+URZl13HNQBuwoYWcq4UHuV/l6NC9VbMo4kN4Gj9HHhxw
 MwzX/q8ub/uqzMZWlBCKW73ESpKBm5c=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a99433b cx=c_pps
 a=9KM80f3Gg1/mZdPsmiBtBA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=S4Wowzo4e0-8zTEymvwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: b41Hxujk4krywcWxswPCSK51OFizU6Ee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4NCBTYWx0ZWRfX8An40gxGRjWh
 6Uzt1MIpXdYewu/FCZ5jwIctuBvyh7DtxKfF/D3whY3G/EKCdPg8Iy/diG3sVhO7iA+M3BxGccl
 m4p0nqzqDAkuFuKzUSW82ITULl4PxKmFjre0EZVgiALAcnJyVKxS6ehrgGa1byjmZ0ExDRRJFB+
 2zcccfaT7am2Kx9WqvqHgDXWK97PWK6lwoFGKvo/QWnYAd92rt6mEGjf5Ow8WhKvLarmP2CmjzL
 /I1nJVhOeCGpRZ3hoAms5kL1isDD3/63HCAfiZZsTmvEEtTzQror3xBSoJJuz6weAZFXBYEWddl
 fUydvC7IvrHiUD9ugmXrmpp8+MEk2PcCf9SW8O3xS8y1V7XlGcHK1e2EuRy/kQIkbhbvbQ6K8BT
 oj+grkT+XhkpAbnanasznXnHXvKFZwh3lVVlbDt4CupHbqC0jPxQOqUbvB1aWorlb0t1/x4D1WD
 8+mMyKM6eM1XFmh3B1w==
X-Proofpoint-ORIG-GUID: b41Hxujk4krywcWxswPCSK51OFizU6Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030084
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 68391BmR3302147
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Sep 2026 09:52:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17652

Hey Ryan,

On 02/09/26 19:35, Ryan Eatmon wrote:
>
>
> On 9/2/2026 8:28 AM, Moteen Shah wrote:
>> Neither image sets TI_CORE_INITRAMFS_KERNEL_MODULES or
>> TI_CORE_INITRAMFS_EXTRA_INSTALL for j722s, so the machine-wide
>> TI_CORE_INITRAMFS_ENABLED gate in meta-ti-bsp stays off by default for
>> this machine. Force ti-core-initramfs to build via an explicit
>> do_build dependency in arago-image.inc, the common include every
>> tisdk-*-image recipe require.
>
> Why do we need to force an initramfs on every platform/image? What is=20
> the point?=C2=A0 The point of the initramfs was that *some* boards need=
=20
> some kernel modules to boot so we only require it for those platforms.
>

Is something like this okay?

--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -30,3 +30,11 @@ BAD_RECOMMENDATIONS +=3D " \
 =C2=A0BAD_RECOMMENDATIONS +=3D "${@oe.utils.conditional("INIT_MANAGER",=20
"sysvinit", "", "busybox-syslog", d)}"

 =C2=A0inherit core-image remove-net-rules
+
+ARAGO_TI_CORE_INITRAMFS_STEP ?=3D ""
+ARAGO_TI_CORE_INITRAMFS_STEP:j722s =3D "ti-core-initramfs:do_image_compl=
ete"
+
+do_build[depends] +=3D "${ARAGO_TI_CORE_INITRAMFS_STEP}"


With the above change I need to do some meta-ti fix as well.

Regards,
Moteen


>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> This patch has a dependency on the following series:
>> https://lists.yoctoproject.org/g/meta-ti/message/20235
>>
>> =C2=A0 meta-arago-distro/recipes-core/images/arago-image.inc | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc=20
>> b/meta-arago-distro/recipes-core/images/arago-image.inc
>> index 37b20850..398e299f 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
>> @@ -30,3 +30,7 @@ BAD_RECOMMENDATIONS +=3D " \
>> =C2=A0 BAD_RECOMMENDATIONS +=3D "${@oe.utils.conditional("INIT_MANAGER=
",=20
>> "sysvinit", "", "busybox-syslog", d)}"
>> =C2=A0 =C2=A0 inherit core-image remove-net-rules
>> +
>> +# Force ti-core-initramfs to build alongside every image based on=20
>> this common include.
>> +
>> +do_build[depends] +=3D "ti-core-initramfs:do_image_complete"
>

