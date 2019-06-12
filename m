Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1ECBF52A00
	for <meta-arago@arago-project.org>;
	Wed, 12 Jun 2019 11:32:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CBVKn4075472
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560339080;
	bh=HhHOz9mSDEsLSVuGAOVifjiv99rARFoNHp4xF8rwZ+c=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=E5B6iAdXv0kyDpfL6glEe1HNl7E0NJuPhC56NOz1hLug4AI9OH7eoBNfNxj8BGY6+
	2O8NZnjghJ7jT8RZItsxy8uR6DjYIQde0pe6glb4jJn5tRl4+lw0TPg13j3RSMPviG
	2Joc5zsWmNyDU/nsvo4bqPNm++4VOor3UFpdP+lw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CBVKus107738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:31:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 12 Jun 2019 06:31:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 12 Jun 2019 06:31:20 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CBVKGW065250;
	Wed, 12 Jun 2019 06:31:20 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1560278753-56122-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <debbb387-b39e-90ae-55fd-b1f0b964ff50@ti.com>
Date: Wed, 12 Jun 2019 07:31:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560278753-56122-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] meta-toolchain-arago: pass --sysroot= option to C, CXX, CPP, LD in environment setup
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
X-List-Received-Date: Wed, 12 Jun 2019 11:32:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to the ti2019.01 branch?


Thank you,

Jake

On 6/11/2019 2:45 PM, Denys Dmytriyenko wrote:
> OE-built toolchain requires passing --sysroot= option to compiler/linker. Since
> we always used prebuilt Linaro/Arm toolchain in the past, we never needed this.
>
> Sync up with coresponding code in OE-Core to pass --sysroot= in the environment
> setup script.
>
> Most Makefiles and autotools will respect those variables being setup. When using
> devkit to manually cross-compile, call $CC, $CXX, $LD instead of directly calling
> corresponding compiler/linker, otherwise pass --sysroot= option manually.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 3d827a7..065531e 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -47,10 +47,11 @@ toolchain_create_sdk_env_script () {
>   	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig' >> $script
>   	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
>   	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' >> $script
> -	printf 'export CC=\x24{TOOLCHAIN_PREFIX}gcc\n' >> $script
> -	printf 'export CXX=\x24{TOOLCHAIN_PREFIX}g++\n' >> $script
> +	printf 'export CC="\x24{TOOLCHAIN_PREFIX}gcc --sysroot=$SDK_PATH_TARGET"\n' >> $script
> +	printf 'export CXX="\x24{TOOLCHAIN_PREFIX}g++ --sysroot=$SDK_PATH_TARGET"\n' >> $script
>   	printf 'export GDB=\x24{TOOLCHAIN_PREFIX}gdb\n' >> $script
> -	printf 'export CPP="\x24{TOOLCHAIN_PREFIX}gcc -E"\n' >> $script
> +	printf 'export CPP="\x24{TOOLCHAIN_PREFIX}gcc -E --sysroot=$SDK_PATH_TARGET"\n' >> $script
> +	printf 'export LD="\x24{TOOLCHAIN_PREFIX}ld --sysroot=$SDK_PATH_TARGET"\n' >> $script
>   	printf 'export NM=\x24{TOOLCHAIN_PREFIX}nm\n' >> $script
>   	printf 'export AS=\x24{TOOLCHAIN_PREFIX}as\n' >> $script
>   	printf 'export AR=\x24{TOOLCHAIN_PREFIX}ar\n' >> $script

