Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7377.1793793223321781414
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 03:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hFEKBPdM;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=RRmcuYqn;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: devarsht@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bbd2m2084225
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Nov 2026 05:53:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KifeThlml/nF+ZUgFSEVyk7gw0pj7E8LuEMCgQ0ub
	QU=; b=hFEKBPdMvtCjyI4jIgzm/NjV+Ytb4Zub/ve2pWFRqYr1CQBvJ+qXuXpIq
	39PgNWxq8qZOxrxaGMqXSafLB7ZgD1DpUYx9c/qTofTD5wQTUDNyQbPPwYh94odr
	z+0g8aBM7FcUvuFQqnNzBDB471Za1CW7dWhL24uU/+cWUFEN/pDbM/g2U08xBE/B
	eO56V+QVGUocimhVlKVGcEMBSHfneW0bR+cY7w0lHlUaDc6DptD1Is0rPCpZLIAT
	RfyUytuOL+sobvCdyUMEQZIO7M7qA4Pai52wVTm7up1cDND5oOWX9JGMevK3ozPx
	2B2zmRFjY2eXoZJsNrdF7d8qEZXkw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hqqra3yhm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 05:53:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wfd6z4TEkXohUajUi/Yewiu2HWsYCA8MovLhYXgucCBDO40JtekkLDAd/JoBEM+fVAtBNavCwWpYGh7boR3DbwWzzR39tsuyJ2USDjBJdXV72boVlrVeOVKfD1qSQMytvTPaBPtCwyexBXMceRbr5ZcLrW93x/q9YiAKhE/RyLlHmVoAqIxrjZWtEJJWgVq2XIVWA33jugBQPeat+UBNOdDonPBhdR3bMt6xxHzT5/4SQ25X9TtC0fxzflg+idX0GsoaAMscPFusGjD/OPqaU7v0RBeOmNjYHxIlmdEiACBcEJmRMGjesVEkLlz2GVbrhNdMbp2h6RfCOJmDBhy0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KifeThlml/nF+ZUgFSEVyk7gw0pj7E8LuEMCgQ0ubQU=;
 b=Nbzv58Z3iUyn34Shsj+9bFGWrJPS+QNWNnEQqum5RL0j30HOm8bjVWnBS2ZWGCHaz5ObOHj/KFGPTrwLobDDiiTIG1qc/X4zlq6LnR3mY8QIFSFTr3PFo55zaA+A7MIKtwSMi6az0PM/JDpFFzMmoYF7bSzLE8y4XzAP5hnJDgjwsvG/xQpbItUfSmIC4VXtcQUt3M3l5e+JX7/7wM2X+qGibmP6VQD+UzavIfzXOwF8gI2M7a642i0W4tot4xp+Vw/1ZeRcxypTpoCB3Q2Sm0PZabbYZ2ARVVo7nksJmSEvI0ggpfQ0QLi729CJosu2+TbJwBeD7uVZwnyT7A3WNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KifeThlml/nF+ZUgFSEVyk7gw0pj7E8LuEMCgQ0ubQU=;
 b=RRmcuYqnVnyWs4DB0f6kv7Kgx77ajNErbtdm/vqbmJosKpr8owUXxmxMl2LjJU60tRdtlYabUxnVtL7cdbeShZ5Hv1wfsvvlcoUxCb5PlXRmfD9cuRNcNxVWEDI9nuVXwof5Ef+SHGM5hB+VxiYVL9Bhk11TN/dG3bZ8JD5Xpqg=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by SN7PR10MB6363.namprd10.prod.outlook.com (2603:10b6:806:26d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:53:39 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:53:39 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Hegde, Yogesh" <y-hegde@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Veeramachaneni, Prudhvi"
	<prudhvi@ti.com>,
        "Sharma, Rahul" <r-sharma3@ti.com>
Subject: Re: [master/wrynose][PATCH] arago-image: remove splash for am62lx and
 am62px
Thread-Topic: [master/wrynose][PATCH] arago-image: remove splash for am62lx
 and am62px
Thread-Index: AQHdbDsPl+QtRv5aTESxTh2yRf0tiLcdzcqA
Date: Wed, 4 Nov 2026 11:53:39 +0000
Message-ID: <334c2bde-3fb3-4542-a7d0-7d8652105a5f@ti.com>
References: <20261104090001.2133882-1-y-hegde@ti.com>
In-Reply-To: <20261104090001.2133882-1-y-hegde@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|SN7PR10MB6363:EE_
x-ms-office365-filtering-correlation-id: 82893a91-7c2e-4ee6-877c-08df3a6a4409
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|38070700021|56012099006|261022075727099003|261022115727099003|261102123227099003|261021121427099003|261009223027099003;
x-microsoft-antispam-message-info: RImvp7y36q4L9mb7sVqejKaBY3VYYfJmmBhlrjd0PoyVsV3MR470SUvsGDyWiOmvJrnlkk3DhvOQp7608dkEZEoDtJ/Z4ZvXuciO8cmspU/S/QfaI207ApDw+vdhTDqlc5+qsUapKn6B50dL+Nj2XCOWl5ujlkhRCU0WtyRtWqooKqeur1n51iCxaMw5GQd/ZDPSbGeHTySJvxsa8kZVhULJQhMY1wS+CNcLPBYC5/kDg040+SNID2bqCQ00SayFhAsas3ENEcowbsuimue9kBitsm9Nz2eqn1sjl/Y86jva2ouoNbcjVBHrCIDt/hTBtsXal54bslm3039Nzsb1dazXcexEfYYqUV82Wj3iPLxCtmP4YwWbw7AYC9ErdSuUQWAhWo6qUiv0Vtpdj0urFsf04CVZtddmTT5CEwZb9GyJ6sVmJ81LK3V2BvBgsFNLd9BPOJZE5XKKzDozC28GoI5F0jyS5NJ0XVSaYwKUY5w2qKhUR1xaQhapsa06sxKyFNrzm+2kv8rjonGzrMAXFroLYV8qKtNxiJoI/ueCad05rab+aveQV9RaKECTC0ZDzYJrbyuABDCte0ZqFnF/QfuVHDXPZdvu0qWVDSEz12OTG9Cir5rBXuuiC1I4QCtG10MGYGFSAUQZRAVyhrJ+c8V+EekixdtDkN0SjbHXd0Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(38070700021)(56012099006)(261022075727099003)(261022115727099003)(261102123227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFlPdG52MjV0R2JLaU0rdVdRY054cFhRdTF4bWJHZ2xqNU0zTFl5TGJobzNw?=
 =?utf-8?B?SlVkYzdQTmxIamVqZzlCK2tHSkV4OGt4bzcrTWpGR0Z2YndVTC96c0FLVkZU?=
 =?utf-8?B?M0tSSmFKQ0pBNU9Xa3RZZHczWnhaaXoydWV3SjBDRGlNY3pkU1dlNTBXNlc0?=
 =?utf-8?B?TGpqc1M0NWY0OUVQdnhNMTNzdzcyaWhIa2NPV01mR29lOEpxZU83UjlWbFRv?=
 =?utf-8?B?RGthbVAyNFdTMVRMRnRKU3NyVDZ0OVVJMjAxOEMyQzMzVmcwWE9ESHd1YnJN?=
 =?utf-8?B?RGhDN0VsaUFIU1BnSEgzNWNOL2FFcWJNd0xxbDNwdkg1MmJUaFdGME9YVDAy?=
 =?utf-8?B?VEFWK1hHUUt3Y0VGcFdrNXdxU2QzVUtMQ1R3MnFlMUVGaG15dVBpb291cXhy?=
 =?utf-8?B?MGRnMytCNENKZTdqbjZVQ1RiQTZSSWFiV1kwZ0tHQ0hBQ3BhQnFEV1JNcU5T?=
 =?utf-8?B?MWxUT1FBNTFnK2FmbHU4L2R4N09pZlB6dHZCcTAzR0MwZXZHemYrYVZKT3Vl?=
 =?utf-8?B?Sm5iOWJRL2RHL2hkMUJwbkg0T1RNZHBUUnlUa1g0S1pRVDVIUGgzeENmNFZr?=
 =?utf-8?B?ejNrajVTdzNLdlYxRkRscUVoUlFuTDlzeGN1Mm1KY0xWTWJRdGZCM2JLamdY?=
 =?utf-8?B?dFprYms1RWdGeVBHQ0tCZGZUYmtzSDBvKzk0RXFGVFpuTXFzTG9zY3JReEYy?=
 =?utf-8?B?UGJRVlNoSEhMalMzMFhaM2h1MDBxa0lHZnNXZkFVQlZvczhqRzBUcHA2VFZs?=
 =?utf-8?B?SXNDakY2TjJjSTJTNXJ2d1NKVGVuaGxMdHhjcjdCTzIybGlrQnN4N2JYL3k1?=
 =?utf-8?B?VHpQVWJHK242WUw4aU1HOEF5SmJ5VDZpdG1vbThGY2FtR21XYVRYbHpYU2RI?=
 =?utf-8?B?RHptM2pTNkJabHVtb1hMRlhwYk16eUR2K3IrbXhqbXc3dG5nNFVvVDUyRU1L?=
 =?utf-8?B?dmRVZVV4Q05RQ3E1YWNYOFpVVVF0UFI4cnByYU9TT2ZvVGRTdTdKOWNuZ0Rt?=
 =?utf-8?B?ZGJITkZHSHdDTG9qbDh1bi81cmxBQWNhRXlkblorbXRhMU5tbXFwNyszdll0?=
 =?utf-8?B?UnkydEVmK1hRZTZJMUtSMmkrRlVmeUNSdUh4OWFZMndhZGJ2dUMwLzZJNFBj?=
 =?utf-8?B?azVMaXpjRi9vQktIYnFZTldPbkwzMHJaOHZPVTRkbEMrbkRtVzBFV1M1TDFu?=
 =?utf-8?B?YW0xY1RYam1FWmlKNHE1OWhqZlhvOUI5SmxlRjEzWTU1eVFNSDFwT1AzY292?=
 =?utf-8?B?RlJlWkJURkZYOUJRL0lPN1l5UFlvNlhMejVzQ3IzRjYwM3pQUmJieDZnNE8w?=
 =?utf-8?B?d1FsUExHTWpyNmRqVFVlbXNucjVCcDdjck5BTllIQWpZUnZQaWpvV0hIVG50?=
 =?utf-8?B?c2JsY0tBQVZ5MnFtdEdXa2VOMzZHZFRzcWpoOHBzVWtOWnVwLzl5c3RwUk1B?=
 =?utf-8?B?Q25ndTNKTGl0c1dJY0c5UENIb3RFT0dUZXFpZW5HYzByQXZVbE1WOHp4WHVU?=
 =?utf-8?B?ckZwYnBxYkZ3OUdsR294RzlIU0c5Uy9VZGR3SXdZOXp5TnFmaDdlNThmTjB3?=
 =?utf-8?B?eXUzV05vODRYd3pDZ2VhVElBRW1SVkZwSXJtRDhMMVNrTXdCM2xwbEVXTWQ1?=
 =?utf-8?B?TmF3UmtJcUFRcG9RSGhBUUlpVkFyT05uejE5OG5LQXlEZGovRHBQbFN2UGRP?=
 =?utf-8?B?S2VtaXFrajVaY3c3RFRsM0d4WHQyWFpPVnhiZzVaY0tvMWM2dEdHZ2NzWWxU?=
 =?utf-8?B?WHZkaW9HL2dLT2JVNWlMREpiWm8yTFhYNlBrOVloNUR5eldCOENHUVIySzla?=
 =?utf-8?B?RXRBYnpqVDI0WlVLMVdzalNzMDM1VktjdU5HOUg0V3hGWGoyWGxaWTlnWHdS?=
 =?utf-8?B?Qkp2WVZ2V0Z4RUt5UWUwMnFTbDZ5d0QvRko5alpkbURaekxCaENPWHYzeXR1?=
 =?utf-8?B?ZWM2bDZSUnQ3Skx5Z0FxT0ZSVnV3VDIyZmVtMzZvWE9mcGplZUlsd1pQcC9n?=
 =?utf-8?B?RGxETjRqQ3BTT3hQR0xucHJId0FJNElCSWVJb0w3RzFkN2NIK1AxK2cxVHhm?=
 =?utf-8?B?bld4cGVtQmlUaHRHdnY5OEFxMGpPcmQwRG9OOWZGNFVvcEZ5UDNuTm0yQnhZ?=
 =?utf-8?B?akRFWlc5RjZVdDhnbzZaRG1MbkVpV2JYeVhaMi9WSTMrQktnNEdKUFdJVllq?=
 =?utf-8?B?Nzhqcy8yTkRNdEhrR096NjBCWnpTT25WZFFidzZNTzl1b0tUS3lUWTE2a3dX?=
 =?utf-8?B?Y0VNSzRTcW5xbFdQeFV2YndoNDFSYVRkcHpmOE8vMVVXcjZ5ZGRJUkgvMXlF?=
 =?utf-8?Q?X1G/p17+1sdsDcnku8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C06CDD8378A014491275374803BBA9C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: z8SpDB6jFlqsvTTsImV3DUDk6a3xdoB9xUtlqhVFQlqFKAT5YGBgRAVLtEc82awoBrjL1Hn9MBzz+kfcTAFbe0Rw7M+kmfumh95VJs46VYgdZ2UKaV7bkUqd2B6PV2/KYbfEze8Ttq1OpTlRY4tbckPMU0pc/1CNShFX/NIbSV2+wA0usN3ZYWNtkTmSJVW8PENNaW8pPAmFEMzRlYTYJcL+aKfsGjJeOBl2LEJd0JwSK4XT2dUQmFKcLMtvWl/dfJkiBoML/KMRUUigrszkaCx/peRoBbk8ZBBRkoCYNWvS7n5WVa40hNStCnCifAAgy8PRdRm4swVtLS0WhnplYQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82893a91-7c2e-4ee6-877c-08df3a6a4409
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 11:53:39.2178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NNmHgfBVBjEE6ieU5kK5o/Rv9wQeOQztCoAj1Uu0e1cpDyehuGtvMnzJyVP1sTv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6363
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NyBTYWx0ZWRfX/ic3U/yokSCX
 09vE0PvWD6L2bpUdFpb1MBVhaXn9A/C8L5fwRrOOpPfVkNnypoEqaP6sljpn98dqH+e7/oOpsLD
 HKPxIums4n/MpfqsP3J59l2mXkv0xg0=
X-Authority-Analysis: v=2.4 cv=F9TC5ahN c=1 sm=1 tr=0 ts=6aeb1cc6 cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=HqEnGNA5ETr2gmw01xMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NyBTYWx0ZWRfX3X+V9SpQNfwm
 IVrbtSIZgNKgpYp9ADVSNHJKw0tAwtpHOxEEZ4MszT13klPVDvq7D/65la/q/t+0LuhcRTWyzia
 EpyX28112OCo4BVnXgmAS5Ow4Sc76SfubcOdc8SH7M++AL40ipv7Nw8A1yMm3igUVSDydDKd2+K
 8KUnvjhzqZYKlUpIMBMTrrAtdWTbIHKL4rEVFQMSTBhx35wLU2HijX9jmBDXnUkO0hcoLkvsEx9
 ZfA0hZmemvTxvhqE+8bLpnG2W8z20uNtZwd2glxGW+IQYVxE8L0Xll+sdcOvmaBbMgqckV5deXd
 /8YcwfTmn7ZAue+a7/OsjKYM1vQuwgmbTAD6//tjKIw+7ZaUIDrWei4nTBbMloOR8DI9XGMKYH2
 I/ROpGanbzZVglNI+y/66TqzGz71UbUWzn2niqAM+me8fnKvxhuY7UtpUV+wXfoZd/dhA6lBYf5
 OW1uVHdenD9d1+nsAhA==
X-Proofpoint-ORIG-GUID: tpxv6arUpINpGsRHMyfc_oSQLhu8Zjdq
X-Proofpoint-GUID: tpxv6arUpINpGsRHMyfc_oSQLhu8Zjdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040047
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 11:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17757

T24gMDQvMTEvMjYgMTQ6MzAsIEhlZ2RlLCBZb2dlc2ggd3JvdGU6DQo+IFBzcGxhc2ggY2F1c2Vz
IGEgbGludXgga2VybmVsIGNyYXNoWzBdIG9uIGFtNjJseHggYW5kIGFtNjJweHggd2hlbg0KPiB1
LWJvb3Qgc3BsYXNoIHNjcmVlbiBpcyBlbmFibGVkIGR1ZSB0byBjaGFuZ2VzIHRvIHUtYm9vdFsx
XS4gcHNwbGFzaA0KPiBmaXJzdCBsYXRjaGVzIG9uIHRvIC9kZXYvZmIwIChzaW1wbGVmYiBkcml2
ZXIpIGxhdGVyIHdoZW4gdGhlIGxpbnV4IGRybQ0KPiBkcml2ZXIgY29tZXMgdXAgaXQgcmUtY3Jl
YXRlcyAvZGV2L2ZiMCAodGlkc3Nkcm1mYikgY2F1c2luZyB0aGUgcHNwbGFzaA0KPiB0byBjcmFz
aC4NCj4gUGF0Y2ggZGlzYWJsZXMgdGhlIHNwbGFzaCBzY3JlZW4gdG8gYXZvaWQga2VybmVsIGNy
YXNoLg0KDQpBTTYyeCBwbGF0Zm9ybXMgYWxzbyB1c2Ugc3BsYXNoIHdpdGggc2ltcGxlZmIgc2lt
aWxhciB0byBBTTYycCwgc28gaQ0KZ3Vlc3Mgc2FtZSBwcm9ibGVtIHdvdWxkIGV4aXN0IHRoZXJl
IHRvby4NCg0KPiANCj4gMDogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20veW9nZXNoaGVnZGUvMzkx
OGY2ODI2YTFlZDU2ODk3NTY2YzM0ZmQ3NzE4ZDENCj4gMTogaHR0cHM6Ly9naXQudGkuY29tL2Nn
aXQvdGktdS1ib290L3RpLXUtYm9vdC9jb21taXQvP2g9dGktdS1ib290LTIwMjYuMDEtbmV4dCZp
ZD0wMmZiZDUwOWE4NjgxNDJlMDQwMDUyMjFhMWY0ODM4ZTcwMzBhMGI0DQo+IFNpZ25lZC1vZmYt
Ynk6IFlvZ2VzaCBIZWdkZSA8eS1oZWdkZUB0aS5jb20+DQo+IC0tLQ0KPiAgbWV0YS1hcmFnby1k
aXN0cm8vcmVjaXBlcy1jb3JlL2ltYWdlcy9hcmFnby1pbWFnZS5pbmMgfCA0ICsrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLWFy
YWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvaW1hZ2VzL2FyYWdvLWltYWdlLmluYyBiL21ldGEtYXJh
Z28tZGlzdHJvL3JlY2lwZXMtY29yZS9pbWFnZXMvYXJhZ28taW1hZ2UuaW5jDQo+IGluZGV4IGU2
NzM5ZDJjLi4xMDZhYzJkNiAxMDA2NDQNCj4gLS0tIGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBl
cy1jb3JlL2ltYWdlcy9hcmFnby1pbWFnZS5pbmMNCj4gKysrIGIvbWV0YS1hcmFnby1kaXN0cm8v
cmVjaXBlcy1jb3JlL2ltYWdlcy9hcmFnby1pbWFnZS5pbmMNCj4gQEAgLTIzLDMgKzIzLDcgQEAg
QkFEX1JFQ09NTUVOREFUSU9OUyArPSAiIFwNCj4gIEJBRF9SRUNPTU1FTkRBVElPTlMgKz0gIiR7
QG9lLnV0aWxzLmNvbmRpdGlvbmFsKCJJTklUX01BTkFHRVIiLCAic3lzdmluaXQiLCAiIiwgImJ1
c3lib3gtc3lzbG9nIiwgZCl9Ig0KPiAgDQo+ICBpbmhlcml0IGNvcmUtaW1hZ2UNCj4gKw0KPiAr
IyBEaXNhYmxlIHRoZSBib290IHNwbGFzaCBzY3JlZW4gb24gQU02Mkx4IGFuZCBBTTYyUHggZmFt
aWx5IGRldmljZXMNCj4gK0lNQUdFX0ZFQVRVUkVTOnJlbW92ZTphbTYybHh4ID0gInNwbGFzaCIN
Cj4gK0lNQUdFX0ZFQVRVUkVTOnJlbW92ZTphbTYycHh4ID0gInNwbGFzaCINCg0KQXMgaGlnaGxp
Z2h0ZWQgSSB0aGluayB3ZSBjYW4gcmVtb3ZlIGl0IGZyb20gYW02MnggcGVyc3BlY3RpdmUgdG9v
Lg0KDQpSZWdhcmRzDQpEZXZhcnNoDQo=
