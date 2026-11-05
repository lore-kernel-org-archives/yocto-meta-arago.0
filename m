Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34629.1793886390305784979
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 05:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LMt3EniO;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=TDgpuXrf;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: devarsht@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5DiaAS1205981
	for <meta-arago@lists.yoctoproject.org>; Thu, 5 Nov 2026 07:46:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=b4vw6J1+cd7r6ms2O1RkaVKkNSib4hIFh1yCzJT0l
	d0=; b=LMt3EniOWKcMFR31SBtlWvrVR5TTnT502NhQnX+nhfC3RAawc4che0I3Z
	atAUAw5HVhjAhnBgdz4hrOvf/bLXR+TerMLzqp9bOaioBHwc6GQynruv7HUUHOET
	+QpssadMafLxjFIbsFjOeG5Xd8FgdLoeWRqXylRj4e3959PD3PUL/fvnOKpZvqCu
	CrTP/orgnyQpsHBtyzWTBtcCAhq2NfOVOFfJU+RuRX/dM9UQnj+BuL3AALEg8YXo
	VGk0I1NMvI5LqmyGJ0LvB2YZmQuXtTvx//CapYwPwjXXZq0+us49V6rljtWssytb
	rmpFNxNuLNpv6ZT2O17Axe7E9S3hg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hrqhus3hx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 07:46:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lA3JrOs5wnet8Cmwepem5ALVv957ZsgNpdgayAG0IhWBoGhPGjYO0B4rElUyHWrnJ0GzM6SuUjVYEWvLJfYBr3Rkev2PScthqDyCN3kPD2aulPZK7vXNBw9zRXJcitLAcC3LI0pe2MgRg+af7Z2ITN5LmWQk9X0JOMMVsthQEZjEPXd+RF+f8VWnAg2vnhFLJKePqSvL93gZL+Dope4o3LZeUgf9El/p8t2k8J3/fOnnHHeQgtVDdHyLQbs8mmI649yVH1i5wI5lE98SThbLEpMbIU/qmWO5daBv8F9sbGkVul/0kA7Ie9iLAGuvg5uzm4HbFuXeykR1S1hvQM1n2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4vw6J1+cd7r6ms2O1RkaVKkNSib4hIFh1yCzJT0ld0=;
 b=AkeMig58zjvgwOrlkzjYBgp7DBRqHnYDN2YoJuvBy1rWEtiV+vnT/5Mv8ei1iK9D+96p4oZfBTYztmXcne1HVZSAGLVkEGlEGy7pOzlMmgLDPncXUySFukM4jEI9BUSLPjK2ug7gvhF/kJZ/MZkOcRcYjYtUSL7zAtl/LhT3Bw/SvZBa+FOWrcNhjC+XjfqautCFwwXI9tfJV2kbuiOF2P4Gh3r3/sBJBpmSUPF7QQPlBmrtSafbgX/dpj3MMsUAQrLIuFViZoeZwx4JR7KiBeC1iN6RANQqH2L+TlsTGJ4Uy6Ttdp0lIHztdXAPDEXCuu1SZM1F4WKjpsAWee/T8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4vw6J1+cd7r6ms2O1RkaVKkNSib4hIFh1yCzJT0ld0=;
 b=TDgpuXrf95p6yinH7aT/SmJr2FWOxnhl/VAurqJ7RUWJn/+ca5vEb98sYQst9RwujYxUT/ha8tspsfbYYSCMBxJLKyYWUQZHONOprKjgolXGkZY+5rDuKHX1hycAPN4r8jgxQGYFcApkp3kl2OfG6CLYiU34HZctfsbDCUBLbzA=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by IA4PR10MB8754.namprd10.prod.outlook.com (2603:10b6:208:568::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 13:46:25 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 13:46:25 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Hegde, Yogesh" <y-hegde@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Veeramachaneni, Prudhvi"
	<prudhvi@ti.com>,
        "Sharma, Rahul" <r-sharma3@ti.com>
Subject: Re: [master/wrynose][PATCH v2] arago-image: remove splash for am62lx
 and am62px
Thread-Topic: [master/wrynose][PATCH v2] arago-image: remove splash for am62lx
 and am62px
Thread-Index: AQHdbO7f3hKmDgtUl06nyAECIO8aTLcffjmA
Date: Thu, 5 Nov 2026 13:46:25 +0000
Message-ID: <a6d2d731-cab5-4d34-91cf-7f1d58669282@ti.com>
References: <20261105062738.2899847-1-y-hegde@ti.com>
In-Reply-To: <20261105062738.2899847-1-y-hegde@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|IA4PR10MB8754:EE_
x-ms-office365-filtering-correlation-id: ed85990d-c1b9-4e7c-9569-08df3b432f6a
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|261021121427099003|261022075727099003|261022115727099003|261009223027099003|10067099003|22082099003|261102123227099003|18002099003;
x-microsoft-antispam-message-info: +OIRnHhcvSH7IGzhULEFfYOEGdA2wuj4Jsq0vOtHvovgIr3W598cjP8s6A2iPXBl/oaXFwzKyREZtlLmPzp4scL09t4DHsajNr65RXZHCDMUM0X/2Ap+tU+rfLjG1ScIMUvj5NAB/Bok7T4Zje84dEUejDryBreDXilKpu6WQHdK+8Yla+i00gcY/DXNpBXX381ruCTKqlBK05crNp0OhYs7cyx6dR1FCkM/Dbx1c+SGS7UzOyx0l8WGryBxVEyiD3e+Moa2lfRwDGeZAdPIzOszL8i/4mFzlygeXnzWJjTq1Fr3xAVtC2jTzRmGXWWhOwlpLJIS/e5Rq2h7uVdqYAs3rKUF9dlasQIseNSX2Jggahzu1kqTQTFiQc9CLeXpT6fmYJzHiwDkmg7fW4YrTrAqHKExYJiWPpgGD3bXoaRKlxuptM7PY9tONlAHuyEeJjNUtXrHFYn4LHUUNxUFnOxk8cmdi/WwQUs3V20eFIoFnOt3a0u94l0V2zAPYrL7B6S9HQE1ACtJP3F9Hkr79He8xxudrNxK8nI4tnVP/i26+aNTcADrf9rwA242ExRTGMTnKrwWh0r/C+mu2I1LQUOhxxZCT2ecGalNMrxnHBbFJ9VxuzspCoWdgupG4s6HcupoZT5zbq0af/D54WwgjvTixDl2agvLDD7tPOFtCNw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(10067099003)(22082099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eE41M0pqa0RrazBtSGpPb0JzeC9Mb0hBbkVWazBJUW8zNkdlckxYdGlnbVJI?=
 =?utf-8?B?aDJET29BWndjLzhkcE1tSEgzdnkzN3pCWEZBVVdJZjlTREs2Q0h6NlBpTkZ5?=
 =?utf-8?B?RUNBRUZ5a2ZSb0pjaVdHUFdLeHNOUWhEaGtBeHVJR3F2ZTlyc3Frd1VQVmlO?=
 =?utf-8?B?REN3b0xmVTZudGpnQjBtVFNZVzFMelpjUHNrcjVzVi9lWFo5aUUzOWFYN1BH?=
 =?utf-8?B?KzNadlRQU0RhempQTmNXVmxTWldBS1U3RVA4dGc1VTNFaDJhWmN0MEU0Ynhq?=
 =?utf-8?B?RnF0d295d2lPT1kzaGZKUUxBakd5enpxOE9CMGVEbzJnWC9EMUxuWDhKam56?=
 =?utf-8?B?eTJHdXdlY2o0ZUowenBzNFAyd204WVdFN1pqZ3QrNGdBZkRoNDZFR1JVMUI5?=
 =?utf-8?B?eXFadmNzYVpPT1puK2RLVXRSdWVYdnNZZzJJYVNwVWJhTGJZWmxzUjVvOUtP?=
 =?utf-8?B?MTdxRW5leDJSZEhnQ3NSRHFGQkN3WFhQWTRhOXhpOGxSQkREb1orVVlKdmIw?=
 =?utf-8?B?Q094cmhJeXNwMG16alNGMEJmbVRONVpKdG01OGRKNWMrbVJJbXJJUk43VElU?=
 =?utf-8?B?WkhVSHowclhBa3lNQy9qazd6Rk00WjR6bldtQlZIRnFSbHJZTEdVSEI4TTA1?=
 =?utf-8?B?RjVVMDUrbGpSdVBtcjlIY2dJNVd6aWltTHZHTTNGVm5ZdFY0dWw0cS9iL0RS?=
 =?utf-8?B?Y003dXNZc1RSZTh2UisyOFhRTnFPUXE5dTNzR2V3dnJqK0dCbWdvNnBxanMx?=
 =?utf-8?B?UjBvSmxUMW94U0RwOGNybUZ1bit4ajFic3hiMXNRemZyL0ZaQ3JCRGVBMXBR?=
 =?utf-8?B?RFNNdEJrTVVyVzU0SWVjZFR5d2RBeTg2YlpZQWdOVU5IVnhwNXFEZzRqNjRk?=
 =?utf-8?B?REUweGpXaDA0c1FiYWZFWVRudWNkY0I2VGdROThiWVFqbi84Rnd0VEt3SWFv?=
 =?utf-8?B?cUJqbmRNZ0pDVjRNK2ZSdVpQVEtqVWxjdzJLUzVaTTlNT1U4VVB3QmJwNk9B?=
 =?utf-8?B?T2h4L0RJNHk2OGh6azdGVzJSUXZNS3dWNzBLT2xjazI2Y0pRZ3Y4N0w1OXJ6?=
 =?utf-8?B?NmNMUDZ3dm1NZmQvdXpYNGFqQkJYS3FMdEM2ZExsYnpyMGpSRUt3L1lzM2pa?=
 =?utf-8?B?d09hZ2NTSDlNYkg1bHRuWlFCTmZpdEliZDJRbGNMdnZITHF1UUx1TGZpVGRN?=
 =?utf-8?B?UUxpL0xkSmZSSjV1YnBYZmJabUZPcHpGeWVTTTExNkNaaVF4d3dzTW9RbUdC?=
 =?utf-8?B?dFJxNFBaUXM0SWNTZG93aVRLOHhlWmxhZ1BTNlJaV0h3VjN6WEpmdVNDRXNj?=
 =?utf-8?B?U3N6aFFaeHJ0ak5ENXdDOHZnMXY4MHBkV1EvQ2lmMmlNSCtXV3VLbFV4NzBm?=
 =?utf-8?B?RnBTNmE5TXNjMjlxYnVnNVpuRmMxVjJzOW9XdVpBWVdpQTJxUVNDZkpoS1BP?=
 =?utf-8?B?SUI3eFZST2N1ZG5HT0VLejNMbVpOdGpVK1NQZDBpVS9vOW1CZGo0Wnk0dTJI?=
 =?utf-8?B?cVl3ekhnL0k1eUlRaVg1RnY3T2RJOWdIWUV1RDh1MVozMnlNWGdSSlZUdXQy?=
 =?utf-8?B?T0RTTUZqR29JNll1eml6VDZQUDJqYjVpWU5CY3AzQW9zRklsTmtvNko0NUFM?=
 =?utf-8?B?UDUrdmsyL01hY1NPcXR6MDAwd3dpa2NmVWg1bTZodXd4eFBWYU42MkR6Vjha?=
 =?utf-8?B?ajdzSE05YzgxZHBkMGFJMDBPVG0zR2g5WTdhdXpHN3hXOWFQRTErZ3QwczFY?=
 =?utf-8?B?ZkNObkhtUGlmY29Ka09LQWk0c3RmbHBCVVRhQUVrRk1xcnRaMDg4NXluYWQw?=
 =?utf-8?B?R04vTFEzWTJvUEltWk9FcHBOSExTWmFDNUZSaW5qc28zK2R2ZDlKckZZdkRJ?=
 =?utf-8?B?a2dzdUprRldCSFFCa2hNMUM2L0FMRFNadFlBVHFGbWxWbEJNcXhhMGh2azBw?=
 =?utf-8?B?aWJITktUN1VkZHNnT1hDbmY3Y2htY3hSV3FFRWRsYkZzU3hTSDNaY1A0NUlJ?=
 =?utf-8?B?QW9UMlF4VExUYkhTMHdzMU9HZm95QUZwOHNDTkJiWGR3V3BmSFFHS0VzdUZm?=
 =?utf-8?B?Y1NZMDZRWVNteHp3ZThIaEpDYTdFeFJPRWg0ZjZHaUNJT2M4S1BMQktsVkJQ?=
 =?utf-8?B?bi9TUzVzbm1nazdmVXpNWWhWRTNrNitIUW1rczNXRmxab29iQmxvVW5lekpo?=
 =?utf-8?B?enJ4YUFvOHh0VHREcWNpdEpaelhzZjRIS1ZUTDlaK1RiSGxhWmlFc2Jqb1Nx?=
 =?utf-8?B?UDJVS29NZFF3eW40YVNydW1ZWVo4VWtIU2ZvYldZVHc1N2lWcVJuNFo4eHdN?=
 =?utf-8?Q?LIr58u4QmjVH70sZum?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45EA573D68ED09458DDA01B2BE750205@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BfCK2+n3IpCGErqI+ly/BSiWYzw7AhKjHWNpb+bI01lAnwF+gL6TN+ri56SXcgf7X4CkXaoBNNVNZiUP7Crs6KWxtS46NyTjInn85c9GdfUeP2sr1O9Anl4cgYAtdKSCGfNy8+6SlKifCWi+2xCDkUdtt2nwDBCypuMRkeRmqFIzvXnNJZLgxiSvunCn5t+fePnwLsBG7ybT0XgKdaJ/yURPmWcWmjvPR/S7uboKOgKdM6oLotTNonZNE1ZkWs5x79AiKiAs2FXIGB91FBixP5E/VxzXQmKjoG3hxXRKPQ+G1KSKovRugIMwhJbhCjUAqWkzgxn+g5v299zUL9i56Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed85990d-c1b9-4e7c-9569-08df3b432f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 13:46:25.3660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yUzAsSaYCdCNQPo9tfqoQZiQbIPRHgZz7NzDqPtQWZNkPZqfUUf/DwPf7axXU/QO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8754
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX3mCo2TuoWSUo
 0vidKxEGkY/KENgKulXYVKGU5jjHRjVbdyDLU14/3aURox8Mr/ElfF5rDBbb/NXbJWnqb5OPuap
 81ToQYx74XPB8md8uL+dggScdU1A4fs=
X-Proofpoint-GUID: mDSAJn0kr25qzeJ_0NzLPH4hfUbWdB97
X-Proofpoint-ORIG-GUID: mDSAJn0kr25qzeJ_0NzLPH4hfUbWdB97
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aec88b4 cx=c_pps
 a=Et1EcG/LeKhR1br1BBFfMA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=V-3-DJPbY5E0sUyeuzIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX2qEXl2qvkLya
 fgC4M+iOticy/xy1OuB145lTUHLH14LKY/jh/buqno18HG/GonnsVDi8H3QUROKkVJRiCUTZp+j
 2T+rBNA5tUYAVxXVfXuKWqNbKxvAN6q7BYY7UdVBdS8C1EBBySRFmGI8hDZhQQ7x55HwpqAkJDG
 PB0L2wppWRpsuA4aOZ01XHLrvIRU44nAjRI83eTkp+gNlme6ebwTSXPgm+/jRa8sdVbBBcjqnOA
 NCSImLu04zQn56iQykCHROZtx8bUgQOAYEMxkv6GDqcJjO7K8P4t4oJ3HRxinO+yIPn7DnJpI91
 BTe36UzECPA/RONEF3573i6w3N8bbaz5SXjaq+OMEu41RtSE/dy+3wK9tCWQvnnnOQm3mdXHvNV
 z3zef1Kb2tp7nT7jH4IGbs6E/12rhl0yQQDAC741SWtfLWujVm5r/+kC9HuPRDWZC0f1JuT7p+L
 F52q3fNLrstelKHRtZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 13:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17761

T24gMDUvMTEvMjYgMTE6NTcsIEhlZ2RlLCBZb2dlc2ggd3JvdGU6DQo+IFBzcGxhc2ggY2F1c2Vz
IGEgbGludXgga2VybmVsIGNyYXNoWzBdIG9uIGFtNjJseHggYW5kIGFtNjJweHggd2hlbg0KPiB1
LWJvb3Qgc3BsYXNoIHNjcmVlbiBpcyBlbmFibGVkIGR1ZSB0byBjaGFuZ2VzIHRvIHUtYm9vdFsx
XS4gcHNwbGFzaA0KPiBmaXJzdCBsYXRjaGVzIG9uIHRvIC9kZXYvZmIwIChzaW1wbGVmYiBkcml2
ZXIpIGxhdGVyIHdoZW4gdGhlIGxpbnV4IGRybQ0KPiBkcml2ZXIgY29tZXMgdXAgaXQgcmUtY3Jl
YXRlcyAvZGV2L2ZiMCAodGlkc3Nkcm1mYikgY2F1c2luZyB0aGUgcHNwbGFzaA0KPiB0byBjcmFz
aC4NCj4gUGF0Y2ggZGlzYWJsZXMgdGhlIHNwbGFzaCBzY3JlZW4gdG8gYXZvaWQga2VybmVsIGNy
YXNoLg0KPiANCj4gMDogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20veW9nZXNoaGVnZGUvMzkxOGY2
ODI2YTFlZDU2ODk3NTY2YzM0ZmQ3NzE4ZDENCj4gMTogaHR0cHM6Ly9naXQudGkuY29tL2NnaXQv
dGktdS1ib290L3RpLXUtYm9vdC9jb21taXQvP2g9dGktdS1ib290LTIwMjYuMDEtbmV4dCZpZD0w
MmZiZDUwOWE4NjgxNDJlMDQwMDUyMjFhMWY0ODM4ZTcwMzBhMGI0DQo+IFNpZ25lZC1vZmYtYnk6
IFlvZ2VzaCBIZWdkZSA8eS1oZWdkZUB0aS5jb20+DQoNClJldmlld2VkLWJ5OiBEZXZhcnNoIFRo
YWtrYXIgPGRldmFyc2h0QHRpLmNvbT4NCg0KUmVnYXJkcw0KRGV2YXJzaA0KPiAtLS0NCj4gIG1l
dGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9pbWFnZXMvYXJhZ28taW1hZ2UuaW5jIHwgNSAr
KysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9pbWFnZXMvYXJhZ28taW1hZ2UuaW5j
IGIvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL2ltYWdlcy9hcmFnby1pbWFnZS5pbmMN
Cj4gaW5kZXggZTY3MzlkMmMuLjM5MWNhY2RhIDEwMDY0NA0KPiAtLS0gYS9tZXRhLWFyYWdvLWRp
c3Ryby9yZWNpcGVzLWNvcmUvaW1hZ2VzL2FyYWdvLWltYWdlLmluYw0KPiArKysgYi9tZXRhLWFy
YWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvaW1hZ2VzL2FyYWdvLWltYWdlLmluYw0KPiBAQCAtMjMs
MyArMjMsOCBAQCBCQURfUkVDT01NRU5EQVRJT05TICs9ICIgXA0KPiAgQkFEX1JFQ09NTUVOREFU
SU9OUyArPSAiJHtAb2UudXRpbHMuY29uZGl0aW9uYWwoIklOSVRfTUFOQUdFUiIsICJzeXN2aW5p
dCIsICIiLCAiYnVzeWJveC1zeXNsb2ciLCBkKX0iDQo+ICANCj4gIGluaGVyaXQgY29yZS1pbWFn
ZQ0KPiArDQo+ICsjIERpc2FibGUgdGhlIGJvb3Qgc3BsYXNoIHNjcmVlbiBvbiBBTTYyeCwgQU02
Mkx4IGFuZCBBTTYyUHggZmFtaWx5IGRldmljZXMNCj4gK0lNQUdFX0ZFQVRVUkVTOnJlbW92ZTph
bTYybHh4ID0gInNwbGFzaCINCj4gK0lNQUdFX0ZFQVRVUkVTOnJlbW92ZTphbTYycHh4ID0gInNw
bGFzaCINCj4gK0lNQUdFX0ZFQVRVUkVTOnJlbW92ZTphbTYyeHggPSAic3BsYXNoIg0KDQo=
