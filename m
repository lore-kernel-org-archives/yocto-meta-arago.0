Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2250D5297E
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2018 17:44:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8OHigP3071669
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 12:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537811082;
	bh=F9J16CWSk4UfgjBF7rvvIQWpx9tCJKFfJMXcCGs2y8E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HoRJTVD61Py3jBtu6y4an/AbCclbGMpLbGV1pG5WF+MxvO3LBQ0Fitap4MGJtXONn
	fq0xjac3mpKO3kUebPwcMrWEursvXmjhMhyySXfeM6cJQbs9oxBEerB8qGEBdQySv2
	pr54/lN9ZHgv9gJC35m7mw8hMe4N+zVSwJeoH/FE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OHigSP028602
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 12:44:42 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 24 Sep 2018 12:44:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 24 Sep 2018 12:44:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OHigXs013349;
	Mon, 24 Sep 2018 12:44:42 -0500
Date: Mon, 24 Sep 2018 13:43:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>
Message-ID: <20180924174328.GD18600@beryl>
References: <1537805152-4059-1-git-send-email-x0157990@ti.com>
	<20180924162909.GC18600@beryl>
	<a02db7c71f094780b1480871e87b6f49@ti.com>
MIME-Version: 1.0
In-Reply-To: <a02db7c71f094780b1480871e87b6f49@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko][PATCH 1/3] arm-compute-library: Add executables to the filesystem
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
X-List-Received-Date: Mon, 24 Sep 2018 17:44:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 24, 2018 at 01:02:30PM -0400, Senicic, Djordje wrote:
> I was recreating flags the way they are set in image folder.

Not sure I follow. Do they need to be executable? Normally *.so in Linux are 
not.


> *.so  are actual shared libraries.
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Monday, September 24, 2018 12:29 PM
> To: Senicic, Djordje
> Cc: meta-arago@arago-project.org; Senicic, Djordje
> Subject: Re: [meta-arago] [rocko][PATCH 1/3] arm-compute-library: Add executables to the filesystem
> 
> On Mon, Sep 24, 2018 at 12:05:50PM -0400, Djordje Senicic wrote:
> > Signed-off-by: Djordje Senicic <x0157990@ti.com>
> > ---
> >  .../arm-compute-library/arm-compute-library_git.bb         | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> > index d9fa8b0..8a65ade 100644
> > --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> > +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
> > @@ -29,20 +29,30 @@ LIBS += "-larmpl_lp64_mp"
> >  do_install() {
> >      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >  
> > -    install -d ${D}${libdir}
> > +    install -m 0755 -d ${D}${libdir}
> >      for lib in ${S}/build/*.so
> >      do
> > -        install -m 0644 $lib ${D}${libdir}
> > +        install -m 0755 $lib ${D}${libdir}
> 
> Why do you make libraries executable?
> BTW, are those *.so actual libraries or symlinks?
> 
> 
> >      done
> >  
> > +    # Install 'example' and benchmark executables
> > +    install -d ${D}${bindir}
> > +    find ${S}/build/examples/ -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
> > +    cp $CP_ARGS ${S}/build/tests/arm_compute_benchmark ${D}${bindir}
> > +
> >      # Install built source package as expected by ARMNN
> >      install -d ${D}${datadir}/${BPN}
> >      cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
> >  }
> >  
> > +SOLIBS = ".so"
> > +FILES_SOLIBSDEV = ""
> > +INSANE_SKIP_${PN} = "ldflags"
> >  INSANE_SKIP_${PN}-dev = "dev-elf ldflags"
> >  
> >  PACKAGES =+ "${PN}-source"
> > +FILES_${PN} += "${bindir}/*"
> > +FILES_${PN} += "${libdir}/*.so"
> >  FILES_${PN}-source = "${datadir}/${BPN}"
> >  INSANE_SKIP_${PN}-source = "ldflags libdir staticdev"
> >  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

