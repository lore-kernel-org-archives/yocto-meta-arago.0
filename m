Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2CD8E529AF
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 14:07:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85E797U002456
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 09:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504620429;
	bh=d4tOlnVS3gxfGvXoxx/H0X3rk7TEi8oonQXxaQ8zYiw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=IzoMqD1k6QAOFWoVr2146lwuDBKeQZpvGGyZtN8mzAPJV2BD1CRvnisIO8xO7xMfx
	3Pzbi97PtBe/WO634xHNESLs9HYl4i0CNU5ZYQcuFnZERBI2hHYBydUErxiXFLR3Xw
	TMBRz7Lk+8HjF57N/vBlJg9jIMdAVC/lqfi/CBC4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85E795O030802
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 09:07:09 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 09:07:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 09:07:08 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85E788q006826;
	Tue, 5 Sep 2017 09:07:08 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
	<20170901211741.26451-5-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <21e2fd43-8e88-a08a-d493-5b1d8a7d486c@ti.com>
Date: Tue, 5 Sep 2017 10:07:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170901211741.26451-5-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v3 5/7] packagegroup-arago-tisdk-matrix : add hmi demos
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
X-List-Received-Date: Tue, 05 Sep 2017 14:07:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/1/2017 5:17 PM, Manisha Agrawal wrote:
> Add evse-hmi and protection-relays-hmi demo
>
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-matrix.bbappend         | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
> index b7c6816..abef996 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
> @@ -7,15 +7,22 @@ MATRIX_SGX_DEMOS_remove_omap-a15 = " \
>   MATRIX_COMMON_APPS_remove = " \
>       matrix-gui-oprofile-demos \
>   "
> +MATRIX_APPS_append_ti33x += " \
You don't need to '+=' here as you are already using the '_append' override.

> +    matrix-hmi-demo-evse            \
> +    matrix-hmi-demo-protection-relays \
> +"
> +
>   
>   MATRIX_APPS_append_omap-a15 += " \
Same comment as above.

>       matrix-gui-apps-dual-camera \
>       matrix-gui-apps-image-gallery \
>       matrix-multimedia-demo-audiocapture \
> +    matrix-hmi-demo-evse            \
>   "
>   
>   MATRIX_APPS_append_ti43x = " \
>       matrix-multimedia-demo-audiocapture \
> +    matrix-hmi-demo-evse            \
>   "
>   
>   MATRIX_TOUCH_APPS_keystone = ""


