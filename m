Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6EEA0529FB
	for <meta-arago@arago-project.org>;
	Wed,  5 Jun 2019 22:24:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x55MNXoL031762
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2019 17:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559773413;
	bh=Lk73Ex8n6dixd/f4rEPvRBgkEb4CWq/WtNRCradWhTw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=vQ+wHvuxd7TxjDZlaAq2h1juNqVue1IZ9qTyM0XQEfS68ayB8ACef4ccp9IuSV99y
	6fYs7rx1tyS8CNiF6BbLWV1rh37pqJHtGv+wgNLOXRSLG8klI4PJ/gnyCs9/3+ly2x
	455A/VEUjQtKFIdLJkmPx6v2Kk0zeEu2DFDiDX/c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x55MNXJ8084427
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2019 17:23:33 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 5 Jun 2019 17:23:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 5 Jun 2019 17:23:33 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x55MNXC3035422;
	Wed, 5 Jun 2019 17:23:33 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <20190605212609.54773-1-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <03a740d9-05cc-7959-9236-1561573de6f0@ti.com>
Date: Wed, 5 Jun 2019 18:23:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605212609.54773-1-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] packagegroup-arago-tisdk-addons: add watchdog for k3
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
X-List-Received-Date: Wed, 05 Jun 2019 22:24:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Will you be upstreaming this?

On 6/5/2019 5:26 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons.bbappend     | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> index e3b2fd6..7f26e6f 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-tisdk51"
> +PR_append = "-tisdk52"
>   
>   EXTRA_PACKAGES_append_ti33x = " opencv"
>   EXTRA_PACKAGES_append_ti43x = " opencv"
> @@ -11,6 +11,7 @@ EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps pru-adc"
>   EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
>   EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
>   EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps"
> +EXTRA_PACKAGES_append_k3 = " watchdog"
>   # FIXME: disable for now
>   # jailhouse-examples
>   # jailhouse-examples-rtos

