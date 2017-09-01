Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7723452978
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:49:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81Kn4Mk012328
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504298944;
	bh=dj7Qog/NASgZ8hr1Lu9vcIDEQbZbZpsiwS9pOfmtYUU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=OK1D6xwarq9dQ6lYtYZx9quhLAzsAghOqLwIgYzkKvW8vcMmwsjZvXVn4USdT/Jl2
	VkXeKBSCRGN0qeFv2f2m1KA6pAYQczKTAOc5rPhf0UHU2OtwpF51Pyxcs2zowbI64a
	GS/DgyyaPscw/ecPyIkDgLi0uL2M/rbshyksg0U0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KmxiV011340
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:48:59 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:48:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:48:58 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81Kmw9Z013089;
	Fri, 1 Sep 2017 15:48:58 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170901203222.24972-1-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <3af1cdd1-33c9-4920-3b21-c0074057459f@ti.com>
Date: Fri, 1 Sep 2017 16:48:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170901203222.24972-1-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v2 1/7] recipe-apps : add evse and protection-relays hmi demo recipe
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
X-List-Received-Date: Fri, 01 Sep 2017 20:49:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can you split this into two patches since they are two independent recipes?


On 9/1/2017 4:32 PM, Manisha Agrawal wrote:
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   recipes-apps/evse-hmi/evse-hmi_git.bb              | 23 ++++++++++++++++++++++
>   .../protection-relays-hmi_git.bb                   | 23 ++++++++++++++++++++++
>   2 files changed, 46 insertions(+)
>   create mode 100755 recipes-apps/evse-hmi/evse-hmi_git.bb
>   create mode 100755 recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
>
> diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
> new file mode 100755
> index 0000000..abd4e90
> --- /dev/null
> +++ b/recipes-apps/evse-hmi/evse-hmi_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
> +
> +inherit qt-provider
> +
> +PV = "1.0"
> +PR = "r0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
> +
> +SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
> +
> +S = "${WORKDIR}/git"
> +
> +CREATE_SRCIPK_evse-hmi = "1"
> +SRCIPK_INSTALL_DIR_evse-hmi = "example-applications/${PN}-${PV}"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 evse_hmi ${D}${bindir}
> +}
> diff --git a/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> new file mode 100755
> index 0000000..a6ece91
> --- /dev/null
> +++ b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "HMI demo for Prectection Relays using QT QWidget tools"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
> +
> +inherit qt-provider
> +
> +PV = "1.0"
> +PR = "r0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
> +
> +SRCREV = "c8764aaba365302090179b6720cbfc994e169842"
> +
> +S = "${WORKDIR}/git"
> +
> +CREATE_SRCIPK_protection-relays-hmi = "1"
> +SRCIPK_INSTALL_DIR_protection-relays-hmi = "example-applications/${PN}-${PV}"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 protection_relays_hmi ${D}${bindir}
> +}


