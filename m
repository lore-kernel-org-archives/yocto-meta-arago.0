Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9275A52A2B
	for <meta-arago@arago-project.org>;
	Wed, 12 Sep 2018 14:34:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8CEY5sO089103
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 09:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536762845;
	bh=pgGRsQ2c6zIfFaud89t9wUaMU5Bl1VWEVBSdrlVaPis=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=aO+1xNxj1ojulT7RD9QKIFAFuB/0JSrZjno3MJd2BuqYH5GZc2/+ydebEfGdG0o98
	VE5WLJQ8/dqY/5x8BLuKM3KcQv5C3vF6c7dsy85ELIESJLbrpB5rgeneY7xEKLiqqC
	hs/X0tbrPIPpn2ix7Bp4bp6s3V+8E/5MncCiaIRQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CEY5O9010708
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 09:34:05 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 12 Sep 2018 09:34:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 12 Sep 2018 09:34:02 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CEY1Qe002449;
	Wed, 12 Sep 2018 09:34:01 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1536681246-9165-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <dd446186-ecf8-7d80-cdb8-10cb70133bfa@ti.com>
Date: Wed, 12 Sep 2018 10:34:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536681246-9165-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] ti-sgx-ddk-um: bump SGX SRCREV to synchronize with meta-ti
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
X-List-Received-Date: Wed, 12 Sep 2018 14:34:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Eric,

I get a fetch error with this:


WARNING: ti-sgx-ddk-um-1.14.3699939-r30.tisdk7 do_fetch: Failed to fetch 
URL 
git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=ti-img-sgx/1.14.3699939, 
attempting MIRRORS if available
ERROR: ti-sgx-ddk-um-1.14.3699939-r30.tisdk7 do_fetch: Fetcher failure: 
Unable to find revision 9ad48144e89d48c7bf2db2a12795985e7a80e4fa in 
branch ti-img-sgx/1.14.3699939 even from upstream
ERROR: ti-sgx-ddk-um-1.14.3699939-r30.tisdk7 do_fetch: Fetcher failure 
for URL: 
'git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=ti-img-sgx/1.14.3699939'. 
Unable to fetch URL from any source.

- Jake


On 9/11/2018 11:54 AM, Eric Ruei wrote:
> - bump SGX SRCREV to pick up latest bug fixes on DDK 1.14
> - libGLESv2.so.1 link has already been up-streamed.
>
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
> index a48f670..9ccf343 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
> @@ -1,8 +1,4 @@
> -PR_append = ".tisdk6"
> +PR_append = ".tisdk7"
>   
>   BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
> -SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bbbd5cbb55e4c54d3b02456ae553bea86fd61506','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
> -
> -do_install_append () {
> -    ln -sf ./libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
> -}
> +SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','9ad48144e89d48c7bf2db2a12795985e7a80e4fa','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"


