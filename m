Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id B7F9552990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 14:07:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KE7Tb0022919
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 09:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505916449;
	bh=GuyLwilokDfhOom3/79n5lGlKkUEHiKFAUUVYpB2e+c=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=xTKWvADM+BP2Ic1jYjiv9e+xbbq2pqRFCebA0RPs7XMesXDB2JI9UzLuZjGwukTHY
	chhSpVy+zeBXKznyooAqKvU7g6jkh2tG3fXoAhr4VWKU85KwJGTh+oCOwL4X9MaeWo
	tAdlfi/0DuJL9sFSwjxpbcK8kScOcdknX/7xQcHw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KE7TmI017766
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 09:07:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 09:07:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 09:07:29 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KE7TrP026130;
	Wed, 20 Sep 2017 09:07:29 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505858148-5618-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <7b338537-9548-fd10-5b69-92ff59b968fa@ti.com>
Date: Wed, 20 Sep 2017 10:07:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505858148-5618-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH 1/2] uio-test-pruss: add support for k2g-evm
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
X-List-Received-Date: Wed, 20 Sep 2017 14:07:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please send the corresponding patch to meta-ti adding a note in the 
patch comments that "uio-test_pruss:   Update to new version 1.0.2.0" 
needs to be applied first.

And one comment below.

On 9/19/2017 5:55 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
> index 7297c8b..e6c92c9 100644
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
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g-evm"

Can you confirm that this is not compatible with the "k2g" family?

> +
> +DEVICE_NAME_append_k2g-evm = "k2g"


