Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F05E1520E5
	for <meta-arago@arago-project.org>;
	Thu,  7 Mar 2019 22:15:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x27MFYb9010249
	for <meta-arago@arago-project.org>; Thu, 7 Mar 2019 16:15:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551996934;
	bh=N3/8xLLPt9+oKAWdWQa5ESQCDsMWmqRxk9nhB14xDNQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MkKhKurKuaqSgi3Gi729lJG/j3FH8yHwfPhoQgcak1azK0BoU7KGUm81Ej/ckIl/1
	EOLUuBn0IAaIREnZbLau8v5tyrQglaGbA+y0Dja7hQgzitPZb0wgK5mpcuLgnApzRT
	zTvVL8W0UvTbRvBDi5Okmz06zYz9khmVwFE0GlWs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x27MFYpb124207
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 7 Mar 2019 16:15:34 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 7 Mar 2019 16:15:33 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 7 Mar 2019 16:15:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x27MFXS6010161;
	Thu, 7 Mar 2019 16:15:33 -0600
Date: Thu, 7 Mar 2019 17:15:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20190307221533.GH26081@beryl>
References: <1551825813-41508-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551825813-41508-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] tidl-utils: add new features; change checksum
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
X-List-Received-Date: Thu, 07 Mar 2019 22:15:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, but you still didn't explain in the commit message why the license 
checksum has changed. If the header is exactly the same as before, just 
mention that only the header is now calculated, not the entire file.


On Tue, Mar 05, 2019 at 05:43:33PM -0500, Jianzhong Xu wrote:
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

