Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0ACDE52974
	for <meta-arago@arago-project.org>;
	Thu,  3 Mar 2016 03:07:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2337jGP011041
	for <meta-arago@arago-project.org>; Wed, 2 Mar 2016 21:07:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2337j6V029187
	for <meta-arago@arago-project.org>; Wed, 2 Mar 2016 21:07:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Mar 2016 21:07:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2337ib4029187;
	Wed, 2 Mar 2016 21:07:45 -0600
Date: Wed, 2 Mar 2016 22:07:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20160303030729.GG7505@edge>
References: <1456951436-25605-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1456951436-25605-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] libnl-xfrm: add symbolic link to link netlink to libnl3/netlink
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
X-List-Received-Date: Thu, 03 Mar 2016 03:07:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

"add symbolic link to link netlink to libnl3/netlink" - please re-phrase the 
subject.

Moreover, why is it required?


On Wed, Mar 02, 2016 at 03:43:56PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> index 74733f0..526ad0a 100644
> --- a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> +++ b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> @@ -14,6 +14,8 @@ BRANCH="hawking_dev"
>  SRCREV = "2a5ee7c4f41398c07c593e81af7b71c7720e6de8"
>  SRC_URI = "git://arago-project.org/git/projects/libnl-xfrm.git;protocol=git;branch=${BRANCH}"
>  
> +PR = "r1"
> +
>  S = "${WORKDIR}/git"
>  
>  LIBNL_XFRM_LIB = "lib/libnl-xfrm.a"
> @@ -34,6 +36,8 @@ do_install_append() {
>  	install -c -m 755 ${S}/${LIBNL_XFRM_LIB} ${D}${libdir}/
>  	install -c -m 755 ${S}/include/netlink/xfrm/*.h ${D}${includedir}/libnl3/netlink/xfrm/
>  	install -c -m 755 ${S}/lib/libnl-xfrm.so ${D}${libdir}/libnl-xfrm.so.1.0.0
> +	cd ${D}${includedir}/
> +	ln -s libnl3/netlink netlink
>  	cd ${D}${libdir}/
>  	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so.1
>  	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

