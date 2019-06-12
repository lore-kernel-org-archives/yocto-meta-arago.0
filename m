Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 099DF52A00
	for <meta-arago@arago-project.org>;
	Wed, 12 Jun 2019 11:32:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CBVZ1Q012713
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560339095;
	bh=xUdyK2X5pPsBxvLmSfBn/U21xpij4E+evTexTHMUYXI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=D1PL70AfcM40c5ZEO/PJargpaXAnTB6KUk01T0/lBEXKAj3bR/sNw5Er71WEfSuJ9
	6nrlA4WCgcytHF1+ajktTedzQNPmMtSI4RunkFqzZ+pHCDps/w8uR3hAV6uAwI5Abg
	hd10HT1+C1+Pj2zrERvVUVu7kiDPcS1m8ewiovcc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CBVZ9C107916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:31:35 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 12 Jun 2019 06:31:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 12 Jun 2019 06:31:35 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CBVZS5076024;
	Wed, 12 Jun 2019 06:31:35 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190611193011.9057-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6e1dacc3-9a98-abdf-bd2c-b12a44b9a985@ti.com>
Date: Wed, 12 Jun 2019 07:31:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611193011.9057-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] tidl-api: Fix tidl-viewer x86_64 build CXXFLAGS
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
X-List-Received-Date: Wed, 12 Jun 2019 11:32:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to the ti2019.01 branch?


Thank you,

Jake

On 6/11/2019 3:30 PM, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> index 9a2cff13..c97b3a3b 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> @@ -5,7 +5,7 @@ LICENSE = "BSD"
>   
>   include tidl-api.inc
>   
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>   
>   DEPENDS = "boost boost-native ti-cgt6x-native clocl-native"
>   
> @@ -15,6 +15,9 @@ TARGET_class-target = "arm"
>   TARGET_class-native = "x86"
>   TARGET_class-nativesdk = "x86"
>   
> +CXXFLAGS_append_class-native    = " -DPLATFORM_64BIT "
> +CXXFLAGS_append_class-nativesdk = " -DPLATFORM_64BIT "
> +
>   EXTRA_OEMAKE = " -C ${S}/viewer \
>                    TARGET=${TARGET} \
>                    TARGET_ROOTDIR=${STAGING_DIR_HOST} \

