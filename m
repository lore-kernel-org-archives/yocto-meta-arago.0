Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D122752A3E
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2013 02:03:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA823VGE027418
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 20:03:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA823V3V028443
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 20:03:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 7 Nov 2013 20:03:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA823Uwh015641;
	Thu, 7 Nov 2013 20:03:30 -0600
Date: Thu, 7 Nov 2013 21:03:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Tivy, Robert" <rtivy@ti.com>
Message-ID: <20131108020330.GX4510@edge>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED101597FEDD2@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49054988C24@DLEE11.ent.ti.com>
	<20131108015325.GV4510@edge>
	<13514BD7FAEBA745BBD7D8A672905C14573A6C45@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <13514BD7FAEBA745BBD7D8A672905C14573A6C45@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Fri, 08 Nov 2013 02:03:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 07, 2013 at 09:00:08PM -0500, Tivy, Robert wrote:
> Please see one response below...
> 
> Regards,
> 
> - Rob
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, November 07, 2013 5:53 PM
> > To: Nelson, Sam
> > Cc: Maupin, Chase; meta-arago@arago-project.org; Ring, Chris; Tivy,
> > Robert
> > Subject: Re: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> > 
> > 
> > > > >+}
> > > > >diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > > > >new file mode 100644
> > > > >index 0000000..5d17d8e
> > > > >--- /dev/null
> > > > >+++ b/recipes-bsp/cmem/cmem.inc
> > > > >@@ -0,0 +1,12 @@
> > > > >+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> > > > >+
> > > > >+LICENSE = "GPLv2"
> > > > >+LIC_FILES_CHKSUM =
> > > > >"file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb
> > > > >8310b3b983024edc620"
> > > > >+
> > > > >+COMPATIBLE_MACHINE = "keystone-evm"
> > > >
> > > > As Sidd pointed out is there any reason not to add the other
> > devices like
> > > > omap-a15 as compatible machines?
> > >
> > > [Sam] I am fine with remove the compatible machine. Although this is
> > not
> > > tested with other machines.
> > 
> > So, Chris and Rob should comment on which platforms this version of
> > cmem is
> > supposed to be compatible with, even if it's not tested yet.
> > 
> 
> CMEM is completely architecture-independent.  The only HW it touches is 
> memory, and the memory it touches is specified by the user/system 
> integrator.

Thanks. Then it doesn't make sense to artificially limit it to Keystone only.

-- 
Denys

