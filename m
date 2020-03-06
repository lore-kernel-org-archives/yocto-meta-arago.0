Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 9D41C52A8F
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2020 18:29:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 026IQvsT084439
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 12:26:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583519217;
	bh=0mL2qQubPXGiu9iZtiybEZqRK2fAGiZ3t/PPujAUCj8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=U91Gwyu1eI5BaVm3VpWpcIR4PYM7QLicMLFWLG/PzLNWC9Lbx62MvWtEmcUGnJA4b
	0I+JOBmg7VtBITmbDS90uVE5JAtGwO9fUQhAmWsOwFUFyS6k07MSHcAxT09iDqKq96
	twsmAEop82nAHtkXfnvnFbYXP4cinOc8NeLgEOOg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 026IQvC2065065
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 12:26:57 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Mar 2020 12:26:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 6 Mar 2020 12:26:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 026IQu8p038138;
	Fri, 6 Mar 2020 12:26:57 -0600
Date: Fri, 6 Mar 2020 13:26:56 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20200306182656.GY1628@beryl>
References: <20200306174625.16312-1-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200306174625.16312-1-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud] [PATCH] packagegroup-arago-tisdk-addons: add tensorflow-lite
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
X-List-Received-Date: Fri, 06 Mar 2020 18:29:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 06, 2020 at 12:46:25PM -0500, Hongmei Gou wrote:
> * This is for including the examples built from the tensforflow lite package
>   to the target filesystem at usr/share/tensorflow-lite/examples
> 
> * As tensorflow-lite is creating static library, tensorflow-lite-demo which
>   depends on tensorflow-lite will not bring in the examples folder for
>   tensorflow-lite to the target filesystem

Not really clear from this description - do you package examples in a separate 
package? Then you need to list that package in RDEPENDS packagegroup below. 
Otherwise the standard depency from demo package should be fine.

Denys


> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
> This is applicable to thud only, since zeus/master is now using ti-analytics.bb
> 
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 583d2c0b..ff34ab95 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r77"
> +PR = "r78"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -153,6 +153,7 @@ ARMNN_PACKAGES = "armnn"
>  EXTRA_PACKAGES_append_ti33x = " voxelsdk \
>                                  arm-compute-library \
>                                  ${ARMNN_PACKAGES} \
> +                                tensorflow-lite \
>                                  tensorflow-lite-demo \
>                                  pdm-anomaly-detection \
>  "
> @@ -160,6 +161,7 @@ EXTRA_PACKAGES_append_ti33x = " voxelsdk \
>  EXTRA_PACKAGES_append_ti43x = " voxelsdk \
>                                  arm-compute-library \
>                                  ${ARMNN_PACKAGES} \
> +                                tensorflow-lite \
>                                  tensorflow-lite-demo \
>                                  pdm-anomaly-detection \
>  "
> @@ -169,12 +171,14 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
>                                     big-data-ipc-demo-linux-firmware \
>                                     arm-compute-library \
>                                     ${ARMNN_PACKAGES} \
> +                                   tensorflow-lite \
>                                     tensorflow-lite-demo \
>                                     pdm-anomaly-detection \
>  "
>  
>  EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
>                               ${ARMNN_PACKAGES} \
> +                             tensorflow-lite \
>                               tensorflow-lite-demo \
>                               pdm-anomaly-detection \
>  "
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

