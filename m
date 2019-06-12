Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8DB4B52A00
	for <meta-arago@arago-project.org>;
	Wed, 12 Jun 2019 11:31:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CBUoXJ053857
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560339050;
	bh=hkPZ5u6kcMhCOew95F6x7dmMa3iNOlZLqpbLuz2jO6g=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=W9uOll+Em4AEDtkqDcuRBvVfLWHPFiRo26PljnRlfH6viknO4PII7T0qH2w/9d0U3
	5yyEkhZ6+3sdWlAEwvwme59d4eJ9dmATEdsYmJLaAc+hAASzHgOkZsHDn/Iv5gFvsl
	U5dlH9LwRHb04x2eADC7PmbaKypbDyjIvpHo2ISk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CBUoi2106941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:30:50 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 12 Jun 2019 06:30:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 12 Jun 2019 06:30:49 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CBUnVJ112771;
	Wed, 12 Jun 2019 06:30:49 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <20190607140503.29694-1-e-ruei1@ti.com>
	<20190607140503.29694-2-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <997ffbfd-cd22-f126-6ead-e8608ad4143d@ti.com>
Date: Wed, 12 Jun 2019 07:30:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607140503.29694-2-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH 2/2] matrix-gui-apps-git:bump SRCREV to put deform back to full-screen mode
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
X-List-Received-Date: Wed, 12 Jun 2019 11:31:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to the ti2019.01 branch?


Thank you,

Jake

On 6/7/2019 10:05 AM, Eric Ruei wrote:
> Restore deform to full-screen mode because the display problem has been
> fixed at Weston 5.0
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 1ef1e9b9..487f1544 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>   LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>   
>   SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "42ccd978004ec75b4e05313466abe92806d14a29"
> +SRCREV = "2b41ee1f8e0dfe6b5f78d56e13a51aab115aaff0"
>   BRANCH = "master"
> -INC_PR = "r69"
> +INC_PR = "r70"
>   
>   # Pull in the base package for installing matrix applications
>   require matrix-gui-apps.inc

