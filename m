Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 74F39520C0
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 17:59:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EHwmTV008534
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560535128;
	bh=Z3MTuXlVXS+AmgAQcalmZFS+FkLr9SJiskJAjp7IcW0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=b/H/klt/ZtAsEGa+4+K6ZlGTEWiN+aNhwFhsVYfdzfjHMu2s549iT7R0WXKSqsTkJ
	zhEkgrNUZbklK101PXplQoYezPhoKb6aE78dApr+w8M078n3s5+oOi6VKthS32v/DK
	PFBLkCunFSORjtVz2ugw1fkJPF9CemUmtCIWIAFE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EHwmv7047947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:58:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 12:58:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 12:58:47 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EHwlC9042590;
	Fri, 14 Jun 2019 12:58:47 -0500
To: Jianzhong Xu <xuj@ti.com>, <meta-arago@arago-project.org>
References: <20190614151128.6908-1-xuj@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <66b9e66d-fd83-f327-8d0a-bb54d1d98d0d@ti.com>
Date: Fri, 14 Jun 2019 13:58:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614151128.6908-1-xuj@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master/thud][PATCH] tidl-utils: bump SRCREV and remove patch
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
X-List-Received-Date: Fri, 14 Jun 2019 17:59:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you backport this to ti2019.01?


Thank you,

Jake


On 6/14/2019 11:11 AM, Jianzhong Xu wrote:
> * Pick up tidl related developments for 6.0
> * Remove tidl-import patch with source fix to disable static linking
> * Consolidate "PV" and "PR" to tidl-utils.inc
>
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>   .../tidl-utils/tidl-import/disable_static.patch  | 16 ----------------
>   .../recipes-ti/tidl-utils/tidl-import_git.bb     |  5 -----
>   .../recipes-ti/tidl-utils/tidl-utils.bb          |  5 -----
>   .../recipes-ti/tidl-utils/tidl-utils.inc         |  6 +++++-
>   4 files changed, 5 insertions(+), 27 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
> deleted file mode 100644
> index 23377af5..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -diff --git a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
> -index 374f862..521f0dc 100644
> ---- a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
> -+++ b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
> -@@ -103,9 +103,9 @@ ifeq ($(PLATFORM_BUILD), x86)
> - ifeq ($(LINUX_IMPORT_TOOL), 64BIT)
> - CFLAGS+= -DPLATFORM_64BIT
> - endif
> --LDFLAGS+= -lstdc++ -static
> -+LDFLAGS+= -lstdc++
> - else
> --LDFLAGS+= -lstdc++ -lz -static
> -+LDFLAGS+= -lstdc++ -lz
> - endif
> - endif
> -
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> index 9f1c5bba..b7c9d7af 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> @@ -7,11 +7,6 @@ require ./tidl-utils.inc
>   LICENSE = "BSD-3"
>   LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
>   
> -PV = "01.01.00.00"
> -PR = "r1"
> -
> -SRC_URI_append = " file://disable_static.patch;pnum=3"
> -
>   S = "${WORKDIR}/git/src/importTool/"
>   
>   DEPENDS = "protobuf zlib protobuf-native"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> index 69b6e297..554cf09a 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> @@ -5,15 +5,10 @@ LICENSE = "TI-TFL"
>   
>   require ./tidl-utils.inc
>   
> -PV = "1.0.1.0"
> -INC_PR = "r0"
> -
>   LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
>   
>   RDEPENDS_${PN}_class-target += "tidl-api tidl-examples"
>   
> -PR = "${INC_PR}.0"
> -
>   S = "${WORKDIR}/git"
>   
>   TARGET_class-target = "arm"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> index 9ccabdd6..2c29fc27 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -1,2 +1,6 @@
>   SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> -SRCREV = "057984b05e143a4740ecec3dd28cfa082927b897"
> +SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
> +
> +PV = "01.01.01.00"
> +PR = "r0"
> +

