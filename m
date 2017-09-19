Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 28D0952A14
	for <meta-arago@arago-project.org>;
	Tue, 19 Sep 2017 19:01:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JJ1x4K003652
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 14:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505847719;
	bh=zdq3Zha7gDuAvNDkixGGsBSWiiyWPyCTgoOGJjcGuzc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=aphSqpYczI5D3kkaZ021F3a2xQlCNIA+AykLioyhAqln2ZB1ta/fwYLzVQ4wt96Hy
	FmBDRBYKWt0DLnQsKrTR4AYB2cZVOESAKuBGmQmoMlTum9Lfkrft5M/hYoLAQOFMtp
	Z78uFU89waI3SrQuj2dqT40MeMxqxAMl9KjfgC3I=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JJ1wKX011331
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 14:01:58 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 14:01:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 14:01:58 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JJ1wLO014904;
	Tue, 19 Sep 2017 14:01:58 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-arago@arago-project.org>
References: <1505842727-12297-1-git-send-email-sam.nelson@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <3b7da686-86d5-13f1-a6df-30466716bd12@ti.com>
Date: Tue, 19 Sep 2017 15:01:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505842727-12297-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] uio-test-pruss: Update to new version 1.0.2.0
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
X-List-Received-Date: Tue, 19 Sep 2017 19:01:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Thank you.


On 9/19/2017 1:38 PM, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>
> ---
> Patch also sent to meta-ti
> Will also be needed here for processor sdk release
> ---
> ---
>   recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 6 ++++++
>   1 file changed, 6 insertions(+)
>   create mode 100644 recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
>
> diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> new file mode 100644
> index 0000000..7297c8b
> --- /dev/null
> +++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> @@ -0,0 +1,6 @@
> +PR_append = ".tisdk0"
> +
> +PV = "1.0.2.0"
> +
> +# Corresponds to version 01.00.02.00
> +UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"


