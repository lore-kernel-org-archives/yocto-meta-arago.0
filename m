Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4695552ABF
	for <meta-arago@arago-project.org>;
	Mon, 27 Apr 2020 22:39:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RMb7w9044468
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2020 17:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588027027;
	bh=fJewk/uVsiXw3pj6o6OzGbUEhqDhyazeBdbmOB6tsUw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rbyhRMgK44v6G5w1qnEtwXk/4OsH8X6ZgPp4MOypmH1bf1+ctbLoa6vl+m9CqTpNj
	TMl3JjmI8ARpG8GYcTa7tstVP6zsd1hZTym9st0Ays6j3cACaInrGFSpVYIa0sZ8vn
	lj9cvUJpzB6hX0EsshfKyXeR3R6eTVAvbf/iGbbk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RMb7tu100679
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2020 17:37:07 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 27 Apr 2020 17:37:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 27 Apr 2020 17:37:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RMb7bl098197;
	Mon, 27 Apr 2020 17:37:07 -0500
Date: Mon, 27 Apr 2020 18:37:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <nikhil.nd@ti.com>
Message-ID: <20200427223706.GC395@beryl>
References: <20200426174223.8089-1-nikhil.nd@ti.com>
	<20200426174223.8089-2-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200426174223.8089-2-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus PATCH v1 2/2] recipes-devtools: statcol: New recipe for statistics collector
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
X-List-Received-Date: Mon, 27 Apr 2020 22:39:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Apr 26, 2020 at 11:12:23PM +0530, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Statistics Collector is userspace application which communicates
> with remote processors to get the statistics data on target.
> 
> This can be printed command line or sent over network for
> host-side visualization.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  ...kagegroup-arago-tisdk-addons-sdk-target.bb |  1 +
>  .../recipes-devtools/statcol/statcol.bb       | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 54a59022..c6502a1f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -135,6 +135,7 @@ UTILS_append_dra7xx = " can-utils-dev \
>  UTILS_append_k2g = " can-utils-dev"
>  UTILS_append_k3 = " can-utils-dev \
>                      websocketd \
> +                    statcol \
>  "
>  
>  EXTRA_LIBS = ""
> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> new file mode 100644
> index 00000000..b87d940b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Statistics collector application"
> +
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
> +
> +PROTOCOL = "git"
> +BRANCH = "master"
> +SRCREV = "80bac9aa2d20160197b336ab3c82ce9080091978"
> +SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +DEPENDS = "rpmsg-char-helper websocketd"

Missing dependency on rpmsg-char-helper


> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${CROSS_COMPILE}"
> +
> +do_install() {
> +	DESTDIR=${D} make install
> +}
> -- 
> 2.17.1
> 

