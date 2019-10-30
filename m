Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 03DBD529E8
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 15:11:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UF9srM009971
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 10:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572448194;
	bh=CosBgKVDZdlxeETdHVN8PZG3i8JGkA1fbe5DFdpPTcc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=h4YIecILh6XB4hNkLl+oofDuvr1QC9EMPP8ARvF2wyA8XytIPBU7f/Hny73pzBmtN
	OoFJayfeGZkPhiq1mKba3I95Q+XRuX29Kc0MHdS9OfxWsJNRT/+qZNNEpxYBv94A9H
	OfUvPudF7Py1evEZ129KhOsg8DVOy0SYxXdQruJg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UF9sTb008674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 10:09:54 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 10:09:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 10:09:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UF9sFb099798;
	Wed, 30 Oct 2019 10:09:54 -0500
Date: Wed, 30 Oct 2019 11:09:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20191030150953.GR7518@beryl>
References: <20191029135349.31792-1-e-ruei1@ti.com>
	<20191029135349.31792-7-e-ruei1@ti.com>
	<8bef7e9e-b4e5-c6b2-7844-c34ffa393168@ti.com>
MIME-Version: 1.0
In-Reply-To: <8bef7e9e-b4e5-c6b2-7844-c34ffa393168@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 6/7] omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL
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
X-List-Received-Date: Wed, 30 Oct 2019 15:11:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 30, 2019 at 11:04:18AM -0400, Andrew F. Davis wrote:
> On 10/29/19 9:53 AM, Eric Ruei wrote:
> > - Replace pvr_wlegl with wayland-egl in the LDFLAGS string
> > 
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 +++++++++++++++++++
> >  .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
> > 
> > diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
> > new file mode 100644
> > index 00000000..4774425f
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
> > @@ -0,0 +1,32 @@
> > +From 06b21346d662209f5ea9816f408f9f883b775d60 Mon Sep 17 00:00:00 2001
> > +From: Eric Ruei <e-ruei1@ti.com>
> > +Date: Mon, 28 Oct 2019 09:43:47 -0400
> > +Subject: [PATCH] util: Makefile.am: update LDFLAGS for Mesa-based EGL
> > +
> > +- replace pvr_wlegl with wayland-egl
> > +
> > +Upstream-Status: Pending
> 
> 
> Who owns the omapdrmtest repo? This should be a trivial fix to get in.

http://git.ti.com/gitweb/?p=glsdk/omapdrmtest.git

Ram Prasad is the last committer.


> Andrew
> 
> 
> > +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > +---
> > + util/Makefile.am | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > + mode change 100644 => 100755 util/Makefile.am
> > +
> > +diff --git a/util/Makefile.am b/util/Makefile.am
> > +old mode 100644
> > +new mode 100755
> > +index 2bfcb5e..fdeb877
> > +--- a/util/Makefile.am
> > ++++ b/util/Makefile.am
> > +@@ -37,7 +37,7 @@ endif
> > + if ENABLE_WAYLAND
> > + libutil_la_SOURCES += display-wayland.c wayland-drm-protocol.c viewporter-protocol.c
> > + libutil_la_CFLAGS = @DRM_CFLAGS@
> > +-libutil_la_LDFLAGS = -lwayland-client -lwayland-cursor -ldrm -ldrm_omap -lpthread -lpvr_wlegl -lavcodec
> > ++libutil_la_LDFLAGS = -lwayland-client -lwayland-cursor -ldrm -ldrm_omap -lpthread -lwayland-egl -lavcodec
> > + 
> > + endif
> > + 
> > +-- 
> > +2.17.1
> > +
> > diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> > index 079663e7..bb166b74 100644
> > --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> > +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> > @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "omap-a15|ti43x"
> >  
> >  inherit autotools pkgconfig
> >  
> > -PR = "r28"
> > +PR = "r29"
> >  SRCREV = "20338b9f575ffe9c18c12bbed41c16069d27ccf4"
> >  
> >  EXTRA_OEMAKE = "CC="${CC}""
> > @@ -17,6 +17,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
> >  
> >  SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
> >          file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
> > +	file://0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch \
> >  "
> >  
> >  S = "${WORKDIR}/git"
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

