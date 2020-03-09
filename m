Return-Path: <mkelly@xevo.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	by arago-project.org (Postfix) with ESMTPS id 8DA92529AD
	for <meta-arago@arago-project.org>;
	Mon,  9 Mar 2020 18:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=kZZcEADxk5B4sHuKght2uL+lMlzBHOj9LyU6VRHfVIIANAkAaPAg0GWn6pYBaqwjIkLb301le1pw5bg3l/yEXxxGIgksjoJ2L2U6Kg4lKYA7IQKtX8QWfdkyLdSvRns/YR8EwmyO9DMMnLUGHaeWzhiuC9q4pQgcWmN4AMa+ifO4Vy/8gLyJw6XJjR5wqzvY4tw7yDWbuRwIpZfXWqO5BCt4womTconoA1n3cPOkoLTC0IFYSH2CyI5Nl7xA+br0MjcQdPxAmdZIFFknmibzBYzfKl/CsWDYca1A76Z76hXMEkY87L1/u26u3X+VXPq5umqJTjvGOpcVZ5enanX3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CncQ0FBAiLblm9eX/da/1xFAvUX3rPd9omfCoPW4SnI=;
	b=b575ClLpA8jbcga+l1DP7HmA0yHq72oMtzhryM/K3lfQgDOGafMwsbrCMstufzjHe2DsRUYJbtd9cau8Z+GYzzg23VhQPOcLLfB5lV3ttP/RLaDulEZyqVHf8zb/6JY6yrm7voHg3Mf/BDV1pfMtVaaBbAHnQsxE/8lsPjmlAS+wYmWn+IAwkEGteTUKp6jaoZ6bVtBLtWpeRTlpqhAIXEWPwg/JRkQjIAYCT9RDGiXJqLasxqPCC9jfvi8LBkpvy8wo06Tu21FzgfpgwohSfUzcw+7Ykq8nASxe8GDnXewB0qz6S/YDzMCZp4Ejbudbh3mHNKMW/qc+LkmaR5gXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
	dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CncQ0FBAiLblm9eX/da/1xFAvUX3rPd9omfCoPW4SnI=;
	b=TUZTG+kOqxTYjeF8xXBO18V9QrSU7XhBYgnhd+aHDOyY5iYAdQelo9Gcyy27mwMW8wocTLlgY70UIg/dhT5ToSPk01B6SD17cPQxw3IkbfQBLSJ28CDJ/ZqAfELieFXD6UDA10y+ZXQqNaC/N6nICCHLNXHlzFZtvlOYJN5W64U=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
	by MW2PR18MB2170.namprd18.prod.outlook.com (2603:10b6:907:2::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17;
	Mon, 9 Mar 2020 18:10:47 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
	([fe80::492:f89:e20a:12b6]) by MW2PR18MB2236.namprd18.prod.outlook.com
	([fe80::492:f89:e20a:12b6%6]) with mapi id 15.20.2772.019;
	Mon, 9 Mar 2020 18:10:47 +0000
From: Martin Kelly <mkelly@xevo.com>
To: meta-ti@lists.yoctoproject.org
References: <efd6a31a-15ab-1f2d-9b74-e08b11662c02@xevo.com>
Message-ID: <0804812e-3894-8f7b-725e-e101e8ba8b94@xevo.com>
Date: Mon, 9 Mar 2020 11:10:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
In-Reply-To: <efd6a31a-15ab-1f2d-9b74-e08b11662c02@xevo.com>
X-ClientProxiedBy: BYAPR11CA0059.namprd11.prod.outlook.com
	(2603:10b6:a03:80::36) To MW2PR18MB2236.namprd18.prod.outlook.com
	(2603:10b6:907:7::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.254.27] (50.35.85.47) by
	BYAPR11CA0059.namprd11.prod.outlook.com (2603:10b6:a03:80::36)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16
	via Frontend Transport; Mon, 9 Mar 2020 18:10:46 +0000
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0588c4b0-906b-4efc-c6ab-08d7c455314d
X-MS-TrafficTypeDiagnostic: MW2PR18MB2170:
X-Microsoft-Antispam-PRVS: <MW2PR18MB2170C72C05865CCB5291BF57ABFE0@MW2PR18MB2170.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39830400003)(366004)(346002)(376002)(199004)(189003)(16526019)(186003)(26005)(956004)(2616005)(2906002)(16576012)(316002)(66556008)(66476007)(5660300002)(53546011)(478600001)(31686004)(52116002)(6916009)(31696002)(36756003)(4326008)(6486002)(81166006)(8676002)(66946007)(81156014)(8936002)(6666004)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR18MB2170;
	H:MW2PR18MB2236.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JX4JII8vJ9kfPUf6tfgZI26EcrujEfz90AxethRd1FhRF+pIox+T7ZF87/SthWuX4jvWFkl2AenR40n2k/x70MoRN2bTPYVSxffnLiP/GV9FTn6RexkGFJQzSJ71LJUONQBEyyneh0M0gfpBxa0EIT2chIinFXSzjCarMB5IvqG7uVbCq3iw+VU75jStk76U02JuUBH31koKQOjZAxeCKlXRCzIU53qOmqh40ziMIlN6dDSckgkD54fHa7DbvzgPqljaPPDgbjH6+U0G6QzDXfBhZc2+x2xMid8Cq/SjnfH7I8Y1/DKppmwOpYuABgOEqQW/Krm1G+V7h94yAAZ88wY/vr+WXNaN2scmrZESrwTykbgPIpqEwmr/l+xFa7eZbw9Xr2xNz9koGMNfpl2E1mMkWguT9hmumQrHoKUPtrgeWOcOySmWTVkRgQhpljE9
X-MS-Exchange-AntiSpam-MessageData: OD1D6wa8pjCGbtOOb9A/Gh7LHLkpMhJtCqjfk6expme/zLRPECFoxW0fVHMawlfJ9dT767bU7kVvlgH8Rqap5VYQECxUPpmDNWqvckU7C+WS+U5hTCGyGcdzWng4fDFn7UwpUFH/RPlLqeMcSczfjw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0588c4b0-906b-4efc-c6ab-08d7c455314d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2020 18:10:47.6618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YojL2fsGsm1VJJGJ48eaqC5KQyzvPKz5rkaEOZKzPE9MSw1LXphs2qIuhIXhNwDU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2170
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
X-List-Received-Date: Mon, 09 Mar 2020 18:12:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/6/20 11:16 AM, Martin Kelly wrote:
> Hi,
> 
> I'm trying to get a basic image running on the J7 EVM using only meta-ti 
> without meta-arago, as I want to use this board but don't need most of 
> the TI SDK support.
> 
> I'm using the j7-evm MACHINE type, and I get a successful build but no 
> u-boot output. In contrast, I get fine output with an SDK built with 
> meta-arago. If I copy the boot partition from the SDK, I can get u-boot 
> output.
> 
> I then noticed the following comment in k3.inc:
> 
> # Please note that booting K3 platform also requires
> # tiboot3.bin and sysfw.itb, which are provided by meta-arago
> # u-boot-k3-r5 and ti-sci-fw recipes
> IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
> WKS_FILE ?= "sdimage-bootpart.wks"
> do_image_wic[depends] += "u-boot:do_deploy"
> 
> Does this mean it's not actually possible to successfully boot a system 
> without pulling in meta-arago and all its many dependencies? Is there a 
> chance we could port these recipes into meta-ti, or will I always have 
> to use meta-arago?
> 
> Thanks,
> Martin

Adding meta-arago to the CC list.

