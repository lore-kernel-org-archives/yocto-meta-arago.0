Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 318F352986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 17:42:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GHf7F2016694
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 12:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521222067;
	bh=gZ5awFoGV5ON8bBiI3n9v4i/0gUkZ0VKTB60xUHkTi8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=DNxsU+ocOuPRxlCsakyHVK3hD7SLuktFzLbt/6CN5rErGhTnqYyv8fLV5YYr0sblF
	u+DmDd/0HqOLE56h97vOgrGMmsoGrJ8XXE2Bifzuq5kHvDNs2iJqelySvLDpjPPXN1
	CWxUQW3xlACjfdocw9+0Y1VDBOafv45LuBp4uW3c=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GHf78u009534
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 12:41:07 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 12:41:07 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 12:41:07 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GHf6qs008726;
	Fri, 16 Mar 2018 12:41:06 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1521216600-27274-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <5e70bb10-0c24-326f-6d0b-df7781121bec@ti.com>
Date: Fri, 16 Mar 2018 13:41:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521216600-27274-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Udpating to the latest version
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
X-List-Received-Date: Fri, 16 Mar 2018 17:42:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This also fails.

| "src/v2/I2C_v2.c", line 686: error #225: function 
"PRUICSS_pruInitMemory" declared implicitly
| "src/v2/I2C_v2.c", line 714: error #20: identifier 
"PRU_ICSS_REVISION_MAJOR_MASK" is undefined
| "src/v2/I2C_v2.c", line 715: error #20: identifier 
"PRU_ICSS_REVISION_MINOR_MASK" is undefined
| "src/v2/I2C_v2.c", line 837: error #225: function 
"PRUICSS_pruInitMemory" declared implicitly
| 4 errors detected in the compilation of "src/v2/I2C_v2.c".
|
| >> Compilation failure



On 3/16/2018 12:10 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
> index 67305b2..75258e9 100644
> --- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
> +++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
> @@ -6,7 +6,7 @@ DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
>   "
>   LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c"
>   
> -I2C_LLD_SRCREV = "137c6c60d18a14629f1a7572fd87402716bd5104"
> +I2C_LLD_SRCREV = "631a38ad7245b68bfac40a417bdc9d3a0b7ca724"
>   
>   PV = "01.00.00.10"
>   


