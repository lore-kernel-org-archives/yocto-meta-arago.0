Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9D69F529A5
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 12:46:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GCjOkp012402
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 07:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521204324;
	bh=u5AqsDOAaA+xoaUvDbEelcsWNtO3bnQF7uPS5SRbOHw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=IzEwQu/GnwYNRDfgBcLHe0ThiiavQGO00ZZSUhPDe/MoFOrvO1Ef2SIgLrJgHuU54
	xWky9mTkfQRoCmovg4WZLvjRCwEzZQJRn2jXu9++Evdcc4jBAs+T/lMSx3dj4xNZJt
	5OLtLcIM4Pmtm/DCmLuuxx/84Iz90W/FB2CjJYUA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GCjNat015473
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 07:45:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 07:45:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 07:45:23 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GCjNoQ029899;
	Fri, 16 Mar 2018 07:45:23 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1521149064-13850-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6d774a67-674a-9615-5e81-d0500faef810@ti.com>
Date: Fri, 16 Mar 2018 08:45:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521149064-13850-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v3] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Fri, 16 Mar 2018 12:46:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I get an different error now.


| In file included from ../git/gc320.cpp:39:0:
| ../git/gc320.h:38:20: fatal error: gc_hal.h: No such file or directory
|  #include <gc_hal.h>
|                     ^
| compilation terminated.
| Makefile:942: recipe for target 'gc320.o' failed
| make: *** [gc320.o] Error 1
| make: *** Waiting for unfinished jobs....
| In file included from ../git/video_graphics_test.cpp:46:0:
| ../git/gc320.h:38:20: fatal error: gc_hal.h: No such file or directory
|  #include <gc_hal.h>
|                     ^
| compilation terminated.
| Makefile:937: recipe for target 'video_graphics_test.o' failed
| make: *** [video_graphics_test.o] Error 1



On 3/15/2018 5:24 PM, Eric Ruei wrote:
> - include gc320
> - QPA interface changes
> - dual-screen support
> - add more dependencies
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> index c19af16..30805a5 100644
> --- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> +++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> @@ -4,12 +4,12 @@ SECTION = "multimedia"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
>   
> -DEPENDS += "libdrm"
> +DEPENDS += "libdrm ti-gc320-libs cmem qtdeclarative"
>   
> -PR = "r0"
> +PR = "r1"
>   
>   BRANCH = "master"
> -SRCREV = "3b3007680845d39784146396a2dd2a68aa1a2283"
> +SRCREV = "bdfbc4179d8d176feec1df148728b1882fca7416"
>   
>   SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
>   "


