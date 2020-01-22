Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BDDC75298B
	for <meta-arago@arago-project.org>;
	Wed, 22 Jan 2020 21:34:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MLWsrI060232
	for <meta-arago@arago-project.org>; Wed, 22 Jan 2020 15:32:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579728774;
	bh=5IzX/o+Vl9m+tkDUTvxnEmsTBGE8votA6CYvg1i1jj8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=m0Cp7glFxaKoKo/VQEBqv/4M9nclPFrxra499D9dGph7DAkMMKctcD+sCsPCnuXk9
	ryVuc47jddrvZr3rU51qVTELkAeKGEarsJePobcRSF2pRJPtD/oPuzZeGnAmGNhQ0x
	VdmZ/QGBBW5BwEECscupJM4z9EApc2Gn/GsmnBSM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MLWs8k050379
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 22 Jan 2020 15:32:54 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 22 Jan 2020 15:32:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 22 Jan 2020 15:32:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MLWrhk024004;
	Wed, 22 Jan 2020 15:32:54 -0600
Date: Wed, 22 Jan 2020 16:32:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20200122213253.GC3658@beryl>
References: <1579702522-31819-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1579702522-31819-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [RFC][PATCH] opencl: fix packaging of library
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
X-List-Received-Date: Wed, 22 Jan 2020 21:34:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hmm, after applying this patch and rebuilding with sstate, it fails in package 
dependencies:

nothing provides libopencl1 >= 1.2.00.02 needed by ...

I'll try making a clean build next.

Denys


On Wed, Jan 22, 2020 at 09:15:22AM -0500, Jacob Stiffler wrote:
> * Add daemon conffiles and library to runtime package.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> index 59cb8ca..502e1cf 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD"
>  
>  include ocl.inc
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  inherit cmake systemd
>  
> @@ -80,7 +80,7 @@ do_install_append() {
>  SYSTEMD_SERVICE_${PN}-runtime = "ti-mct-daemon.service"
>  SYSTEMD_AUTO_ENABLE_${PN}-runtime = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
>  
> -FILES_${PN}-runtime += "${bindir} ${systemd_system_unitdir}"
> +FILES_${PN}-runtime += "${bindir} ${systemd_system_unitdir} ${sysconfdir}/ti-mctd ${libdir}/lib*${SOLIBS}"
>  
>  FILES_${PN} += " \
>      ${datadir}/ti/opencl/* \
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

