Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B4310520EA
	for <meta-arago@arago-project.org>;
	Thu, 29 Oct 2020 19:42:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TJdmOj096941
	for <meta-arago@arago-project.org>; Thu, 29 Oct 2020 14:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604000388;
	bh=bM3lGfZC8HKePrAuvzKbCLkgizLZkeyfaaCLeQGkmlU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GToiBevQTwzhD3oKkafJ5eyShwGelUFf9ezJwTYFhaghvoe9CRjaMUy6+Jc937vOm
	X0EDcXnmlfsVpa9qW2eYgsi2nXF7sGlWTZwdUtN11Jz4tTvJopA0IVaahSPnDXFqD9
	dO+Ylahlz/LCRp3dbiIMSf6+mCTxRV7lvCA/XRBM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TJdm8M045980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 29 Oct 2020 14:39:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 29 Oct 2020 14:39:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 29 Oct 2020 14:39:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TJdlr8128117;
	Thu, 29 Oct 2020 14:39:47 -0500
Date: Thu, 29 Oct 2020 15:39:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20201029193947.GN15849@beryl>
References: <20201029193621.26512-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201029193621.26512-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, aparnab@ti.com
Subject: Re: [dunfell PATCH v2] statcol: New recipe for statistics collector application
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
X-List-Received-Date: Thu, 29 Oct 2020 19:42:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 30, 2020 at 01:06:21AM +0530, Nikhil Devshatwar wrote:
> statcol is a statistics collector application which can be used
> to get various statistics data like CPU load, DDR bandwidth,
> network speed, etc from various sources.
> 
> It allows to simply dump the data over command line or it can
> also be used to send to a websocket for visualization on a
> host machine.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Haven't personnaly tested it, but looks reasonable.
Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
> 
> Notes:
>     v2: Add CROSS_COMPILE to fix build issues on armv7
> 
>  .../recipes-devtools/statcol/statcol.bb       | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> new file mode 100644
> index 00000000..bb841d08
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Statistics collector application"
> +
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
> +
> +PROTOCOL = "git"
> +BRANCH = "master"
> +SRCREV = "6420b4e6d98dc2c6825557d7d6f56ffd52fd230c"
> +SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +DEPENDS = "ti-rpmsg-char websocketd"
> +RDEPENDS_${PN} = "bash"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${TARGET_PREFIX}"
> +
> +do_install() {
> +	DESTDIR=${D} make install
> +}
> -- 
> 2.17.1
> 

