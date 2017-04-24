Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0A17852A4F
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 20:25:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OKPYID032394
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 15:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493065534;
	bh=T2XeMyLCnZN9wL+bcqBbdmN9J6ZRMQkid6pyq1uITYk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=O+9O9QmZzTG4wyKlMHLYkby5ofVlrR41XKNnbWWBTJmdDWarAnbMA4y6E2YEzW0G5
	/tcstzAvmByCvsz1c268kg5TRzFuL7cKpluw9SprBZ7PXe16K7OxGfJSi4hY/9KXxq
	Td8kWyETZ2wqFl8SMKRZe+OpWf+W4Bu6zb4QKGcI=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OKPTNm032680
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 15:25:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 15:25:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OKPSj3001418;
	Mon, 24 Apr 2017 15:25:28 -0500
Date: Mon, 24 Apr 2017 16:25:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170424202527.GC30097@edge>
References: <20170424193843.1759-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170424193843.1759-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee: Update SRCREV for client, os and test
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
X-List-Received-Date: Mon, 24 Apr 2017 20:25:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Dan,

On Mon, Apr 24, 2017 at 02:38:43PM -0500, Dan Murphy wrote:
> Updating the SRCREV for the optee-client,
> optee-os and optee-test to align with Linaro's
> code base and kernel driver.  For the 2017.01-rc1
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 2 +-
>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 +-
>  meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> index 3a24c60..df7587d 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> @@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
>             file://tee-supplicant.service"
>  
>  BRANCH = "ti_optee_client"
> -SRCREV = "5477e9ebf093ba3ac5296409a690944db6c0014c"
> +SRCREV = "1df4046bd729e866743454a18a71e72228e585fd"
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index c50c47d..4fa39de 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>  "
>  BRANCH = "ti_optee_os"
> -SRCREV = "f4543643876f50b5c454955763c243b8625b0294"
> +SRCREV = "a92d4a6698b0acc8147fba21b10c7e4473da3b9e"

This SRCREV is incorrect.


>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
> diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> index a94cd42..3ab6177 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> @@ -3,4 +3,4 @@ PR_append = ".arago1"
>  SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
>  
>  BRANCH = "ti_optee_test"
> -SRCREV = "ba271a6e3eb2bbb6996b5de73918216f64a9e077"
> +SRCREV = "170a1ee60a98b407790d97dc682568981d344ca3"
> -- 
> 1.9.1
> 

