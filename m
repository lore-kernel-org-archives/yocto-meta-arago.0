Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5F3EA529E4
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2019 14:17:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89EGLJT035248
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 09:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568038581;
	bh=vAWBxv4Ce2PyREdyk4Q77pYEuKsStNfE81sgKKpfk4g=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=tXvqpgdm4RSuF1YJ79duzMTu/w21GYZu87aePJ5H1pHnahfGzxUqoJd8V0DjzepEr
	3cyBRiTYhQAMwt9Gt9V6DscGX4Y+5SV2QNnBm+ho+TygnCxo8nQIANXe6Z3Zfjixsi
	rv107BEN8aPzVl1fPO9zO+ciCynLKKVyODtTtF00=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89EGLv2051318
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2019 09:16:21 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 09:16:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 09:16:21 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89EGKif027591;
	Mon, 9 Sep 2019 09:16:21 -0500
To: Jianzhong Xu <xuj@ti.com>, <meta-arago@arago-project.org>
References: <20190904144614.31641-1-xuj@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <134ece1e-9f8b-8541-0c4f-4aa283549420@ti.com>
Date: Mon, 9 Sep 2019 10:16:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904144614.31641-1-xuj@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master] [PATCH] tidl-utils: bump SRCREV
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
X-List-Received-Date: Mon, 09 Sep 2019 14:17:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you backport this to ti2019.03?


Thanks,

Jake

On 9/4/2019 10:46 AM, Jianzhong Xu wrote:
> * bug fixes and config files update in tidl import tool
>
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> index 6fdeec48..64667e59 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -1,6 +1,4 @@
>   SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> -SRCREV = "b2466e02f99d85d8afcbc93edc612da5cc9345de"
> -
> +SRCREV = "23d158e4f18a3391e0d836bb3bd9a7c7c7ada7ee"
>   PV = "01.01.02.00"
> -PR = "r0"
> -
> +PR = "r1"

