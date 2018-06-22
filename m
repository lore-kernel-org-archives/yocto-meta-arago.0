Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 181EF529B3
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 18:36:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5MIaofB037272
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529692610;
	bh=jhIVPwAneygABXvKu9um6kyMoejqtc+v5bNWmtpQV/c=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=f/QreU+FMFs6/foLedXf0a4+KNsp4SZiUeR8t08MvTWVFc3H6hfktBHL5F+EVZj46
	USBp0ELmM4Vat3z8p0o4IWJOvWzOmuU8Ys8TsEkIDbzvTqCAXhmOKu7WIRXonvHY9g
	FjTO9sRuSP4CFBwtF+iccCYYhqTXJB5rm4EUEkTM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIaoeF021469
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:36:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 13:36:49 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 13:36:49 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIalHe016742;
	Fri, 22 Jun 2018 13:36:48 -0500
To: <meta-arago@arago-project.org>
References: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
	<1529691675-25624-2-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4ea59c07-cf8e-a139-e23d-d9d3295100de@ti.com>
Date: Fri, 22 Jun 2018 14:36:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1529691675-25624-2-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ajayj@ti.com
Subject: Re: [meta-processor-sdk][PATCH 1/6] tidl-api: various updates
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
X-List-Received-Date: Fri, 22 Jun 2018 18:36:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/22/2018 2:21 PM, Jacob Stiffler wrote:
> * Bump SRCREV for nativesdk-tidl-viewer fix
> * Rename tidl-examples installation directory.
> * Enable creation of tidl-examples sourceipk.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   recipes-ti/tidl-api/tidl-api.inc         |  2 +-
>   recipes-ti/tidl-api/tidl-examples_git.bb | 23 ++++++++++++++---------
>   2 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-ti/tidl-api/tidl-api.inc b/recipes-ti/tidl-api/tidl-api.inc
> index d266611..ed38516 100644
> --- a/recipes-ti/tidl-api/tidl-api.inc
> +++ b/recipes-ti/tidl-api/tidl-api.inc
> @@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
>   BRANCH = "master"
>   
>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
> +SRCREV = "1ea871c6aed97f5891a04e0cf479b64cbbb7bb2c"
> diff --git a/recipes-ti/tidl-api/tidl-examples_git.bb b/recipes-ti/tidl-api/tidl-examples_git.bb
> index be9bb65..258c75a 100644
> --- a/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -28,20 +28,25 @@ do_compile() {
>   
>   CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>   
> +TIDL_INSTALL_DIR = "${datadir}/ti/tidl-api"

I see that I forgot to change this TIDL_INSTALL_DIR as was discussed. 
I'll send an update after there has been more time to review.

> +
>   do_install() {
> -    install -d ${D}${datadir}/ti/tidl-api
> -    install -d ${D}${datadir}/ti/tidl-api/examples
> -    install -d ${D}${datadir}/ti/tidl-api/tidl_api
> -    install -d ${D}${datadir}/ti/tidl-api/viewer
> -    cp ${CP_ARGS} ${S}/examples/* ${D}${datadir}/ti/tidl-api/examples/
> -    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${datadir}/ti/tidl-api/tidl_api/
> -    cp ${CP_ARGS} ${S}/viewer/* ${D}${datadir}/ti/tidl-api/viewer/
> -    install ${S}/readme.md ${D}${datadir}/ti/tidl-api/
> +    install -d ${D}${TIDL_INSTALL_DIR}
> +    install -d ${D}${TIDL_INSTALL_DIR}/examples
> +    install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
> +    install -d ${D}${TIDL_INSTALL_DIR}/viewer
> +    cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
> +    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
> +    cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
> +    install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
>   }
>   
>   FILES_${PN} += "\
> -    ${datadir}/ti/tidl-api \
> +    ${TIDL_INSTALL_DIR} \
>   "
>   
>   
>   INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> +
> +CREATE_SRCIPK = "1"
> +SRCIPK_INSTALL_DIR = "example-applications/tidl-api-${PV}"


