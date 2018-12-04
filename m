Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 80CBF52092
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 17:19:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4HJVSd079034
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 11:19:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543943971;
	bh=GFDL0Vhtbv999VOoQqRj+4tYx0fXjtoeqPqKcplHLlY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dYE2A7brZnW3ililHt3x+c8zb+nO/mjHXzsHq1JwY1u/Fh4JVH/EAz5QHPzHCUvD9
	1m/DnZepDO2SlVJozqPq+76rYjzPWXh4X44Kn5JQintmsFv9cvOQv6HCgms/p1539n
	32jYZjhnhgoVSFlhs2TTpedBOGGjuo/sfjrfpEFQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4HJVZc098411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 11:19:31 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 11:19:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 11:19:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4HJUMN019949;
	Tue, 4 Dec 2018 11:19:31 -0600
Date: Tue, 4 Dec 2018 12:19:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20181204171930.GK6887@beryl>
References: <20181129230928.90335-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20181129230928.90335-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tidl-api: update to version 01.02.00
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
X-List-Received-Date: Tue, 04 Dec 2018 17:19:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 29, 2018 at 05:09:28PM -0600, Yuan Zhao wrote:
> - Minimized TIDL API/OpenCL dispatch overhead using multiple execution
>   contexts on devices.  Added MNIST example for demonstration.
> - Execution graph generation with timestamps.
> - Python 3 bindings for TIDL API.
> 
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc         | 6 +++---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 1 +
>  meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 ++
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index fb37a249..b3115c23 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,11 +1,11 @@
> -PV = "1.1.0.1"
> +PV = "01.02.00"

Is this being embedded in the binary and you need it with leading zeros?


>  INC_PR = "r0"
>  
> -LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"
> +LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"

Every time license file or checksum changes, it raises questions. To avoid 
such questions, please provide explanation in the commit log.


>  GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
>  GIT_PROTOCOL = "git"
>  BRANCH = "master"
>  
>  SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
> +SRCREV = "03978a83b03d8881261222344d1a08e0f4e2bd06"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index 47e98ef9..efd705af 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -16,6 +16,7 @@ DEPENDS = "opencv \
>             opencl-monitor \
>             ti-cgt6x-native \
>             clocl-native \
> +           python3 \

You probably want to inherit python3native and/or (R)DEPENDS on python3-core 
instead of python3 here.


>  "
>  
>  RDEPENDS_${PN} += "opencl-runtime \
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

