Return-Path: <mkelly@xevo.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	by arago-project.org (Postfix) with ESMTPS id C2148529A5
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2020 18:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=YeJsqT49wk5NJ0WzHhqEIyn48krsHsrFXbFSJSmXi1Ojk7LHy4zdekko+vB8ZIG5ZHmka2l9d6pWekZRR4XUmjZIIpR4S0vb1L89aYpxV4vQpl68UIJpUM1d0dUruxT/wgwxtEQ3VRmLE8r5C2Qu4tRLl8wYVBfu+k5vOtqv3X1AearIx4nAmIAokmY/nCECo7L6uxtZQ284skr+QygssRJJXHtiC+DXJ+uWkQldKVUMVzJ8K5DXFfnBLiHbMKDNTh/qAgAxLYNj4Tyxc9dvhOnAMkfBmv6n7rfrNui6HoVh2ukaearkFZEHd87tloJ4nymg8P574bc9CXHlW32HbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vuFUpIFJ4UvbMaFv65U5c4dUozc5eOzrMg2wZrgheg8=;
	b=TOKEe4dSWLlZuBwUn7VhqYXhQSmNDDQlrwDlHQFKvnU2CYxRb1QoAEeNULwEH9UCykzR67doSlpYMszvW5oLpyuQBghPd/t/NP6z92UwUjL7/pSbUz1dg78BHBdPV/W0q8vMyisUoKsYu4M4GStczN/XPRtN+VF3ZK+/+YvWp2ExbIpg5BGOQJk8SyEhmRu39GHja+0tFYwqE7W/6qA5dSMxWrLe0Q8G8W2Ix0Urfk6MNkx9qcYefd3iw2p5bZIHjNLGLR40rMbulND14ojyV9yS6Wn90naLx7dj7NUdJqXG2iAiYt/YCX01/XshtnHNhow39MOgc5Bqj78awDiOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
	dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vuFUpIFJ4UvbMaFv65U5c4dUozc5eOzrMg2wZrgheg8=;
	b=jetFEXRogTyBDh/FDi5BH8OmAcgwAm4wlB/pjYfNJPyhwV0DTDGnCTy4WBHrOGb3i4Iu7BCCN5V7M/fw8IA4/bwrgthsBByltx7MrWqytElZtt4/pabCFpC+wtQDlOOnFTLC8NcDdHj6e8fParNDMgvNNtvmBJ80b75FF25+INg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
	by MW2PR18MB2137.namprd18.prod.outlook.com (2603:10b6:907:5::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17;
	Fri, 13 Mar 2020 18:54:57 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
	([fe80::e1fb:58c9:4324:cbe0]) by
	MW2PR18MB2236.namprd18.prod.outlook.com
	([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2814.018;
	Fri, 13 Mar 2020 18:54:57 +0000
From: Martin Kelly <mkelly@xevo.com>
To: meta-ti@lists.yoctoproject.org
References: <efd6a31a-15ab-1f2d-9b74-e08b11662c02@xevo.com>
	<0804812e-3894-8f7b-725e-e101e8ba8b94@xevo.com>
Message-ID: <106e3296-fd8a-f18c-8b83-07557400d429@xevo.com>
Date: Fri, 13 Mar 2020 11:54:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
In-Reply-To: <0804812e-3894-8f7b-725e-e101e8ba8b94@xevo.com>
X-ClientProxiedBy: MW2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:907::26)
	To MW2PR18MB2236.namprd18.prod.outlook.com
	(2603:10b6:907:7::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.252.60] (4.14.243.50) by
	MW2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:907::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15
	via Frontend Transport; Fri, 13 Mar 2020 18:54:56 +0000
X-Originating-IP: [4.14.243.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 137192cc-72df-48ff-e21f-08d7c78005dd
X-MS-TrafficTypeDiagnostic: MW2PR18MB2137:
X-Microsoft-Antispam-PRVS: <MW2PR18MB213793BB4295A8DCEDBA30A3ABFA0@MW2PR18MB2137.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(376002)(366004)(39840400004)(346002)(199004)(478600001)(6916009)(31686004)(81156014)(6486002)(5660300002)(8936002)(4326008)(8676002)(81166006)(6666004)(956004)(2906002)(66556008)(36756003)(66946007)(2616005)(86362001)(31696002)(16526019)(316002)(66476007)(186003)(53546011)(52116002)(16576012)(26005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR18MB2137;
	H:MW2PR18MB2236.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdyQRcm/hRQq6Li360C1wmGhJeIzHt3QVS0p3ot2Ry+oDsH4n7a8q6xbvXMLrPwHNf1lxEOUMozUl6xW1JmHuEz9arIKfzdvLz4XTRBxHVMHMw8aph3L2d2WQ8AnRQfuEmBVpUpSGX7NQOZdPemODDQG2w6zRzg4lHGkqbkcpNMfZRaj2qmJzw0lgHC9d0WPK74uT5s1i244m4iehYq2VfB9ChtFcuHXLdnsofqG4vtirjnvdWD12B7mG7XIHsJ/zq6lsdCEYhFzx8go/hPROl6yKKpUfSTkPTTH173IlEvXp96YOLPBRkjAkoZUuHiBia9xllQxfhtoPNJcMebrJbvmvFgpozSzNGKAE7UGE82dF6W2b24WUPHoF5fnPsjzZ4dG5NITu+6zc9BdVck5+OQh8G4g4gq8zFC9FQ5iNM2KCEvsRVTratP9pMRXoDk3
X-MS-Exchange-AntiSpam-MessageData: iDf9u1eo7LPvuPZ6POqrDpQ1lI2yf/l3mFtv1q6Dnkktt6LwYX2kgUNBLJQn5dRqcw2GJZ3Zqxy2wSMaTHaVN/QET10Nsb/1j3g+qYqqcYSZ+YLJBq0jHJmcIsBx/3Um42bsTmN8znm75CFsvmVFaw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137192cc-72df-48ff-e21f-08d7c78005dd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 18:54:56.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPHk8AIuyreIe17FtqDsv1s0v0+uzXusDV+Vu3syjrSf7OIKRphV/Alcmq5UqBC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2137
Cc: meta-arago@arago-project.org
Subject: Re: Booting a J7 EVM without meta-arago
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2020 18:57:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/9/20 11:10 AM, Martin Kelly wrote:
> On 3/6/20 11:16 AM, Martin Kelly wrote:
>> Hi,
>>
>> I'm trying to get a basic image running on the J7 EVM using only 
>> meta-ti without meta-arago, as I want to use this board but don't need 
>> most of the TI SDK support.
>>
>> I'm using the j7-evm MACHINE type, and I get a successful build but no 
>> u-boot output. In contrast, I get fine output with an SDK built with 
>> meta-arago. If I copy the boot partition from the SDK, I can get 
>> u-boot output.
>>
>> I then noticed the following comment in k3.inc:
>>
>> # Please note that booting K3 platform also requires
>> # tiboot3.bin and sysfw.itb, which are provided by meta-arago
>> # u-boot-k3-r5 and ti-sci-fw recipes
>> IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
>> WKS_FILE ?= "sdimage-bootpart.wks"
>> do_image_wic[depends] += "u-boot:do_deploy"
>>
>> Does this mean it's not actually possible to successfully boot a 
>> system without pulling in meta-arago and all its many dependencies? Is 
>> there a chance we could port these recipes into meta-ti, or will I 
>> always have to use meta-arago?
>>
>> Thanks,
>> Martin
> 
> Adding meta-arago to the CC list.

(ping)

