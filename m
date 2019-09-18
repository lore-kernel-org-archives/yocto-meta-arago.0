Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9C77D5299C
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 12:33:50 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ICWhJU121940
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 07:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568809963;
	bh=Rwr+MZ+G40AGlksz0imUyQXQ6ppDYUlNEJd4JxTcvvY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Ix3d8T3y14Ih8yuGIkJ/T8L8hxM1FzOV2hu1OeyDvDSHwtdE7D56A65A/pGuK7+yB
	Tb0EPgv4FTe8pjzwDCshGv/1BFwfjoj1TSOp3MZUTq9pKtv0dTbhD8jiHmPLzyuEVT
	9KlRBHlprF5Z+LtA5hd4J6KdU8+Xddr2xTvyhtig=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ICWgpk068192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 07:32:43 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 07:32:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 07:32:42 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ICWgVq038750;
	Wed, 18 Sep 2019 07:32:42 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1568764660-2369-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <58426705-1317-6c6d-4ab2-5781daa2548e@ti.com>
Date: Wed, 18 Sep 2019 08:32:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568764660-2369-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] ti-sci-fw: update to 2019.08
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
X-List-Received-Date: Wed, 18 Sep 2019 12:33:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Did the checksums for the hs-enc and hs-cert images change in this version?


- Jake

On 9/17/2019 7:57 PM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../ti-sci-fw/{ti-sci-fw_2019.07.bb => ti-sci-fw_2019.08.bb}          | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.07.bb => ti-sci-fw_2019.08.bb} (96%)
>
> diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
> similarity index 96%
> rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
> rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
> index d53e926..fab4de4 100644
> --- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
> +++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
> @@ -14,9 +14,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   TI_SECURE_DEV_PKG ?= ""
>   export TI_SECURE_DEV_PKG
>   
> -SRCREV = "3f7c97c9f923f6fbf1b96dcae1da8620a3bab0b3"
> +SRCREV = "c75bca342d5a8579c3a459515adb6b77d640a245"
>   BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "38a82e00f84efdf381dba001fff75e8411898e99"
> +SRCREV_imggen = "92623d82dc683e74225ceaac239b29deac437adf"
>   SRCREV_FORMAT = "imggen"
>   
>   SRC_URI = " \

