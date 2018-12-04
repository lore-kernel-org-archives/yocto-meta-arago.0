Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id DCAC6529A6
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 21:04:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4L4Akl012998
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:04:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543957450;
	bh=errCLwFzjNF4dnsPd4SrMVL5Yc4TrkiWZ3LGiKOFcys=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KYefvDSomHCzwMVDoE+G5FySLgpHvahb1JiL+Oyu5DjmDTagWiB2kYAzCjKJi20r5
	ConaNNpZ6e9MuWKsKqX/xt0GtWNr9ijwBXtRVr8nQCjlEKXrpccRcWok8f3fM79Uea
	l5Y887BCsoph0ZdyMrUBWhDb4y62YG3rV6AVz+cs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4L4AkB047451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:04:10 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 15:04:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 15:04:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4L4AEm017265;
	Tue, 4 Dec 2018 15:04:10 -0600
Date: Tue, 4 Dec 2018 16:04:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20181204210410.GS6887@beryl>
References: <20181204204833.27940-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20181204204833.27940-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] tidl-api: update to version 1.2.0
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
X-List-Received-Date: Tue, 04 Dec 2018 21:04:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 04, 2018 at 02:48:33PM -0600, Yuan Zhao wrote:
> - Minimized TIDL API/OpenCL dispatch overhead using multiple execution
>   contexts on devices.  Added MNIST example for demonstration.
> - Execution graph generation with timestamps.
> - Python 3 bindings for TIDL API.
> - Add a top level license file.

Is the license the same, just moved to a separate file?


> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc         | 6 +++---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 2 ++
>  meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 ++
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index fb37a249..1b1167ec 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,11 +1,11 @@
> -PV = "1.1.0.1"
> +PV = "1.2.0"

I see you changed it back to not have leading zeros. I'm fine either way.


>  INC_PR = "r0"
>  
> -LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"
> +LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
>  
>  GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
>  GIT_PROTOCOL = "git"
>  BRANCH = "master"
>  
>  SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
> +SRCREV = "03978a83b03d8881261222344d1a08e0f4e2bd06"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index 47e98ef9..fbea9aa8 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -11,6 +11,8 @@ PR = "${INC_PR}.0"
>  COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> +inherit python3native
> +
>  DEPENDS = "opencv \
>             opencl \
>             opencl-monitor \
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> index 94f215c3..2f5ca537 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -15,11 +15,13 @@ DEPENDS = "opencv \
>             clocl-native \
>             ti-cgt6x-native \
>             tidl-api \
> +           json-c \
>  "
>  
>  RDEPENDS_${PN} += "tidl-api \
>                     opencl-runtime \
>                     opencv \
> +                   json-c \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

