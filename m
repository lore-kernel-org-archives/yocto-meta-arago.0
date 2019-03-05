Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id EEA3D529CA
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 20:37:26 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25KbKgO026182
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 14:37:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551818240;
	bh=Gs1Pf+HHSogo0uRhlBzM4OV+/n7WIDUNxxdzLV/IQc8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CDEAaYahEaHJwFL3QGHSAHA19Jk6JFTK3ep7GWLYYp0sxv3F2Czx9bOcp8W7VCaw4
	Xy5sPtfNPnMX/Nt/8C7Rla7qoMTPfPKhitIMQyCna3MM8h2kNRVIylFFinJrjmKO6+
	BMao+9GeBd5QIoGkWTV/3gDFMYIHuZlzXGb2iNAM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25KbKXA122320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 14:37:20 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 14:37:19 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 14:37:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25KbIQL013016;
	Tue, 5 Mar 2019 14:37:19 -0600
Date: Tue, 5 Mar 2019 15:37:18 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20190305203718.GF26081@beryl>
References: <1551818165-40178-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551818165-40178-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tidl-utils: add new features
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
X-List-Received-Date: Tue, 05 Mar 2019 20:37:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 05, 2019 at 03:36:05PM -0500, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb | 8 ++++----
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb      | 2 +-
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc     | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> index 1291f9d..3d9c275 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> @@ -5,10 +5,10 @@ DESCRIPTION = "TIDL import tool is using protobuf to read and parse information
>  require ./tidl-utils.inc
>  
>  LICENSE = "BSD-3"
> -LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;md5=7baa68fec0aadbac92c3b41b283d26c4"
> +LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;md5=ad5c2b85a36ac5c1f5db4ebd6fce3933"

^^^


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

