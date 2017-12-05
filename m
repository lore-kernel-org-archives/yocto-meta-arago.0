Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4A876529ED
	for <meta-arago@arago-project.org>;
	Tue,  5 Dec 2017 15:35:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB5FZXV9023602
	for <meta-arago@arago-project.org>; Tue, 5 Dec 2017 09:35:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512488133;
	bh=I5LRpQdNeVJ0bs36jx3ptxm1+QXNyslTK8GdFczRVQQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ZzB5tXDN780GWSvgzwZvwga/yqCC8/mhwUJBgOk7f5sneM6MB1D/fUN6RNgCcmLVy
	q+rnLbNq2Kg3oDfhGL5iVrKMjd4D9dsG0iBtifteJblm+CSKUiRxLINsujkuHRhIRK
	+16iBPgt+OD1QMMzQUfVqhC0DGaw37Lc9Yo2faD4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB5FZSJw007425
	for <meta-arago@arago-project.org>; Tue, 5 Dec 2017 09:35:28 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Dec 2017 09:35:28 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Dec 2017 09:35:28 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB5FZR4W001346;
	Tue, 5 Dec 2017 09:35:27 -0600
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1512049447-64434-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4a006a81-311f-2e7d-b374-f2c7cd789039@ti.com>
Date: Tue, 5 Dec 2017 10:35:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512049447-64434-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] ti-xsgx-ddk-um: bump SRCREV to pick up the libpng fixes for AM5
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
X-List-Received-Date: Tue, 05 Dec 2017 15:35:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed to the "morty-x11-experimental" branch of meta-processor-sdk.


On 11/30/2017 8:44 AM, Eric Ruei wrote:
> - restore the libpng libraries as symbolic links for AM5
> - update the SYSROOT_DIRS_BLACKLIST_append list with libpng* instead of libpng12
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> index 6434869..8bdf4bd 100644
> --- a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> +++ b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> @@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   BRANCH = "ti-img-sgx/${PV}"
>   
>   SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "c00eb002f624cddac4956c901314c07d83a13260"
> +SRCREV = "bc642ce08c6056906eac4c7e257e856bb22d8cbb"
>   
>   SRC_URI += " file://xorg"
>   
> @@ -33,7 +33,7 @@ INITSCRIPT_PARAMS = "defaults 8"
>   
>   inherit update-rc.d
>   
> -PR = "r1"
> +PR = "r2"
>   PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"
>   
>   DEPENDS += "udev"
> @@ -71,7 +71,7 @@ FILES_${PN}-plugins += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/mo
>   FILES_${PN}-staticdev += "/usr/local/XSGX/lib/dri/*.so /usr/local/XSGX/lib/xorg/modules/*.so /usr/local/XSGX/lib/xorg/modules/drivers/*.so /usr/local/XSGX/lib/xorg/modules/extensions/*.so /usr/local/XSGX/lib/xorg/modules/input/*.so"
>   RDEPENDS_${PN} += "${PN}-plugins"
>   
> -SYSROOT_DIRS_BLACKLIST_append = " /usr/local/XSGX/lib/libpng12.a /usr/local/XSGX/lib/libpng12.so /usr/local/XSGX/lib/libpng12.so.0  /usr/local/XSGX/lib/libpng12.so.0.56.0"
> +SYSROOT_DIRS_BLACKLIST_append = " /usr/local/XSGX/lib/libpng.a /usr/local/XSGX/lib/libpng.so"
>   
>   
>   ALLOW_EMPTY_${PN}-plugins = "1"


