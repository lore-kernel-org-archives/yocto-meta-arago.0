Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3D1DD52A1F
	for <meta-arago@arago-project.org>;
	Tue, 14 Mar 2017 19:44:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2EJiftS002324
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 14:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489520682;
	bh=xxihCnVQOsaO2gT7G4xEqHtlsPWu2UZARNJ4mbCiT6c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E2w17HASweSOqJavMbGc3vZlvKxePgXzOliukBGh/bAGxoNg9ZNAtvf+bXYFS+cVT
	I8KdbX6P0zu+aTnEqRvnc9X8cSXPKQdiTQ5Pq4Ju6ldVHapXcJrDni9+6GpewbFnL0
	DZxCVzdTcF2PMEBC2ztKlK8pkZcGKI0NRA2j3b6o=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2EJifhF023606
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 14:44:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 14:44:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2EJifAw012808;
	Tue, 14 Mar 2017 14:44:41 -0500
Date: Tue, 14 Mar 2017 15:44:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170314194440.GM578@edge>
References: <1489491757-83601-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1489491757-83601-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master] omapdrmtest: Update tests to handle disabled HDMI
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
X-List-Received-Date: Tue, 14 Mar 2017 19:44:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Should this also be applied to morty, I presume?

On Tue, Mar 14, 2017 at 05:12:37PM +0530, Karthik Ramanan wrote:
> Pre-requisities: this is applicable for kernel 4.9
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb              | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> index 793e9b5..bb787ec 100644
> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> @@ -7,13 +7,14 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
>  
>  inherit autotools pkgconfig
>  
> -PR = "r19"
> -SRCREV = "47bbb6b2ec48bbee35f9dc7192c05e48fd1a2589"
> +PR = "r21"
> +SRCREV = "809e72b2c5ebe45bb7ba13bcfe964b1ef69f98f0"
>  
>  EXTRA_OEMAKE = "CC="${CC}""
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
> -           file://0001-configure.ac-also-check-for-libavcodec-library.patch"
> +           file://0001-configure.ac-also-check-for-libavcodec-library.patch \
> +"
>  
>  S = "${WORKDIR}/git"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

