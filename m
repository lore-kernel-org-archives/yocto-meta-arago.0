Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 07DB652993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 13:14:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DDESeb024906
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 08:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536844468;
	bh=CVfx1XwEIsl89cN713F+Qw/MfnIJoN55hrCfEfj9qSw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=O/fEDDoPxm6OUWGH8XqejX1YTbIe5tKRniV7+81aAAWhbUmgZOhbdn1hRrELyTjIt
	IEhDx5EhIU2K7U7M5fazFmWKCCAY1f2ZD/6Pl2JzPAm7MK4VhYqut+WoqBmKLknE5z
	8iW65vtI/WDME4boqutO0D6xkyV2szC5AyX4USp8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DDESjd021222
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 08:14:28 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 08:14:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 08:14:27 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DDERnm020659;
	Thu, 13 Sep 2018 08:14:27 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1536776579-40448-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4d28d97e-9cc5-c080-c25e-6f059b1ae97a@ti.com>
Date: Thu, 13 Sep 2018 09:14:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536776579-40448-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2] ti-sgx-ddk-um: bump SGX SRCREV to synchronize with meta-ti
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
X-List-Received-Date: Thu, 13 Sep 2018 13:14:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This has been pushed. Thank you.


On 9/12/2018 2:22 PM, Eric Ruei wrote:
> - bump SGX SRCREV to pick up latest bug fixes on DDK 1.14
> - libGLESv2.so.1 link has already been up-streamed.
>
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
> index a48f670..179a56d 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
> @@ -1,8 +1,4 @@
> -PR_append = ".tisdk6"
> +PR_append = ".tisdk7"
>   
> -BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
> -SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bbbd5cbb55e4c54d3b02456ae553bea86fd61506','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
> -
> -do_install_append () {
> -    ln -sf ./libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
> -}
> +BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/rocko/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
> +SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','9ad48144e89d48c7bf2db2a12795985e7a80e4fa','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"


