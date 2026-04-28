Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01B8FF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 14:48:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15245.1777387696315170859
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 07:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6D66540CBE;
	Tue, 28 Apr 2026 14:48:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DC_vS44Ja1NM; Tue, 28 Apr 2026 14:48:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 28A6640A20;
	Tue, 28 Apr 2026 14:48:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C727517CB57; Tue, 28 Apr 2026 10:48:11 -0400 (EDT)
Date: Tue, 28 Apr 2026 10:48:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: Fix install error
Message-ID: <20260428144811.GI4186@denix.org>
References: <20260428144042.849713-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428144042.849713-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Apr 2026 14:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17499

On Tue, Apr 28, 2026 at 09:40:42AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Something in the oe-core commit [1] is exposing an existing issue with
> the ltp-ddt install flow.  The runtest/ddt sub directory was being
> chmodded to 644 which stripped the execute bit make the directory, not a
> directory.
> 
> Attached patch fixes the issue in ltp-ddt.  We are waiting for testing
> of this patch to make sure this works before accepting the patch change
> in ltp-ddt itself.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?h=master&id=8ea63d320aba32d3894cace9e71e850bdff1d6b2
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...01-include-mk-Fix-installing-subdirs.patch | 49 +++++++++++++++++++
>  .../recipes-devtools/ltp-ddt/ltp_20260130.inc |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch
> 
> diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch
> new file mode 100644
> index 00000000..5f970a12
> --- /dev/null
> +++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch
> @@ -0,0 +1,49 @@
> +From 5907227ad86a93b084a52a7ff8dd8cb791c228a5 Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Mon, 27 Apr 2026 11:02:32 -0500
> +Subject: [PATCH] include/mk: Fix installing subdirs
> +
> +When installing sub directories, the INSTALL_MODE was being used for the
> +dirs as well.  But in runtest/Makefile the INSTALL_MODE is being set to
> +00644.  This causes the ddt dir to lose the execute bits and stop acting
> +like a directory.
> +
> +Simple fix is create INSTALL_MODE_DIR and use it when installing
> +directories.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +---
> + include/mk/env_post.mk  | 1 +
> + include/mk/functions.mk | 2 +-
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
> +index ab31da73a..c2e85439a 100644
> +--- a/include/mk/env_post.mk
> ++++ b/include/mk/env_post.mk
> +@@ -58,6 +58,7 @@ INSTALL_TARGETS			:= $(patsubst $(abs_srcdir)/%,%,$(INSTALL_TARGETS))
> + # The large majority of the files that we install are going to be apps and
> + # scripts, so let's chmod them like that.
> + INSTALL_MODE			?= 00775
> ++INSTALL_MODE_DIR		?= 00775
> + 
> + $(abspath $(addprefix $(DESTDIR)/$(INSTALL_DIR)/,$(sort $(dir $(INSTALL_TARGETS) $(MAKE_TARGETS))))):
> + 	mkdir -p "$@"
> +diff --git a/include/mk/functions.mk b/include/mk/functions.mk
> +index 60dbed395..8e4bc973c 100644
> +--- a/include/mk/functions.mk
> ++++ b/include/mk/functions.mk
> +@@ -18,7 +18,7 @@ INSTALL_FILES		+= $$(abspath $$(DESTDIR)/$(3)/$(1))
> + 
> + $$(abspath $$(DESTDIR)/$(3)/$(1)): \
> +     $$(abspath $$(dir $$(DESTDIR)/$(3)/$(1)))
> +-	install -m $$(INSTALL_MODE) $(shell test -d "$(2)/$(1)" && echo "-d") $(PARAM) "$(2)/$(1)" $$@
> ++	install $(shell test -d "$(2)/$(1)" || echo "-m $(INSTALL_MODE)") $(shell test -d "$(2)/$(1)" && echo "-m $(INSTALL_MODE_DIR) -d") $(PARAM) "$(2)/$(1)" $$@
> + 	$(shell test -d "$(2)/$(1)" && echo "install -m "'$$(INSTALL_MODE) $(PARAM)' "$(2)/$(1)/*" -t '$$@')
> + endef
> + 
> +-- 
> +2.43.0
> +
> diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
> index 4c19d870..560e9b4e 100644
> --- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
> +++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
> @@ -31,6 +31,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
>             file://0001-Add-__clear_cache-declaration-for-clang.patch \
>             file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
>             file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
> +           file://0001-include-mk-Fix-installing-subdirs.patch \

If this is fixing ltp-ddt, then the patch should go to ltp-ddt recipe, not 
upstream ltp.

It could be applicable to upstream ltp, but I believe "ddt" is the only 
directory under runtest, so seems to be specific to ltp-ddt.


>            "
>  
>  inherit autotools-brokensep pkgconfig
> -- 
> 2.43.0

