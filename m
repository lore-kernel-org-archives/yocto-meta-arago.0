Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 96983529A6
	for <meta-arago@arago-project.org>;
	Fri,  8 Jun 2018 10:29:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w58ATMjs027173
	for <meta-arago@arago-project.org>; Fri, 8 Jun 2018 05:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528453762;
	bh=tna/tPyPf/G2AzHE9Qi2WWdUJmdfu/vD21XDVj9JaVs=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=rG39oLs4C5v1lwO6TIQ5ZLDkuLAEppF9ei8R19if9vCckqWdiCx+uYIFA52zhxMpq
	mI+Ac7bPzANHL9WePsX9y65UpFE5uWelsToRCRT6Z8TzMRO8YcnK4rgC/Ai3Z6ABou
	olLS48lMcbenZVACt/bLSSzY6l1eBvAeqPZS4iKM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w58ATM1L006564
	for <meta-arago@arago-project.org>; Fri, 8 Jun 2018 05:29:22 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 8 Jun 2018 05:29:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 8 Jun 2018 05:29:22 -0500
Received: from [172.24.156.57] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w58ATKYs029606;
	Fri, 8 Jun 2018 05:29:21 -0500
To: Ramprasad N <x0038811@ti.com>, <meta-arago@arago-project.org>
References: <1528197652-4249-1-git-send-email-x0038811@ti.com>
	<1528197652-4249-2-git-send-email-x0038811@ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <8155b2a7-6459-77a7-0140-047f4bb5e28b@ti.com>
Date: Fri, 8 Jun 2018 15:59:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1528197652-4249-2-git-send-email-x0038811@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko] example-applications: Bump SRCREV with latest commit
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
X-List-Received-Date: Fri, 08 Jun 2018 10:29:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Acked-by: Karthik Ramanan <a0393906@ti.com>


On 05-Jun-18 4:50 PM, Ramprasad N wrote:
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>   .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> index 3ce8a76..e44bee9 100644
> --- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> +++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> @@ -14,9 +14,9 @@ inherit autotools pkgconfig
>   SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
>   "
>   
> -SRCREV="491b3129a5c5267d72aba8878b50731f27356d3a"
> +SRCREV="6197386b99383849fbf7c1017d2420742860a88c"
>   
> -PR = "r50"
> +PR = "r51"
>   
>   do_install_append () {
>       install -d ${D}${sysconfdir}/glsdkstatcoll


