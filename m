Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D0B9052A3E
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 18:08:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KI7w8m012337
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505930878;
	bh=qLAIBvhWbJqSGJKsasAKL9S7BuVPUnKEkvK+SE0upbY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=LVJPao/jWi+2fsf56U/YPZI2YeP1PE8hfIJ5gZpi9SYrsCNe7YhoO3F4O8UchNamC
	A27te4hwBeIcOlKJep8iSKHmSU83tOZiVeiPRwjeQrSI7iddP/pk90ydX40Hp3YoMe
	ITrZEabjPA2FLqov+BBF7frsKg3g0t4G9W8owZ9w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI7ruq029797
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:07:53 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 13:07:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 13:07:53 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI7rOh015053;
	Wed, 20 Sep 2017 13:07:53 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505927347-1586-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <91ebaef4-0d92-8c7e-3592-2e617f433859@ti.com>
Date: Wed, 20 Sep 2017 14:07:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505927347-1586-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH 1/2] ccief-basic: add CCLINK IEF Basic for Linux
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
X-List-Received-Date: Wed, 20 Sep 2017 18:08:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

These two have been pushed.


On 9/20/2017 1:09 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-support/cclink/ccief-basic_git.bb | 44 +++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 recipes-support/cclink/ccief-basic_git.bb
>
> diff --git a/recipes-support/cclink/ccief-basic_git.bb b/recipes-support/cclink/ccief-basic_git.bb
> new file mode 100644
> index 0000000..41332fa
> --- /dev/null
> +++ b/recipes-support/cclink/ccief-basic_git.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION = "CC-Link Industrial Ethernet Field Basic Master and Slave Implementation"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://CCIEF-BASIC_Master/library/include/SLMP.h;beginline=1;endline=34;md5=9bcca1b46fb3c83966c242e5afa3c352"
> +
> +PV = "1.0"
> +PR = "r0"
> +
> +CCIEF-BASIC_GIT_URI = "git://git.ti.com/processor-sdk/cclink.git"
> +CCIEF-BASIC_GIT_PROTOCOL = "git"
> +CCIEF-BASIC_GIT_BRANCH = "master"
> +
> +CCIEF-BASIC_SRCREV = "8b4f9aea6550ff563d21ff3979aa6e7cdc708998"
> +
> +BRANCH = "${CCIEF-BASIC_GIT_BRANCH}"
> +SRC_URI = "${CCIEF-BASIC_GIT_URI};protocol=${CCIEF-BASIC_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${CCIEF-BASIC_SRCREV}"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +# build Master sample application
> +    cd ${S}/CCIEF-BASIC_Master/build/linux
> +    oe_runmake
> +# build Slave sample application
> +    cd ${S}/CCIEF-BASIC_Slave/build/linux
> +    oe_runmake
> +}
> +
> +do_install() {
> +# install CCIEF BASIC binaries
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/CCIEF-BASIC_Master/build/linux/Master_sample ${D}${bindir}
> +    install -m 755 ${S}/CCIEF-BASIC_Slave/build/linux/Slave_sample ${D}${bindir}
> +
> +# install CCIEF BASIC configuration files
> +    install -d ${D}${datadir}/cclink
> +    install -m 644 ${S}/CCIEF-BASIC_Master/sample/MasterParameter.csv ${D}${datadir}/cclink
> +    install -m 644 ${S}/CCIEF-BASIC_Slave/sample/SlaveParameter.csv ${D}${datadir}/cclink
> +}
> +
> +FILES_${PN} += "${datadir}/cclink"
> +
> +INSANE_SKIP_${PN} = "ldflags"


