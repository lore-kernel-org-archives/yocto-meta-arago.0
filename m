Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id EF49A529D1
	for <meta-arago@arago-project.org>;
	Thu,  5 Oct 2017 17:32:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v95HWHL1010400
	for <meta-arago@arago-project.org>; Thu, 5 Oct 2017 12:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507224738;
	bh=b4PfONWipJx4Q9GJKeqzQF4Mnmnpv3BLX38fv7LEZaE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=O3sJQIBB+viW7FJNtUVCXP1j5XqNKMpt9i9sTewatMvwNdIhrUuYkhoMUtzukfTsp
	YrW1pUYwl3hYZJIaAs42G+MO5Bpzm10bUMVuiSfVQMUiQRLdsFs3XK1UmzDAzLBg5Y
	Gj+33YdsUketQhsjrg1QOfAUuoFU2QQx58kCfWD0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v95HWHEg006982
	for <meta-arago@arago-project.org>; Thu, 5 Oct 2017 12:32:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 5 Oct 2017 12:32:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 5 Oct 2017 12:32:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v95HWHGG012323;
	Thu, 5 Oct 2017 12:32:17 -0500
Date: Thu, 5 Oct 2017 13:32:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20171005173201.GB16210@edge>
References: <20171005164138.6340-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20171005164138.6340-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee_os: Sync with upstream support for AM4 PM
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
X-List-Received-Date: Thu, 05 Oct 2017 17:32:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! Does the version change?


On Thu, Oct 05, 2017 at 11:41:38AM -0500, Andrew F. Davis wrote:
> Merge upstream bug fixes and new support for AM43xx power
> management.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index f765d16a..550d75ca 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -10,7 +10,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>  "
>  BRANCH = "ti_optee_os"
> -SRCREV = "e82ac5b65bc789f3f0d1a3668bb5a2ffe2323f77"
> +SRCREV = "342a75f64d69fa9a60a2934d56131243d540fe42"
>  
>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
> -- 
> 2.14.1
> 

