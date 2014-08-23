Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5F91552A6A
	for <meta-arago@arago-project.org>;
	Sat, 23 Aug 2014 03:30:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7N3Ug3w014549;
	Fri, 22 Aug 2014 22:30:42 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7N3Ugo8001595;
	Fri, 22 Aug 2014 22:30:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 22:30:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7N3UfJw006005;
	Fri, 22 Aug 2014 22:30:41 -0500
Date: Fri, 22 Aug 2014 23:30:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Arnaud Janvier <aja@survision.fr>
Message-ID: <20140823033040.GA23523@edge>
References: <53F6E737.4080208@survision.fr>
MIME-Version: 1.0
In-Reply-To: <53F6E737.4080208@survision.fr>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] binutils: Fix documentation build error with Texinfo 5
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
X-List-Received-Date: Sat, 23 Aug 2014 03:30:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What branch is it for? There's no longer binutils-2.20.1 in latest meta-arago. 
If it's for Dora, I can probably apply it there. If it's for AMSDK 7.0, it 
should be applied to Dylan, but I'm not sure there will be a point release to 
pick it up...


On Fri, Aug 22, 2014 at 08:46:15AM +0200, Arnaud Janvier wrote:
> Newer versions of Texinfo have problems to build binutils documentation.
> This patch fixes the build issue seen on Ubuntu 14.04 distribution.
> ---
>  .../binutils-2.20.1/binutils-texinfo-5.0.patch     | 42
> ++++++++++++++++++++++
>  .../recipes-devtools/binutils/binutils_2.20.1.bb   |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch
> 
> diff --git a/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch b/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch
> new file mode 100644
> index 0000000..7de8e55
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch
> @@ -0,0 +1,42 @@
> +diff -Nru binutils-2.20.1.orig/bfd/doc/bfd.texinfo
> binutils-2.20.1/bfd/doc/bfd.texinfo
> +--- binutils-2.20.1.orig/bfd/doc/bfd.texinfo	2009-09-02
> 09:18:38.000000000 +0200
> ++++ binutils-2.20.1/bfd/doc/bfd.texinfo	2014-06-05 08:51:35.897319775 +0200
> +@@ -323,7 +323,7 @@
> + @printindex cp
> + + @tex
> +-% I think something like @colophon should be in texinfo.  In the
> ++% I think something like @@colophon should be in texinfo.  In the
> + % meantime:
> + \long\def\colophon{\hbox to0pt{}\vfill
> + \centerline{The body of this manual is set in}
> +@@ -334,7 +334,7 @@
> + \centerline{{\sl\fontname\tensl\/}}
> + \centerline{are used for emphasis.}\vfill}
> + \page\colophon
> +-% Blame: doc@cygnus.com, 28mar91.
> ++% Blame: doc@@cygnus.com, 28mar91.
> + @end tex
> + + @bye
> +diff -Nru binutils-2.20.1.orig/ld/ld.texinfo binutils-2.20.1/ld/ld.texinfo
> +--- binutils-2.20.1.orig/ld/ld.texinfo	2014-06-05 09:26:41.049356076 +0200
> ++++ binutils-2.20.1/ld/ld.texinfo	2014-06-04 18:10:49.305840598 +0200
> +@@ -7521,7 +7521,7 @@
> + @printindex cp
> + + @tex
> +-% I think something like @colophon should be in texinfo.  In the
> ++% I think something like @@colophon should be in texinfo.  In the
> + % meantime:
> + \long\def\colophon{\hbox to0pt{}\vfill
> + \centerline{The body of this manual is set in}
> +@@ -7532,7 +7532,7 @@
> + \centerline{{\sl\fontname\tensl\/}}
> + \centerline{are used for emphasis.}\vfill}
> + \page\colophon
> +-% Blame: doc@cygnus.com, 28mar91.
> ++% Blame: doc@@cygnus.com, 28mar91.
> + @end tex
> + + @bye
> diff --git
> a/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
> b/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
> index d0f889c..dd7e640 100644
> --- a/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
> +++ b/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
> @@ -34,6 +34,7 @@ SRC_URI = "\
>       file://200_elflink_%B_fixes.patch \
>       file://201_elflink_improve_noaddneeded_errors.patch \
>       file://202_elflink_noaddneeded_vs_weak.patch \
> +     file://binutils-texinfo-5.0.patch \
>       "
>   SRC_URI[md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> -- 
> 1.9.1
> 
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

