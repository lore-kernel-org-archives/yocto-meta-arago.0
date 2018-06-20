Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6DF40529DB
	for <meta-arago@arago-project.org>;
	Wed, 20 Jun 2018 12:21:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5KCLct3025528
	for <meta-arago@arago-project.org>; Wed, 20 Jun 2018 07:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529497298;
	bh=FZ6DxlHtSCkJRJq2lS06UPkydlDLhpFtS9L27qmH0VQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=rVySgmHJ6AggaC2cHr0dFIanVjGj4P7wKbaQXtSN/WSRZm01B2iJQu6YdOKJa+SY3
	/XDmnNtRRV2R5T8eSN8+YgfDuLzF5URmx8IxS0GzAmWTdjLWYbOI+DkK5dPQ2lmVTr
	hYjAGSNayBpDLch8dMFD2uAX3mqUgdEINkFGpqDk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5KCLcCv011002
	for <meta-arago@arago-project.org>; Wed, 20 Jun 2018 07:21:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 20 Jun 2018 07:21:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 20 Jun 2018 07:21:38 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5KCLb1H003605;
	Wed, 20 Jun 2018 07:21:37 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20180531151451.21291-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ee344fa3-70f5-c663-37e4-93a8f72d92d6@ti.com>
Date: Wed, 20 Jun 2018 08:21:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180531151451.21291-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] tidl-api: Initial release v01.00.00
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
X-List-Received-Date: Wed, 20 Jun 2018 12:21:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,


Can you please apply this to the ti2018.01 branch?


Thanks,

Jake


On 5/31/2018 11:14 AM, Yuan Zhao wrote:
> - Recipes for building from repository for TI Deep Learning (TIDL) API.
>    Repo contains the API, examples, and a TIDL network viewer.
> - Recipes: tidl-examples, tidl-viewer, tidl-viewer-native
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 11 +++++
>   .../recipes-ti/tidl-api/tidl-examples_git.bb       | 47 ++++++++++++++++++++++
>   .../recipes-ti/tidl-api/tidl-viewer_git.bb         | 32 +++++++++++++++
>   3 files changed, 90 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
>   create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
>   create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> new file mode 100644
> index 00000000..d266611c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -0,0 +1,11 @@
> +PV = "1.0.0.0"
> +INC_PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
> +
> +GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
> +GIT_PROTOCOL = "git"
> +BRANCH = "master"
> +
> +SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> +SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> new file mode 100644
> index 00000000..be9bb65f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -0,0 +1,47 @@
> +SUMMARY = "TIDL API and examples"
> +DESCRIPTION = "TIDL API and examples of API usage. Refer TIDL API User's Guide for details."
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
> +LICENSE = "BSD"
> +
> +include tidl-api.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +DEPENDS = "opencv opencl opencl-monitor ti-cgt6x-native clocl-native"
> +
> +RDEPENDS_${PN} += " opencl-runtime opencv"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = " -C ${S}/examples \
> +                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
> +                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> +"
> +
> +do_compile() {
> +  oe_runmake
> +}
> +
> +CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +do_install() {
> +    install -d ${D}${datadir}/ti/tidl-api
> +    install -d ${D}${datadir}/ti/tidl-api/examples
> +    install -d ${D}${datadir}/ti/tidl-api/tidl_api
> +    install -d ${D}${datadir}/ti/tidl-api/viewer
> +    cp ${CP_ARGS} ${S}/examples/* ${D}${datadir}/ti/tidl-api/examples/
> +    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${datadir}/ti/tidl-api/tidl_api/
> +    cp ${CP_ARGS} ${S}/viewer/* ${D}${datadir}/ti/tidl-api/viewer/
> +    install ${S}/readme.md ${D}${datadir}/ti/tidl-api/
> +}
> +
> +FILES_${PN} += "\
> +    ${datadir}/ti/tidl-api \
> +"
> +
> +
> +INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> new file mode 100644
> index 00000000..3c761747
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "TIDL Network Viewer"
> +DESCRIPTION = "TIDL Network viewer using dot and graphviz"
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
> +LICENSE = "BSD"
> +
> +include tidl-api.inc
> +
> +PR = "${INC_PR}.0"
> +
> +DEPENDS = "boost boost-native ti-cgt6x-native clocl-native"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET_class-target = "arm"
> +TARGET_class-native = "x86"
> +TARGET_class-nativesdk = "x86"
> +
> +EXTRA_OEMAKE = " -C ${S}/viewer \
> +                 TARGET=${TARGET} \
> +                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
> +"
> +
> +do_compile() {
> +  oe_runmake
> +}
> +
> +do_install() {
> +  install -d ${D}${bindir}
> +  install -m 755 ${S}/viewer/${TARGET}/tidl_viewer ${D}${bindir}
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"


