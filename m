Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 5D56552990
	for <meta-arago@arago-project.org>;
	Tue, 12 Dec 2017 20:05:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBCK5lLB014242
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 14:05:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513109147;
	bh=RwoLk40d6zoZrXU1J/jVG8ITE4n1Y4Brhld2ZOzOVZE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=R8GbC85kYdo33IMgcpRcgfrF8yagvO9hE8FAXH9KjDjvOHSYxARL/3Qf9N1d+5grS
	Ntb7v5v7Bq/1/jlShPBkqioNE5IFYK7IS9Apt1DzN1iiPCf0D/SKl8yBIsXW68SuyJ
	9UNTBl1DvYTAc73FOHXptvqLc+HK7qjcHuABGBEc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBCK5lZm031518
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 14:05:47 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 12 Dec 2017 14:05:47 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 12 Dec 2017 14:05:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBCK5kTv010585;
	Tue, 12 Dec 2017 14:05:47 -0600
Date: Tue, 12 Dec 2017 15:05:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gaurav Mitra <gaurav@ti.com>
Message-ID: <20171212200531.GB28177@edge>
References: <20171212170940.5147-1-gaurav@ti.com>
MIME-Version: 1.0
In-Reply-To: <20171212170940.5147-1-gaurav@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Patch to integrate OCL v01.01.14.08 with fix for ICD conformance with gcc7.2
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
X-List-Received-Date: Tue, 12 Dec 2017 20:05:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! I'll give it a try.


On Tue, Dec 12, 2017 at 11:09:40AM -0600, Gaurav Mitra wrote:
> Signed-off-by: Gaurav Mitra <gaurav@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/ocl.inc       | 4 ++--
>  meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index 9a3fb70d..ffa3cbee 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,4 +1,4 @@
> -PV = "1.1.14.7"
> +PV = "1.1.14.8"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL = "git"
>  OCL_GIT_BRANCH = "master"
>  
> -OCL_SRCREV = "2be51882b5c1f0f8a97fddcc7e8db2b09db41dfe"
> +OCL_SRCREV = "caf4a0e55831ea34e3659e81877aaffde29ccfd1"
>  
>  BRANCH = "${OCL_GIT_BRANCH}"
>  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> index 4daef6b1..fdc822d0 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> @@ -35,6 +35,7 @@ DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
>  DEPENDS_append_keystone = " mpm-transport multiprocmgr"
>  DEPENDS_remove_k2g = " libulm"
>  
> +RDEPENDS_${PN} += " bash"
>  RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
>  RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
>  
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

