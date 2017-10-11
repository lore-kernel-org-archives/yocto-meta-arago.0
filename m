Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 475A45209B
	for <meta-arago@arago-project.org>;
	Wed, 11 Oct 2017 19:47:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9BJlhYV023307
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 14:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507751263;
	bh=XwYjL4LxmW3ZHKMwDZ31z33T2jwscEzbIf1iZ6QNQww=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TpP1mEfUvQb+b9rb7AY8DuMJ1lMHxAlAltVpZO1ZnZPqTHrujQ4M3ExW91nUDOVke
	rPCB6TV2y/Dlr/EbCD3gqrNsJ9i2ot8AFxEqHEoXLraDgBC0A5+57V6+fXc+f2KJ0J
	LWu9lxIuH0nzwXU6SqJTkrARkYJU+AcVA85YbKp4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BJlhwg032488
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 14:47:43 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 11 Oct 2017 14:47:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 11 Oct 2017 14:47:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BJlgBB009765;
	Wed, 11 Oct 2017 14:47:42 -0500
Date: Wed, 11 Oct 2017 15:47:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20171011194727.GA16210@edge>
References: <1507629183-171718-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1507629183-171718-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth 1/2] glsdk-util-scripts: Add the initial version of recipe
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
X-List-Received-Date: Wed, 11 Oct 2017 19:47:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is this coming to morty?


On Tue, Oct 10, 2017 at 03:23:02PM +0530, Karthik Ramanan wrote:
> These are utility scripts used for debugging the VPE and DSS.
> They have been in use for very critical customer debugs and
> it is useful to have this shipped as part of the SDK.
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../util-scripts/glsdk-util-scripts.bb             | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> new file mode 100644
> index 0000000..87c4937
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Utility scripts for debug"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://debug/filter-dmesg-rproc.sh;md5=ce264e7cbc036fd2f37073947c2f0800"
> +PR = "r1"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRC_URI = "git://git.ti.com/glsdk/util-scripts.git"
> +
> +SRCREV = "ecbb9cd13e1728686a82e87e5c1b325c0e806202"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    install -d ${D}${datadir}/ti/util-scripts 
> +    install -d ${D}${datadir}/ti/util-scripts/debug
> +    install -d ${D}${datadir}/ti/util-scripts/perf
> +    install -m 0644 ${S}/debug/* ${D}${datadir}/ti/util-scripts/debug/.
> +    install -m 0644 ${S}/perf/* ${D}${datadir}/ti/util-scripts/perf/.
> +}
> +
> +FILES_${PN} += "${datadir}/ti/util-scripts/*"
> +
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

