Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 89A4A529CC
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 12:55:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85CtmPp024535
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 07:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504616148;
	bh=uAvyMGrBqn4po9GB4jH/XnkiNUA+XhJsVMEj+Vqhqm8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=q7VI7Sb79L0eSTMswchBs/zWFT2qD0Pj0ESf3I8VccjNiH8h5Xs0niwlRjOmZAC0+
	YXIUIPoxW7E3LmH0mK4Z3rz3N1crBgyo5tfNvHUHWLLAnjDtECH30SrXJc6boSNaLi
	d1D4qZPG5zK0qI9ZvdDUQ2Ay3HCGlmIHqRbKmyKM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85Ctm2V015544
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 07:55:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 07:55:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 07:55:48 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85Ctlc0006080;
	Tue, 5 Sep 2017 07:55:48 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
	<20170901211741.26451-7-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8ee66a9b-5138-5ef6-ff72-701bf0f63d78@ti.com>
Date: Tue, 5 Sep 2017 08:55:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170901211741.26451-7-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v3 7/7] tisdk-rootfs-image: add evse-hmi packagegroup
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
X-List-Received-Date: Tue, 05 Sep 2017 12:55:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This does not parse.


On 9/1/2017 5:17 PM, Manisha Agrawal wrote:
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   recipes-core/images/tisdk-rootfs-image.bbappend | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-core/images/tisdk-rootfs-image.bbappend b/recipes-core/images/tisdk-rootfs-image.bbappend
> index d4b08cc..e97ce61 100644
> --- a/recipes-core/images/tisdk-rootfs-image.bbappend
> +++ b/recipes-core/images/tisdk-rootfs-image.bbappend
> @@ -1,4 +1,15 @@
>   PR_append = ".tisdk4"
>   
> -IMAGE_INSTALL_append_ti43x = " packagegroup-arago-tisdk-graphics"
> -IMAGE_INSTALL_append_ti33x = " packagegroup-arago-tisdk-graphics"
> +IMAGE_INSTALL_append_ti43x = "
Need to line continutation indicator "\"
> +	packagegroup-arago-tisdk-graphics \
> +        packagegroup-arago-tisdk-hmi \
> +"
> +IMAGE_INSTALL_append_ti33x = "
Need to line continutation indicator "\"
> +  	packagegroup-arago-tisdk-graphics \
> +        packagegroup-arago-tisdk-hmi \
> +"
> +
> +
> +IMAGE_INSTALL_append_omap-a15 = "
Need to line continutation indicator "\"
> +  	packagegroup-arago-tisdk-hmi \
> +"


