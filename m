Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EAD4A529B3
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 19:55:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CJt37j002236;
	Thu, 12 Mar 2015 14:55:03 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CJt2pv004873;
	Thu, 12 Mar 2015 14:55:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 14:55:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CJt16m016980;
	Thu, 12 Mar 2015 14:55:02 -0500
Date: Thu, 12 Mar 2015 15:55:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20150312195501.GQ24885@edge>
References: <1426186144-2658-1-git-send-email-denis@denix.org>
	<4B26FB5A64EBA14C87266869E037F9581410808B@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581410808B@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] ltp-ddt: fix yylex issue and __NR_* syscall	issue
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
X-List-Received-Date: Thu, 12 Mar 2015 19:55:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks for confirmation! I'll push it later today.


On Thu, Mar 12, 2015 at 07:40:51PM +0000, Stiffler, Jacob wrote:
> ACK.
> 
> This fixes my local build.
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, March 12, 2015 2:49 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] ltp-ddt: fix yylex issue and __NR_* syscall issue
> 
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../ltp-ddt/ltp-Do-not-link-against-libfl.patch    | 31 ++++++++++++++++++++++
>  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 12 ++++++++-
>  2 files changed, 42 insertions(+), 1 deletion(-)  create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
> new file mode 100644
> index 0000000..3e4aa73
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link
> +++ -against-libfl.patch
> @@ -0,0 +1,31 @@
> +From 5bda9c0af56869c6ff2c25d38ea087179c946bc6 Mon Sep 17 00:00:00 2001
> +From: Chong Lu <Chong.Lu@windriver.com>
> +Date: Tue, 11 Mar 2014 14:47:22 +0800
> +Subject: [PATCH] ltp: Don't link against libfl
> +
> +We have already defined yywrap function in scan.l file. After this, we 
> +no longer need to link against libfl and so no longer get errors about undefined references to yylex.
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +---
> + pan/Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pan/Makefile b/pan/Makefile index 4cc6466..a4b575b 100644
> +--- a/pan/Makefile
> ++++ b/pan/Makefile
> +@@ -31,7 +31,7 @@ CPPFLAGS		+= -Wno-error
> + 
> + CPPFLAGS		+= -I$(abs_srcdir)
> + 
> +-LDLIBS			+= -lm $(LEXLIB)
> ++LDLIBS			+= -lm
> + 
> + LFLAGS			+= -l
> + 
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> index f8c9da0..a31568c 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> @@ -16,7 +16,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  SRCREV = "eef6281052f36f6fe41059eadcf3b4a94f0d85ea"
>  BRANCH ?= "master"
>  
> -SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
> +SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
> +    file://ltp-Do-not-link-against-libfl.patch \ "
>  
>  S = "${WORKDIR}/git"
>  
> @@ -66,6 +68,14 @@ do_configure_append() {
>      (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})  }
>  
> +# The makefiles make excessive use of make -C and several include 
> +testcases.mk # which triggers a build of the syscall header. To 
> +reproduce, build ltp, # then delete the header, then "make -j XX" and 
> +watch regen.sh run multiple # times. Its easier to generate this once here instead.
> +do_compile_prepend () {
> +    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h ) }
> +
>  do_compile_append () {
>      unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>      oe_runmake modules
> --
> 2.2.0
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

