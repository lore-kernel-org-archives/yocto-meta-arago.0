Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 32163529C0
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 21:31:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCLTwKI021010
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 15:29:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576186198;
	bh=o5xlIXLf+K2+SRw1/rTKz5PQ12ieKog4UAYNY2egves=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sa3MK8Q04Dyf42JgA7rW+NPFWe+fiZm2Gamq/6Vci+HanT2kttsKfODlVp5cmsYIP
	Yx2Iqp7kf8ZdfvGUHdqLFKhtRHrlG9qJrQ+zCR97iuhVi3skjHD1oXg1MtljNRVKls
	AzFRcT7/rF8JqS8wQ/l8hIwKrTDyxiV6N9xWsxPs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCLTwlc050875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 15:29:58 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 15:29:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 15:29:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCLTvfs097212;
	Thu, 12 Dec 2019 15:29:57 -0600
Date: Thu, 12 Dec 2019 16:29:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20191212212957.GH32050@beryl>
References: <1576184573-9278-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1576184573-9278-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud/ti2019.05][PATCH] tidl-api: fix package-qa issues
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
X-List-Received-Date: Thu, 12 Dec 2019 21:31:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Dec 12, 2019 at 04:02:53PM -0500, Jacob Stiffler wrote:
> tidl-api does not create versioned libraries,

Should it be fixed then? What's the plan to address it?



> so provide these in the
> base package and skip the QA checks.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index a8829c1..ea12fb0 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -52,5 +52,9 @@ FILES_${PN} += "\
>      ${TIDL_INSTALL_DIR} \
>  "
>  
> +# Versioned libs are not created. See do_install().
> +SOLIBS = ".so*"
> +FILES_SOLIBSDEV = ""
>  
> -INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> +INSANE_SKIP_${PN} = "arch ldflags textrel staticdev libdir"
> +INSANE_SKIP_${PN}-dbg = "libdir"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

