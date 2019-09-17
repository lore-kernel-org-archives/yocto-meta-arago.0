Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C3D6E529B9
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2019 14:15:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HEEbrD122440
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2019 09:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568729677;
	bh=HwVw51jJr7Wa4sgtzCKugSvntpDy4/CXPMqPGtppCbg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=iln1axMGSqYGne+cdxIh9/Fjt8sUOfVKiDzh4g4emIpRkJZYgx7KapBIFIAVwudMO
	I91QWORLkkIDCtgjX98UZAeyT2Nn9qfxNSr8OdnwgU80GgTHu5XS9kpuZqlaqLfaSg
	ChaW0rENJFKP0UPWfkdQoNyoqLB1tYITFLJC3ShM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HEEbLn075845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2019 09:14:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 17 Sep 2019 09:14:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 17 Sep 2019 09:14:34 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HEEaVK104334;
	Tue, 17 Sep 2019 09:14:37 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190916202605.44605-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <a4ba1489-8886-c317-c58a-f09d59262351@ti.com>
Date: Tue, 17 Sep 2019 10:14:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916202605.44605-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] tidl-api: update to version 1.3.2
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
X-List-Received-Date: Tue, 17 Sep 2019 14:15:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this to ti2019.03.


Thanks,

Jake

On 9/16/2019 4:26 PM, Yuan Zhao wrote:
> - MobileNet v2 support
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index 01725245..edfd208f 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,4 +1,4 @@
> -PV = "1.3.1"
> +PV = "1.3.2"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
> @@ -8,7 +8,7 @@ GIT_PROTOCOL = "git"
>   BRANCH = "master"
>   
>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "73efef4ab6b4c9c20f6ade372c396043e6d36b40"
> +SRCREV = "b83df643de46c2ae198dfdac859e51f6b4acc1ea"
>   
>   # default patchdir is ${S}
>   S = "${WORKDIR}/git"

