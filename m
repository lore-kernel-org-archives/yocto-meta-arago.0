Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 66759529B1
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2019 18:36:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADIYjZp025709
	for <meta-arago@arago-project.org>; Wed, 13 Nov 2019 12:34:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573670085;
	bh=KVN5GdYWsu4pMSofsOjvfbh+FJqM/zYXGDyYMeHNWq8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eRMtq90BmfHHUg9FTfnnLwWl26uydqtyyRqhl36ycUyIUyNDmYMA9AUJBIgxpr4/E
	tbUhb/l4xj6p1+0ysqr6rHBsz3MeSRulneSnPE5o6lK5lTKeoLE/5MBy7IhRdeJFhu
	usM+R7O1B8ISjbpn2/8NnDwnQFCz2xZExYfvr8eM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADIYj2d077887
	for <meta-arago@arago-project.org>; Wed, 13 Nov 2019 12:34:45 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 13 Nov 2019 12:34:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 13 Nov 2019 12:34:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADIYiDu069113;
	Wed, 13 Nov 2019 12:34:44 -0600
Date: Wed, 13 Nov 2019 13:34:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20191113183444.GA15023@beryl>
References: <20191113001349.30916-1-a0271529@ti.com>
	<20191113001349.30916-3-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191113001349.30916-3-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master] [PATCH 3/3] packagegroup-arago-tisdk-addons: add tensorflow-lite
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
X-List-Received-Date: Wed, 13 Nov 2019 18:36:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 12, 2019 at 07:13:49PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 14b2370c..73f3f950 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r76"
> +PR = "r77"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -154,6 +154,7 @@ EXTRA_PACKAGES_append_ti33x = " voxelsdk \
>                                  arm-compute-library \
>                                  ${ARMNN_PACKAGES} \
>                                  tensorflow-lite-examples \
> +                                tensorflow-lite \

Can you make tensorflow-lite-examples properly RDEPENDS on tensorflow-lite 
instead?


>                                  pdm-anomaly-detection \
>  "
>  
> @@ -161,6 +162,7 @@ EXTRA_PACKAGES_append_ti43x = " voxelsdk \
>                                  arm-compute-library \
>                                  ${ARMNN_PACKAGES} \
>                                  tensorflow-lite-examples \
> +                                tensorflow-lite \
>                                  pdm-anomaly-detection \
>  "
>  
> @@ -170,12 +172,14 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
>                                     arm-compute-library \
>                                     ${ARMNN_PACKAGES} \
>                                     tensorflow-lite-examples \
> +                                   tensorflow-lite \
>                                     pdm-anomaly-detection \
>  "
>  
>  EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
>                               ${ARMNN_PACKAGES} \
>                               tensorflow-lite-examples \
> +                             tensorflow-lite \
>                               pdm-anomaly-detection \
>  "
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

