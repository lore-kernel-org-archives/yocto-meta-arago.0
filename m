Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 75FB152093
	for <meta-arago@arago-project.org>;
	Tue, 12 Dec 2017 14:02:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBCE22lS000632
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 08:02:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513087322;
	bh=nx8vsj3nW95ulh/Gvzbb3TMmal9UR8DnPFdpyN71Tl8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=oSOERaN50pby4oMPh0A70OFoOAMcCdUPwxtxPG4/fSsxyM3e16ZbyvgpBI5R5s8GP
	d8bdAQqp/fAr1qz5aDC8aK2P9ZZjiXh13Zkc1fbmYpRNl8lvF4Z28C+6r0WYqNLfxf
	B6r5hmzOXrboOhlsyHWt2DFE32HOBicNB+KY8mhE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBCE22fM004422
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 08:02:02 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 12 Dec 2017 08:02:02 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 12 Dec 2017 08:02:02 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBCE21YT032079;
	Tue, 12 Dec 2017 08:02:01 -0600
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1513037623-6080-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ef58e9fd-1f4a-f5d0-f28c-dedef8d719c4@ti.com>
Date: Tue, 12 Dec 2017 09:02:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1513037623-6080-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH 1/2] packagegroup-*-qte*: add QtWebKit and remove QtWenEngine for non-sgx build
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
X-List-Received-Date: Tue, 12 Dec 2017 14:02:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This set has been pushed. Thank you.


On 12/11/2017 7:13 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   .../packagegroup-arago-qte-toolchain-target.bbappend             | 9 +++++++++
>   recipes-core/packagegroups/packagegroup-arago-qte.bbappend       | 9 +++++++++
>   recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend | 9 +++++++++
>   3 files changed, 27 insertions(+)
>   create mode 100644 recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
>   create mode 100644 recipes-core/packagegroups/packagegroup-arago-qte.bbappend
>   create mode 100644 recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
> new file mode 100644
> index 0000000..691916d
> --- /dev/null
> +++ b/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
> @@ -0,0 +1,9 @@
> +PR_append = ".tisdk0"
> +
> +QT5_DEV_remove = "\
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-mkspecs qtwebengine-dev', d)} \
> +"
> +
> +QT5_DEV_append = "\
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtwebkit-mkspecs qtwebkit-dev qtquick1-dev', d)} \
> +"
> diff --git a/recipes-core/packagegroups/packagegroup-arago-qte.bbappend b/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
> new file mode 100644
> index 0000000..ac545ec
> --- /dev/null
> +++ b/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
> @@ -0,0 +1,9 @@
> +PR_append = ".tisdk0"
> +
> +QT5_ESSENTIALS_remove = "\
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-qmlplugins', d)} \
> +"
> +
> +QT5_ESSENTIALS_append = "\
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtwebkit-qmlplugins qtquick1-plugins qtquick1-qmlplugins', d)} \
> +"
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
> new file mode 100644
> index 0000000..6fa1035
> --- /dev/null
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
> @@ -0,0 +1,9 @@
> +PR_append = ".tisdk0"
> +
> +QT5_DEMOS_remove = "\
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-examples', d)} \
> +"
> +
> +QT5_DEMOS_append = "\
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtquick1-examples qtwebkit-examples-examples', d)} \
> +"


