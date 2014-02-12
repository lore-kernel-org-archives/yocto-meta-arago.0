Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AD77E5299C
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 17:58:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CHwW0l021578
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 11:58:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CHwWE4030030
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 11:58:32 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Feb 2014 11:58:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CHwWYP014739;
	Wed, 12 Feb 2014 11:58:32 -0600
Date: Wed, 12 Feb 2014 12:58:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Aravind Batni <aravindbr@ti.com>
Message-ID: <20140212175831.GJ4346@edge>
References: <1392153853-16227-1-git-send-email-aravindbr@ti.com>
MIME-Version: 1.0
In-Reply-To: <1392153853-16227-1-git-send-email-aravindbr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v3] ti-csl: new recipe providing CSL for TI-KeyStone2 devices
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
X-List-Received-Date: Wed, 12 Feb 2014 17:58:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 11, 2014 at 04:24:13PM -0500, Aravind Batni wrote:
> -This package provides chip support library interface files
> 
> Signed-off-by: Aravind Batni <aravindbr@ti.com>

Ack, I'll push it soon.


> ---
> Changes since last patch:
> * relaxed COMPATIBLE_MACHINE to entire "keystone" family
> * removed cd ${S} redundant instruction in do_install
> * fixed the bug in installation of serdes_sb C source files
> ---
> ---
>  meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> new file mode 100644
> index 0000000..fb5e6f8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "TI CSL"
> +LICENSE = "TI BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +ALLOW_EMPTY_${PN} = "1"
> +
> +PR = "r0"
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
> +# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
> +SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 
> +
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +    install -d ${D}${includedir}/ti/csl
> +    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl 
> +    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
> +}
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

