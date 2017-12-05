Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0A1A3529ED
	for <meta-arago@arago-project.org>;
	Tue,  5 Dec 2017 15:35:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB5FZjXY023633
	for <meta-arago@arago-project.org>; Tue, 5 Dec 2017 09:35:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512488145;
	bh=h0cwoy+Prkegwr3kzs2ju1gqnatGvKlSrF64irC8KTo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=jeAB5J93Nogopw/i5t7Iofhzil+MMUDJZa8Biy96EO0l9QG46tQb15315Kgl3HE6a
	EyGWyjILOrNi73RqD5FXbjglUcLLMWuSTv37giFLKuGUhR2sI5OszHoMgTr8MsbQB5
	oZ8MI2Qv1Fv5/ebaejnwEIFhY0myj4S/YLLfotf8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB5FZecD014143
	for <meta-arago@arago-project.org>; Tue, 5 Dec 2017 09:35:40 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Dec 2017 09:35:40 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Dec 2017 09:35:40 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB5FZeFA011407;
	Tue, 5 Dec 2017 09:35:40 -0600
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1512429398-11919-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <9126227d-453f-afc4-8215-0456e6488634@ti.com>
Date: Tue, 5 Dec 2017 10:35:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512429398-11919-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] ti-xsgx-ddk-um: enable script xorg as executable
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
X-List-Received-Date: Tue, 05 Dec 2017 15:35:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed to the "morty-x11-experimental" branch of meta-processor-sdk.


On 12/4/2017 6:16 PM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> index 8bdf4bd..96cbb0e 100644
> --- a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> +++ b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> @@ -33,7 +33,7 @@ INITSCRIPT_PARAMS = "defaults 8"
>   
>   inherit update-rc.d
>   
> -PR = "r2"
> +PR = "r3"
>   PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"
>   
>   DEPENDS += "udev"
> @@ -56,7 +56,7 @@ S = "${WORKDIR}/git"
>   
>   do_install () {
>       oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
> -    install -m 0644 ${WORKDIR}/xorg ${D}${sysconfdir}/init.d/
> +    install -m 0755 ${WORKDIR}/xorg ${D}${sysconfdir}/init.d/
>   }
>   
>   SYSROOT_DIRS_append = "/usr/local"


