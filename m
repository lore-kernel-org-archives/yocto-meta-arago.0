Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8D71552987
	for <meta-arago@arago-project.org>;
	Wed, 18 Jul 2018 21:45:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6ILj3Rj051361
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 16:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531950303;
	bh=9vXZjsjHikDLkYWfsjB/cwgiLkt+z6d6vh5EbAQP18Q=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Hl7/lYtp1g79t7ZZ2HDXjM267u3CyqehVKOvrbNun3EamdMnm+rwOPg2CyDxm7Orz
	WqBmFeYZgZ90v5ywyjE1oiXS6NosndoF0FI0Srz8aFdjBFm2dRHG6EsMDszIVWdr7W
	85UjvYzUMIn6s1egDF80CWh4SPSycj/3PBtHXndU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6ILj3Mc011588
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 16:45:03 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 18 Jul 2018 16:45:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 18 Jul 2018 16:45:02 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6ILj2bb007514;
	Wed, 18 Jul 2018 16:45:02 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1531937844-15959-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2ab96b0a-4abf-e73b-32d0-4079d933dc53@ti.com>
Date: Wed, 18 Jul 2018 17:45:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1531937844-15959-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [rocko/master][PATCHv2] tidl-utils: add import and simulation binary utilities needed by tidl stack
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
X-List-Received-Date: Wed, 18 Jul 2018 21:45:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please apply this to the ti2018.01 branch?


Thank you,

Jake


On 7/18/2018 2:17 PM, Djordje Senicic wrote:
> * Three executables are added to the filesystem (along with sample configuration files), used for Caffe/TF model conversion and bit-exact emulation.
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../recipes-ti/tidl-utils/tidl-utils.bb            | 40 ++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> new file mode 100644
> index 0000000..264b030
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "TIDL Utilities and configuration files"
> +DESCRIPTION = "TIDL Utilities for standalone simulation and importing / translation of Caffe and TF-Slim models"
> +HOMEPAGE = "http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Foundational_Components.html#tidl"
> +LICENSE = "TI-TFL"
> +
> +PV = "1.0.0.0"
> +INC_PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
> +
> +RDEPENDS_${PN} += " tidl-api tidl-examples "
> +
> +SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> +SRCREV = "93f66d2c53960b13b7e7f20208ee205f727aaf28"
> +
> +PR = "${INC_PR}.0"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET_class-target = "arm"
> +TARGET_class-native = "x86"
> +TARGET_class-nativesdk = "x86"
> +
> +CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +do_install() {
> +  install -d ${D}${bindir}
> +  install -d ${D}${datadir}/ti/tidl/utils/test
> +  install -d ${D}${datadir}/ti/tidl/utils/docs
> +  install -m 755 ${S}/${TARGET}/bin/* ${D}${bindir}
> +  cp ${CP_ARGS} ${S}/test/* ${D}${datadir}/ti/tidl/utils/test/.
> +  cp ${CP_ARGS} ${S}/docs/* ${D}${datadir}/ti/tidl/utils/docs/.
> +}
> +
> +FILES_${PN} += " ${datadir}/ti/tidl/utils \
> +                 ${bindir} "
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +INSANE_SKIP_${PN} += "build-deps ldflags already-stripped "


