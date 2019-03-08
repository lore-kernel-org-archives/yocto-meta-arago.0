Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E76F3529A4
	for <meta-arago@arago-project.org>;
	Fri,  8 Mar 2019 21:08:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28L7xCW122722
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 15:07:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552079279;
	bh=OhVoWCqSIIjiX7i1yue9OlJaL2OlflqbC1755eM3WDs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=d6tPejJWa9A726BQKJP1zh9kswsmOB6OV39uWC1toQc0qVQEiupBrskdkf4E0Ms5x
	XDYI0DW+TlBR2Pq0MRDniYDs544ReR329wHMh71UMBW/uN99YgQ3Y6D3DLYV3u+pFA
	2RlxxYcdU+NLb7mik2JzekzPS/NY4bVNY3qniwG4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28L7xVO041727
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 15:07:59 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 15:07:59 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 15:07:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x28L7xrj017797;
	Fri, 8 Mar 2019 15:07:59 -0600
Date: Fri, 8 Mar 2019 16:07:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20190308210758.GC26510@beryl>
References: <1552051785-31309-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1552051785-31309-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v3] tidl-utils: add new features; change license checksum
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
X-List-Received-Date: Fri, 08 Mar 2019 21:08:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

The gold rule of every commit message is to answer the "Why?" question, not 
"What?". The code change in the patch itself covers "What?", the commit 
message should explain "Why?" - why those changes are being made?

Let's see:
> add new features;

Update to add new features, fine.


> change license checksum

Yeah, the license checksum is being changed, but why?

We've just gone through the same excercise with Mahesh, just on meta-ti list:
https://lists.yoctoproject.org/pipermail/meta-ti/2019-March/thread.html


On Fri, Mar 08, 2019 at 08:29:45AM -0500, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
> Change from previous version of patch: commit message modification
> ---
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb | 8 ++++----
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb      | 2 +-
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc     | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> index 1291f9d..bef2d1a 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> @@ -5,10 +5,10 @@ DESCRIPTION = "TIDL import tool is using protobuf to read and parse information
>  require ./tidl-utils.inc
>  
>  LICENSE = "BSD-3"
> -LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;md5=7baa68fec0aadbac92c3b41b283d26c4"
> +LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
>  
> -PV = "01.00.00.00"
> -PR = "r1"
> +PV = "01.01.00.00"
> +PR = "r0"
>  
>  S = "${WORKDIR}/git/src/importTool/"
>  
> @@ -21,7 +21,7 @@ EXTRA_OEMAKE += "CORE=eve"
>  EXTRA_OEMAKE += "TARGET_BUILD=release"
>  EXTRA_OEMAKE += "TARGET_PLATFORM=PC"
>  
> -EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUX_IMPORT_TOOL=64BIT PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include"
> +EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUXENV=x86 LINUX_IMPORT_TOOL=64BIT PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include"
>  EXTRA_MAKE_ARGS_class-target = "LINUX_BUILD_TOOLS=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PROTOBUF_LIB_DIR=${STAGING_LIBDIR} PROTOBUF_INC_DIR=${STAGING_INCDIR} LINUXENV=oearm"
>  
>  EXTRA_OEMAKE += "${EXTRA_MAKE_ARGS}"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> index e065e17..69b6e29 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> @@ -5,7 +5,7 @@ LICENSE = "TI-TFL"
>  
>  require ./tidl-utils.inc
>  
> -PV = "1.0.0.1"
> +PV = "1.0.1.0"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> index 37ce84d..9ccabdd 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -1,2 +1,2 @@
>  SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> -SRCREV = "0021b6f15ee4a1a8919905429a5045fd02afe5b1"
> +SRCREV = "057984b05e143a4740ecec3dd28cfa082927b897"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

