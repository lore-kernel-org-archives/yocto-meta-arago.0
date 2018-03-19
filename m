Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3790152970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 19:05:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JJ48v7004985
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 14:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521486248;
	bh=LkEJfUEktpG3U1dOttx1yaiIjFP5VSmUk1mdbAb/AUU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=v++yQqyK8V/W6GbXSDel0yFbXTwNes+goLqYKqLcjoTflGqueR9wwevOuZamHsLU7
	x4At3JpcTzUAQdEKQ4mYf+vpPkmlB9/JHKYtSeuaMSn7RFAPqIvb6akaW9Zi+0yuCB
	ocSRDUW7phs4Btg7La2S4XgtptC6BWduPbHykwKc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JJ48V6028856
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 14:04:08 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 14:04:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 14:04:05 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JJ447E032295;
	Mon, 19 Mar 2018 14:04:04 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
	<1521484541-8104-6-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6e4d0f9b-5504-bf68-310f-3bbb77ecf38e@ti.com>
Date: Mon, 19 Mar 2018 15:04:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521484541-8104-6-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk 5/6] [PATCH] tiovx-app-host: enable compilation of app-host and tutorial example on target
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
X-List-Received-Date: Mon, 19 Mar 2018 19:05:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/19/2018 2:35 PM, Hongmei Gou wrote:
> * Copy source files and makefiles to target
> * Create setenv.sh and copy it to target
> * Create examples package with tiovx-lib-host dependencies specified
> * Build procedure on target: "source setenv.sh; make"
>
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-ti/tiovx/tiovx-app-host.bb | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
> index eb312b3..093025e 100644
> --- a/recipes-ti/tiovx/tiovx-app-host.bb
> +++ b/recipes-ti/tiovx/tiovx-app-host.bb
> @@ -4,13 +4,19 @@ DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conform
>   LICENSE = "BSD-3-Clause & MIT"
>   LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_01.00.01.00_manifest.html;md5=247d7c56d783f583bf802490d5c93db3"
>   
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI_append += "\
> +     file://setenv.sh \
> +"
> +
>   require recipes-ti/includes/tisdk-paths.inc
>   require tiovx-sys.inc
>   
>   DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv"
>   RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem "
>   
> -PR = "r1"
> +PR = "r2"
>   
>   COMPATIBLE_MACHINE = "dra7xx"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -28,10 +34,23 @@ do_install () {
>       install -d ${D}${bindir}/
>       install -m 0755 ${S}/host/bin/debug/app_host ${D}${bindir}/tiovx-app_host
>       install -m 0755 ${S}/khronos_example/bin/debug/opticalflow ${D}${bindir}/tiovx-opticalflow
> +
> +    oe_runmake clean
> +    install -d ${D}${datadir}/ti/examples/openvx
> +    install -m 644 ${S}/products.mak ${D}${datadir}/ti/examples/openvx
> +    install -m 644 ${S}/makefile ${D}${datadir}/ti/examples/openvx
> +    install -m 644 ${WORKDIR}/setenv.sh ${D}${datadir}/ti/examples/openvx
> +    cp -r ${S}/host ${D}${datadir}/ti/examples/openvx
> +    cp -r ${S}/khronos_example  ${D}${datadir}/ti/examples/openvx
> +    cp -r ${S}/shared ${D}${datadir}/ti/examples/openvx
>   }
>   
> +PACKAGES += "${PN}-examples"
> +FILES_${PN}-examples = "${datadir}/ti/examples/openvx"
> +RDEPENDS_${PN}-examples = "tiovx-lib-host-staticdev tiovx-lib-host-dev"
> +
>   CREATE_SRCIPK = "1"
>   SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
>   
>   FILES_${PN} += "${bindir}/*"
> -INSANE_SKIP_${PN} = "ldflags"
> +INSANE_SKIP_${PN} = "ldflags dev-deps"

Is this dev-deps skip necessary? Nothing changed in the dependencies of 
the main package.


