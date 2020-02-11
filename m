Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EF3465298B
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 01:43:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01B1fEpl038815
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 19:41:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581385274;
	bh=QM97t8cjQKRy85apIfcmMykgm9rkCN/w8O59PqPj0cE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gkwTjlaX8o7+aySWtIvan7mN41bR2jrUxHXa0lnI154GqZbcU6w+V9Rc6ry1dl+0n
	iAiibusJ24BuPpkz8tfnDp2kMjuyXqYPbF9987ZMNUJdy0uzEJuDPH/1XvvEBsgTmh
	sn53Nj7SgdsJtrdxFXqTK5HnSVWTSkaHJYOx+Oew=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B1fEMf057175
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 19:41:14 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 10 Feb 2020 19:41:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 10 Feb 2020 19:41:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B1fDRP076418;
	Mon, 10 Feb 2020 19:41:13 -0600
Date: Mon, 10 Feb 2020 20:41:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20200211014113.GF17543@beryl>
References: <20200127162616.24864-1-afd@ti.com> <20200127194555.GW3658@beryl>
MIME-Version: 1.0
In-Reply-To: <20200127194555.GW3658@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud][PATCH] screenshot: Remove this screenshot tool in favor of fbgrab
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
X-List-Received-Date: Tue, 11 Feb 2020 01:43:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 27, 2020 at 02:45:55PM -0500, Denys Dmytriyenko wrote:
> On Mon, Jan 27, 2020 at 11:26:16AM -0500, Andrew F. Davis wrote:
> > This takes a screenshot of the current framebuffer only. There are tools
> > for taking screenshots of the current window system which is usually what
> > a user wants. If the user really wants the conent of the framebuffer then
> > they can use fbgrab which is already in meta-oe.
> 
> I'm not 100% sure, but I believe there's some use of screeshot tool in Matrix 
> demos. I guess we would need to update that too for this change.
> 
> Jake, any comments from OOBE perspective?

Ping


> Denys
> 
> 
> > Signed-off-by: Andrew F. Davis <afd@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-amsdk.bb         |  5 ----
> >  .../screenshot/screenshot_1.0.bb              | 27 -------------------
> >  2 files changed, 32 deletions(-)
> >  delete mode 100644 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> > index 42c6aefa..c9a17c5e 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> > @@ -17,11 +17,6 @@ OOBE_ti43x += "\
> >      parse-ip \
> >  "
> >  
> > -EXTRA_APPLICATIONS = "\
> > -    screenshot \
> > -"
> > -
> >  RDEPENDS_${PN} = "\
> >      ${OOBE} \
> > -    ${EXTRA_APPLICATIONS} \
> >  "
> > diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> > deleted file mode 100644
> > index 08a3040b..00000000
> > --- a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -SUMMARY = "Screenshot"
> > -HOMEPAGE = "https://gitorious.org/screenshot"
> > -LICENSE = "BSD"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
> > -SECTION = "graphics"
> > -
> > -PR = "r2"
> > -
> > -BRANCH ?= "master"
> > -SRCREV = "169242aa7a265d5c94755d74601ad4a3f1828c96"
> > -
> > -SRC_URI = "git://git.ti.com/apps/screenshot.git;protocol=git;branch=${BRANCH}"
> > -
> > -S = "${WORKDIR}/git"
> > -
> > -do_compile() {
> > -    export CROSS_COMPILE=${TARGET_PREFIX}
> > -    export CFLAGS='${TARGET_CC_ARCH}'
> > -    # build the release version
> > -    make release CC="${CC}"
> > -}
> > -
> > -do_install() {
> > -    make DESTDIR=${D} install
> > -}
> > -
> > -INSANE_SKIP_${PN} = "ldflags"
> > -- 
> > 2.17.1
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

