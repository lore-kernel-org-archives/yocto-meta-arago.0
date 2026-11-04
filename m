Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7537.1793793426953570976
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 03:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CL9K3fZR;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=l5PkgbvY;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: devarsht@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bbcg12084187
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Nov 2026 05:57:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jjRBCjoACv6qAi1YaqQvXiyELeUnze4qKRwCW9y1z
	FQ=; b=CL9K3fZRL1eX/yjdmnKGWBKvfMZJZra1VbOCGg2Biz1QWkwQMvShaoutM
	+v5nj3LMzPdIe1TbVUssjT4aRsvKNNr6L2PfZvc+9uLgHinwpeHCA1iMhaLcteld
	s0LVasaTZ21Rjk6ROgmN6zSc7XuvGTyLL3yf9dRW/wH8DXihVQvsYCPhxpPeBqRH
	je2HsRkdybjeqr9sscWXcXd/UEF2DKZoHnz2MZIByFyr6fY/zpwJYhRqWzVyohR3
	BhW10iCOFKVVtFaazIEwvdCDtKpQVdqnr1o8RPzXhkMntAkAJ5y4ZMwkehApnD4v
	grOBxsQ/yQGnOlqefPDIIv0vpCEUg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013001.outbound.protection.outlook.com [40.93.196.1])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hqqra3yya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 05:57:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BM9s5t70M5mgUQOvBlJExkJfIMbpIoILBUSM3gj9Ow5WW4sQ4Kx1Dkq2VoX8HDv2asglW9sWXDRtaevACKFmS/eOobjl7e0Z6So4MbfOtlsp6ddWNRxt2+6DX5XUrF0neAuy3hmcpjJNscbBW1IP//hTLBQz8pWXtl0AuU31pz/n4qfe0P/cuF4KbWeHj7NAGKXifcsmx6EOI1PNAJLpGugbvsbxCjuZjXQXZsrb9cOxYLXL8hTmmPuPVWpog7XLqTEv3XP8Oo3/HUY9BscZMjUco4hQ2OiQ24OyS4pW3ZE06kn6p9UHfTcEGmfGcoOxBKcoKcLbu0bXaj13cEGghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjRBCjoACv6qAi1YaqQvXiyELeUnze4qKRwCW9y1zFQ=;
 b=hfxzPNLl71kUxw/QBRGHa1CB3VPUXJe+dKMuXo9fVeoKgJxW48JSOldA3lbekW0FQurn6WB3uujtCloydeVBeEwWCf2p/T78uJbRKAxypmF9z1DSlmh7gfXSNCk1Rc4Odkl72oWEeJPfuyTZP26e9Y+Fv8L69gA6LPfSoBSfeRBUpYngGQ0nC0WiU9e5lQ/PcZjheAf7fE1MaU5OtY0kPxVQPQZhdwudEzJI0jK3ZWSAt1y1OV15ocadNsZEtq2Fv17+nkd+wuS+DpGK7mA8cgRt5C231f9NIYowE1NU0odYQ+iuBCvAOlybmxi7OgObK/yp1+LSebl61jbr4HAQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjRBCjoACv6qAi1YaqQvXiyELeUnze4qKRwCW9y1zFQ=;
 b=l5PkgbvYzE5kCnP+RUAY2KVKujuFpT8uR2+kQIrYQskWQ0oTMA+cF6I4Rwl2LwB0RmmukbdhEcc4V2Pfx2df4elw/3pk9P8ivrVMzeAyc39u5FRDeg+s4ToiaBqm+4e953dF41DTEnach1Ib7r7/n/Aj4LdIZRTcmgerbVzA9ns=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by IA1PR10MB5971.namprd10.prod.outlook.com (2603:10b6:208:3ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:57:03 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:57:03 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Hegde, Yogesh" <y-hegde@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Veeramachaneni, Prudhvi"
	<prudhvi@ti.com>,
        "Sharma, Rahul" <r-sharma3@ti.com>
Subject: Re: [master/wrynose][PATCH] packagegroup-arago-multimedia: add
 application to debug drm
Thread-Topic: [master/wrynose][PATCH] packagegroup-arago-multimedia: add
 application to debug drm
Thread-Index: AQHdbDssJwdSevhzTUKtAW9vYYYhHLcdzr4A
Date: Wed, 4 Nov 2026 11:57:03 +0000
Message-ID: <e31e5ae9-808c-42e4-b47a-6afe20d8fcf5@ti.com>
References: <20261104090108.2136937-1-y-hegde@ti.com>
In-Reply-To: <20261104090108.2136937-1-y-hegde@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|IA1PR10MB5971:EE_
x-ms-office365-filtering-correlation-id: 3fb20d4b-3ee2-4055-42f2-08df3a6abdc6
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|38070700021|261102123227099003|261021121427099003|56012099006|261022105027099003|261026140227099003|261009223027099003|261028144727099003;
x-microsoft-antispam-message-info: E6PUBDcvO3+dxU8cYJdJ0dnfFuJzZ0e5+whKelxLN8q7xx0KYrZZCSB6JVFJ1xLxJi/E+Xw7BQXPNdWGEAbX+gmLkbPcI8ACX7M/FQkEWBXt2BHZt0yJmYYxAIM8+mHKL+CnRKvn/l3Dj9jSAVz9EEj2kzqgvvoCIHOmtKDjLbW7Q+Ml6SNfNlmHwz8JfApp9r6JlIhA/AghjwwWgmDBeVtmCThT5by18UDVHDVHtXJAf5YBWmWD1tHaXSFG6wQ8bzj1HooISQzSfmsfklum5pFE6TW1PymaDp6BJAli43TKZVP+EVl2T370kjySd8kWBEyxeEYwzVQ5VZopU2XzHkWH7U0qXuA+DX7ueJrXbByijhkkLMyDr+FJHdn67cfhUByysjINAiG66+eybgwGfU4orJlxAuDnYmule5XDvYJGFJuYl6KeLfzvLEL2+fBRG3snZVWYTtI6sesyWUGFFul9cLjex56aypSSb9b+FE/c9iMoNMHsiZRMdt+PEDHcYCRJvVV3ninKATQv5c1OQ0ppln0J/OnScrQB34tjFbtSLln4IejTWZbiB/a5jJHBUuVP6J0fU4OZFjwI+Rj2UPNJWFC+OPDlaExYg6JCL7qYWFTnX+VTkRobqjtAFub2qtX5kunsazMl8QHfnBhttG4qzLTsYcnPWCFz3e+JFvnG/JPa0Qo8o3gQ0yUnaIE032sM2tHLTHT+T/P5zf3OEbWbe7iocKix2qdX0b5PJ5E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(38070700021)(261102123227099003)(261021121427099003)(56012099006)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGZaV21rSTRFNHkvREpibW1Scm45UytHazZvdTJCclAwM3JZZC9ESTluM016?=
 =?utf-8?B?c3FhMWp2ZUorQkQ4Zjk4QW5LRHZJZXBtQkg4QmR5MzNNZ0wwckNnMUVZVjFz?=
 =?utf-8?B?N0RNelRBYmRwMlpmakplQ2hWM0UwRUFEektjdnNuZzhoKzhNRERqT1ZlQUNz?=
 =?utf-8?B?OGNyUWRiSlM5NkZGVVF3a1VjZ21KVTBoMVdDdXhxYjZoRUQ2MmQ1Y0V2UXN3?=
 =?utf-8?B?c1dTbzY5WG0zLzNwUnRobTVoRnhPRHloL0w0Vi9wU0ZMZG5lZ3NJVTNSeVI1?=
 =?utf-8?B?cGx3RE9XZDcvMGs0S01LcWNoWHZ4Q2lCMDZyOGFDVG1jOSt0TWlobVdJRnRX?=
 =?utf-8?B?MU9JRmtURGVyVGdoVDNqUms0aTBBamwxN3p4eVJLYnphY0lzT2dzeVNOUWIv?=
 =?utf-8?B?Q1ZydVJDSEl3TEFiczRZakJaS21MeEw3N0FBMXdCaHBsYmhHZUVNZjY5WERK?=
 =?utf-8?B?TWoxNDNBNFowS0JLYThKMzMyVEJ0dExpZFhvMUlUaE96dXprUlVTaGk2MC9t?=
 =?utf-8?B?Z3djRnhQMjlWUmR2U1FmcEhVbDZyZDNJZzNmTXNaSS8yRnAvNUw0d1kyenhi?=
 =?utf-8?B?TVhxM1hNaGVvYUd5Sk9HaTRveXlFZWp5Ykcrc2M4S2dtRHFXYjE3M2JnTWZl?=
 =?utf-8?B?eDNvUGM1RjlsL3NJNkNCQURSMWFpcmEzOG5NUWlqd0s0R2ZWODhxZFBydXhV?=
 =?utf-8?B?SGJNYVJiZW5KcVh0OVpLbU5IeFpUMjFKWDFPU0Z1b1Y4Z3FVeUliK3pmUWw4?=
 =?utf-8?B?U1hXR1NtaEdYWjJpYVcwZCtFaGRFQ0lTeElRKy9ncklBNXBBK3JoTDl1WkRk?=
 =?utf-8?B?dnlXVjRuaVkwYjE1YkMrKzdod3ZmSHdiMy82VlJDMmtKUGdQYlhrQjVOY21B?=
 =?utf-8?B?ZWhPd0tuMUlLNno1aUplU1BWcTN3aEVxS0J5NEEyUDdqbEtCRVNQRVdnTVh6?=
 =?utf-8?B?THB3TmJMSUk3WGd3NkxKUEhkdllwcEc5cG41TGZiV2l6N09aNVhSdEZnR1Bv?=
 =?utf-8?B?V0dDK3RwNVYrWHZSMCt0d3pROVFsRHRuSlFHTllleTRWMGd3MDVFVi9xNEdN?=
 =?utf-8?B?MzcrMzFPRmdjeFVFQ1lxbHE0RlNoOXRJSXFWVTlVb0VQN3BRZEowQk5DdW9n?=
 =?utf-8?B?WWU0SXhSNmlpdEpVVlhkQ3Z6RGVyNVQ0di81di9jVSs0dGVMMG94Q3h0cFo3?=
 =?utf-8?B?UDJmNGFqQnpSY2oxN0hxdzRnbmFRNUowbDhpQ1UzZk1vR1I0K0FRRGJWdzFv?=
 =?utf-8?B?S0k2SEhrWUhrYis3bmhwWFNNckdUbmo4NFNHKzYwNDJMZVdHOUJMMkR3eFhx?=
 =?utf-8?B?dDdaSHFYUGVvU3JTNjFmOUx4QVF2UFpiNk1PRGZHczNPK1piK1B5b3d3SGtP?=
 =?utf-8?B?Rm9xTk5PYnVXQlJlMk93bFV6eVpMaWVpMUQzQ01BdkxmN0JGSW4rSHlheUZi?=
 =?utf-8?B?WmNETmFWRTg3K282U2dzMjVKTDdoUzczZXYrV2NxN2p2RVhlT2FkdGE3cFRQ?=
 =?utf-8?B?SnJ6Q2I5RUF4S29Ba2dnTjlqR2pWbEhUY2duQ3V4VGlTeGxZZkluUENhN3Ft?=
 =?utf-8?B?MjNBcTJKNkZIejhUUitxN0VMbGt1Y09iVlhBYXFJL293U3hrSDBRSmhIUVV3?=
 =?utf-8?B?Z0FMNkJaOW5YeHdpZ3lWVnBFejR4d0gxUTJkNDZ5dHozSTlJaDIzRHRhd2g4?=
 =?utf-8?B?U29jSUt5TWtNSDFlS0xPRHAzdlEyYStEWHRaNmttbHVCaHFkeGljSElyK0pF?=
 =?utf-8?B?WnFadTR5bUNxMEJnNm8xb2t0NXV1a2pCVU9lczgyaldkdGQwR05SZXhpTFY2?=
 =?utf-8?B?eEtVZjJ4eSs2VTNUZk0zWEZFOVhNdkNiRTZjN1EzelhXNTVqc3RDK3d6UHow?=
 =?utf-8?B?dllGSVlaU0Nzd2VQRXVWNllKcHlJTUgzVWs2dTBqS1RDT3ZVaG85UlZhSllH?=
 =?utf-8?B?eVMwaWhYWUh0MSs1NlkranB1aGNVRmVHZkwwVGJtbEEyYUtBcktlZmNGRk90?=
 =?utf-8?B?TThQNFhoWFcrbmhLZzYzSzh3QmVXWjB4MFluNjVHNmlUdlpVQjVneXhnMVV0?=
 =?utf-8?B?bjZvb0lPYU54RFdpQ1dxeFRjTjh1bEk3ZytkdGovYVE0S3oxSDNkQ0xSd1pC?=
 =?utf-8?B?Y0VldzRCSFNmSy9xRm8yLzRKVmJJdDB6WWFzbU5mMXMrY1dRRmxWU3dHZjhM?=
 =?utf-8?B?SWRablZ3V0dTK2EyY2lqVEE1TndraUpLbzZLRE9sODB1MERQdWdTUktvQUgx?=
 =?utf-8?B?S1NMVWlLZ2hmMHl5VGYreWVjZU8yVDhnSlNNWnpNakxYdEZmZDVhViswWXJh?=
 =?utf-8?Q?jWYlARgBs8vjuI4W+r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C27B0841DC355E4EB5C35874B0C22A97@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rQKt5E/A3kMEjGPtrY/KR/nMpkU+BcKbJcCVdz9C9uuF8FEUdMv+xogL8LLNa9ThEZM1FTvXuy7H3/eXtkdwqXNGXi/ORnz49TH1iqP/B759z8odfc6gcqp+matu9LbwMwh2uwu5nktP2vmbmy/lrySZT5IalJ7wklVDVekH63xT9gR3rCmLeRkIr29yPXBBZ7ApnhaTgAtsImRHiolazT2BRGctqgHesK69VqTVPIOGTvnHromwOgwIVFV2PU3HGj6T1sl8BlNzO4C1QzCKWTDnE8GtdKMBSPSp5hc6CtX826MC/c6dqoy4zplTNeVWjwElIvUQNVytcLMVXoPhVQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb20d4b-3ee2-4055-42f2-08df3a6abdc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 11:57:03.4178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJMek3ENEaE3SDGjNlF4VClF5cVwaMo4FUsusrrZ22tFfgo9t0utK2RbYX32jOTe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5971
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NyBTYWx0ZWRfX/JMHj6Qrw4wL
 B/GMUBRVpdH6+waX9bWwLUEK8jzGThm4DjwQl7bAnVR+DK14V4GXZeUYqWhlkWYJMJg5AO2wgoW
 B3AKPM8WQRtEBjg1I9PhLVeJW0H1g3s=
X-Authority-Analysis: v=2.4 cv=F9TC5ahN c=1 sm=1 tr=0 ts=6aeb1d92 cx=c_pps
 a=dImUGf+04sfXZTE2vAy0Gw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=uMV7DkHrv0bcnLV2zZ4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NyBTYWx0ZWRfX3frlgUZaLzb9
 +bh7wO6qpVmN2fbkNpcVotGbq2w2ezcgkE3hj8XrNUUIpuWzf26XVh3HpmLfr6gG39AhE0JUqOC
 vxSQyFPfN9f9qMCEnhSdGnEiVk0pN0Nl/2z4gUgLa2VxQeOOiOFlMlqXriZa54+BlaaKI9PsjVe
 gN0MdnyAQjxV4H4quwBYibBvxfSW10vydKFt21N/JsEYl1/vFWkm33rHkJGpnurFFsNbrbdSFX9
 puy0d0p7Yd2V2KZ4BOB6u+MfZwkUVVtnZcLtnsiU5xG8exp2pBwJI96iZOlXrQ9sARaZb68DIvr
 5gfrFxSRAmvKpZkbAJbhbm799EKqY5lqWY8TbZCy3LHmtisJxBKoxINLfxl3Lf3LR1Gv9VCTPk7
 D7US3HcbHZI/dTV9ZV9snOH89dGnOmC5OevKRXwWKXFMiXPDtvhtyvCvxc6ArUDJHfC+Ts1mRyc
 zMYhhiYBmHtQd8fvgyg==
X-Proofpoint-ORIG-GUID: z-lzpOVJ1W21xMrBNln8vdRJMweRQEKp
X-Proofpoint-GUID: z-lzpOVJ1W21xMrBNln8vdRJMweRQEKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040047
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 11:57:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17758

T24gMDQvMTEvMjYgMTQ6MzEsIEhlZ2RlLCBZb2dlc2ggd3JvdGU6DQo+IEFkZCBkcm0tZnJhbWVi
dWZmZXIgYW5kIGRybS1pbmZvIHBhY2thZ2VzIHRoYXQgaGVscCBnZXQgbW9yZSBpbmZvIGFuZA0K
PiBkZWJ1ZyBEUk0gZGV2aWNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlvZ2VzaCBIZWdkZSA8
eS1oZWdkZUB0aS5jb20+DQoNClJldmlld2VkLWJ5OiBEZXZhcnNoIFRoYWtrYXIgPGRldmFyc2h0
QHRpLmNvbT4NCg0KUmVnYXJkcw0KRGV2YXJzaA0KDQo+IC0tLQ0KPiAgLi4uL3BhY2thZ2Vncm91
cHMvcGFja2FnZWdyb3VwLWFyYWdvLW11bHRpbWVkaWEuYmIgICAgICAgICAgfCA2ICsrKysrKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21l
dGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1h
cmFnby1tdWx0aW1lZGlhLmJiIGIvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL3BhY2th
Z2Vncm91cHMvcGFja2FnZWdyb3VwLWFyYWdvLW11bHRpbWVkaWEuYmINCj4gaW5kZXggMTk4YjNk
YWMuLjQ1NzYyNmRhIDEwMDY0NA0KPiAtLS0gYS9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNv
cmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtYXJhZ28tbXVsdGltZWRpYS5iYg0KPiArKysg
Yi9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3Jv
dXAtYXJhZ28tbXVsdGltZWRpYS5iYg0KPiBAQCAtNDcsMTAgKzQ3LDE2IEBAIFBJUEVXSVJFID0g
IiBcDQo+ICAgICAgd2lyZXBsdW1iZXItZGV2IFwNCj4gICINCj4gIA0KPiArRElTUExBWSA9ICIg
XA0KPiArICAgIGRybS1mcmFtZWJ1ZmZlciBcDQo+ICsgICAgZHJtLWluZm8gXA0KPiArICAgICIN
Cj4gKw0KPiAgUkRFUEVORFM6JHtQTn0gPSAiXA0KPiAgICAgICR7QVVESU99IFwNCj4gICAgICBw
YWNrYWdlZ3JvdXAtYXJhZ28tZ3N0IFwNCj4gICAgICAke01VTFRJTUVESUF9IFwNCj4gICAgICAk
e0BiYi51dGlscy5jb250YWlucygnTUFDSElORV9GRUFUVVJFUycsICdtbWlwJywgJyR7QUNDRUxf
TU19JywgJycsIGQpfSBcDQo+ICAgICAgJHtQSVBFV0lSRX0gXA0KPiArICAgICR7RElTUExBWX0g
XA0KPiAgIg0KDQo=
