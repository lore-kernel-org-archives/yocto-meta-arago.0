Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C3F9352970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 22:11:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JMAYSv027410
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 17:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521497434;
	bh=d1kOxx5LUVMCdmeuMZYAgwLpUDi2V7JgiDwoo1Vi8Mo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ZtyoSFLFOxKYEW1Q+RTOevBfBlCB2He8M5w2OgpTjMExtsBt66ObuoHr8ZJexmvEq
	kGUSVXsKp7dBfUlOcxgDdTUB7WK4myks1X+7hOx/r6HagynO8i6auIejPCU88OUdmM
	8dINBSJOpFWVs9rKgW9aHDAKZPtOCeVOtMEVXFWg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JMAY5I032261
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 17:10:34 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 17:10:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 17:10:33 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JMAXDR024287;
	Mon, 19 Mar 2018 17:10:33 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1521496586-2283-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <295654e8-83e3-be2f-3863-f151f6bbc572@ti.com>
Date: Mon, 19 Mar 2018 18:10:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521496586-2283-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] tiovx-sys-iface: use update-alternatives for the firmware
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
X-List-Received-Date: Mon, 19 Mar 2018 22:11:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/19/2018 5:56 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-ti/tiovx/tiovx-sys-iface.bb | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-ti/tiovx/tiovx-sys-iface.bb b/recipes-ti/tiovx/tiovx-sys-iface.bb
> index 4462749..bcfbcc9 100644
> --- a/recipes-ti/tiovx/tiovx-sys-iface.bb
> +++ b/recipes-ti/tiovx/tiovx-sys-iface.bb
> @@ -7,11 +7,13 @@ LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html
>   require recipes-ti/includes/tisdk-paths.inc
>   require tiovx-sys.inc
>   
> -PR = "r1"
> +PR = "r0"

The PR value should not be decreased.

>   
>   COMPATIBLE_MACHINE = "dra7xx"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> +inherit update-alternatives
> +
>   S = "${WORKDIR}/git"
>   
>   do_install () {
> @@ -24,6 +26,13 @@ do_install () {
>       install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx
>   }
>   
> +ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
> +ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66"
> +ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66.openvx"
> +ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66"
> +ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx"

This looks fine, but it may be better to follow the examples in 
opencl-monitor to use ${BPN} instead of the hard-coded "openvx".

E.g.:

ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = 
"${base_libdir}/firmware/dra7-dsp1-fw.xe66"
ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = 
"${base_libdir}/firmware/dra7-dsp1-fw.xe66.${BPN}"
ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = 
"${base_libdir}/firmware/dra7-dsp2-fw.xe66"
ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = 
"${base_libdir}/firmware/dra7-dsp2-fw.xe66.${BPN}"


> +ALTERNATIVE_PRIORITY = "20"
> +
>   FILES_${PN} += "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
>   PACKAGES =+ "${PN}-firmware"
>   FILES_${PN}-firmware = "${base_libdir}/firmware/*"


