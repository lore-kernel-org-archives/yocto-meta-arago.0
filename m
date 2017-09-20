Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 12A8752961
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 15:25:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KFPHja023895
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505921117;
	bh=VP9ndUde5GoJ1J3qHA1FMh1FwFTxxSkc94nDaHxGv9U=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=cc7/9xmqXtaHbozXS9zVZxiHwzSwhbrW2RfXep1az+p/DQpdJIwafb2KOztST4HOE
	4aSoMCO5IPXWry0RBo1D7pgOHKQwfTVSw5BRLzWaxo3bdHoCbIUP2/CD4e4pSgTPhP
	lo5QVWCl0ZQUNU4PQVo+5gY/KNT5sXaXmpzp4K0g=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFPCpN003000
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:25:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 10:25:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 10:25:12 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFPCHQ013655;
	Wed, 20 Sep 2017 10:25:12 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505919619-9053-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <505e54e4-9bc1-ed00-f482-8837f4a4d481@ti.com>
Date: Wed, 20 Sep 2017 11:25:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505919619-9053-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH 1/2 v2] uio-test-pruss: add support for k2g
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
X-List-Received-Date: Wed, 20 Sep 2017 15:25:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/20/2017 11:00 AM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
> v2 change: update compatible machine to include the k2g family
>
>   recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> index 7297c8b..9611b56 100644
> --- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> +++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> @@ -1,6 +1,10 @@
> -PR_append = ".tisdk0"
> +PR_append = ".tisdk1"
>   
>   PV = "1.0.2.0"
>   
>   # Corresponds to version 01.00.02.00
>   UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> +
> +DEVICE_NAME_append_k2g-evm = "k2g"
Should DEVICE_NAME also be extended to the k2g family?


