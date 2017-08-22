Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4375E5299D
	for <meta-arago@arago-project.org>;
	Tue, 22 Aug 2017 19:19:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7MJJOGG001038
	for <meta-arago@arago-project.org>; Tue, 22 Aug 2017 14:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503429564;
	bh=wvOiVK2SIN6P9rYua8AAqcneVxW4AGB2U1W99jBywr0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=N8uiX4OyERdj4XVC5POR1iqrnkf3H39SV1LeZLhIHECPs0ZeIAqvYhYRIGiqt9iG9
	pYipHM1lEdEaLgaSBNmLay7WsoaPUGte0sSguF6EfkjHgJiO3r5hMmwaqdzzZa2L+U
	PXsnSoLUUxRMfx+LLe94YioJYxT+7cenMvlc5WDc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7MJJJ95032176
	for <meta-arago@arago-project.org>; Tue, 22 Aug 2017 14:19:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 22 Aug 2017 14:19:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 22 Aug 2017 14:19:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7MJJIRO005667;
	Tue, 22 Aug 2017 14:19:18 -0500
Date: Tue, 22 Aug 2017 15:19:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170822191914.GM28233@edge>
References: <20170822184341.15304-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170822184341.15304-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee_os: Add Secure Device Playback memory reservation
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
X-List-Received-Date: Tue, 22 Aug 2017 19:19:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!

On Tue, Aug 22, 2017 at 01:43:41PM -0500, Dan Murphy wrote:
> Add Secure Device Playblack firewall memory reservation

Playblack? :)


> and enable SDP feature in OPTEE_OS
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index 07eb088e..f765d16a 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -10,7 +10,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>  "
>  BRANCH = "ti_optee_os"
> -SRCREV = "09fe6fe9099d4479ab6e986f4af78dd9f9215862"
> +SRCREV = "e82ac5b65bc789f3f0d1a3668bb5a2ffe2323f77"
>  
>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
> -- 
> 2.14.0
> 

