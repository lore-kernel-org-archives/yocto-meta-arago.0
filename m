Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 05C2D529AE
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 00:40:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x250eqtI074548
	for <meta-arago@arago-project.org>; Mon, 4 Mar 2019 18:40:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551746452;
	bh=a6fp3lS90U2fChekXcmBdS+8XJ/CC8dwVYmaup7se/g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=L2mBlkjxti6BTYqebGSXTBncfjuHGpx2a3mEeSNqygnZCLsvhahCAGwHQ8HtilulJ
	vpF263OgyQ1zHL6oix7MO+D95/NVjxeDr8PJJzzyO6zlSgVafAWNXByuOPK1xhsPdC
	qOm1kxgXQY5uwVd10cRzx8c/NqDoShHk42CTcHz4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x250eqCJ065713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 4 Mar 2019 18:40:52 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 18:40:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 18:40:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x250epRw015567;
	Mon, 4 Mar 2019 18:40:51 -0600
Date: Mon, 4 Mar 2019 19:40:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20190305004051.GP26081@beryl>
References: <20190304225038.110745-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190304225038.110745-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ocl: update version to 01.01.18.00
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
X-List-Received-Date: Tue, 05 Mar 2019 00:40:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2019 at 04:50:38PM -0600, Yuan Zhao wrote:
> - Runtime support update for TIDL API 01.03.00
> - Update OpenCL TIDL firmware to 01.01.18.00

Thanks! Please see below.


> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/ocl.inc               | 6 +++---
>  meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index 96d1836f..21247177 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,6 +1,6 @@
>  # patch version at the end needs to be in double digits
> -PV = "1.1.17.01"

You would need to rebase - we are already on version 1.1.17.02:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=1b77a721090738e30d6a297a2892f551e66915bd


> -INC_PR = "r1"
> +PV = "1.1.18.00"
> +INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
>  
> @@ -10,7 +10,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL = "git"
>  OCL_GIT_BRANCH = "master"
>  
> -OCL_SRCREV = "61d9dbae3ee40f8023ec624601c2a0cc9e80220f"
> +OCL_SRCREV = "a50d8b41cc30bdf4faf1998ec3fc7d0a3093b795"
>  
>  BRANCH = "${OCL_GIT_BRANCH}"
>  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> index a47d9128..a9ec413a 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
>  
> -PV = "01.01.17.01"
> +PV = "01.01.18.00"
>  PR = "r0"
>  
>  require recipes-ti/includes/arago-paths.inc
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
>  GIT_PROTOCOL = "git"
>  BRANCH       = "master"
> -SRCREV       = "2f1715affab9ef4debf02769cf113dc1922cf75f"
> +SRCREV       = "3b98f405d98416a66678dec01d8f7ef244f379b6"
>  
>  SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
>  
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

