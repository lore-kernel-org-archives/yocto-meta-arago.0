Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 22BF952A83
	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 23:26:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RNQr08026931
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 18:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501198013;
	bh=+8rym9mjj4Geq/Otyye46RSpeACxKDZgyVtdZEZ63O8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LcmrzKIqNn1ADupvR2/HtEgi8tI/qPh3MDp+FKVAsEQYo3MTJ32TMl2J28NGmdtvN
	zG3AJP5HstQD7hvbFSZ7HF877bZMEhZD8itBZbWhUe6gDs3EouUTkONmFAMwImOAQv
	NkHTGPmrN+UoiGHon0w6Y46GjWVdoAqmQOfE3/po=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RNQrYw012438
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 18:26:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 18:26:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RNQrjH005084;
	Thu, 27 Jul 2017 18:26:53 -0500
Date: Thu, 27 Jul 2017 19:26:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170727232650.GS18367@edge>
References: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
	<1501194495-48938-5-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1501194495-48938-5-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH 4/4] packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7
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
X-List-Received-Date: Thu, 27 Jul 2017 23:26:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 27, 2017 at 06:28:15PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 7402427..9a19224 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r66"
> +PR = "r67"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -128,6 +128,7 @@ MATRIX_APPS_append_omap-a15 = "     \
>      matrix-gui-generic-pm           \
>      matrix-gui-clocks               \
>      matrix-gui-pm-demos-governor    \
> +    ${@bb.utils.contains('MACHINE_FEATURES','sgx','matrix-gui-browser-demos','',d)} \

Are these really specific to sgx?


>  "
>  
>  MATRIX_APPS_append_dra7xx += " \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

