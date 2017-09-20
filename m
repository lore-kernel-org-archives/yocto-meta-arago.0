Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id EECE852A3E
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 18:06:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KI6VO2031905
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505930791;
	bh=nybP9yQFG75neAqZT+0M175Zm9BZddlksZnxto7JdXI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=CIYxBE8zHzrpaCOaVLnZ2TFEXV9rQoTSlTxzlp8QPqc8EvkbsnwMtuh0bUhfoh1ws
	esNoVNZfV4HHZez2B87WQGUEXyTff9ZA5242bFSRvUuIYTF4gU8Rr5eZ8VQfvQWPcz
	ddUWhTwhl2+0gWl1KAOkbptbOLnU8e+g0Dks5zac=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI6ViP028224
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:06:31 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 13:06:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 13:06:31 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI6Urk013532;
	Wed, 20 Sep 2017 13:06:31 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505858148-5618-1-git-send-email-a0271529@ti.com>
	<1505858148-5618-2-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c14d5f16-5cae-4085-d8e8-3f949e15dd74@ti.com>
Date: Wed, 20 Sep 2017 14:06:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505858148-5618-2-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH 2/2] uio-module-drv-test: include pruss_uio_test for k2g-evm
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
X-List-Received-Date: Wed, 20 Sep 2017 18:06:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Please follow up by upstreaming to meta-ti.


On 9/19/2017 5:55 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
> index 15fbc54..5f02601 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
> @@ -1,6 +1,12 @@
> -PR_append = ".tisdk0"
> +PR_append = ".tisdk1"
>   
>   # This corresponds to version 02.02.01.00
>   UIO_MODULE_DRV_SRCREV = "bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
>   
>   PV = "2.2.1.0+git${SRCPV}"
> +
> +DEVICE_NAME_k2g-evm = "k2g"
> +
> +do_install_append_k2g-evm () {
> +        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
> +}


