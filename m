Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CEFE1529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 19:02:23 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA1J2Nsn022441;
	Thu, 1 Nov 2012 14:02:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA1J2Nqv030597;
	Thu, 1 Nov 2012 14:02:23 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 1 Nov 2012 14:02:22 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA1J2M04011310;
	Thu, 1 Nov 2012 14:02:22 -0500
Date: Thu, 1 Nov 2012 15:02:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-ID: <20121101190222.GF22705@edge>
References: <1351795396-5146-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1351795396-5146-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH] meta-toolchain-arago-tisdk: Add Arago SDK specific toolchain recipe
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
X-List-Received-Date: Thu, 01 Nov 2012 19:02:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 01, 2012 at 01:43:16PM -0500, Franklin S. Cooper Jr wrote:
> * Add a meta toolchain recipe that builds on top of meta-toolchain-arago-qte
>   but includes components and tasks specific to the Arago SDK.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../meta/meta-toolchain-arago-tisdk.bb             |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> 
> diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> new file mode 100644
> index 0000000..17f3966
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> @@ -0,0 +1,18 @@
> +require recipes-core/meta/meta-toolchain-arago-qte.bb
> +
> +TOOLCHAIN_TARGET_TASK = "task-arago-toolchain-tisdk-target"
> +TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"

Hmm, this essentially returns it back to the one used by the generic 
meta-toolchain-arago...

> +
> +PR = "0"

^^^^ it's "r0"

> +
> +toolchain_create_sdk_env_script_append() {
> +    echo -e 'export CPP="\x24{TARGET_PREFIX}gcc -E"' >> $script
> +    echo -e 'export NM=\x24{TARGET_PREFIX}nm' >> $script
> +    echo -e 'export RANLIB=\x24{TARGET_PREFIX}ranlib' >> $script
> +    echo -e 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy' >> $script
> +    echo -e 'export STRIP=\x24{TARGET_PREFIX}strip' >> $script
> +    echo -e 'export AS=\x24{TARGET_PREFIX}as' >> $script
> +    echo -e 'export AR=\x24{TARGET_PREFIX}ar' >> $script
> +    echo -e 'export OBJDUMP=\x24{TARGET_PREFIX}objdump' >> $script
> +    echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script

All these vars are not TI-SDK specific, should we rather place them in the 
meta-toolchain-arago instead?

