Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9548852995
	for <meta-arago@arago-project.org>;
	Thu, 23 Jan 2020 18:04:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00NI2tAo060550
	for <meta-arago@arago-project.org>; Thu, 23 Jan 2020 12:02:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579802575;
	bh=4cM/PEz13bFzBVFRXPwbSP6/RrfNPV8x3X3k/PnabwQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TsbtUhtkHCadMpGwbFRcJ7InWynRF/H01KY/UVFxt9aTLlU/TuV2Pn/RdPk9WTOTt
	N18TOAJ7FHrhJQGcQHrk5qj7QPTJHJe1MzXlkr/Zojt6sMN21PIk5WQqu/8hNPqHls
	wSYcTrJaCyFbJegxaAt3ZqZ38Mp9j46DIg+xR+J8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00NI2t8j045082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 23 Jan 2020 12:02:55 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 23 Jan 2020 12:02:54 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 23 Jan 2020 12:02:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00NI2s3O052908;
	Thu, 23 Jan 2020 12:02:54 -0600
Date: Thu, 23 Jan 2020 13:02:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20200123180254.GR3658@beryl>
References: <1579702522-31819-1-git-send-email-j-stiffler@ti.com>
	<20200122213253.GC3658@beryl>
	<8b3e40008dfa4e88b27db0073f96844d@ti.com>
	<20200122215059.GE3658@beryl>
	<59b432635324423fae565e2a7c695410@ti.com>
MIME-Version: 1.0
In-Reply-To: <59b432635324423fae565e2a7c695410@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC][PATCH] opencl: fix packaging of library
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
X-List-Received-Date: Thu, 23 Jan 2020 18:04:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I think as part of this RFC/packagefeed work we are doing, we should remove 
some of those SIGGEN_EXCLUDERECIPES_ABISAFE entries and expose any issues with 
machine-specific dependencies early on and try to address them...

Denys


On Thu, Jan 23, 2020 at 10:24:03AM -0500, Stiffler, Jacob wrote:
> This fixes the error. 
> 
> 
> -----Original Message-----
> From: Stiffler, Jacob 
> Sent: Wednesday, January 22, 2020 4:53 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [RFC][PATCH] opencl: fix packaging of library
> 
> I had started a clean build, but I think I can stop it and recreate the problem using the sstate mirror.
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, January 22, 2020 4:51 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [RFC][PATCH] opencl: fix packaging of library
> 
> Can you try removing opencl from SIGGEN_EXCLUDERECIPES_ABISAFE in layer.conf 
> of meta-arago-extras - see if that helps?
> 
> Denys
> 
> 
> On Wed, Jan 22, 2020 at 04:44:17PM -0500, Stiffler, Jacob wrote:
> > I have been struggling with the same. I guess this is because the library 
> > switched packages? How can this be handled without a clean build?
> > 
> > -----Original Message-----
> > From: Dmytriyenko, Denys 
> > Sent: Wednesday, January 22, 2020 4:33 PM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [RFC][PATCH] opencl: fix packaging of library
> > 
> > Hmm, after applying this patch and rebuilding with sstate, it fails in package 
> > dependencies:
> > 
> > nothing provides libopencl1 >= 1.2.00.02 needed by ...
> > 
> > I'll try making a clean build next.
> > 
> > Denys
> > 
> > 
> > On Wed, Jan 22, 2020 at 09:15:22AM -0500, Jacob Stiffler wrote:
> > > * Add daemon conffiles and library to runtime package.
> > > 
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> > > index 59cb8ca..502e1cf 100644
> > > --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> > > +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> > > @@ -4,7 +4,7 @@ LICENSE = "BSD"
> > >  
> > >  include ocl.inc
> > >  
> > > -PR = "${INC_PR}.1"
> > > +PR = "${INC_PR}.2"
> > >  
> > >  inherit cmake systemd
> > >  
> > > @@ -80,7 +80,7 @@ do_install_append() {
> > >  SYSTEMD_SERVICE_${PN}-runtime = "ti-mct-daemon.service"
> > >  SYSTEMD_AUTO_ENABLE_${PN}-runtime = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
> > >  
> > > -FILES_${PN}-runtime += "${bindir} ${systemd_system_unitdir}"
> > > +FILES_${PN}-runtime += "${bindir} ${systemd_system_unitdir} ${sysconfdir}/ti-mctd ${libdir}/lib*${SOLIBS}"
> > >  
> > >  FILES_${PN} += " \
> > >      ${datadir}/ti/opencl/* \
> > > -- 
> > > 2.7.4
> > > 
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

