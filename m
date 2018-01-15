Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id CDE0752A12
	for <meta-arago@arago-project.org>;
	Mon, 15 Jan 2018 20:51:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FKouB3014763
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 14:50:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516049456;
	bh=Y2mV+yWzR1dyIOTuJco5LmJicH7PNp1M8tn9F68Xf4U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yqxtMRHiaDdJU2djz1lM6hNuEttNk6A7dJhnnckg6xBlV+kuDnPZlkuug4KFmpPxI
	Lx3nzQ84JIPU5FJYPpYpm8jPz1EW667Ql5qiXws7MGUwHHWtH5v1GCC26N0CUcLoJc
	y0Uxps5SxpDlflNxYR21hUEAFyfvS2jNS0bxSmoU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FKous5000643
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 14:50:56 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 14:50:55 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 15 Jan 2018 14:50:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FKotiF030634;
	Mon, 15 Jan 2018 14:50:55 -0600
Date: Mon, 15 Jan 2018 15:50:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gaurav Mitra <gaurav@ti.com>
Message-ID: <20180115205055.GA31682@edge>
References: <20171221220415.101279-1-gaurav@ti.com>
MIME-Version: 1.0
In-Reply-To: <20171221220415.101279-1-gaurav@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ocl, ocl-rtos: OpenCL RTOS Eclipse plugin generation and signature moved to yocto build
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
X-List-Received-Date: Mon, 15 Jan 2018 20:51:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This has not been applying cleanly to morty due to previous changes and had to 
be rebased. But since I failed to report it before the holidays and vacation, 
I fixed it myself for this time.


On Thu, Dec 21, 2017 at 04:04:15PM -0600, Gaurav Mitra wrote:
> Signed-off-by: Gaurav Mitra <gaurav@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb | 1 -
>  meta-arago-extras/recipes-ti/ocl/ocl.inc                 | 4 ++--
>  meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb  | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> index 41b66534..88b94215 100644
> --- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
> @@ -73,7 +73,6 @@ do_compile() {
>          -DARM_LLVM_DIR=${ARM_LLVM_DIR} \
>          -DOCL_VERSION=${PV} ../git/host;
>      make install
> -    make -C eclipse install
>      make -C packages install
>      cd ..
>  }
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index ffa3cbee..b2c90671 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,4 +1,4 @@
> -PV = "1.1.14.8"
> +PV = "1.1.14.10"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL = "git"
>  OCL_GIT_BRANCH = "master"
>  
> -OCL_SRCREV = "caf4a0e55831ea34e3659e81877aaffde29ccfd1"
> +OCL_SRCREV = "4669e010c35591154872d2364be720dc12b6b112"
>  
>  BRANCH = "${OCL_GIT_BRANCH}"
>  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> index 0f769f4d..2a9fccc5 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> @@ -10,7 +10,7 @@ PR = "${INC_PR}.1"
>  COMPATIBLE_MACHINE = "dra7xx|keystone"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -DEPENDS = "opencl ti-cgt6x-native clocl-native"
> +DEPENDS = "opencl opencl-monitor ti-cgt6x-native clocl-native"
>  
>  OCL_PERSISTENT_DEPENDS = "ti-xdctools ti-ipc-rtos ti-sysbios"
>  
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

