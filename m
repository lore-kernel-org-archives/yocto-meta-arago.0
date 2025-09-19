Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC87CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 19:55:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5538.1758311703440486448
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 12:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9297940CBA;
	Fri, 19 Sep 2025 19:55:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VevpqvF6bNYv; Fri, 19 Sep 2025 19:55:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6918540C2E;
	Fri, 19 Sep 2025 19:55:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B89E3175209; Fri, 19 Sep 2025 15:54:58 -0400 (EDT)
Date: Fri, 19 Sep 2025 15:54:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: a-christidis@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH v1 1/2] libsdl2: Add tests
 package
Message-ID: <20250919195458.GR3125@denix.org>
References: <20250917220826.2078836-1-a-christidis@ti.com>
 <20250917220826.2078836-2-a-christidis@ti.com>
 <93d5f953-8d52-4f76-aa16-9deb4fee60ff@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93d5f953-8d52-4f76-aa16-9deb4fee60ff@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 19:55:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16605

On Thu, Sep 18, 2025 at 08:51:53AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 9/17/2025 5:08 PM, a-christidis@ti.com wrote:
> >From: Antonios Christidis <a-christidis@ti.com>
> >
> >The software provides tests, configure cmake to build and install them.
> >Package the tests in -tests package.
> >
> >Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> >---
> >  meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 5 +++++
> >  meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
> >  2 files changed, 9 insertions(+)
> >  create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> >  create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> >
> >diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> >new file mode 100644
> >index 00000000..12e06295
> >--- /dev/null
> >+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> >@@ -0,0 +1,5 @@
> >+EXTRA_OECMAKE:append = " -DSDL_TESTS=ON \
> >+                         -DSDL_INSTALL_TESTS=ON \
> >+                       "
> >+PACKAGE_BEFORE_PN = "${PN}-tests"
> >+FILES:${PN}-tests += "${libexecdir} /usr/share/installed-tests/SDL2"
> 
> 
> I'm getting QA errors related to nativesdk-libsdl2.  I had to change
> the above line to this:
> 
> FILES:${PN}-tests:append = " ${datadir}/installed-tests/SDL2"
> FILES:${PN}-tests:append:class-nativesdk = " ${datadir}/installed-tests/SDL2"

Aren't those 2 the same? Wouldn't BBCLASSEXTEND handle it normally?

Can you post the QA errors you were seeing?


> The libexecdir was not needed, and I changed the /usr/share to use
> the correct variable (datadir) in case someone wants to change the
> directory names in the Yocto manner.  I moved to append just so that
> the two lines looked the same.
> 
> I know this is also being submitted upstream, so these changes might
> be needed for those patches as well.
> 
> 
> >diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> >new file mode 100644
> >index 00000000..385aa801
> >--- /dev/null
> >+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> >@@ -0,0 +1,4 @@
> >+LIBSDL2_TI = ""
> >+LIBSDL2_TI:ti-soc = "libsdl2-ti.inc"
> >+
> >+require ${LIBSDL2_TI}

