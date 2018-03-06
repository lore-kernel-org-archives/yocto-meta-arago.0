Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4C1D052975
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 13:29:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26DSTMY031014
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 07:28:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520342909;
	bh=WP3jtost165ZDeXAKkw86+5IsDBmmg4tpBueLKRRIHw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=NDYbuCT4MmJwNgjrLPM4+4gbZVvYfumitUy2Vd0L0pximAfVfnI1+8+aahKHCtP28
	PjBsk0m2YxwkrBAdtIwxm1WfhxP5ai02u0ERM5yyHfREuyijtHEMCn/Wd0g2YlOw0d
	yPMxIfQP5dcGppjp4ljYfW+VhMcMkmAV4ZgsfHtk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26DSTbD001554
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 07:28:29 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 07:28:29 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 07:28:29 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26DSTxn011954
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 07:28:29 -0600
To: <meta-arago@arago-project.org>
References: <1519932329-26946-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <356933e6-5334-3661-bb5f-2f892fcb13a7@ti.com>
Date: Tue, 6 Mar 2018 08:28:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519932329-26946-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [morty/rocko/master][PATCH v2 1/2] ti-llvm3.6: add dependency on groff-native
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
X-List-Received-Date: Tue, 06 Mar 2018 13:29:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I see that this was accepted into rocko/master, but can this also be 
accepted into morty?


On 3/1/2018 2:25 PM, Jacob Stiffler wrote:
> * groff is used to generate documentaion during the install task
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> * No change for this patch, but an additional patch is added to the set.
>
>   meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> index 4f36310..91d3cea 100644
> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> @@ -17,7 +17,7 @@ require recipes-core/llvm/llvm.inc
>   
>   LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
>   
> -DEPENDS += "libxml2"
> +DEPENDS += "libxml2 groff-native"
>   DEPENDS_append_class-target = " valgrind"
>   
>   LLVM_DIR = "ti-llvm${PV}"


