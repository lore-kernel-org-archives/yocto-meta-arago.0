Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id AE03E52ABF
	for <meta-arago@arago-project.org>;
	Mon, 27 Apr 2020 22:39:55 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RMbZBU102018
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2020 17:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588027055;
	bh=UPOTqavic+k8NDW7yWG+jw90Ah3H5+BxxDD7Sh/X8Ws=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JyY29t3YAELHE7jyQGJyf/fc9Ph8iFOaSDQBkE55Oens4sap7Q6y+V4Zbm9V9ukZb
	u/+QQcDdYXP53e6aFFMCnI9JboFdy32PytvbuTYCS/cccbRxtY9eOrVlzQfk4lMHgZ
	8RtpvNjyMcFhMDvQbBcCbCehN9pGkLTp431XnE7Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RMbZ83026422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2020 17:37:35 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 27 Apr 2020 17:37:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 27 Apr 2020 17:37:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RMbYjE098706;
	Mon, 27 Apr 2020 17:37:34 -0500
Date: Mon, 27 Apr 2020 18:37:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <nikhil.nd@ti.com>
Message-ID: <20200427223734.GD395@beryl>
References: <20200426174223.8089-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200426174223.8089-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus PATCH v1 1/2] recipes-devtools: websocketd: Add new recipe for websocket app
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
X-List-Received-Date: Mon, 27 Apr 2020 22:39:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Apr 26, 2020 at 11:12:22PM +0530, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> websocketd is a userspace application which allows to send
> data over web sockets. This is used in SDK for visualizing
> statistics parameters.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  ...packagegroup-arago-tisdk-addons-sdk-target.bb |  4 +++-
>  .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 26925f2f..54a59022 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -133,7 +133,9 @@ UTILS_append_dra7xx = " can-utils-dev \
>                          elfutils-staticdev \
>  "
>  UTILS_append_k2g = " can-utils-dev"
> -UTILS_append_k3 = " can-utils-dev"
> +UTILS_append_k3 = " can-utils-dev \
> +                    websocketd \

Why are you adding it to the devkit?


> +"
>  
>  EXTRA_LIBS = ""
>  EXTRA_LIBS_append_ti43x = "\
> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> new file mode 100644
> index 00000000..44f549ee
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Application for routing native applications via websockets"
> +HOMEPAGE = "http://websocketd.com/"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
> +
> +PV = "0.3.0"
> +SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
> +SRC_URI[md5sum] = "968c1ce4ed4fe5f86817f2533f5d3004"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +	install -d ${D}/${bindir}
> +	install -m 0755 ${S}/websocketd ${D}${bindir}/
> +}
> -- 
> 2.17.1
> 

