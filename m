Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E386152090
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 11:14:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r69BET2f014324
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 06:14:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r69BETgZ027978
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 06:14:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Jul 2013 06:14:28 -0500
Received: from [172.24.157.78] (a0132163lt.apr.dhcp.ti.com [172.24.157.78])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r69BERLk009366;
	Tue, 9 Jul 2013 06:14:27 -0500
Message-ID: <51DBF092.9080109@ti.com>
Date: Tue, 9 Jul 2013 16:44:26 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Mrinmayee Hingolikar <mrinmayee@ti.com>
References: <1373367532-6282-1-git-send-email-mrinmayee@ti.com>
In-Reply-To: <1373367532-6282-1-git-send-email-mrinmayee@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCHv3] KMSCube: Add Demo 3D graphics application
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
X-List-Received-Date: Tue, 09 Jul 2013 11:14:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Kindly ignore the v2 patch. I had missed a few comments.

On 7/9/2013 4:28 PM, Mrinmayee Hingolikar wrote:
> * Showcases 3D graphics on SGX using kms and gbm
>
> v2:
>
> * Added DEPENDS for libdrm, libgbm and omap-sgx userspace
> * INSANE_SKIP to avoid package dependencies
>
> v3:
>
> * Remove inc file as we have a version only .bb file. This
>   fixes the review comment received with v1.
>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> ---
>  .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
>
> diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> new file mode 100644
> index 0000000..e18e398
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Demo application to showcase 3D graphics on SGX using kms and gbm"
> +HOMEPAGE = "http://git.ti.com"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
> +
> +DEPENDS = "libdrm libgbm-glsdk omap5-sgx-ddk-um-linux"
> +
> +COMPATIBLE_MACHINE = "omap-a15"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "5a03757c0aa52eff44fb0d8ac0529f8cc18b1da0"
> +
> +INSANE_SKIP_kmscube += "dev-deps"


-- 
Regards,
Mrinmayee


