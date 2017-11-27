Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8093B52A52
	for <meta-arago@arago-project.org>;
	Mon, 27 Nov 2017 17:27:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vARHRXDU006896
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 11:27:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511803653;
	bh=wHFO6e0Y1ma7OZsZ9262Ar799tXw13oE2bn2ajlnHfg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=n2E1GxF5So32fq5AtZ9dL5zKLFGnVVgzep/rB6sf9J09+GgD0AFz3YGAXLTkJmV8x
	Yf1w7yMKCw+UGDHGGoyct2AJmAX84t7nr1UKyLhDSa27pa86ztS6ySupWisdmd0lTL
	BSus+yxWNb5bGmt03Cl3501d+YBtRhtK+U4GjQlY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARHRXsQ022684
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 11:27:33 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 27 Nov 2017 11:27:33 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 27 Nov 2017 11:27:33 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARHRWqY003172;
	Mon, 27 Nov 2017 11:27:32 -0600
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1511799289-21996-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2ce58da5-8066-d780-9c77-5c5aa103297f@ti.com>
Date: Mon, 27 Nov 2017 12:27:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511799289-21996-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] packagegroup-arago-tisdk-matrix: add audiocapture demo for AM4 and AM5
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
X-List-Received-Date: Mon, 27 Nov 2017 17:27:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Thank you.


On 11/27/2017 11:14 AM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-matrix.bbappend         | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
> index 99bf97e..524aea3 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-tisdk53"
> +PR_append = "-tisdk54"
>   
>   MATRIX_SGX_DEMOS_remove_omap-a15 = " \
>       matrix-3d-demo-kmscubevideo \
> @@ -11,6 +11,11 @@ MATRIX_COMMON_APPS_remove = " \
>   MATRIX_APPS_append_omap-a15 = " \
>       matrix-gui-apps-dual-camera \
>       matrix-gui-apps-image-gallery \
> +    matrix-multimedia-demo-audiocapture \
> +"
> +
> +MATRIX_APPS_append_ti43x = " \
> +    matrix-multimedia-demo-audiocapture \
>   "
>   
>   MATRIX_TOUCH_APPS_keystone = ""


