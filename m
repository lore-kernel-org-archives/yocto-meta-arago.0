Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 67DE252A30
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2020 01:48:09 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0411jm2V073653
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2020 20:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588297548;
	bh=Z4doJVMvm7J1GhYf7N+XScVgekFH5Y1/MC501NLqlBw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MCVBepgHasm/DhCbYAbG7ucd6njIB7tGWPmE6lb2nOtPLugmuWEXYMe6BsuHwXW3m
	VSdPO9zbk1G0gLCU3dVJ3JLlYRQRsMts7leTy23rDukUYGyg9eZ/bD3h0/PZcxxOmv
	job3YzaeUa2lpgbi0rtCgsaGEqwBL9eETe2Rq0GU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0411jmJc112691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2020 20:45:48 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 30 Apr 2020 20:45:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 30 Apr 2020 20:45:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0411jkaR035373;
	Thu, 30 Apr 2020 20:45:47 -0500
Date: Thu, 30 Apr 2020 21:45:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <nikhil.nd@ti.com>
Message-ID: <20200501014545.GF11212@beryl>
References: <20200430103558.5797-1-nikhil.nd@ti.com>
	<20200430103558.5797-2-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200430103558.5797-2-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus PATCH v2 2/2] recipes-devtools: statcol: New recipe for statistics collector
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
X-List-Received-Date: Fri, 01 May 2020 01:48:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, this lookd good, but does not apply to master. Can you please rebase?


On Thu, Apr 30, 2020 at 04:05:58PM +0530, nikhil.nd@ti.com wrote:
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
> 
> Notes:
>     Changes from v1:
>     * Add the package in correct packagegroup
> 
>  .../packagegroup-arago-tisdk-addons.bb        |  2 +-
>  .../recipes-devtools/statcol/statcol.bb       | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/statcol/statcol.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 2913fa15..c8c445cb 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -77,7 +77,7 @@ UTILS_append_k3 = " mmc-utils \
>  "
>  
>  UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
> -UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
> +UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw statcol"
>  
>  UTILS_append_omapl138 = " ti-ipc-rtos-fw"
>  
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

