Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CF64152A60
	for <meta-arago@arago-project.org>;
	Mon, 18 May 2015 19:36:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IJaIRt025608
	for <meta-arago@arago-project.org>; Mon, 18 May 2015 14:36:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IJaIaS008444
	for <meta-arago@arago-project.org>; Mon, 18 May 2015 14:36:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 14:36:17 -0500
Received: from [158.218.103.160] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IJaHOG004196;
	Mon, 18 May 2015 14:36:17 -0500
Message-ID: <555A3F31.8010601@ti.com>
Date: Mon, 18 May 2015 15:36:17 -0400
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <hzhang@ti.com>
References: <1431719812-13050-1-git-send-email-hzhang@ti.com>
In-Reply-To: <1431719812-13050-1-git-send-email-hzhang@ti.com>
X-Enigmail-Version: 1.6
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] tisdk-server image: add recovery kernel build for Keystone
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
X-List-Received-Date: Mon, 18 May 2015 19:36:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Ping.

On 5/15/2015 3:56 PM, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> Add recovery linux kernel and dtb image build for Keystone II devices.
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index 4241dd4..879b761 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r0"
> +PR = "r1"
>  
>  inherit packagegroup
>  
> @@ -159,4 +159,5 @@ RDEPENDS_${PN} = "\
>      file \
>      libbz2 \
>      boost \
> +    recovery-kernel \
>      "
> 


