Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CC640529D2
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 19:53:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15JrIdL001937
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 13:53:18 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15JrIYd021865
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 13:53:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 13:53:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15JrHWr011465;
	Wed, 5 Feb 2014 13:53:17 -0600
Date: Wed, 5 Feb 2014 14:53:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Aravind Batni <aravindbr@ti.com>
Message-ID: <20140205195317.GW18784@edge>
References: <1391624082-26580-1-git-send-email-aravindbr@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391624082-26580-1-git-send-email-aravindbr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] ti-csl: new recipe providing CSL for TI-KeyStone2 devices
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 19:53:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 05, 2014 at 01:14:42PM -0500, Aravind Batni wrote:
> -This package provides chip support library interface files
> 
> Signed-off-by: Aravind Batni <aravindbr@ti.com>
> ---
> * grouped SRC_URI and SRCREV together
> * Modified do_install to copy the needed files only instead of copy everything
>   delete unwanted files.
> ---
> ---
>  meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> new file mode 100644
> index 0000000..37f7937
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "TI CSL"
> +LICENSE = "TI BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> +
> +COMPATIBLE_MACHINE = "keystone-evm"

Do you want to relax it to entire "keystone" family, not just EVM?


> +ALLOW_EMPTY_${PN} = "1"
> +
> +PR = "r0"
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
> +# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
> +SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +    cd ${S}

do_install already operates from within ${S}. If you need to control it 
further, you can pass it to find commands below, instead of "."

Either way it's rather nit-picking, along with SRCREV order...


> +    install -d ${D}${includedir}/ti/csl
> +    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl 
> +    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl/src/ip/serdes_sb/V0
> +}
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

