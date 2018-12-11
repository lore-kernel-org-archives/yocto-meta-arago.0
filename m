Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 919545298A
	for <meta-arago@arago-project.org>;
	Tue, 11 Dec 2018 01:50:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBB1oE6V031425
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 19:50:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544493014;
	bh=TAixOpHtFZnteoplgGaCRiQCPoEM9GmsyPW3YLLkCTM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gdnyQD7zhcnUuhNVmOMA8tfbOgpj5WMNEihJs3aCVkHWCHJAWSJlIlyJQa0uOfT6y
	jotxLOH9nkWbdPLxWjSZqMK6doQVsRG+whPTPo/eb+YilIS0J+uP10CmivjhpWntt1
	3FzHqRKM/9bjgYGL1gQQ6RTigRq4IGinnyriavqE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBB1oEw7108252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 19:50:14 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 10 Dec 2018 19:50:13 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 10 Dec 2018 19:50:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBB1oD5B021294;
	Mon, 10 Dec 2018 19:50:13 -0600
Date: Mon, 10 Dec 2018 20:50:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20181211015013.GB21516@beryl>
References: <1544036283-56867-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1544036283-56867-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master] [PATCH] tidl-utils: add TIDL import tool source compilation.
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
X-List-Received-Date: Tue, 11 Dec 2018 01:50:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 05, 2018 at 01:58:03PM -0500, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  .../nativesdk-packagegroup-arago-sdk-host.bb       |  1 +
>  .../recipes-ti/tidl-utils/tidl-import.bb           | 43 ++++++++++++++++++++++
>  .../recipes-ti/tidl-utils/tidl-utils.bb            |  7 ++--
>  .../recipes-ti/tidl-utils/tidl-utils.inc           |  5 +++
>  4 files changed, 52 insertions(+), 4 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import.bb
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> 
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
> index 4f8e62b..53cf9b1 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
> @@ -11,6 +11,7 @@ EXTRA_TI_TOOLS = " \
>      nativesdk-ti-cgt-pru \
>      nativesdk-clocl \
>      nativesdk-clacc \
> +    nativesdk-tidl-import \
>  "
>  
>  RDEPENDS_${PN} = "\
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import.bb
> new file mode 100644
> index 0000000..30bfa2e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = " TIDL import tool for conversion of Caffe and TF models into TI custom network format "
> +DESCRIPTION = "TIDL import tool is using protobuf to read and parse information from external network models \
> +               This is ARM Linux implementation."
> +
> +require ./tidl-utils.inc
> +
> +LICENSE = "BSD-3"
> +LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;md5=7baa68fec0aadbac92c3b41b283d26c4"
> +
> +PV = "01.00.00.00"
> +PR = "r1"
> +
> +S = "${WORKDIR}/git/src/importTool/"
> +
> +DEPENDS=" protobuf zlib protobuf-native"
> +
> +EXTRA_OEMAKE += "TIARM_TOOLS=${GCC_ARM_NONE_TOOLCHAIN} "
> +EXTRA_OEMAKE += "XDAIS_PATH=${XDAIS_INSTALL_DIR} "
> +EXTRA_OEMAKE += "SHOW_COMMANDS=1"
> +EXTRA_OEMAKE += "CORE=eve "
> +EXTRA_OEMAKE += "TARGET_BUILD=release "
> +EXTRA_OEMAKE += "TARGET_PLATFORM=PC"
> +
> +EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUX_IMPORT_TOOL=64BIT PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include"
> +EXTRA_MAKE_ARGS_class-target = "LINUX_BUILD_TOOLS=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PROTOBUF_LIB_DIR=${STAGING_LIBDIR} PROTOBUF_INC_DIR=${STAGING_INCDIR} LINUXENV=oearm"
> +
> +EXTRA_OEMAKE += "${EXTRA_MAKE_ARGS}"
> +
> +do_compile() {
> +    cd ${S}/modules/ti_dl/utils
> +    ./genProtoSrc.sh
> +    cd ${S}
> +    oe_runmake -C modules/ti_dl/utils/tidlModelImport
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/modules/ti_dl/utils/tidlModelImport/out/tidl_model_import.out ${D}${bindir}
> +}
> +
> +INSANE_SKIP_${PN} = "ldflags"
> +
> +BBCLASSEXTEND=" native nativesdk "
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> index 569de5a..575a0a0 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> @@ -3,16 +3,15 @@ DESCRIPTION = "TIDL Utilities for standalone simulation and importing / translat
>  HOMEPAGE = "http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Foundational_Components.html#tidl"
>  LICENSE = "TI-TFL"
>  
> -PV = "1.0.0.0"
> +require ./tidl-utils.inc
> +
> +PV = "1.0.0.1"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
>  
>  RDEPENDS_${PN}_class-target += " tidl-api tidl-examples "
>  
> -SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> -SRCREV = "994d90ae583610673d9d39086ca5e84027a9c56e"
> -
>  PR = "${INC_PR}.0"
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> new file mode 100644
> index 0000000..a51d4ba
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -0,0 +1,5 @@
> +SUMMARY = "TIDL utils SRC URI"

Why set SUMMARY here in .inc file if it will be overwritten?


Can you also please cleanup the files - there are lots of extra white spaces 
where they are not needed and vice versa...


> +SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> +SRCREV = "0021b6f15ee4a1a8919905429a5045fd02afe5b1"
> +
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

