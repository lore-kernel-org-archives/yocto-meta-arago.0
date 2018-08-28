Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 50E2F529EE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 19:04:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7SJ4UgP114964
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535483070;
	bh=JLx08nWARttOLBG+lAt3UEubQ7F4sBg67ldwZP72bFg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Vz/uE8VVOsGt1katGo7+zgmDsRyEtVAt7U7jDsSPa9+csnAQxbopFZGYqD+dw9REW
	crYCnAop+a/ArLvSmS0V4m+n8IA9P0ttTellP34NeJY5GuHmUoMOv1MtyAWshzEBBD
	/nDZfqU/pESTJeN30b0W7zLx54o/TBtpvvf8dKF0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SJ4UjZ014082
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:04:30 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 14:04:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 14:04:30 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SJ4T81010936
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:04:30 -0500
To: <meta-arago@arago-project.org>
References: <1535477663-15879-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0969cfda-be66-0cf7-244f-574b5cfb2963@ti.com>
Date: Tue, 28 Aug 2018 15:04:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1535477663-15879-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH 1/4] ti-tisdk-makefile: fix KERNEL_IMAGETYPE replacement
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
X-List-Received-Date: Tue, 28 Aug 2018 19:04:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I have identified and fixed another issue with ti-tisdk-makefile for k3.

I will submit a v2 of the entire set to keep the patches in order.

- Jake


On 8/28/2018 1:34 PM, Jacob Stiffler wrote:
> * KERNEL_IMAGE_TYPE was used when the correct variable name is
>    KERNEL_IMAGETYPE.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index aba71d9..f83713a 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -249,7 +249,7 @@ do_install () {
>       fi
>   
>       sed -i -e "s/__KERNEL_ARCH__/${ARCH}/" ${D}/Makefile
> -    sed -i -e "s/__KERNEL_IMAGE_TYPE__/${KERNEL_IMAGE_TYPE}/" ${D}/Makefile
> +    sed -i -e "s/__KERNEL_IMAGE_TYPE__/${KERNEL_IMAGETYPE}/" ${D}/Makefile
>       sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
>       sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
>   


