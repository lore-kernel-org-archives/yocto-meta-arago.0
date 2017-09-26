Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 9F6F952A92
	for <meta-arago@arago-project.org>;
	Tue, 26 Sep 2017 17:34:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8QHY8ZX031671
	for <meta-arago@arago-project.org>; Tue, 26 Sep 2017 12:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506447248;
	bh=A/L4XWckoD7/3zk10jx6FW+ieOJx5a5XvRDuEyuNEVI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MFVjcXhaOQmgq7PRlsI9DH8lzdSnH6sJPk+PmuyjJc8j28huc1OEFNBZS2iAcfL7y
	cc5lH4KnJs+WzA63JQkHBe04YzsUUyksmbaRfTU9fQHh/x5o3YsG13dVXXIkLE5y8n
	WHwi5vqudwFyF6g5DRocPWi1yfuKJN7h3UwSa+s8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QHY8lf029010
	for <meta-arago@arago-project.org>; Tue, 26 Sep 2017 12:34:08 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 26 Sep 2017 12:34:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 26 Sep 2017 12:34:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QHY73r003599;
	Tue, 26 Sep 2017 12:34:08 -0500
Date: Tue, 26 Sep 2017 13:33:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20170926173352.GA26843@edge>
References: <1506366173-17907-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <1506366173-17907-1-git-send-email-a0271529@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] ccief-basic: add CCLINK IEF Basic for Linux
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
X-List-Received-Date: Tue, 26 Sep 2017 17:34:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 25, 2017 at 03:02:52PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  .../recipes-support/cclink/ccief-basic_git.bb      | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> 
> diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> new file mode 100644
> index 0000000..41332fa
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION = "CC-Link Industrial Ethernet Field Basic Master and Slave Implementation"

^^^^^^
https://lists.yoctoproject.org/pipermail/meta-ti/2017-July/010261.html


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

If you need this, then LDFLAGS are not being passed properly to the build. Any 
chance to fix this?


> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

